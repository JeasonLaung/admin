<?php
namespace app\purchase\behavior;
// use app\purchase\model\DemandMessage;
use app\purchase\model\FormId;
use app\purchase\model\User;
use app\purchase\model\Ask;


/**
 * @param $to_id 发送的user_id本地的 *
 * @param $cmd 消息种类
 * @param $data 附带参数
 *
 *
 */

class CreateMsg
{
	public function run($params)
	{
		$FormId = new FormId;
		$User = new User;
		$app = Factory::miniProgram(config('easy_wechat'));

		//发送的用户id
		$to_id = @$params['to_id'];
		//找到该用户,里面有openid.unionid
		$user = $User->get($to_id);

		//种类
		$cmd = @$params['cmd'];
		//参数
		$data = @$params['data'];

		//现在预设5天(应该7天的)
		// 对过期formid进行删除
		$last = time() - 24*7*3600;
		$FormId->where('create_time','<', $last)->delete();

		//

		switch ($cmd) {
			// 注册提醒
			// case 'register': 
			// 	//拿出最前一条有效的formid
			// 	$res = $FormId->field('form_id')->order('id asc')->get(['user_id'=>$to_id]);
			// 	if (!empty($res)) {
			// 		//如果有就发送模板消息
			// 		$app->template_message->send([
			// 		    'touser' => $user['purchase_wx_openid'],
			// 		    'template_id' => 'R-3GH3jJJga4_RXrjmSif_trf0otIJWzw47gdWrzkLI',
			// 		    // 'page' => '/pages/',
			// 		    'form_id' => $res['form_id'],
			// 		    'data' => [
			// 				//车型
			// 				'keyword1' => $ask['brand_name'] . ' ' . $ask['car_name'],
			// 				//报价时间
			// 		        'keyword2' => date('Y-m-d'),
			// 				// 报价金额
			// 		        'keyword3' => $data['car_pirce'],
			// 		    ],
			// 		]);
			// 	}
			// 	break;

			// 收到报价消息
			case 'quote':
				//内部消息保存
				



				// $data里面有ask_id,car_price
				// 找到这条需求
				$Ask = new Ask;
				$ask = $Ask
				->alias('a')
				->field('b.name as brand_name,a.*')
				->join('think_sign_brands b','b.id=a.brand_id')
				->get($ask_id);

				//现在预设5天(应该7天的)
				// 对过期formid进行删除
				// $last = time() - 24*5*3600;
				// $FormId->where('create_time','<', $last)->delete();

				//拿出最前一条有效的formid
				$res = $FormId->field('form_id')->order('id asc')->get(['user_id'=>$to_id]);
				if (!empty($res)) {
					//如果有就发送模板消息
					$app->template_message->send([
					    'touser' => $user['purchase_wx_openid'],
					    'template_id' => 'iXD2DFD2wJ9LT7_ghEFgaIYylWunU_Jp0OyXbVjnpj4',
					    // 'page' => '/pages/',
					    'form_id' => $res['form_id'],
					    'data' => [
							//车型
							'keyword1' => $ask['brand_name'] . ' ' . $ask['car_name'],
							//报价时间
					        'keyword2' => date('Y-m-d'),
							// 报价金额
					        'keyword3' => $data['car_pirce'],
							
					    ],
					]);
				}

				break;
			
			default:
				return error('异常消息操作！');
				break;
		}
	}
}