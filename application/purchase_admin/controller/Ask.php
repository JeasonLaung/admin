<?php

namespace app\purchase_admin\controller;

use app\common\controller\Base;

use app\purchase\model\Ask as AskModel;
use app\purchase\model\Brand;

class Ask extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index($key_word='',$page_num=10,AskModel $Ask)
    {
        //
        $Sql = $Ask
        ->alias('a')
        ->field('a.*,b.name as brand_name,u.name,u.id as user_id')
        ->join(['think_sign_brands b'],'b.id = a.brand_id','LEFT')
        ->join(['think_business_users_union u'],'u.id = a.user_id','LEFT');

        if ($key_word) {
            $Sql = $Sql->where('b.name|car_name|u.name',$key_word);
        }

        $list = $Sql->order('id desc')->paginate($page_num);
        $this->assign('list',$list);
        $this->assign('key_word',$key_word);
        return view();
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create(Brand $Brand)
    {
        //
        $brands = $Brand->getBrands();
        $this->assign('brands',$brands);

        return view();
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(AskModel $Ask)
    {
        //
        $data = $this->request->only('car_price,brand_id,car_name,province,city,region,car_product_time,note,status');
        halt($data);
        $Ask->insertData($data);
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id,AskModel $Ask)
    {
        //

    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id,AskModel $Ask,Brand $Brand)
    {
        //
        
        $info = $Ask->see($id);
        $brands = $Brand->getBrands();
        // halt($brands);
        $this->assign('info',$info);
        $this->assign('brands',$brands);
        return  view();
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update($id,AskModel $Ask)
    {
        //

        $data = $this->request->only('car_price,brand_id,car_name,province,city,region,car_product_time,note,status,is_display','post');
        // $data['status'] = (int)$data['status'];
        // $data['is_display'] = (int)$data['is_display'];
        
        //$data['is_display'] = 0;
        // $Ask->updateData($id,$data);
        return success($Ask->where('id',$id)->update($data));
        // return $Ask->getLastSql();
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id,AskModel $Ask)
    {
        //
       $Ask->deleteData($id);
    }
}
