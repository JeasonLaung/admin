<?php
namespace app\article\model;

use app\common\model\Base;
use think\Db;

class ArticleColumn extends Base
{

    protected $insert = ['column_createtime'];
    protected $update = ['column_updatetime'];

    protected function setColumnCreatetimeAttr()
    {
        return time();
    }

    protected function setColumnUpdatetimeAttr()
    {
        return time();
    }

    public function getColumn($where){
        return $this->alias('c')->join('column_info i', 'c.id=i.cid', 'left')->where($where)->field('c.*,i.column_content')->find();
    }

    public function addColumn($data){
        $this->startTrans();
        try{
            $this->allowField(true)->isUpdate(false)->save($data);
            $id = $this->getLastInsID();
            if(!empty($data['position'])){
                $position = [];
                foreach ((array)$data['position'] as $v){
                    $temp = [];
                    $temp['pid'] = $v;
                    $temp['cid'] = $id;
                    $temp['type'] = 2;
                    $position[] = $temp;
                }
                Db::name('position_access')->insertAll($position);
            }
            if($data['type'] == 0){
                $id = $this->getLastInsID();
                $content['cid'] = $id;
                $content['column_content'] = $data['column_content'];
                Db::name('column_info')->insert($content);
            }

            $this->commit();
            return true;
        }catch (\Exception $e){
            $this->rollback();
            return false;
        }
    }

    public function editColumn($data){
        $this->startTrans();
        try{
            $this->allowField(true)->isUpdate(true)->save($data);

            if(!empty($data['position'])){
                $position = [];
                $where = [];
                $where[] = ['cid', '=', $data['id']];
                $where[] = ['type', '=', 2];
                $list = Db::name('position_access')->where($where)->field('pid,id')->select();
                $pid = [];
                $delete = [];
                foreach ($list as $vl){
                    $pid[] = $vl['pid'];
                    if(!in_array($vl['pid'], (array)$data['position'])){
                        $delete[] = $vl['id'];
                    }
                }
                foreach ((array)$data['position'] as $v){
                    if(empty($pid) || !in_array($v, $pid)){
                        $temp = [];
                        $temp['pid'] = $v;
                        $temp['type'] = 2;
                        $temp['cid'] = $data['id'];
                        $position[] = $temp;
                    }
                }
                if(!empty($position)){
                    Db::name('position_access')->insertAll($position);
                }
                if(!empty($delete)){
                    Db::name('position_access')->where([['id', 'in', $delete], ['type', '=', 2]])->delete();
                }
            }else{
                Db::name('position_access')->where([['cid', '=', $data['id']], ['type', '=', 1]])->delete();
            }

            $count = Db::name('column_info')->where([['cid', '=', $data['id']]])->count('id');
            $content['column_content'] = $data['column_content'];
            if($count){
                Db::name('column_info')->where([['cid', '=', $data['id']]])->update($content);
            }else{
                $content['cid'] = $data['id'];
                Db::name('column_info')->insert($content);
            }
            $this->commit();
            return true;
        }catch (\Exception $e){
            $this->rollback();
            return false;
        }
    }

    public function deleteColumn($id){
        $this->startTrans();
        try{
            $this->where('id', $id)->delete();
            $where = [];
            $where[] = ['cid', '=', $id];
            $where[] = ['type', '=', 2];
            Db::name('position_access')->where($where)->delete();
            Db::name('column_info')->where('cid', $id)->delete();
            $this->commit();
            return true;
        }catch (\Exception $e){
            $this->rollback();
            return false;
        }
    }
}
