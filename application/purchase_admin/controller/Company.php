<?php 
namespace app\purchase_admin\controller;

use app\common\controller\Base;

use app\purchase\model\Company as CompanyModel;
use app\purchase\model\CompanyApply;
use app\purchase\model\User;

class Company extends Base
{
	public function edit($id,CompanyModel $Company)
	{
		$info = $Company->get($id);
		$photos = $info['licence_pic'] ? explode(',', $info['licence_pic']) : [];

		$this->assign('info',$info);
		$this->assign('photos',$photos);

		return view();

	}

	public function update($id,CompanyModel $Company)
	{
		$data = request()->only('company_name,company_info,licence_pic,group_id');
		
		$data['update_time'] = time();

		$res = $Company->where('id',$id)->data($data)->update();

		if ($res) {
			return success('', '修改成功');
		}
		else{
			return error('修改失败');
		}

	}

	public function index($key_word='',$page_size=10,CompanyModel $Company)
	{
		$Sql = $Company
		->alias('c')
		->field('c.*,u.name')
		->join(['purchase_user_relation ur'], 'ur.company_id = c.id AND ur.is_admin = 1','LEFT')
		->join(['think_business_users_union u'], 'ur.user_id = u.id','LEFT')
		->order('c.id desc')
		->group('c.id');

		if ($key_word) {
			$Sql->where('company_name',$key_word);
		}
		$list = $Sql->paginate($page_size);
		// halt($list);
		$this->assign('list',$list);
		return view();
	}




	public function resolve_apply($apply_id,CompanyApply $CompanyApply,CompanyModel $Company)
	{
		//成功审核
		//找到这条申请
		$apply = $CompanyApply->get($apply_id)->toArray();
		
		//查找是否有重复公司在公司表
		$res = $Company->field('id')->get(['company_name'=>$apply['name']]);
		if ($res) {
			//存在公司返回已存在
			return error('该公司已存在!');
		}
		//更新状态
		$res = $CompanyApply->where(['id'=>$apply['id']])->data(['status'=>1])->update();

		$data = [];
		$data['company_name'] = $apply['name'];
		$data['licence_pic'] = $apply['licence_pic'];
		$data['create_time'] = time();
		$data['update_time'] = time();
		$res = $Company->insertGetId($data);
		return success('审核成功');

	}
	public function reject_apply($apply_id='',$reject_note='',CompanyModel $Company,CompanyApply $CompanyApply)
	{
		//否决认证并返回信息
		//找到这条申请
		$apply = $CompanyApply->get($apply_id)->toArray();
		
		//查找是否有重复公司在公司表
		$res = $Company->field('id')->get(['company_name'=>$apply['name']]);
		if ($res) {
			//存在公司返回已存在
			return error('该公司已存在!');
		}

		//更新状态并写审核建议
		$data = [];
		$data['status'] = -1;
		$data['reject_note'] = $reject_note;
		$data['update_time'] = time();
		$res = $CompanyApply->where(['id'=>$apply['id']])->data($data)->update($data);
		return success('驳回成功');
	}

	public function delete_apply($apply_id,CompanyApply $CompanyApply)
	{
		return success($CompanyApply->where(['id'=>$apply_id])->delete());
	}

	public function apply_list($key_word='',$status='',$page_size=20,CompanyApply $CompanyApply)
	{
		// halt($status);
		$Sql = $CompanyApply
		->alias('ca')
		->field('ca.*,u.name as user_name')
		->order('ca.id desc')
		->join(['think_business_users_union u'],'u.id = ca.user_id','LEFT');

		if ($key_word) {
			$Sql = $CompanyApply->where('ca.name|ca.note|u.name|u.phone','like','%'.$key_word.'%');
		}
		if ($status === '0' || $status) {
			$Sql = $CompanyApply->where('status',$status);
		}
		$list = $Sql->paginate($page_size);
		$this->assign('status',$status);
		$this->assign('key_word',$key_word);

		$this->assign('list',$list);


		return view();
	}
}