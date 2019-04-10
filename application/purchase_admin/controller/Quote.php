<?php 
namespace app\purchase_admin\controller;
use app\common\controller\Base;
use app\purchase\model\Quote as QuoteModel;
/**
 * 
 */
class Quote extends Base
{
	
	public function index ($key_word='',$page_num=10,QuoteModel $Quote)
	{
		$Sql = $Quote
		->alias('q')
		->field('q.*,a.car_name,a.brand_id,b.name as brand_name,ad.name as admin_name')
		->join(['purchase_ask a'],'a.id = q.ask_id','LEFT')
		->join(['think_sign_brands b'],'b.id = a.brand_id','LEFT')
		->join(['think_admin ad'],'ad.id = q.user_id','LEFT')
		->order('id');


        if ($key_word) {
            $Sql = $Sql->where('b.name|ad.name|a.car_name|q.note','like','%'.$key_word.'%');
        }
		$list = $Sql->paginate($page_num);
		// halt($list);
		$this->assign('list', $list);
        $this->assign('key_word', $key_word);

		// halt($list);
		return	$this->fetch();

	}
	/**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
      	return view();
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(QuoteModel $Quote)
    {
        //
        $data = $this->request->only('ask_id,car_price,note');
        $res = $Quote->insertData($data);
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
        

    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id,QuoteModel $Quote)
    {
        //
        $this->assign('info',$Quote->see($id));

        return view();
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update($id,QuoteModel $Quote)
    {
        //
        $data = $this->request->only('car_price,note','post');
        $Quote->updateData($id,$data);
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id,QuoteModel $Quote)
    {
        //
        $Quote->deleteData($id);
    }
}