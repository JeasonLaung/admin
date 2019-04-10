<?php
namespace app\purchase\behavior;
use app\purchase\model\DemandMessage;

class CreateMsg
{
	public function run($params)
	{
		

		$cmd = @$params['cmd'];
		$data = @$params['data'];

		switch ($cmd) {
			// 报价消息
			case 'quote':
				$DemandMessage = new DemandMessage;
				// ['ask_id','user_id','quote_id'] 需要接受的数据[需求id，需求方id，报价id]
				$data['create_time'] = time();
				$res = $DemandMessage->insert($data);
				break;
			
			default:
				return error('异常消息操作！');
				break;
		}
	}
}