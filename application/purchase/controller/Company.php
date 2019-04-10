<?php 
namespace app\purchase\controller;
use app\purchase\model\CompanyApply;
use app\purchase\model\JoinCompanyApply;
use app\purchase\model\Company as CompanyModel;
use app\purchase\model\UserRelation;

use app\purchase\model\Market;
use app\purchase\model\Imported;
use app\purchase\model\Ask;

/**
 * 
 */
class Company extends Base
{	
	public function my($id,CompanyModel $Company,UserRelation $UserRelation)
	{
		$uid = request()->uid;
		$res = $UserRelation
		->alias('ur')
		->field('c.id,company_name,company_logo,company_info')
		->where(['user_id'=>$uid])
		->join('purchase_company c','c.id = ur.company_id')
		->find();

		if (!empty($res)) {
			return error();
		}
		return success($res);
	}

	public function read($id,CompanyModel $Company,UserRelation $UserRelation)
	{
		$uid = request()->uid;

		//查一下我是不是管理员
		$res = $UserRelation->field('user_id')->where(['company_id'=>$id,'is_admin'=>1,'user_id'=>$uid])->find();
		if (!empty($res)) {
			return success($Company->get($id));
		}


		$res = $Company->field('company_name,company_info,company_logo,id')->get($id);
		if (empty($res)) {
			return error();
		}
		else {
			return success($res);
		}
	}



	// public function markets($company_id,Market $Market,UserRelation $UserRelation,CompanyModel $Company)
	// {
	// 	return $Market
	// 	->alias('m')
	// 	->where(['m.user_id'=>''])
	// 	->join('purchase_user_relation ur', 'ur.company_id = '.$company_id,'LEFT')
	// 	->join('purchase_company c','c.company_id','LEFT')
	// }


	public function staff(UserRelation $UserRelation)
	{
		$uid = request()->uid;
		//找到我是那个公司的管理员
		$company_id = $UserRelation->where(['user_id'=>$uid])->value('company_id');
		if (empty($company_id)) {
			//不存在
			return error();
		}
		
		$res = $UserRelation
		->alias('ur')
		->field('u.name,u.phone')
		->where(['company_id'=>$company_id])
		->join('think_business_users_union u','ur.user_id = u.id')
		->select();
		return success($res);
	}

	public function quit(CompanyModel $Company,UserRelation $UserRelation)
	{
		$uid = request()->uid;
		$res = $UserRelation->where(['user_id'=>$uid])->data(['company_id'=>''])->update();
		if ($res) {
			return success(request()->groud,'退出成功');
		}
		else {
			return error('退出失败');			
		}
	}
	
	public function fast_join(CompanyModel $Company,UserRelation $UserRelation)
	{
		$uid = request()->uid;
		//邀请码直接加入.
		$data = $this->request->only('company_id,invite_code','post');
		$company_id = $data['company_id'];
		$invite_code =  $data['invite_code'];
		$res = $Company->field('id')->get(['id'=>$company_id,'invite_code'=>$invite_code]);

		if ($res) {
			$UserRelation->where(['user_id'=>$uid])->data(['company_id'=>$company_id])->update();
			return success(request()->groud,'加入成功');
		}
		else {
			return error('邀请码不正确');			
		}
	}

	/**
	 *
	 *  公司注册申请等待
	 */
	public function wait(CompanyApply $CompanyApply,CompanyModel $Company)
	{
		$uid = request()->uid;
		$res = $CompanyApply->field('id')->get(['user_id'=>'','is_pass'=>0]);
		if ($res) {
			//还在申请中
			return error();
		}
		else {
			return success();
		}
	}
	/**
	 *
	 * 注册公司
	 *
	 */
	public function register(CompanyApply $CompanyApply,CompanyModel $Company)
	{
		$uid = request()->uid;
		//$uid = 2;
		//普通用户注册公司,交由后台审核
		$data = request()->only('name,note,licence_pic,linkman','post');

		$result = $this->validate($data,'\app\purchase\validate\Company.register_company');
		if(true !== $result){
            //  验证失败输出错误信息
            return error($result);
        }

        $res = $Company->field('id')->get(['company_name'=>$data['name']]);
        if ($res) {
        	return error('已存在该公司');
        }

        $data['licence_pic'] = join($data['licence_pic'],',');
		$data['create_time'] = time();
		$data['user_id'] = $uid;
		$res = $CompanyApply->insert($data);
		if ($res) {
			return success('申请成功，请等待管理员审核');
		}
	}
	/**
	 *
	 * 同意加入申请
	 *
	 */
	public function add_person(UserRelation $UserRelation,JoinCompanyApply $JoinCompanyApply)
	{
		//供应商添加员工
		// 操作者id
		$uid = request()->uid;
		//$uid = 2;

		// 被操作者id
		$data = request()->only('user_id','post');
		$result =   $this->validate($data,'app\purchase\validate\Company.add_person');
        if(true !== $result){
            //  验证失败输出错误信息
            return error($result);
        }

        //先看看这个人是不是公司管理员
		$res = $UserRelation->field('company_id')->where(['is_admin'=>1,'user_id'=>$uid])->find();

		if (empty($res)) {
			return error('不是本公司管理员不能进行此操作');
		}

        //再看看是不是自主申请的
		$res2 = $JoinCompanyApply->field('id')->where(['user_id'=>$data['user_id'],'company_id'=>$company_id])->find();

		if (empty($res2)) {
			return error('需要用户提出申请才能添加');
		}

		
		// 已经注册的用户会有，所以不用再查是否存在，直接update
		$data['company_id'] = $res['company_id'];
		$data['create_time'] = time();
		$res = $UserRelation->where('user_id',$data['user_id'])->data($data)->update();
		if ($res) {
			return success('添加成功');
		}
		else {
			return error();
		}
	}

	public function get_join_apply(CompanyApply $CompanyApply,JoinCompanyApply $JoinCompanyApply,UserRelation $UserRelation)
	{
		//供应商添加员工
		// 操作者id
		$uid = request()->uid;

		//先看看这个人是不是公司管理员
		$res = $UserRelation->field('company_id')->where(['is_admin'=>1,'user_id'=>$uid])->find();
		if (empty($res)) {
			return error('不是本公司管理员不能进行此操作');
		}
		//公司
		$company_id = $res['company_id'];

		//获取用户申请公司的所有申请列
		$res = $JoinCompanyApply
		->where(['company_id'=>$company_id])
		->order('id desc')
		->select();
		if ($res) {
			return success($res);
		}
		else{
			return error();
		}
		

	}
	/**
	 *
	 * 拒绝申请
	 */

	// public function reject_apply(UserRelation $UserRelation,JoinCompanyApply $JoinCompanyApply)
	// {
		


	// 	if ($res) {
	// 		return success('添加成功');
	// 	}
	// 	else {
	// 		return error();
	// 	}
	// }


	public function index($key_word="",CompanyModel $Company)
	{
		if (!$key_word) {
			return error('请输入公司');
		}

		$res = $Company
		->field('company_name,company_info,id')
		->where('company_name','like','%'.$key_word.'%')
		->select();
		if (empty($res)) {
			return error('找不到该公司');
		}
		return success($res);
	}

	public function join($company_id,JoinCompanyApply $JoinCompanyApply)
	{
		//员工加入供应商
		$uid = request()->uid;
		//$uid = 2;
		//普通用户注册公司,交由后台审核
		//员工需要搜索公司全称才能加入
		//搜索公司
		
		$data['company_id'] = $company_id;
		$data['create_time'] = time();
		$data['user_id'] = $uid;

		$res = $JoinCompanyApply->insert($data);
		if ($res) {
			return success('申请成功，请等待公司审核');
		}
	}
	public function remove_person()
	{
		//供应商删除员工
		//供应商添加员工
		// 操作者id
		$uid = request()->uid;

		//$uid = 2;
		// 被操作者id
		$data = request()->only('user_id','post');
		$result =   $this->validate($data,'app\purchase\validate\Company.add_person');
        if(true !== $result){
            //  验证失败输出错误信息
            return error($result);
        }

		//先看看操作者是不是公司管理员
		$res = $UserRelation->field('company_id')->where(['is_admin'=>1])->get(['user_id'=>$uid]);


		if (empty($res)) {
			return error('不是本公司管理员不能进行此操作');
		}

		//该公司id
		$company_id = $res['company_id'];
		$res = $UserRelation
		//找到这个公司不是管理员的被操作者
		->where(['company_id'=>$company_id,'is_admin' => 0,'user_id'=>$data['user_id']])
		->data(['company_id'=>null])
		->update($data);
		if ($res) {
			return success('移除成功');
		}
		else {
			return error('移除失败');
		}
	}
	
	public function update($company_id,UserRelation $UserRelation,CompanyModel $Company)
	{
		$uid = request()->uid;
		//供应商编辑自身信息，除了营业执照等重要信息需要后台更改其他都可以
		$data = request()->only('company_info,company_logo','post');
		//$uid = 2;

		$res = $UserRelation->where(['company_id'=>$company_id,'user_id'=>$uid,'is_admin'=>1]);
		if (empty($res)) {
			// 不是该企业管理者
			return error('非企业管理员无法操作');
		}

		$data['update_time'] = time();
		$res = $Company->where(['id'=>$company_id])->data($data)->update();
		if ($res) {
			return success('修改成功');
		}
		else{
			return error('修改失败');
		}

	}
}