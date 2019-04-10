<?php
namespace app\admin\validate;

use think\Validate;

class Menu extends Validate
{
    protected $rule = [
        'name'  =>  'require',
        'type' =>  'require',
//        'module' => 'require',
//        'controller'=>'require',
//        'action'=>'require'
    ];

    protected $message  =   [
        'name.require' => '菜单名称不能为空',
        'type.require'     => '请选择菜单类型',
//        'module.require'   => '模型不能为空',
//        'controller.require'  => '控制器不能为空',
//        'action.require'        => '菜单方法不能为空',
    ];
}
?>