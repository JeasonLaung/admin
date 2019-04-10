<?php
namespace app\purchase\model;

use think\Model;
use think\Db;

class Chat extends Model
{
	protected $table = 'purchase_chat';
	public function insertData($data=[])
	{
		// 表情兼容
		return Db::connect('mysql://root:root@127.0.0.1:3306/mputao#utf8mb4')
			->table($this->table)
			->insert($data);
	}
	public function selectData($where=[],$limit='0,30',$order="id desc")
	{
		return Db::connect('mysql://root:root@127.0.0.1:3306/mputao#utf8mb4')
			->table($this->table)
			->where($where)
			->limit($limit)
			->order($order)
			->select();
	}

}