<?php
namespace app\invite\model;

use app\common\model\Base;
use think\Db;
use app\common\Controller\IkCrm;

class Invite extends Base
{
    protected $table = 'invite_consumer';

    public function inviteList($where){
        $field = ['c.id', 'c.name', 'c.phone', 'a.admin_name', 'c.status', 'c.updatetime', 'c.createtime' ,'c.wx_id'];
        try{
            $list = $this->alias('c')
                ->join(['admin_user a'], 'c.aid=a.id','left')
                ->join(['invite_follow f'], 'f.cid=c.id','left')
                ->where($where)->order('c.createtime desc')->group('c.id')->field($field)->paginate(10);
            return $list;
        }catch (\Exception $e){
            return $e;
        }
    }

    public function addInvite($data){
        //设置录入数据
        if($data['user_type'] == 1) {
            $data['wx_id'] = $data['phone'];
            $data['phone'] = '';
        }else{
            $ikCrm = new IkCrm;
            //有手机的客户，查找CRM,没有就增加
            $ikCustomer = $ikCrm->getCustomers($data['phone']);
            if(isset($ikCustomer['code']) && $ikCustomer['code'] === 0 && isset($ikCustomer['data']['customers']) && count($ikCustomer['data']['customers']) > 0) {
                $data['crm_user'] = intval($ikCustomer['data']['customers'][0]['id']);
            }else{
                $brandArr = explode(',',$data['brand']);
                try{
                    $brandInfo = Db::table('think_sign_brands')->alias('b')
                        ->join(['think_sign_brands p'], 'p.id=b.pid','left')
                        ->where(array('b.id'=>$brandArr[0]))
                        ->field('p.name as brand,b.name as module')
                        ->find();
                }catch (\Exception $e){
                    return $e;
                }
                $addIKData['name'] = $data['name'];
                $addIKData['phone'] = $data['phone'];
                $addIKData['brand'] = $brandInfo['brand'];
                $addIKData['module'] = $brandInfo['module'];
                $addIKData['channel'] = $data['channel'];
                $addRes = $ikCrm->addIKCustomer($addIKData);
                if(isset($addRes['code']) && $addRes['code']===0) $data['crm_user'] = $addRes['data']['id'];
            }
        }
        unset($data['user_type']);

        $followData['aid'] = $data['aid'] = session('user.id');
        $data['updatetime'] = $followData['createtime'] = $data['createtime'] = time();
        $followData['content'] = $data['follow'];
        unset($data['follow']);

        $result = $this->insert($data);
        $followData['cid'] = $this->getLastInsID();
        if(!empty($followData['content'])) Db::table('invite_follow')->insert($followData);
        return $result;
    }

    public function saveInvite($data){
        //设置录入数据
        if($data['user_type'] == 1) {
            $data['wx_id'] = $data['phone'];
            $data['phone'] = '';
            unset($data['user_type']);
        }
        $data['updatetime'] = time();

        $result = $this->isUpdate(true)->save($data);
        return $result;
    }

    public function getReport($type){
        switch ($type){
            case 1:
                //今日开始时间戳和结束时间戳
                $beginTime = mktime(0,0,0,date('m'),date('d'),date('Y'));
                $endToTime = mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
                break;
            case 2:
                //昨日开始时间戳和结束时间戳
                $beginTime = mktime(0,0,0,date('m'),date('d')-1,date('Y'));
                $endToTime = mktime(0,0,0,date('m'),date('d'),date('Y'))-1;
                break;
            case 3:
                //当周开始时间戳和结束时间戳
                $beginTime = mktime(0,0,0,date('m'),date('d')-date('w'),date('Y'));
                $endToTime = mktime(23,59,59,date('m'),date('d')-date('w')+7,date('Y'));
                break;
            case 4:
                //上周开始时间戳和结束时间戳
                $beginTime = mktime(0,0,0,date('m'),date('d')-date('w')-7,date('Y'));
                $endToTime = mktime(23,59,59,date('m'),date('d')-date('w'),date('Y'));
                break;
            case 5:
                //当月开始时间戳和结束时间戳
                $beginTime = mktime(0,0,0,date('m'),1,date('Y'));
                $endToTime = mktime(23,59,59,date('m'),date('t'),date('Y'));
                break;
            case 6:
                //当月开始时间戳和结束时间戳
                $beginTime = mktime(0,0,0,date('m')-1,1,date('Y'));
                $endToTime = mktime(0,0,0,date('m'),1,date('Y'))-1;
                break;
            default:
                $beginTime = 0;
                $endToTime = time();
                break;
        }
        try{
            $admin_list = Db::table('admin_user')->alias('a')
                ->join(['admin_auth_group_access g'],'g.uid=a.id','left')
                ->where('FIND_IN_SET("14",g.group_id)')
                ->field('a.admin_name,a.id')->select();
            $list = [];
            foreach($admin_list as $k=>$v){
                $num = Db::table('invite_consumer')->where(array('aid'=>$v['id'],'del'=>0))->whereBetween('updatetime',[$beginTime,$endToTime])
                    ->field('sum(method = 1) as come_num,sum(method = 2) as go_num,sum(status = 2) as deal_num,sum(status = 1) as not_deal_num,sum(status = 3) as fail_num')
                    ->group('aid')->select();
                if(!empty($num)){
                    $list[$k] = $num[0];
                    $list[$k]['admin_name'] = $v['admin_name'];
                }else{
                    $list[$k]['admin_name'] = $v['admin_name'];
                    $list[$k]['come_num'] = $list[$k]['go_num'] = $list[$k]['deal_num'] = $list[$k]['not_deal_num'] = $list[$k]['fail_num'] = 0;
                }
            }
            return $list;
        }catch (\Exception $e){
            return $e;
        }
    }
}
