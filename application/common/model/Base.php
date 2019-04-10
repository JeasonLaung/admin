<?php

namespace app\common\model;

use think\Model;

class base extends Model
{
    /*
       * 获取单条信息
       * */
    public function findData($where,$field = ['*']){
        return $this->where($where)->field($field)->find();
    }

    /*
     * 获取多条信息
     * */
    public function selectData($where, $field = ['*'], $order = 'id desc', $page = false, $limit = null)
    {
        if ($page) {
            $action = "paginate";
            if (!$limit) {
                $limit = 10;
            }
        } else {
            $action = 'select';
            $limit = null;
        }
        return $this->where($where)->field($field)->order($order)->$action($limit);
    }

    /*
     * 新增/修改信息
     * */
    public function saveData($data){
        return $this->allowField(true)->isUpdate(!empty($data['id']))->save($data);
    }

    /*
     * 删除信息
     * */
    public function deleteData($where){
        return $this->where($where)->delete();
    }

}
