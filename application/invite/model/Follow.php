<?php
namespace app\invite\model;

use app\common\model\Base;
use think\Db;
use app\common\Controller\IkCrm as IkCrm;

class Follow extends Base
{
    protected $table = 'invite_follow';

    public function FollowList($id = 0){
        try{
            $FollowList = $this->alias('f')
                ->join(['admin_user a'], 'f.aid=a.id','left')
                ->where(['f.cid'=>$id,'f.del'=>0])->field(['a.admin_name','f.content','f.createtime','f.id','f.aid'])->order('f.createtime desc')->select();
            return $FollowList;
        }catch (\Exception $e){
            return $e;
        }
    }

    public function addFollow($data = []){
        $data['aid'] = session('user.id');
        $data['createtime'] = time();
        $crm_id = Db::table('invite_consumer')->getFieldById($data['cid'],'crm_user');
        $ikCrm = new IkCrm();
        if($crm_id) $ikCrm->WriteFollow($crm_id,$data['content']);
        return $this->insert($data);
    }

    public function saveFollow($data){
        $data['createtime'] = time();
        $result = $this->update($data);
        return $result;
    }

    public function delFollow($id){
        $data['createtime'] = time();
        $data['del'] = 1;
        $data['id'] = $id;
        $result = $this->update($data);
        return $result;
    }

}
