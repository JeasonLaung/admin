<?php 

function getUserId()
{
	$sign = request()->header(SIGN_NAME);
	if (!$sign) {
		return null;
	}
	try{
		$jwt = \Firebase\JWT\JWT::decode($sign, PUBLIC_KEY, array('RS256'));
	}
	catch(\UnexpectedValueException $e){
		return null;
	}

	return $jwt->uid;
}