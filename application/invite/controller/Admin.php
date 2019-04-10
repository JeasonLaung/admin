<?php
namespace app\invite\controller;

use think\Db;
use app\common\controller\Base;
use app\invite\model\Invite as InviteModel;
use app\invite\model\Follow as FollowModel;
use app\invite\validate\Invite as InviteValidate;
use EasyWeChat\Factory;


class Admin extends Base
{
    /*
     * 客户列表
     * */
    public function invite_list(InviteModel $invite)
    {
        $keyword = $this->request->get('search_key');
        $status = $this->request->get('status');
        $where[] = ['c.del','eq',0];
        if(!empty($keyword)){
            $where[] = ['c.name|c.phone','like','%'.$keyword.'%'];
        }
        if(!empty($status)){
            $where[] = ['c.status','eq',$status];
        }

        //用户组id 14为门店销售，只能看见自己下面的客户
        $gidArr = explode(',',session('user.gid'));
        if(in_array(14,$gidArr)){
            $where[] = ['c.aid','eq',session('user.id')];
            $this->assign('is_sale', 1);
        }

        $list = $invite->inviteList($where);
        $list->appends($this->request->param());
        $selectCategory = array(0=>'新增',1=>'未成交',2=>'成交',3=>'战败');
        $this->assign('option', $selectCategory);
        $this->assign('list', $list);
        $this->assign('search_key', $keyword);
        $this->assign('status', $status!==''?(int) $status:'');
        return $this->fetch();
    }

    /*
     * 添加客户
     * */
    public function invite_add(InviteModel $invite,InviteValidate $validate){
        if ($this->request->isPost()) {
            $data = $this->request->post();
            if (!$validate->check($data)) {
                $this->result('', 1, $validate->getError());
            }
            if($invite->addInvite($data)){
                $this->sendConsumerChangeMsg($data['channel'],'add','',$data['status'],session('user.admin_name'));
                $this->result('', 0, '添加成功');
            }else{
                $this->result('', 1, '添加失败');
            }
        }

        $where[] = ['s.pid','neq',0];
        $where[] = ['p.pid','eq',0];
        $where[] = ['s.del','eq',0];
        //页面渲染
        try{
            $BrandList = Db::table('think_sign_brands')->alias('s')
                ->join(['think_sign_brands p'],'s.pid = p.id','left')
                ->field(['s.id', 's.pid', 'p.pid as fid' , 's.name' ,'p.name as p_name'])->where($where)->select();
        }catch (\Exception $e){
            return $e;
        }
        try{
            $ChannelList = Db::table('think_xx_style_channel')->field(['id','name','code'])->select();
        }catch (\Exception $e){
            return $e;
        }
        $this->assign('brandList', $BrandList);
        $this->assign('channelList', $ChannelList);
        return $this->fetch();
    }

    /*
     * 客户详情
     * */
    public function invite_edit(InviteModel $invite,$id=0){
        $info = $invite->find($id);
        $info['brands'] = explode(',',$info['brands']);
        $where[] = ['s.pid','neq',0];
        $where[] = ['p.pid','eq',0];
        $where[] = ['s.del','eq',0];
        //页面渲染
        try{
            $BrandList = Db::table('think_sign_brands')->alias('s')
                ->join(['think_sign_brands p'],'s.pid = p.id','left')
                ->field(['s.id', 's.pid', 'p.pid as fid' , 's.name' ,'p.name as p_name'])->where($where)->select();
        }catch (\Exception $e){
            return $e;
        }
        $where[] = ['s.id','in',$info['brands']];
        try{
            $BrandItem = Db::table('think_sign_brands')->alias('s')
                ->join(['think_sign_brands p'],'s.pid = p.id','left')
                ->field(['s.id', 's.pid', 'p.pid as fid' , 's.name' ,'p.name as p_name'])->where($where)->select();
        }catch (\Exception $e){
            return $e;
        }
        try{
            $ChannelList = Db::table('think_xx_style_channel')->field(['id','name','code'])->select();
        }catch (\Exception $e){
            return $e;
        }
        try{
            $AdminList = Db::table('admin_user')->field(['id','admin_name'])->select();
        }catch (\Exception $e){
            return $e;
        }

        $phonesList = empty($info['pics'])?'':explode(',',$info['pics']);
        $selectCategory = array(0=>'新增',1=>'未成交',2=>'成交',3=>'战败');
        $this->assign('info', $info);
        $this->assign('photos', $phonesList);
        $this->assign('selectCategory', $selectCategory);
        $this->assign('AdminList', $AdminList);
        $this->assign('brandList', $BrandList);
        $this->assign('brandItem', $BrandItem);
        $this->assign('channelList', $ChannelList);
        return $this->fetch();
    }

    /*
     * 客户修改
     * */
    public function invite_info_edit(InviteModel $invite,InviteValidate $validate){
        if ($this->request->isPost()) {
            $data = $this->request->post();
            if (!$validate->check($data)) {
                $this->result('', 1, $validate->getError());
            }
            $info = $invite::get($data['id']);
            if($invite->saveInvite($data)){
                //状态改变，通知相应人员
                if($info['status'] != $data['status']) $this->sendConsumerChangeMsg($data['channel'],'status',$info['status'],$data['status'],$data['name']);
                elseif($info['method'] != $data['method']) $this->sendConsumerChangeMsg($data['channel'],'method',$info['method'],$data['method'],$data['name']);

                $this->result('', 0, '修改成功');
            }else{
                $this->result('', 1, '修改失败');
            }
        }
        $this->result('', 1, '请求失败');
    }

    //微信公众号配置
    private $WxConfig = [
        'app_id' => 'wxd0ab978ac3dbd725',
        'secret' => '817149d4bf4c733978df31a886d02800',
        'token' => 'TestToken',
        'response_type' => 'array',
    ];
    private $consumerChangeTp = 'IrwpnXjEsYjPqv4dv9BwDOr8srG7Cm8XBmXwapTq-DE';

    /**
     * 客户状态改变发送微信信息给该渠道人
     * @access public
     * @param  string     $channel  渠道代码
     * @param  string     $type     改变类型
     * @param  int|string      $before   改变前的值
     * @param  int|string      $after    改变后的值
     * @param  string      $name    改变后的值
     * @throws
     * @return bool
     * */
    public function sendConsumerChangeMsg($channel, $type, $before, $after, $name){
        $access_token = get_wx_token();
        $statusArray = array(0=>'新增',1=>'未成交',2=>'成交',3=>'战败');
        $methodArray = array(1=>'到店拜访',2=>'到店拜访');

        $first = "您好，您渠道下的客户状态产生变化 \n \n客户名称：".$name;
        $key3 = date('Y-m-d H:i',time());
        if($type == 'status'){
            $key1 = "客户状态 \n变更之前：".$statusArray[$before];
            $key2 = $statusArray[$after]."\n操作人员：".session('user.admin_name');
        }elseif($type == 'method'){
            $key1 = "访问方式 \n变更之前：".$statusArray[$before];
            $key2 = $methodArray[$after]."\n操作人员：".session('user.admin_name');
        }elseif($type == 'add'){
            $key1 = "新增邀约客户";
            $key2 = $methodArray[$after]."\n操作人员：".session('user.admin_name');
        }else{
            return false;
        }
        $remark = "\n祝您生活愉快！";

        $openid = Db::table('think_xx_style_channel')->where('code',$channel)->value('wxopenid');
        $Factory = new Factory();
        $app = $Factory::officialAccount($this->WxConfig);
        $app['access_token']->setToken($access_token);
        $res = $app->template_message->send([
                'touser' => $openid,
                'template_id' => $this->consumerChangeTp,
                'data' => [
                    'first' => $first,
                    'keyword1' => $key1,
                    'keyword2' => $key2,
                    'keyword3' => $key3,
                    'remark' => $remark
            ],
        ]);
        return $res;
    }

    /*
     * 跟进详情
     * */
    public function invite_follow(FollowModel $model,$id=0){
        //用户组id 14为门店销售，可以写跟进，其余人只能看不能动
        $gidArr = explode(',',session('user.gid'));
        if(in_array(14,$gidArr)){
            $this->assign('sale_aid', session('user.id'));
        }
        if(empty($id)) $this->error('参数错误');
        $FollowList = $model->FollowList($id);
        $this->assign('FollowList', $FollowList);
        $this->assign('cid', $id);
        return $this->fetch();
    }

    /*
     * 增加跟进
     * */
    public function follow_add(FollowModel $model){
        if($this->request->isPost()){
            $data = $this->request->post();
            if(empty($data['content'])) $this->result('', 1, '请填写跟进内容');
            if($data['id'] == -1){
                unset($data['id']);
                $res = $model->addFollow($data);
            }else{
                $res = $model->saveFollow($data);
            }
            if($res){
                //跟进记录改变后，客户最新更新时间显示出来
                try{
                    db::table('invite_consumer')->where(['id'=>$data['cid']])->update(['updatetime'=>time()]);
                }catch (\Exception $e){}

                $this->result('', 0, '操作成功');
            }else{
                $this->result('', 1, '操作失败');
            }
        }
        $this->result('', 1, '请求失败');
    }

    /*
     * 删除跟进
     * */
    public function follow_delete(FollowModel $model){
        if($this->request->isPost()){
            $id = $this->request->post('id');
            if(empty($id)) $this->result('', 1, '参数错误');
            if($model->delFollow($id)){
                $this->result('', 0, '删除成功');
            }else{
                $this->result('', 1, '删除失败');
            }
        }
        $this->result('', 1, '请求失败');
    }

    /*
     * 报表查看
     * */
    public function invite_report(InviteModel $model,$type = 0){
        $list = $model->getReport($type);
        $this->assign('list', $list);
        $this->assign('option', array(0=>'全部',1=>'当天',2=>'昨天',3=>'当周',4=>'上周',5=>'当月',6=>'上月'));
        $this->assign('type', $type);
        return $this->fetch();
    }


}
