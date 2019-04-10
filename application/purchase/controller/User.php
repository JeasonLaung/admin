<?php 
namespace app\purchase\controller;
use \Firebase\JWT\JWT;
use app\purchase\model\User as UserModel;


class User extends Base
{
	// public function edit(UserModel $User)
 //    {
 //        $uid = request()->uid;

 //        $User->where(['id'=>$uid])->update();
 //        return ;
 //    }
    public function change_phone(UserModel $User)
    {
        $uid = request()->uid;
        $phone = request()->only('phone','post');
        $captcha = request()->only('captcha','post');
        $res = \TXSms::checkCaptcha($phone,$captcha);
        if ($res !==true) {
            return error($res);
        }
        $res = $User
        ->where(['id'=>$uid])
        ->data(['phone',$phone])
        ->update();
        return success('修改成功');
    }
    public function change_logo(UserModel $User)
    {
        // $uid = request()->uid;
        // return ;
    }
}