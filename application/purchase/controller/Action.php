<?php
namespace app\purchase\controller;

use app\purchase\model\FormId;
/*
*  用户行为分析
*
*/
class Action extends \think\Controller
{
    public function form($formId,FormId $FormId)
    {
    	$uid = getUserId();
    	if (!$uid) {
    		return error();
    	}
    	$data['user_id'] = $uid;
    	$data['form_id'] = $formId;
    	$FormId->isUpdate(false)->save($data);
    }

}
