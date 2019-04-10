<?php
namespace app\admin\controller;

use app\common\controller\Base;
use think\Db;

class Index extends Base
{

    public function index()
    {
        try{
            $invite = Db::table('invite_consumer')->where(array('del'=>0))
                ->field('count(id) as count,sum(method = 1) as come_num,sum(method = 2) as go_num,sum(status = 2) as deal_num,sum(status = 1) as not_deal_num,sum(status = 3) as fail_num')->select();
        }catch (\Exception $e){
            return $e;
        }
        $this->assign('invite',$invite[0]);
        return $this->fetch('index');//        session('user',null);
    }

}
