<?php
namespace app\invite\validate;

use think\Validate;
use think\Db;

class Invite extends Validate
{
    protected $rule = [
        'name'  =>  'require',
        'phone'  =>  'require|checkPhone:thinkphp',
        'channel'  =>  'require',
        'brands'  =>  'require',
    ];

    protected $message  =   [
        'name.require' => '请输入客户姓名',
        'phone.require' => '请输入客户手机/客户微信',
        'channel.require' => '请选择来源渠道',
        'brands.require' => '请选择关注品牌',
    ];

    // 自定义验证规则
    protected function checkPhone($value,$rule,$data=[])
    {
        $where = [];
        if(isset($data['id'])){
           $where = [['id','neq',$data['id']]];
        }
        if($data['user_type']!=1 && !preg_match('/^1\d{10}$/',$value)){
            return '手机号码格式错误';
        }elseif($data['user_type']!=1 && Db::table('invite_consumer')->where(array('phone'=>$value,'del'=>0))->where($where)->count()>0){
            return '此手机已有数据';
        }elseif($data['user_type']==1 && Db::table('invite_consumer')->where(array('wx_id'=>$value,'del'=>0))->where($where)->count()>0){
            return '此微信号已有数据';
        }else{
            return true;
        }
    }
}
?>