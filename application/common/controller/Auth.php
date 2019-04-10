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
namespace app\common\controller;

use think\Db;


class Auth
{

    /**
     * 检查权限
     * @param $name string  需要验证的规则
     * @param $uid  int           认证用户的id
     * @param $relation string    如果为 'or' 表示满足任一条规则即通过验证;如果为 'and'则表示需满足所有规则才能通过验证
     * @return boolean           通过验证返回true;失败返回false
     */
    public static function check($uid, $name, $relation = 'or')
    {
        if (empty($uid) || empty($name)) {
            return false;
        }
        if ($uid == 1) {
            return true;
        }

        $name = strtolower($name);

        $where_rule[] = ['rule', '=', $name];
        $where_rule[] = ['rule_status', '=', 0];
        $count = Db::name('auth_rule')->where($where_rule)->count('id');

        if ($count == 0) {//没有规则时,!
            return false;
        }

        //当前用户所属用户组集
        $groups = Db::name('auth_group_access')
            ->where([['uid', '=', $uid]])
            ->value('group_id');

//        if (in_array(1, $groups)) {
//            return true;
//        }
        if (empty($groups)) {
            return false;
        }
        $groups = explode(',', $groups);
        $rules = Db::name('auth_group')->where([['id', 'in', $groups]])->column('rules');
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
        $where_check[] = ['rule', '=', $name];
        $where_check[] = ['rule_status', '=', 0];

        //检查当前用户所属用户组集是否存在当前规则
        $rules = Db::name('auth_rule')->where($where_check)->count('id');

        if ($rules) {
            return true;
        }
//        foreach ($rules as $rule) {
//            if (!empty($rule['condition'])) { //根据condition进行验证
////                $user = $this->getUserInfo($uid);//获取用户信息,一维数组
//
//                $command = preg_replace('/\{(\w*?)\}/', '$user[\'\\1\']', $rule['condition']);
//                //dump($command);//debug
//                @(eval('$condition=(' . $command . ');'));
//                if ($condition) {
//                    $list[] = strtolower($rule['name']);
//                }
//            } else {
//                $list[] = strtolower($rule['name']);
//            }
//        }
//
//        if ($relation == 'or' and !empty($list)) {
//            return true;
//        }
//        $diff = array_diff($name, $list);
//        if ($relation == 'and' and empty($diff)) {
//            return true;
//        }
        return false;
    }


    public static function allRule($where_rule = []){
        $where_rule[] = ['rule_status', '=', 0];
        return Db::name('auth_rule')->where($where_rule)->column('rule');
    }
}
