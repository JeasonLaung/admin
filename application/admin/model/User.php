<?php

namespace app\admin\model;
use think\Db;
use app\common\model\Base;

class User extends Base
{
    protected $table = 'admin_user';

    protected $insert = ['createtime'];

    protected function setCreatetimeAttr()
    {
        return time();
    }

    protected function setPasswordAttr($value)
    {
        return md5($value);
    }

    public function selectUser($where, $field = ['*'], $order = 'id desc', $limit = 20){
        return $this->alias('u')->join('auth_group_access g','u.id=g.uid', 'left')->where($where)->field($field)->order($order)->paginate($limit);
    }

    public function addUser($data){
        $this->startTrans();
        try{
            $this->allowField(true)->isUpdate(false)->save($data);
            $id = $this->getLastInsID();
            $access = [];
            $access['uid'] = $id;
            $access['group_id'] = implode(',',$data['rules']);
            Db::name('auth_group_access')->insert($access);
            $this->commit();
            return true;
        }catch (\Exception $e){
            $this->rollback();
            return false;
        }
    }

    public function editUser($data){
        $this->startTrans();
        try{
            $this->allowField(true)->isUpdate(true)->save($data);
            $access['uid'] = $data['id'];
            $info = Db::name('auth_group_access')->where([['uid', '=', $data['id']]])->find();
            if($info){
                $access['group_id'] = implode(',',$data['rules']);
                Db::name('auth_group_access')->where([['uid', '=', $data['id']]])->update($access);
            }else{
                $access['uid'] = $data['id'];
                $access['group_id'] = implode(',',$data['rules']);
                Db::name('auth_group_access')->insert($access);
            }
            $this->commit();
            return true;
        }catch (\Exception $e){
            $this->rollback();
            echo $e->getMessage();
            return false;
        }
    }


    public function deleteUser($id){
        $this->startTrans();
        try{
            $this->where([['id', '=', $id]])->delete();
            Db::name('auth_group_access')->where([['uid', '=', $id]])->delete();
            Db::commit();
            return true;
        }catch (\Exception $e){
            $this->rollback();
            return false;
        }
    }

    public function getWithGroup($where, $field = ['*']){
        return $this->alias('u')->join('auth_group_access a', 'u.id=a.uid', 'left')->where($where)->field($field)->find();
    }
}
