<?php
namespace app\article\validate;

use think\Validate;

class ArticleColumn extends Validate
{
    protected $rule = [
        'column_title'  =>  'require',
    ];

    protected $message  =   [
        'column_title.require' => '栏目标题不能为空',
    ];
}
?>