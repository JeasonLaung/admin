<?php 
namespace app\purchase\controller;
use app\purchase\model\Chat as ChatModel;
use app\purchase\model\User;
use think\Db;

/**
 * 	
 */
class Chat extends \think\Controller
{
	/**
	 * 交易建立,由批发商发起
	 * @var string
	 */
	public function chat(ChatModel $Chat)
	{
		// halt(Db::connect('mysql://root:root@127.0.0.1:3306/mputao#utf8mb4')
		// 	->table('purchase_chat')
		// 	->insert(['content'=>$content])
		// );
		// halt(Db::connect('mysql://root:root@127.0.0.1:3306/mputao#utf8mb4')
		// 	->table('purchase_chat')
		// 	->select());
		
		$uid = 5; 	
			
		
		$data = $this->request->only('to_id,content','post');
		$data['from_id'] = $uid;
		$data['create_time'] = time();
		return Db::connect('mysql://root:root@127.0.0.1:3306/mputao#utf8mb4')
			->table('purchase_chat')
			->insert($data);
		
	}
	/**
	 * 与某用户的对话
	 * last_id 加载到最前的id值
	 */
	public function history($page_size=30,$last_id='',$user_id='',ChatModel $Chat)
	{
		// $uid = request()->uid;
		$uid = 5;
		$Sql = Db::connect('mysql://root:root@127.0.0.1:3306/mputao#utf8mb4')
			->table('purchase_chat')
			->where(['from_id'=>$uid,'to_id'=>$user_id])
			->union(function($query) use ($uid,$user_id){
				$query
				->table('purchase_chat')
				->where(['to_id'=>$uid,'from_id'=>$user_id]);
			});
		//最前面的id
		if ($last_id) {
			$Sql = $Sql->where('id','<',$last_id);
		}
		$data = $Sql->limit($page_size)
			->order('id desc')
			->select();
		$data = array_reverse($data);

		return success($data);

	}


}