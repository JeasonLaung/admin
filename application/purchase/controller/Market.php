<?php 
namespace app\purchase\controller;
use app\purchase\model\Market as MarketModel;
use app\purchase\model\Brand;
use app\purchase\model\MarketLike;


/**
 * 
 */
// class Market extends \think\Controller
class Market extends Base
{
    // 推荐车源
    public function recommond()
    {
        
    }

    public function like($id,MarketLike $MarketLike,MarketModel $Market)
    {
        $uid = request()->uid;

        $data = ['user_id'=>$uid,'market_id'=>$id];
        $res = $MarketLike->field('id')->get($data);
        if (!empty($res)) {
            return error('已点赞');
        }
        $data['create_time'] = time();
        $res = $MarketLike->insert($data);
        if ($res) {
            return success();
        }
        else{
            return error();
        }
    }

    public function unlike($id,MarketLike $MarketLike)
    {
        $uid = request()->uid;
        $data = ['user_id'=>$uid,'market_id'=>$id];
        $res = $MarketLike->where($data)->delete();
        if ($res) {
            return success();
        }
        else{
            return error();
        }
    }

    public function my_like(MarketModel $Market,MarketLike $MarketLike)
    {
        $uid = request()->uid;

        $res = $MarketLike->alias('ml')
        ->field('m.*,u.name,u.phone,c.company_name,b.name as brand_name,b.img,!ISNULL(m.id) as liked,c.company_logo')
        ->join('purchase_market m','m.id = ml.market_id')
        ->join('think_sign_brands b','b.id = m.brand_id')
        ->join('think_business_users_union u','u.id = m.user_id')
        ->join('purchase_user_relation ur','ur.user_id = ml.user_id')
        ->join('purchase_company c','c.id = ur.company_id')
        ->where(['m.status'=>1,'m.is_delete'=>0])
        ->where('ml.user_id',$uid)
        ->order('ml.id desc')
        ->select();
        return success($res);
    }

	public function my(MarketModel $Market)
	{
		$uid = request()->uid;
		$res = $Market->alias('m')
            ->field('m.*,b.name as brand_name,img')
            ->where('m.user_id',$uid)
            ->where(['m.status'=>1,'m.is_delete'=>0])
            ->join('think_sign_brands b', 'm.brand_id=b.id','LEFT')
            ->order('m.create_time desc')
            ->select();
        if (empty($res)) {
       		return error('没有此车源信息');
        }else{
       		return success($res);
        }
	}


    public function index($page_num=1,$page_size=10,$key_word='',$brand_id='',MarketModel $Market)
    {
        $uid = getUserId();

        // $uid = 1;

        if ($uid) {
            $Sql = $Market->alias('m')
            ->field('m.*,b.name as brand_name,b.img,u.name,u.phone,!ISNULL(ml.id) as liked')
            ->where(['m.status'=>1,'m.is_delete'=>0])
            ->join('purchase_market_like ml', 'm.id =ml.market_id and ml.user_id='.$uid,'LEFT')
            ->join('think_sign_brands b','b.id = m.brand_id','LEFT')
            ->join('think_business_users_union u', 'm.user_id=u.id','LEFT');
        }
        else {
            $Sql = $Market->alias('m')
            ->field('m.*,b.name as brand_name,b.img,u.name,u.phone')
            ->where(['m.status'=>1,'m.is_delete'=>0])
            ->join('think_sign_brands b','b.id = m.brand_id','LEFT')
            ->join('think_business_users_union u', 'm.user_id=u.id','LEFT');
        }

        if ($key_word) {
            $Sql = $Sql->where('m.market|b.name','like','%'.$key_word.'%');
        }

        if ($brand_id) {
            $Sql = $Sql->where('brand_id',$brand_id);
        }
        
        $res = $Sql->limit((int)$page_size * abs((int)$page_num- 1),$page_size)
                ->order('m.id desc')
                ->select();
        // return $Market->getLastSql();
        if(empty($res)){
            return error('没有找到行情');
        }


        return success($res);
    }

    public function read($id,MarketModel $Market)
    {
        $uid = getUserId();
        
        if ($uid) {
            $data = $Market->alias('m')
            ->field('m.*,b.name as brand_name,b.img,u.name,u.phone,!ISNULL(ml.id) as liked,company_name,company_logo,ur.company_id')
            ->where(['m.status'=>1,'m.is_delete'=>0])
            ->join('think_sign_brands b','b.id = m.brand_id','LEFT')
            ->join('think_business_users_union u', 'm.user_id=u.id','LEFT')

            /*公司*/
            ->join('purchase_user_relation ur', 'm.user_id=ur.user_id')
            ->join('purchase_company c', 'c.id=ur.company_id','LEFT')

            /*喜欢*/
            ->join('purchase_market_like ml', 'm.id =ml.market_id and ml.user_id='.$uid,'LEFT')
            ->where('m.id',$id)
            ->find();
        }
        else {
            $data = $Market->alias('m')
            ->field('m.*,b.name as brand_name,b.img,u.name,u.phone,company_name,company_logo,ur.company_id')
            ->where(['m.status'=>1,'m.is_delete'=>0])
            ->join('think_sign_brands b','b.id = m.brand_id','LEFT')
            /*公司*/
            ->join('purchase_user_relation ur', 'm.user_id=ur.user_id')
            ->join('purchase_company c', 'c.id=ur.company_id','LEFT')

            ->join('think_business_users_union u', 'm.user_id=u.id','LEFT')
            ->where('m.id',$id)
            ->find();
        }
        if (!empty($data)) {
            return success($data);
        }
        else{
            return error('车源信息不存在');
        }
    }

    public function save(MarketModel $Market)
    {
        $uid = request()->uid;
        $data = $this->request->only('market,brand_id');

        // 数据验证
        $result =   $this->validate($data,'app\purchase\validate\Ask.market');
        if(true !== $result){
            //  验证失败输出错误信息
            return error($result);
        }

        // 过滤标签
        $data['market']=\Safe::filter($data['market']);
        // 插入数据库
        $data['user_id'] = $uid;
        $data['create_time'] = time();
        $ask_id = $Market->insertGetId($data);
        if ($ask_id) {
            return success($ask_id,'发布成功');
        }
        else{
            return success('发布失败');
        }
    }

    public function delete($id='',MarketModel $Market)
    {
        $uid = request()->uid;
        

        $res = $Market->where(['is_delete'=>0,'id'=>$id, 'user_id'=>$uid])
                    ->data(['is_delete'=>1,'update_time'=>time()])
                    ->update();
        if($res){
            return success('','删除成功');
        }else{
            return error('删除失败');
        }
    }

    public function update($id='',MarketModel $Market)
    {

        $uid = request()->uid;

        $data = $this->request->only('market,brand_id','post');
        // 数据验证
        $result =   $this->validate($data,'app\purchase\validate\Ask.market');
        if(true !== $result){
            //  验证失败输出错误信息
            return error($result);
        }

        // 过滤标签
        $data['market']=\Safe::filter($data['market']);
        // 插入数据库
        $data['update_time'] = time();
        $res = $Market
        ->where(['id'=>$id,'user_id'=>$uid])
        ->where(['status'=>1,'is_delete'=>0])
        ->data($data)->update();
        if ($res) {
            return success($id,'修改成功');
        }
        else{
            return error('修改失败');
        }
    }
}