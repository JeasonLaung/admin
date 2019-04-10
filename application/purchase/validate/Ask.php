<?php
namespace app\purchase\validate;
use	think\Validate;
class Ask extends Validate {				
    protected $rule =	[
        // 提出需求
        'brand_id|品牌'            =>   'require|max:20',
        'car_brand|品牌'		       =>	'require|max:20',
        'car_name|车名'		       =>	'require|max:200',
        'car_price|车价'	           =>	'require|elt:9999',
        'car_product_time|出厂日期' =>	'require',
        'province|省份'	           =>	'require|max:20',
        'city|城市'	               =>	'require|max:20',
        'region|区（地方）'         =>	'require|max:20',
        'note|备注'	               =>	'max:200',

        'market|行情'              =>   'require|max:1000',

        'phone|手机'               =>   'require|mobile
',
        
        'code'                     =>   'require',
        'captcha'                  =>   'require',

        'car_procedure|手续'       =>   'require',
        'car_standard|规格'           =>   'require',
        'car_color|颜色'           =>   'require',
        // 'photos|图片'              =>   ''

    ];
    protected $message = [
        'car_price.elt'     =>  '请确认价格，单位为万元'
    ];
    // 场景
    protected $scene = [
        // 提出需求
        'ask'		        =>  [
            'brand_id',
            'car_name', 
            'car_price', 
            'car_product_time',
            'province',
            'city',
            'region',
            'note'
        ],
        'imported'          =>  [
            'brand_id',
            'car_name',
            'car_procedure',
            'car_standard',
            'car_price',

        ],
        'quote'             =>  [
            'car_price',
            'note'
        ],

        'market'            =>  [
            'market'
        ],

        'captcha'           =>  [
            'phone'
        ],

        'verify'            =>  [
            'phone',
            'captcha',
            
        ]

        
    ];				
}
