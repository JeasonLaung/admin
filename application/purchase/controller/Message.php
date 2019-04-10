<?php 
namespace app\purchase\controller;

// use app\purchase\model\HasRead;
use app\purchase\model\DemandMessage;
use app\purchase\model\AskHasRead;
use app\purchase\model\Ask;
use app\purchase\model\Quote;

 

/**
 * 
 */
// class Ask extends \think\Controller
class Message extends Base
{
    /*
     *
     * 需求者消息
     *
     */
    public function quote(Quote $Quote,DemandMessage $DemandMessage)
    {
        $uid = request()->uid;

        // $uid = 17067;
        return success($DemandMessage
                ->alias('dm')
                ->field('q.*,dm.is_read')
                ->where('dm.user_id = '.$uid)
                ->join('purchase_quote q','q.id = dm.quote_id')
                ->order('q.create_time desc')
                ->select());
    }
    /*
     *
     * 需求者消息
     *
     */
    public function quote_tip(DemandMessage $DemandMessage)
    {
        $uid = request()->uid;
        // $uid = 17067;
        return success($DemandMessage
                ->where('user_id',$uid)
                ->where('is_read',0)
                ->count('id'));
    }
    public function ask(Ask $Ask,AskHasRead $AskHasRead)
    {
        $uid = request()->uid;
        // $uid = 17067;
        return success($Ask->alias('a')
                    ->field('a.*,!ISNULL(r.id) as is_read')
                    ->order('a.create_time desc')
                    ->join('purchase_follow_brand fb', 'fb.create_time < a.create_time AND fb.brand_id = `a`.brand_id AND fb.user_id = '.$uid)
                    ->join('purchase_supplier_read r','r.ask_id=a.id','LEFT')
                    ->select());
        // return success($Ask->alias('a')
        //             ->field('a.*,!ISNULL(r.id) as is_read')
        //             ->join('purchase_follow_brand fb', 'fb.brand_id = `a`.brand_id AND fb.user_id = '.$uid)
        //             ->join('purchase_supplier_read r','r.ask_id=a.id','LEFT')
        //             ->join('business_users_union u','u.id = '.$uid,'LEFT')
        //             ->where('u.createtime','<','fb.create_time')
        //             ->select());
                    
    }
    public function ask_tip(Ask $Ask,AskHasRead $AskHasRead)
    {
        $uid = request()->uid;
        // $uid = 17067;
        return $Ask->alias('a')
                    ->join('purchase_follow_brand fb', 'fb.create_time < a.create_time AND fb.brand_id = `a`.brand_id AND fb.user_id = '.$uid)
                    ->join('purchase_supplier_read r','r.ask_id=a.id','LEFT')
                    ->where('r.id IS NULL')
                    ->count('a.id');
        // return $Ask->getLastSql();
    }
    
    public function quote_read($id,DemandMessage $DemandMessage)
    {
        $res = $DemandMessage
        ->where(['quote_id'=>$id])
        ->data([
            'is_read'=>1,
            'update_time'=>time()
        ])
        ->update();
        if ($res) {
            return success();
        }
        else {
            return error();
        }
    }
    public function ask_read($ask_id,AskHasRead $AskHasRead)
    {
        $uid = request()->uid;
        $res = $AskHasRead->field('id')->get(['ask_id'=>$ask_id,'user_id'=>$uid]);
        if (empty($res)) {
            return error();
        }
        $res = $AskHasRead->insert([
            'user_id'=>$uid,
            'ask_id'=>$ask_id,
            'create_time'=>time()
        ]);
        return success();
    }
}