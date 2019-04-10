<?php

namespace app\purchase_admin\controller;

use app\common\controller\Base;
use app\purchase\model\Brand;
use app\purchase\model\Imported as ImportedModel;

class Imported extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index($key_word='',$page_size=10,ImportedModel $Imported)
    {
        // dump($Imported->all());
        //
        $Sql = $Imported
        ->alias('i')
        ->field('i.*,b.name as brand_name,u.name,company_name')
        ->join(['purchase_user_relation ur'],'ur.user_id = i.user_id','LEFT')
        ->join(['purchase_company c'],'ur.company_id = c.id','LEFT')
        ->join(['think_business_users_union u'],'i.user_id = u.id','LEFT')
        ->join(['think_sign_brands b'],'b.id = i.brand_id','LEFT')
        ->order('id desc');
        
        if ($key_word) {
            $Sql = $Sql->where('u.name|u.phone|c.company_name|i.car_name|i.city|b.name','like',$key_word);
        }

        // halt($Sql->select());
        $list = $Sql->paginate($page_size);
        // halt($list);
        $this->assign('list',$list);
        $this->assign('key_word',$key_word);
        return view();
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //
        return view();

    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save()
    {
        //
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
    public function edit($id,ImportedModel $Imported, Brand $Brand)
    {
        //
        $info = $Imported->get($id);
        // halt(explode(',',$info['photos']));
        $brands = $Brand->getBrands();
        $this->assign('info',$info);
        $this->assign('photos',explode(',',$info['photos']));
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
    public function update($id,ImportedModel $Imported)
    {
        //
        $data = request()->only('car_name,car_standard,car_color,car_type,car_procedure,photos,note,car_price,brand_id,status,province,city,region','post');
        $data['update_time'] = time();
        $res = $Imported->where('id',$id)->data($data)->update();
        if ($res) {
            return success('','修改成功');
        }
        else{
            return error('修改失败');
        }
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id,ImportedModel $Imported)
    {
        //
        
        $res = $Imported->where('id',$id)->delete();
        if ($res) {
            return success(false,'删除成功');
        }
        else {
            return error('删除失败'); 
        }
    }
}
