<?php
namespace app\admin\validate;

use think\Validate;

class AuthGroup extends Validate
{
    protected $rule = [
        'title'  =>  'require',
        'rules' =>  'require',
    ];

    protected $message  =   [
        'title.require' => '用户组名称不能为空',
        'rules.require'     => '权限规则不能为空',
    ];
}
?>