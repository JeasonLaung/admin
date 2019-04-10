<?php
namespace app\admin\validate;

use think\Validate;

class User extends Validate
{

    protected $rule = [
        'admin_name'  =>  'require',
        'admin_account' =>  'require|min:5|unique:user',
        'password' =>  'require|min:5',
    ];

    protected $message  =   [
        'admin_name.require' => '用户名称不能为空',
        'admin_account.require'     => '登录账号不能为空',
        'admin_account.min'     => '登录账号最少5位数',
        'admin_account.unique'     => '该账号已被使用',
        'password.require'     => '登录密码不能为空',
        'password.min'     => '登录密码最少5位数',
    ];


}
?>