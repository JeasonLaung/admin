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

function getCompanyId($uid)
{
	$UserRelation = new \app\purchase\model\UserRelation;
	return $UserRelation->where(['user_id'=>$uid])->value('company_id');
}