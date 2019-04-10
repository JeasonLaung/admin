<?php

namespace app\common\controller;

use think\Controller;
use app\admin\model\Menu;
use app\admin\model\AuthGroup;

class Base extends Controller
{
    public function __construct()
    {
        parent::__construct();
        if (empty(session('user')) && empty(cookie('user'))) {
            $this->redirect('admin/login/login');
            exit();
        }
        if (empty(session('user'))) {
            session('user', json_decode(cookie('user'),true));
        }

        $this->assign('user_info', session('user'));
        $route['model'] = strtolower($this->request->module());
        $route['controller'] = strtolower($this->request->controller());
        $route['action'] = strtolower($this->request->action());
        $this->assign('route', $route);
        if (!$this->checkAccess(session('user.id'))) {
            if ($this->request->isAjax()) {
                $this->result('', 1, '没有访问权限');
            } else {
                $this->error('没有访问权限',null, '', 2);
            }
        }
        if (!$this->request->isAjax()) {
            $this->assign('admin_menu',$this->getMenu());
        }
    }

    public function _empty()
    {
        $this->redirect('admin/index/index');
    }

    /**
     *  检查后台用户访问权限
     * @param int $userId 后台用户id
     * @return boolean 检查通过返回true
     */
    private function checkAccess($userId)
    {
        // 如果用户id是1，则无需判断
        if ($userId == 1) {
            return true;
        }

        $module = $this->request->module();
        $controller = $this->request->controller();
        $action = $this->request->action();
        $rule = strtolower($module . $controller . $action);

        //不进行权限检测的规则
        $notRequire = ['indexindexindex', 'indexusereditself'];
        if (!in_array($rule, $notRequire) && strtolower($action) != 'uploadimg') {
            return auth_check($userId);
        } else {
            return true;
        }
    }


    private function getMenu()
    {
        function check_top(&$value, $key, $rule)
        {
            $road = strtolower($value['app'] . '/' . $value['controller'] . '/' . $value['action']);
            if (!in_array($road, $rule)) {
                unset($value);
            }
        }

        $menu = new Menu();
        $where[] = ['pid', '=', 0];
        $where[] = ['status', '=', 0];
        $field = ['id', 'pid', 'url', 'name', 'icon' , 'type'];
        //获取所有顶级栏目
        $top = $menu->selectData($where, $field, 'sort desc,id asc')->toArray();
        //获取所有子栏目
        $where[0] = ['pid', '>', 0];
        $child = $menu->selectData($where, $field, 'sort desc,id asc')->toArray();
        //获取当前用户组生效的权限规则
        if (session('user.id') == 1) {
            $rule = Auth::allRule();
        }else{
            $auth_group = new AuthGroup();
            $rules = $auth_group->selectData([['id', 'in', explode(',',session('user.gid'))]], 'rules');
            $groups = [];
            //获取所属所有用户组所有拥有的权限id
            foreach($rules as $vr){
                $groups = array_merge($groups,explode(',', $vr['rules']));
            }
            $where_check[] = ['id', 'in', $groups];
            $rule = Auth::allRule($where_check);
        }

        //非管理员过滤顶级栏目
        $filter = [];
        if (session('user.id') != 1) {
            foreach ($top as $value){
                $road = strtolower($value['url']);
                //可访问菜单需要检查权限
                if ((!in_array($road, $rule) && !$value['type']) || (in_array($road, $rule) && $value['type'])) {
                    $filter [] = $value;
                }
            }
        }else{
            $filter = $top;
        }

        $admin_menu = [];

        //处理子栏目
        foreach ($filter as $vo) {
            $temp = [];
            //将有对应权限的子栏目放入父栏目的下级属性中
            foreach ($child as $vc){
                $road = strtolower($vc['url']);
                // || !$vc['type']
                if (((in_array($road, $rule) || session('user.id') == 1)) && $vo['id'] == $vc['pid']) {
                    $temp[] = $vc;
                }
            }
            //父栏目有子菜单且父栏目不是可访问菜单时，显示父栏目
            if(!empty($temp) || $vo['type']){
                $vo['child'] = $temp;
                $admin_menu[] = $vo;
            }
//            $vo['auth'] = true;
//            if (!check_auth($vo['name'])) {
//                $vo['auth'] = false;
//            }
//            $vo['url'] = U($vo['name']);
//            $child = $this->where(array('pid' => $vo['id']))->order('level asc')->select();
//
//            foreach ($child as $k => $v) {
//                $child[$k]['auth'] = true;
//                $child[$k]['url'] = U($v['name']);
//                if (!check_auth($v['name'])) {
//                    $child[$k]['auth'] = false;
//                }
//            }
//            $vo['child'] = $child;
//            $data[] = $vo;
        }
        return $admin_menu;

    }

}
