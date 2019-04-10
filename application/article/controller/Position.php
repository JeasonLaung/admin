<?php
namespace app\article\controller;

use app\common\controller\Base;
use app\article\model\Position as PositionModel;

class Position extends Base
{

    /*
     * 推荐位列表
     * */
    public function index(PositionModel $position)
    {
        $field = ['id', 'position_name', 'position_sort', 'position_status'];
        $list = $position->selectData([], $field, 'position_sort desc')->toArray();
        $this->assign('list', $list);
        return $this->fetch('index');
    }

    /*
     * 添加推荐位
     * */
    public function addPosition(PositionModel $position){
        if ($this->request->isPost()) {
            $data = $this->request->post();
            if(empty($data['position_name'])){
                $this->result('', 1, '推荐位名称必须填写');
            }
            if($position->saveData($data)){
                $this->result('', 0, '添加成功');
            }else{
                $this->result('', 1, '添加失败');
            }
        }
        return $this->fetch('add_position');
    }



    /*
     * 编辑推荐位
     * */
    public function editPosition(PositionModel $position){
        $id = intval($this->request->param('id'));
        if(empty($id)){
            if(!$this->request->isAjax()){
                $this->error('参数错误',null,"",2);
            }else{
                $this->result('', 1, '参数错误');
            }
        }
        if ($this->request->isPost()) {
            $data = $this->request->post();
            if(empty($data['position_name'])){
                $this->result('', 1, '推荐位名称必须填写');
            }
            if($position->saveData($data)){
                $this->result('', 0, '编辑成功');
            }else{
                $this->result('', 1, '编辑失败');
            }
        }
        $info = $position->findData([["id", '=', $id]]);
        $this->assign('info', $info);
        return $this->fetch('edit_position');
    }


    /*
     * 删除推荐位
     * */
    public function deletePosition(PositionModel $column){
        if ($this->request->isPost()) {
            $id = $this->request->param("id", 0, 'intval');
            if(empty($id)){
                $this->result('', 1, '参数错误!');
            }
            if ($column->deletePosition($id)) {
                $this->result('', 0, '删除成功!');
            } else {
                $this->result('', 1, '删除失败!');
            }
        }
    }

}
