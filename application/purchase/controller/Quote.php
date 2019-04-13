<?php
namespace app\purchase\controller;

use app\purchase\model\Quote as QuoteModel;
use app\purchase\model\Ask;

class Quote extends Base
{
	public function save(Ask $Ask,QuoteModel $Quote)
	{

		$uid = request()->uid;

		$data = $this->request->only('car_price,note,ask_id');
		// $fromId = input('formId');
        // return json($data);

        // 数据验证
        $result =   $this->validate($data,'app\purchase\validate\Ask.quote');
        if(true !== $result){
            //  验证失败输出错误信息
            return error($result);
        }

        //找到这个需求
        $res = $Ask->field('user_id')->get(['id'=>$data['ask_id']]);

        // 报价插入数据库
        $data['user_id'] = $uid;
        $data['create_time'] = time();
        $quote_id = $Quote->insertGetId($data);

        //通知需求者
        // 发布者id
        $from_id = $res['user_id'];
        // 需求id
        $ask_id = $data['ask_id'];

        behavior('\app\purchase\behavior\CreateMsg',[
			'cmd'=>'quote',
			'to_id'=>$from_id,
            'data'=>[
            	'uid'=>$uid,
                'ask_id'=>$ask_id,
                'quote_id'=>$quote_id,
                'car_price'=>$data['car_price'],
                'note'=>$data['note']
            ],
		]);
		
        if ($res) {
        	return success('','报价成功');
        }
        else {
        	return error('报价失败');
        }
	}

	public function update($id,QuoteModel $Quote)
	{

		$uid = request()->uid;

		$data = $this->request->only('car_price,note,ask_id');
        // return json($data);

        // 数据验证
        $result =   $this->validate($data,'app\purchase\validate\Ask.quote');
        if(true !== $result){
            //  验证失败输出错误信息
            return error($result);
        }

        $data['update_time'] = time();
        $res = $Quote->where(['id'=>$id,'user_id'=>$uid])->data($data)->update();
        if ($res) {
        	return success('','编辑报价成功');
        }
        else {
        	return error('编辑报价失败');
        }
	}

	// public function read($id,Quote $Quote)
	// {
	// 	$uid = request()->uid;

	// 	// 只有供应商本人和需求者本人才能看到
	// 	$res = $Quote
	// 	->alias('q')
	// 	->field('b.img,b.name as brand_name,q.*')
	// 	->join('think_purchase_ask a','a.id = q.ask_id','LEFT')
	// 	->join('think_sign_brands b','b.id = a.brand_id','LEFT')
	// 	->['q.status'=>1,'q.is_delete'=>0]
	// 	->where('q.user_id',$uid)
	// 	->where('a.user_id',$uid
	// 	->order('create_time desc')
	// 	->get($id);
	// 	if (empty($res)) {
	// 		return error('没有此报价');
	// 	}
	// 	return success($res);
	// }

	public function delete($id,QuoteModel $Quote)
	{
		$uid = request()->uid;

        $res = $Quote->where(['is_delete'=>0,'id'=>$id, 'user_id'=>$uid])
                    ->data(['is_delete'=>1,'update_time'=>time()])
                    ->update();
        if($res){
            return success('','删除成功');
        }else{
            return error('删除失败');
        }
	}
	public function read($id,QuoteModel $Quote)
	{
		$uid = request()->uid;
		$res = $Quote->get($id);
		//自己的报价才能看到详情
		if($res['user_id']==$uid) {
			return success($res);
		}
		else{
			return error('找不到报价信息');
		}

	}

	public function my(QuoteModel $Quote)
	{
		$uid = request()->uid;

		$res = $Quote
		->alias('q')
		->field('b.img,b.name as brand_name,q.*')
		->join('purchase_ask a','a.id = q.ask_id','LEFT')
		->join('think_sign_brands b','b.id = a.brand_id','LEFT')
		->where(['q.user_id'=>$uid,'q.status'=>1,'q.is_delete'=>0])
		->order('create_time desc')
		->select();
		if (empty($res)) {
			return error('没有此报价');
		}
		return success($res);
	}
}