<?php
namespace app\index\controller;

// use app\common\controller\Base;

class Error extends Base
{
    public function _empty()
    {
    	return error(400);
    }
}
