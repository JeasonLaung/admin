<?php 
namespace app\index\model;

class Sms extends \think\Model
{
	protected $table = 'think_sign_smslog';


	public function updateData($id='')
	{
		json(123)->send();
		exit();
	}
}