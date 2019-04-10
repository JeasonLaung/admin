<?php
namespace app\article\controller;

use app\common\controller\Base;
use app\article\model\ArticleColumn;
use app\article\validate\ArticleColumn as MenuValidate;
use app\common\model\Tree;
use app\article\model\Position;
use app\article\model\PositionAccess;

class Column extends Base
{

    /*
     * 文章栏目列表
     * */
    public function index(ArticleColumn $menu)
    {
        $field = ['id', 'pid', 'column_title', 'column_icon', 'column_status', 'column_sort', 'type'];
//        $keyword = $this->request->get('search_key');
//        $where = [];
//        if(!empty($keyword)){
//            $where[] = ['column_title','like','%'.$keyword.'%'];
//        }

        $list = $menu->selectData([], $field, 'id asc')->toArray();
        $list = $this->treeToHtml($this->generateTree($list));
        $this->assign('list', $list);
//        $this->assign('search_key', $keyword);
        return $this->fetch('index');
    }


    /*
     * 添加栏目
     * */
    public function addColumn(ArticleColumn $column, Position $position){
        if($this->request->isPost()){
            $data = $this->request->post();
            $validate = new MenuValidate;
            if (!$validate->check($data)) {
                $this->result('', 1, $validate->getError());
                exit();
            }

            if($column->addColumn($data)){
                $this->result('', 0, '添加成功');
            }else{
                $this->result('', 1, '添加失败');
            }
        }
        $tree_data = array();
        $tree = new Tree();
        $list = $column->selectData([], ['id','pid', 'column_title'], 'id asc')->toArray();
        foreach ($list as $key => $value) {
            $tree_data[$value['id']] =$value;
        }
        $str = "<option value='\$id' \$selected>\$spacer \$column_title</option>";
        $tree->init($tree_data);
        $selectCategory = $tree->get_tree(0, $str);
        $this->assign('option', $selectCategory);

        $where[] = ['position_status', '=', 0];
        $field = ['id', 'position_name'];
        $this->assign('position', $position->selectData($where, $field, 'position_sort desc')->toArray());

        return $this->fetch('add_column');
    }


    /*
     * 编辑栏目
     * */
    public function editColumn(ArticleColumn $column, Position $position){
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
            $validate = new MenuValidate;
            if (!$validate->check($data)) {
                $this->result('', 1, $validate->getError());
                exit();
            }
            if($data['type'] == 0){
                $res = $column->editColumn($data);
            }else{
                $res = $column->saveData($data);
            }
            if($res){
                $this->result('', 0, '编辑成功');
            }else{
                $this->result('', 1, '编辑失败');
            }
        }
        $info = $column->getColumn([["c.id", '=', $id]]);
        $tree_data = array();
        $tree = new Tree();
        $list = $column->selectData([], ['id','pid', 'column_title'], 'id asc')->toArray();
        foreach ($list as $key => $value) {
            $tree_data[$value['id']] =$value;
        }
        $str = "<option value='\$id' \$selected>\$spacer \$column_title</option>";
        $tree->init($tree_data);
        $selectCategory = $tree->get_tree(0, $str, $info['pid']);
        $this->assign('option', $selectCategory);
        $this->assign('info', $info);

        $access = new PositionAccess();
        $this->assign('access', $access->sgetAccess([['cid', '=', $id], ['type', '=', 2]]));
        $where[] = ['position_status', '=', 0];
        $field = ['id', 'position_name'];
        $this->assign('position', $position->selectData($where, $field, 'position_sort desc')->toArray());
        return $this->fetch('edit_column');
    }


    /*
     * 删除栏目
     * */
    public function deleteColumn(ArticleColumn $column){
        if ($this->request->isPost()) {
            $id = $this->request->param("id", 0, 'intval');
            if(empty($id)){
                $this->result('', 1, '参数错误!');
            }
            $count = $column->findData([['pid', '=', $id]], 'id');
            if ($count) {
                $this->result('', 1, '该栏目下还有子栏目，无法删除！');
            }
            if ($column->deleteColumn($id)) {
                $this->result('', 0, '删除成功!');
            } else {
                $this->result('', 1, '删除失败!');
            }
        }
    }






    private function treeToHtml($list, $start = 0){
        $html = '';
        foreach ($list as $v){
            switch ($v['type']){
                case 0:
                    $type = '页面栏目';break;
                case 1:
                    $type = '新闻栏目';break;
                case 2:
                    $type = '跳转栏目';break;
                default:
                    $type = '页面栏目';
            }
            if($v['pid'] == 0){
                $start = 0;
            }
            $nbsp = '';
            if($start > 0){
                for($i=0;$i< ($start*3);$i++){
                    $nbsp .= '<span class="witrh_span"></span>';
                }
            }
            if($start == 0){
                $head = '<div class="column_back"><div class="column_info"><span style="width: 50px">';
            }else{
                $head = '<div class="column_back column_child"><div class="column_info"><span style="width: 50px">';
            }
            if(!empty($v['child'])){
                $head .= '<input type="button" value="+" class="show_hide">';
            }
            $html .= $head. '</span><span style="width: 50px">' .$v['id']. '</span>';
            $url = empty($v['column_icon'])? '/static/images/default-head.png' : $v['column_icon'];
            $html .= '<span><div class="column_icon_back"><img src="' .$url. '" class="column_icon"></div></span>';
            $html .= '<span class="width_auto">' . $nbsp .$v['column_title'] . '</span>';
            $html .= '<span>' . ($v['pid'] == 0 ? '顶级栏目' : '子栏目') . '</span>';
            $html .= '<span><span class="label label-primary">' .$v['column_sort'] . '</span></span><span>'.$type.'</span>';
            $html .= ($v['column_status'] == 1 ? '<span><span class="label label-warning">隐藏</span></span>' : '<span><span class="label label-success">显示</span></span>');
            $html .= '<span><a class="btn btn-default btn-xs" href="' . url('article/column/editcolumn',['id'=>$v['id']]) .'"><iclass="fa fa-edit"></i>&nbsp;编辑</a>';
            $html .= '<a class="btn btn-default btn-xs" onclick="return del(' . $v['id']. ',this)"><i class="fa fa-trash-o"></i>&nbsp;删除</a></span></div>';

            if(!empty($v['child'])){
                $temp = $start + 1;
                $html .= $this->treeToHtml($v['child'], $temp);
            }
            $html .= '</div>';
        }
        return $html;
    }


    private function generateTree($list)
    {
        $tree     = [];
        $packData = [];
        foreach ($list as $data) {
            $packData[$data['id']] = $data;
        }
        foreach ($packData as $key => $val) {
            if ($val['pid'] == 0) {
                $tree[] = &$packData[$key];
            } else {
                //找到其父类
                if(!empty($packData[$val['pid']])){
                    $packData[$val['pid']]['child'][] = &$packData[$key];
                }
            }
        }
        return $tree;
    }
}
