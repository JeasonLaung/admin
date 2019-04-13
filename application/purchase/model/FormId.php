<?php
namespace app\purchase\model;

use think\Model;

class FormId extends Model
{
	protected $table = 'purchase_form_id';
	protected $insert = ['create_time'];

	public function setCreateTimeAttr()
	{
		return time();
	}
}