<?php
namespace app\article\model;

use app\common\model\Base;
use think\Db;

class Position extends Base
{

    public function deletePosition($id){
        $this->startTrans();
        try{
            $this->where('id',$id)->delete();
            Db::name('position_access')->where('pid',$id)->delete();
            $this->commit();
            return true;
        }catch (\Exception $e){
            $this->rollback();
            return false;
        }
    }
}
