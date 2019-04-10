<?php
namespace app\article\validate;

use think\Validate;

class Article extends Validate
{
    protected $rule = [
        'article_title'  =>  'require',
        'pid'  =>  'require',
    ];

    protected $message  =   [
        'article_title.require' => '文章标题不能为空',
        'pid.require' => '文章所属栏目不能为空',
    ];
}
?>