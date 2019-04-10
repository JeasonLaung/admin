<?php
namespace app\purchase\validate;
use	think\Validate;
class Company extends Validate {				
    protected $rule =	[
    	'user_id|用户'            =>   'require',

    	'name|公司名'             =>    'require',
    	'lisence_pic|营业执照'    =>    'require',
    	'note|备注'               =>    'max:200'
    ];
	protected $scene = [
        // 提出需求
        'add_person'	          =>  [
            'user_id'
        ],
        'register_company'        =>  [
        	'name',
        	'licence_pic',
        	'note'
        ]
    ];
}
