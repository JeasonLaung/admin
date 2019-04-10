<?php

namespace app\purchase_admin\controller;

use app\common\controller\Base;
use app\purchase\model\User as UserModel;

class User extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index($key_word='',$p_role='',$page_size=10,UserModel $User)
    {
        //
        $Sql = $User;
        
        if ($p_role) {
            $Sql = $Sql->where('p_role',$p_role);
        }

        if ($key_word) {
            $Sql = $Sql->where('phone|name','like',$key_word);
        }
        // halt($Sql->select());
        $list = $Sql->paginate($page_size);
        // halt($list);
        $this->assign('list',$list);
        $this->assign('key_word',$key_word);
        $this->assign('p_role',$p_role);
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
    public function save(Request $request)
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
    public function edit($id,UserModel $User)
    {
        //
        $info = $User->see($id);
        $this->assign('info',$info);
        return view();
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }
}
