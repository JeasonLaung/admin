<?php
namespace app\admin\controller;
use think\Controller;
use app\admin\model\User;
use app\admin\model\AuthGroupAccess;

class Login extends Controller
{
    public function login(){
        if($this->request->isPost()){
            $param = $this->request->param();
            if(empty($param['username']) || empty($param['password'])){
                $this->result('',1,'请输入账号密码');
            }
            $user = new User();
            $where[] = ['admin_account','=',$param['username']];

            $field = ['id','password','admin_name','admin_status','admin_head'];
            $info = $user->findData($where,$field);
            if(!$info){
                $this->result('',1,'账号不存在');
            }
            if($info->admin_status){
                $this->result('',1,'账号已被禁用');
            }
            if(md5($param['password']) != $info->password){
                $this->result('',1,'密码错误');
            }
            unset($info->admin_status,$info->password);
            if(!$info->admin_head){
                $info->admin_head = '//' . $_SERVER['HTTP_HOST'] . '/static/images/default-head.png';
            }
            $access = new AuthGroupAccess();
            $group = $access->findData([['uid','=',$info->id]],'group_id');
            $info->gid = $group['group_id'];

            session('user',$info->toArray());
            if(!empty($param['save'])){
                cookie('user',json_encode($info),['expire' => 43200]);
            }
            $this->result('',0,'登录成功');
        }
        return $this->fetch();
    }

    public function logout(){
        session('user',null);
        cookie('user',null);
        if($this->request->isAjax()){
            $this->result('',0,'注销成功');
        }else{
            $this->success('注销成功',url('admin/login/login'));
        }
    }
}
