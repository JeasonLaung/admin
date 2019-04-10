<?php
function checkLogin()
{
	// 存在签名，验证
	if ($sign = request()->header(SIGN_NAME)) {
	    try{
	        $decoded = \Firebase\JWT\JWT::decode($sign, PUBLIC_KEY, array('RS256'));
	    }catch(\UnexpectedValueException $e){
	        // 捕捉异常，直接抛出报错
	        json(['status'=>0,'msg'=>$e->getMessage(),'code'=>500])->send();
	        exit();
	    }
	    request()->uid = $decoded->uid;
	}
	else {
		if (!session('?user.id')) {
	        json(['status'=>0,'msg'=>'大哥，你没权限','code'=>500])->send();
			exit();
		}
		request()->uid = session('user.id');
	}
	
}