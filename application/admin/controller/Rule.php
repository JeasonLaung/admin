<?php
namespace app\admin\controller;

use app\admin\model\AuthRule;
use app\admin\validate\Rule as RuleValidate;
use app\admin\model\Menu;
use app\common\controller\Base;

class Rule extends Base
{
    public function index(AuthRule $rule)
    {
        $field = ['id', 'rule_name', 'rule_status', 'rule'];
        $keyword = $this->request->get('search_key');
        $where = [];
        if(!empty($keyword)){
            $where[] = ['rule_name','like','%'.$keyword.'%'];
        }
        $list = $rule->selectData($where, $field, 'id asc', true, '20');
        $list->appends($this->request->param());
        $this->assign('list', $list);
        $this->assign('search_key', $keyword);
        return $this->fetch('index');
    }


    //新增权限规则
    public function addRule(AuthRule $rule,Menu $menu){
        if($this->request->isPost()){
            $data = $this->request->post();
            $validate = new RuleValidate;
            if (!$validate->check($data)) {
                $this->result('', 1, $validate->getError());
                exit();
            }
            if(empty($data['pid'])){
                $this->result('', 1, '所属顶级栏目必须选择');
            }
            $data['rule'] = strtolower($data['rule']);
            if ($rule->saveData($data)) {
                $this->result('', 0, '权限添加成功');
            } else {
                $this->result('', 1, '权限添加失败');
            }
        }
        $where[] = ['pid', '=', 0];
        $where[] = ['status', '=', 0];
        $field = ['id', 'name'];
        $top = $menu->selectData($where, $field, 'sort desc,id desc');
        $this->assign('list', $top);
        return $this->fetch('add_rule');
    }

    //修改权限规则
    public function editRule(AuthRule $rule,Menu $menu){
        $id = intval($this->request->param('id'));
        if(empty($id)){
            if(!$this->request->isAjax()){
                $this->error('参数错误',null,"",2);
            }else{
                $this->result('', 1, '参数错误');
            }
        }
        if($this->request->isPost()){
            $data = $this->request->post();
            $validate = new RuleValidate;
            if (!$validate->check($data)) {
                $this->result('', 1, $validate->getError());
                exit();
            }
            if(empty($data['pid'])){
                $this->result('', 1, '所属顶级栏目必须选择');
            }
            $data['rule'] = strtolower($data['rule']);
            if ($rule->saveData($data)) {
                $this->result('', 0, '权限编辑成功');
            } else {
                $this->result('', 1, '权限编辑失败');
            }
        }
        $info = $rule->findData([['id', '=', $id]]);
        $this->assign('info', $info);
        $where[] = ['pid', '=', 0];
        $where[] = ['status', '=', 0];
        $field = ['id', 'name'];
        $top = $menu->selectData($where, $field, 'sort desc,id desc');
        $this->assign('list', $top);
        return $this->fetch('edit_rule');
    }

    //删除权限规则
    public function delete(AuthRule $rule){
        $id = $this->request->param('id');
        if(empty($id)){
            $this->result('', 0, '参数错误');
        }
        if ($rule->deleteData([['id', '=', $id]])) {
            $this->result('', 0, '删除成功');
        } else {
            $this->result('', 1, '删除失败');
        }
    }
}
