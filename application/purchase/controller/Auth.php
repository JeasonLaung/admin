<?php
// +---------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +---------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.thinkcmf.com All rights reserved.
// +---------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +---------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +---------------------------------------------------------------------
namespace app\purchase\controller;

use think\Db;
use \Firebase\JWT\JWT;

class Auth
{
    /**
     * 10: 普通用户
     * 11：分销商
     * 12：供应商
     * 
     */
    /**
     * 检查权限
     * @param $name string  需要验证的规则
     * @param $uid  int           认证用户的id
     * @param $relation string    如果为 'or' 表示满足任一条规则即通过验证;如果为 'and'则表示需满足所有规则才能通过验证
     * @return boolean           通过验证返回true;失败返回false
     */

    public static function check($relation = 'or')
    {
        // 排除公共url
        // 公共url获取不了id请注意，调用getUserId
        $is_public_arr = [
            "purchase/brand/index",//获取品牌
            "purchase/brand/type",//获取品牌下的车型
            "purchase/market/index",//车源信息
            "purchase/market/read",//单个车源信息
            "purchase/imported/index",//进口信息
            "purchase/imported/read",//进口单个
            "purchase/login/login",//登录
            "purchase/login/register",//注册
            "purchase/login/captcha",//验证码
            "purchase/company/index",//公司多个
            "purchase/company/read",//公司单个
            
            "purchase/test/index",//测试


        ];




        // 公共url获取不了id请注意
        $module = request()->module();
        $controller = request()->controller();
        $action = request()->action();
        $rule = strtolower($module . '/' . $controller . '/' . $action);

        if (in_array($rule, $is_public_arr)) {
            return true;
        }

        // 不在公共网址中需要验证
        $sign = request()->header(SIGN_NAME);
        if (!$sign) {
            json(['status'=>0,'msg'=>'Empty token','code'=>500])->send();
            exit();
        }

        // 存在签名，验证
        try{
            $decoded = JWT::decode($sign, PUBLIC_KEY, array('RS256'));
        }catch(\UnexpectedValueException $e){
            // 捕捉异常，直接抛出报错
            json(['status'=>0,'msg'=>$e->getMessage(),'code'=>500])->send();
            exit();
        }

        //成功则获取id
        // $uid = $decoded['uid'];
        // 全局用户id
        request()->uid = $decoded->uid;
        // halt($decoded);
        $uid = $decoded->uid;


        if (empty($uid)) {
            return false;
        }
        if ($uid == 1) {
            return true;
        }

        // $name = strtolower($name);

        $where_rule[] = ['rule', '=', $rule];
        $where_rule[] = ['rule_status', '=', 0];
        $count = Db::name('admin_auth_rule')->where($where_rule)->count('id');

        if ($count == 0) {//没有规则时,!
            return false;
        }

        $RoleAccess = new \app\purchase\model\UserRelation;
        //当前用户所属用户组集
        $groups = $RoleAccess
            ->alias('ur')
            ->field('ur.user_id,c.group_id')
            ->join('purchase_company c','c.id = ur.company_id','LEFT')/*找到对应公司的组群*/
            ->where([['ur.user_id', '=', $uid]])
            ->find();

        if (empty($groups)) {
            return false;
        }

        if (!$groups['group_id']) {
            $groups = '10'; //普通用户
        }else{
            $groups = $groups['group_id'];
        }


        // 全局的用户组
        request()->group = $groups;






        $rules = Db::name('admin_auth_group')->where([['id', 'in', $groups]])->column('rules');
        if(empty($rules)){
            return false;
        }
        $rule_id = [];
        foreach ($rules as $vr){
            $ids = explode(',', $vr);
            foreach ($ids as $vid){
                $rule_id[] = $vid;
            }
        }

        $where_check[] = ['id', 'in', $rule_id];
        $where_check[] = ['rule', '=', $rule];
        $where_check[] = ['rule_status', '=', 0];

        //检查当前用户所属用户组集是否存在当前规则
        $rules = Db::name('admin_auth_rule')
        ->where($where_check)
        ->count('id');

        if ($rules) {
            return true;
        }
        return false;
    }


    public static function allRule($where_rule = []){
        $where_rule[] = ['rule_status', '=', 0];
        return Db::name('auth_rule')->where($where_rule)->column('rule');
    }
}
