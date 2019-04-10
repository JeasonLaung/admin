<?php
// +---------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +---------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.thinkcmf.com All rights reserved.
// +---------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +---------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +---------------------------------------------------------------------
namespace app\purchase\controller;

use app\purchase\controller\Auth;



class Base extends \think\Controller
{
	public function __construct()
	{
		parent::__construct();
		

		if(!Auth::check(url())){
			json(['status'=>0,'msg'=>'没有权限'])->send();
			exit();
		}
	}
}