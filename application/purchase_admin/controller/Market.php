<?php

namespace app\purchase_admin\controller;

use app\common\controller\Base;
use app\purchase\model\Market as MarketModel;
use app\purchase\model\Brand;


class Market extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index($key_word='',$page_num=10,MarketModel $Market)
    {
        //
        $Sql = $Market
        ->alias('m')
        ->field('m.*,b.name as brand_name,u.name')
        ->join(['think_sign_brands b'],'b.id = m.brand_id','LEFT')
        ->join(['think_business_users_union u'],'u.id = m.user_id','LEFT');
        if ($key_word) {
            $this->assign('key_word',$key_word);
            $Sql = $Sql->where('b.name|m.market|u.name','like' ,'%'.$key_word.'%');
        }
        $list = $Sql->order('m.id desc')->paginate($page_num);
        $this->assign('list',$list);
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
    public function save(MarketModel $Market)
    {
        $data = $this->request->only('brand_id,market,photos','post');
        // $data['photos'] = json_encode($data['photos']);
        $Market->insertData($data);
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id, MarketModel $Market,Brand $Brand)
    {
        //
        $info = $Market->see($id)->toArray();
        // halt($info);
        if ($info['photos']) {
            $photos = explode(',',$info['photos']);
        }
        else{
            $photos = [];
        }
        $brands = $Brand->getBrands();
        // halt($photos);
        $this->assign('photos',$photos);
        $this->assign('info',$info);
        $this->assign('brands',$brands);
        return view();
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update($id,MarketModel $Market)
    {
        //
        $data = $this->request->only('brand_id,market,photos','post');
        // $data['photos'] = json_encode($data['photos']);
        $Market->updateData($id,$data);
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id,MarketModel $Market)
    {
        //
        $Market->deleteData($id);
    }
}
