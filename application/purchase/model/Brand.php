<?php
namespace app\purchase\model;

use think\Model;

class Brand extends Model
{
	protected $table = 'think_sign_brands';

	public function getBrands()
	{
		return $this->where('pid',0)->order('letter asc')->select();
	}

	public function getTypes($pid='')
	{
		return $this->where('pid',$pid)->order('letter asc')->select();
	}

}