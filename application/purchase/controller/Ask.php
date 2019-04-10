<?php 
namespace app\purchase\controller;
use app\purchase\model\Ask as AskModel;
use app\purchase\model\Quote;
use app\purchase\model\AskHasRead;

 

/**
 * 
 */
// class Ask extends \think\Controller
class Ask extends Base
{
	// 推荐需求
	public function recommond()
	{
		# code...
	}

	public function quote($ask_id,Quote $Quote,AskModel $Ask)
	{
		$uid = request()->uid;
        // 如果我是需求者，我可以看报价
        $res = $Ask->field('id')->get(['user_id'=>$uid,'id'=>$ask_id]);
        if ($res) {
            // 如果我是需求者，我可以看报价
            $data = $Quote
            ->alias('q')
            ->field('q.*,u.name,u.phone,c.company_name,c.company_logo')
            ->join('purchase_user_relation ur','ur.user_id = q.user_id','LEFT')
            ->join('purchase_company c','ur.company_id = c.id','LEFT')
            ->join('think_business_users_union u', 'q.user_id=u.id','LEFT')
            ->where(['q.status'=>1,'q.is_delete'=>0,'q.ask_id'=>$ask_id])
            ->order('q.id desc')
            ->select();
        }
        else{
            $data = $Quote
            ->alias('q')
            ->field('q.id,q.update_time,q.create_time,u.name,c.company_name,c.company_logo')
            ->join('purchase_user_relation ur','ur.user_id = q.user_id','LEFT')
            ->join('purchase_company c','ur.company_id = c.id','LEFT')
            ->join('think_business_users_union u', 'q.user_id=u.id')
            ->where(['q.status'=>1,'q.is_delete'=>0,'q.ask_id'=>$ask_id])
            ->order('q.id desc')
            ->select();
        }

		// $data = $Quote
  //           ->alias('q')
  //           ->field('q.*,u.name,u.phone,c.company_name')
  //           ->join('purchase_user_relation ur','ur.user_id = q.user_id','LEFT')
  //           ->join('purchase_company c','ur.company_id = c.id','LEFT')
  //           ->join('think_business_users_union u', 'q.user_id=u.id','LEFT')
  //           ->where(['q.status'=>1,'q.is_delete'=>0,'q.ask_id'=>$ask_id])
  //           ->order('id desc')
  //           ->select();
        if ($data) {
            success($data);
        } 
        else{
            error('找不到报价');
        }
	}

	public function my(AskModel $Ask)
	{
		$uid = request()->uid;

        $res = $Ask->alias('a')->join('think_sign_brands b','b.id=a.brand_id')->field('a.*, b.name as brand_name')
            ->where('user_id',$uid)
            ->where(['is_delete'=>0,'status'=>1])
            ->order('id desc')
            ->select();
        if (empty($res)) {
            return error('还没发布需求');
        }
        return success($res);
	}

	public function read($id,AskModel $Ask,AskHasRead $AskHasRead)
	{
		$uid = request()->uid;

		$res = $Ask
		->field('a.*,u.name,u.phone,u.id as user_id,b.name as brand_name,b.img')
		->alias('a')
        ->join('think_business_users_union u', 'a.user_id=u.id','LEFT')
		->join('think_sign_brands b', 'b.id=a.brand_id','LEFT')
		->get(['a.status'=>1,'a.is_delete'=>0,'a.id'=>$id]);

		if ($res) {
			//记录观看
			$AskHasRead->insert(['user_id'=>$uid,'ask_id'=>$id,'create_time'=>time()]);
			return success($res);
		}
		else{
			error('没有该需求');
		}
	}
	public function index($page_num=1,$page_size=10,$key_word='',$brand_id='',AskModel $Ask)
	{
		$uid = request()->uid;

		$Sql = $Ask
		->field('a.*,u.name,u.phone,u.id as user_id,b.name as brand_name,b.img')
		->alias('a')
		->join('think_business_users_union u', 'a.user_id=u.id','LEFT')
        ->join('think_sign_brands b', 'b.id=a.brand_id','LEFT')
		->where(['a.status'=>1,'a.is_delete'=>0]);

		if ($key_word) {
            $Sql = $Sql->where('b.name|a.car_name','like','%'.$key_word.'%');
        }
        if ($brand_id) {
            $Sql = $Sql->where('b.id',$brand_id);
        }

		$res = $Sql->limit((int)$page_size * abs((int)$page_num- 1),$page_size)->order('a.id desc')
		->select();
		return success($res);
	}

	public function save(AskModel $Ask)
	{
		$uid = request()->uid;
        
        $data = $this->request->only('brand_id,car_name,car_price,car_product_time,province,city,region,car_color,note,car_level');

        // 数据验证
        $result =   $this->validate($data,'app\purchase\validate\Ask.ask');
        if(true !== $result){
            //  验证失败输出错误信息
            return error($result);
        }
        // 插入数据库
        $data['user_id'] = $uid;
        $data['create_time'] = time();
        $ask_id = $Ask->insertGetId($data);
        if ($ask_id) {
        	return success($ask_id,'发布成功');
        }
        else {
        	return error('发布失败');
        }
	}

	public function update($id,AskModel $Ask)
    {
        $uid = request()->uid;
        
        $data = $this->request->only('brand_id,car_name,car_price,car_product_time,province,city,region,car_color,note,car_level');

        // 数据验证
        $result =   $this->validate($data,'app\purchase\validate\Ask.ask');
        if(true !== $result){
            //  验证失败输出错误信息
            return error($result);
        }
        $data['update_time'] = time();
        $res = $Ask->where(['status'=>1,'is_delete'=>0,'user_id'=>$uid,'id'=>$id])->data($data)->update();
        // return success($ask_id,'发布成功');
        if ($res) {
            return success('','编辑成功');
        }
        else{
            return success('','编辑失败');
        }
    }

    public function delete($id,AskModel $Ask)
    {
        $uid = request()->uid;
        
        $data = $this->request->only('id','POST');

        $data['update_time'] = time();
        $data['is_delete'] = 1;
        $res = $Ask->where(['status'=>1,'is_delete'=>0,'user_id'=>$uid,'id'=>$id])->data($data)->update();
        // return success($ask_id,'发布成功');
        if ($res) {
            return success('','删除成功');
        }else{
            return error('删除失败');

        }
    }

}