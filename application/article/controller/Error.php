<?php
namespace app\article\controller;

use app\common\controller\Base;

class Error extends Base
{
    public function _empty()
    {
        $this->redirect('admin/index/index');
    }

}
