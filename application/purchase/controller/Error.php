<?php
namespace app\purchase\controller;

// use app\common\controller\Base;

class Error extends Base
{
    public function _empty()
    {
    	return error(400);
        // $this->redirect('admin/index/index');
    }


}
