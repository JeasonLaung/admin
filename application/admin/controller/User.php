<?php
namespace app\admin\controller;

use app\admin\model\User as UserModel;
use app\admin\model\AuthGroup;
use app\admin\model\AuthGroupAccess;
use app\admin\validate\AuthGroup as GroupValidate;
use app\admin\validate\User as UserValidate;
use app\admin\model\Menu;
use app\admin\model\AuthRule;
use app\common\controller\Base;

class User extends Base
{
    /*
     * 后台管理员列表
     * */
    public function index(UserModel $user,AuthGroup $group)
    {
        $field = ['u.id', 'u.admin_name', 'u.admin_status', 'u.admin_head','g.group_id'];
        $keyword = $this->request->get('search_key');
        $where = [];
        if(!empty($keyword)){
            $where[] = ['u.admin_name','like','%'.$keyword.'%'];
        }
        $list = $user->selectUser($where, $field);
        $list->appends($this->request->param());
        $this->assign('list', $list);
        $all_group = $group->selectData([['status', '=', 0]],['title','id']);
        $arr = [];
        foreach ($all_group as $v){
            $arr[$v['id']] = $v['title'];
        }
        $this->assign('group', $arr);
        $this->assign('search_key', $keyword);
        return $this->fetch('index');
    }

    /*
     * 添加管理员
     * */
    public function addUser(UserModel $user, AuthGroup $group){
        if ($this->request->isPost()) {
            $data = $this->request->post();
            if(($data['password'] != $data['password1']) || empty($data['password']) || empty($data['password1'])){
                $this->result('', 1, '登录密码与确认密码不能为空且必须相同');
            }
            if(empty($data['rules'])){
                $this->result('', 1, '至少选择一个用户组');
            }
            $validate = new UserValidate;
            if (!$validate->check($data)) {
                $this->result('', 1, $validate->getError());
                exit();
            }
            $data['admin_head'] = '//' . $_SERVER['HTTP_HOST'] . '/static/images/default-head.png';
            if ($user->addUser($data)) {
                $this->result('', 0, '用户添加成功');
            } else {
                $this->result('', 1, '用户添加失败');
            }
        }
        $this->assign('list',$group->selectData([['status', '=', 0]],['id','title']));
        return $this->fetch('add_user');
    }

    /*
     * 修改管理员
     * */
    public function editUser(UserModel $user, AuthGroup $group){
        $id = intval($this->request->param('id'));
        if(empty($id)){
            if(!$this->request->isAjax()){
                $this->error('参数错误',null,"",2);
            }else{
                $this->result('', 1, '参数错误');
            }
        }
        if ($this->request->isPost()) {
            $data = $this->request->post();
            if(!empty($data['password']) || !empty($data['password1'])){
                if(($data['password'] != $data['password1']) || empty($data['password']) || empty($data['password1'])){
                    $this->result('', 1, '登录密码与确认密码不能为空且必须相同');
                }
                if(!isset($data['password']{4})){
                    $this->result('', 1, '登录密码最少5位数');
                }
            }else{
                unset($data['password'],$data['password1']);
            }
            if(!isset($data['admin_account']{4})){
                $this->result('', 1, '登录账号最少5位数');
            }
            if($user->editUser($data)){
                $this->result('', 0, '用户编辑成功');
            }else{
                $this->result('', 1, '用户编辑失败');
            }
        }
        $field = ['u.*','a.group_id'];
        $info = $user->getWithGroup([['u.id', '=', $id]], $field);
        $this->assign('info',$info);
        $this->assign('list',$group->selectData([['status', '=', 0]],['id','title']));
        return $this->fetch('edit_user');
    }

    /*
     * 管理员修改自己信息
     * */
    public function editSelf(UserModel $user){
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $data['id'] = session('user.id');
            if(!empty($data['password']) || !empty($data['password1'])){
                if(($data['password'] != $data['password1']) || empty($data['password']) || empty($data['password1'])){
                    $this->result('', 1, '登录密码与确认密码不能为空且必须相同');
                }
                if(!isset($data['password']{4})){
                    $this->result('', 1, '登录密码最少5位数');
                }
            }else{
                unset($data['password'],$data['password1']);
            }
            if($user->saveData($data)){
                $this->result('', 0, '信息编辑成功');
            }else{
                $this->result('', 1, '信息编辑失败');
            }
        }

        $info = $user->findData([['id', '=', session('user.id')]]);
        $this->assign('info',$info);
        return $this->fetch('edit_self');
    }

    /*
     * 删除管理员
     * */
    public function deleteUser(UserModel $user){
        $id = intval($this->request->param('id'));
        if(empty($id)){
            $this->result('', 1, '参数错误');
        }
        if ($user->deleteUser($id)) {
            $this->result('', 0, '删除成功');
        } else {
            $this->result('', 1, '删除失败');
        }
    }


    //用户组列表
    public function group(AuthGroup $group){
        $keyword = $this->request->get('search_key');
        $where = [];
        if(!empty($keyword)){
            $where[] = ['title','like','%'.$keyword.'%'];
        }
        $list = $group->selectData($where,['id','title','status'],'id asc', true, 20);
        $this->assign('list', $list);
        $this->assign('search_key', $keyword);
        return $this->fetch();
    }

    /*
     * 用户组添加
     */
    public function addGroup(AuthGroup $group,Menu $menu,AuthRule $rule)
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $validate = new GroupValidate;
            if (!$validate->check($data)) {
                $this->result('', 1, $validate->getError());
                exit();
            }
            $data['rules'] = implode(',',$data['rules']);
            if ($group->saveData($data)) {
                $this->result('', 0, '用户组添加成功');
            } else {
                $this->result('', 1, '用户组添加失败');
            }
        }
        $where_rule[] = ['rule_status', '=', 0];
        $rule = $rule->selectData($where_rule,['id', 'pid', 'rule_name'])->toArray();
        $where[] = ['pid', '=', 0];
        $where[] = ['status', '=', 0];
        $field = ['id', 'name'];
        $top = $menu->selectData($where, $field, 'sort desc,id desc')->toArray();
        foreach ($top as &$v){
            $v['child'] = array_filter($rule,function($value) use ($v){
                if($value['pid'] == $v['id']){
                    return true;
                }else{
                    return false;
                }
            });
        }
        $this->assign('list', $top);
        return $this->fetch('add_group');
    }

    /*
     * 用户组修改
     */
    public function editGroup(AuthGroup $group,Menu $menu,AuthRule $rule)
    {
        $id = intval($this->request->param('id'));
        if(empty($id)){
            if(!$this->request->isAjax()){
                $this->error('参数错误',null,"",2);
            }else{
                $this->result('', 1, '参数错误');
            }
        }
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $validate = new GroupValidate;
            if (!$validate->check($data)) {
                $this->result('', 1, $validate->getError());
                exit();
            }
            $data['rules'] = implode(',',$data['rules']);

            if ($group->saveData($data)) {
                $this->result('', 0, '用户组编辑成功');
            } else {
                $this->result('', 1, '用户组编辑失败');
            }
        }

        $where_rule[] = ['rule_status', '=', 0];
        $rule = $rule->selectData($where_rule,['id', 'pid', 'rule_name'])->toArray();
        $where[] = ['pid', '=', 0];
        $where[] = ['status', '=', 0];
        $field = ['id', 'name'];
        $top = $menu->selectData($where, $field, 'sort desc,id desc')->toArray();
        foreach ($top as &$v){
            $v['child'] = array_filter($rule,function($value) use ($v){
                if($value['pid'] == $v['id']){
                    return true;
                }else{
                    return false;
                }
            });
        }
        $this->assign('list', $top);
        $this->assign('info', $group->findData([['id', '=', $id]]));
        return $this->fetch('edit_group');
    }


    /*
     * 用户组删除
     * */
    public function deleteGroup(AuthGroup $group,AuthGroupAccess $access){
        $id = $this->request->param('id');
        if(empty($id)){
            $this->result('', 1, '参数错误');
        }
        if($access->findData([['group_id','=',$id]],'id')){
            $this->result('', 1, '该用户组下有用户存在');
        }
        if ($group->deleteData([['id', '=', $id]])) {
            $this->result('', 0, '权限删除成功');
        } else {
            $this->result('', 1, '权限删除失败');
        }
    }
}
