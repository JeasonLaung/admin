<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use app\common\model\Tree;
use app\admin\model\Menu as MenuModel;
use app\admin\validate\Menu as MenuValidate;
use app\common\controller\Base;

class Menu extends Base
{
    /**
     * 后台菜单管理
     */
    public function index(MenuModel $menu)
    {
        $field = ['id', 'name', 'pid', 'status', 'url', 'sort', 'type'];
        $keyword = $this->request->get('search_key');
        $where = [];
        if(!empty($keyword)){
            $where[] = ['name','like','%'.$keyword.'%'];
        }
        $list = $menu->selectData($where, $field, 'sort desc,id asc', true, '20');
        $list->appends($this->request->param());
        $this->assign('list', $list);
        $this->assign('search_key', $keyword);
        return $this->fetch('index');
    }

    /**
     * 后台菜单添加
     */
    public function addMenu(MenuModel $menu)
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $validate = new MenuValidate;
            if (!$validate->check($data)) {
                $this->result('', 1, $validate->getError());
                exit();
            }

            if($data['type'] && (empty($data['module']) || empty($data['controller']) || empty($data['action']))){
                $this->result('', 1, '可访问菜单必须完整填写路径');
            }
            if(empty($data['icon'])){
                $data['icon'] = 'fa-circle-o';
            }
            if($data['type']){
                $url = [];
                $url[] = $data['module'];
                $url[] = $data['controller'];
                $url[] = $data['action'];
                $data['url'] =  implode('/',$url);
            }else{
                $data['url'] =  '';
            }

            if ($menu->saveData($data)) {
                $this->result('', 0, '菜单添加成功');
            } else {
                $this->result('', 1, '菜单添加失败');
            }
        }
        $where[] = ['pid', '=', 0];
        $where[] = ['status', '=', 0];
        $field = ['id', 'name'];
        $top = $menu->selectData($where, $field, 'sort desc,id desc');
        $this->assign('list', $top);
        return $this->fetch('add_menu');
    }

    /**
     * 后台菜单编辑
     */
    public function edit(MenuModel $menu)
    {
        $id = intval($this->request->param('id'));
        if(empty($id)){
            if(!$this->request->isAjax()){
                $this->error('参数错误',null,"",2);
            }else{
                $this->result('', 1, '参数错误');
            }
        }
        if ($this->request->isPost()) {
            $id = intval($this->request->post('id'));
            if(empty($id)){
                $this->result('', 1, '参数错误');
            }
            $data = $this->request->post();
            $validate = new MenuValidate;
            if (!$validate->check($data)) {
                $this->result('', 1, $validate->getError());
                exit();
            }
            if($data['type'] && (empty($data['module']) || empty($data['controller']) || empty($data['action']))){
                $this->result('', 1, '可访问菜单必须完整填写路径');
            }
            if(empty($data['icon'])){
                $data['icon'] = 'fa-circle-o';
            }
            if($data['type']){
                $url = [];
                $url[] = $data['module'];
                $url[] = $data['controller'];
                $url[] = $data['action'];
                $data['url'] =  implode('/',$url);
            }else{
                $data['url'] =  '';
            }
            if ($menu->saveData($data)) {
                $this->result('', 0, '菜单修改成功');
            } else {
                $this->result('', 1, '菜单修改失败');
            }
        }
        //https://blog.csdn.net/chunxiaqiudong5/article/details/54585316

        $info = $menu->findData([["id", '=', $id]]);
        $url = explode("/",$info['url']);
        $info['module'] = empty($url[0])?'':$url[0];
        $info['controller'] = empty($url[1])?'':$url[1];
        $info['action'] = empty($url[2])?'':$url[2];
        $where[] = ['pid', '=', 0];
        $where[] = ['status', '=', 0];
        $field = ['id', 'name'];
        $top = $menu->selectData($where, $field, 'sort desc,id desc');
        $this->assign("info", $info);
        $this->assign("list", $top);
        return $this->fetch('edit_menu');
    }


    /**
     * 后台菜单删除
     */
    public function delete(MenuModel $menu)
    {
        if ($this->request->isPost()) {
            $id = $this->request->param("id", 0, 'intval');
            if(empty($id)){
                $this->result('', 1, '参数错误!');
            }
            $count = $menu->findData([['pid', '=', $id]], 'id');
            if ($count) {
                $this->result('', 1, '该菜单下还有子菜单，无法删除！');
            }
            if ($menu->deleteData([['id', '=', $id]]) !== false) {
                $this->result('', 0, '删除成功!');
            } else {
                $this->result('', 1, '删除失败!');
            }
        }
    }


    /*
     * 查看栏目图标样式
     * */
    public function icon(){
        return $this->fetch();
    }

}