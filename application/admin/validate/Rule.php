<?php
namespace app\admin\validate;

use think\Validate;

class Rule extends Validate
{
    protected $rule = [
        'rule_name'  =>  'require',
        'rule' =>  'require',
        'pid' =>  'require',
    ];

    protected $message  =   [
        'rule_name.require' => '权限名称不能为空',
        'rule.require'     => '权限规则不能为空',
        'pid.require'     => '所属顶级栏目必须选择',
    ];
}
?>