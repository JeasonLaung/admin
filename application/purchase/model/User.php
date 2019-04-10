<?php
namespace app\purchase\model;

use think\Model;

class User extends Model
{
	protected $table = 'think_business_users_union';
	public function see($id)
	{
		return $this->get($id);
	}

	public function insertData($data)
	{
		$data['user_id'] = session('user.id');
		// halt(session('user.id'));
		$data['createtime'] = time();
        $res = $this->insertGetId($data);
		if ($res) {
			json(['status'=>1,'msg'=>'添加成功'])->send();
			exit();
		}
		else {
			json(['status'=>0,'msg'=>'添加失败'])->send();
			exit();
		}
	}
	public function updateData($id='',$data=[])
	{
		// $data['update_time'] = time();
		$res = $this->where('id',$id)->data($data)->update();
		json(['status'=>1,'msg'=>'编辑成功'])->send();
		exit();
	}

	public function deleteData($id)
	{
		if (session('uid' == 1)) {
			//超级会员跳过认证是否该用户
			$res = $this->where('id',$id)->delete();
		}
		else{
			$res = $this
			->where('id',$id)
			->where('user_id',session('uid'))
			->delete();			
		}

		if ($res) {
			json(['status'=>1,'msg'=>'删除成功'])->send();
			exit();
		}
		else {
			json(['status'=>0,'msg'=>'删除失败'])->send();
			exit();
		}
	}
}