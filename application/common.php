<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

define('USER_ID','user.id');
// 公钥
define('PUBLIC_KEY', "-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDMblq4kXqOQ/LPL+fnJ0UAJ+Zy
fwSgs6UV124S/u7W1S0dXf0Xu43nI8EWHGm3PeKHkTs2QlQuuzcVLZBJ7KkUzhTd
KBP0OrVcCW4trZ+JJjgpZa9lZCODN6SAH+f+o2OaQzyMdIjHAgjRg6T2tKf/+tgd
3nJYIAIGlVYeTksH8QIDAQAB
-----END PUBLIC KEY-----");

// 私钥
define('PRIVATE_KEY', "-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMxuWriReo5D8s8v
5+cnRQAn5nJ/BKCzpRXXbhL+7tbVLR1d/Re7jecjwRYcabc94oeROzZCVC67NxUt
kEnsqRTOFN0oE/Q6tVwJbi2tn4kmOCllr2VkI4M3pIAf5/6jY5pDPIx0iMcCCNGD
pPa0p//62B3eclggAgaVVh5OSwfxAgMBAAECgYBYpeX7MUKm3Ho3M/vo9dNrDOJW
dhQIp74HqaKW5Cunx0tH99DfcLpJJ+z77Jg/GLvZs7WsgrjEhvSM33Q5SkHK+F0D
rDDcz2VhfV4tZUuNmhuDu3Xmbyu7Ik49qqQYdorqOa+oSPvgCcLTJM3ppKL0EQXb
Qo0q/1nT7nrSdGnz7QJBAOlQNyibk8gdHkjB8ZZ2B3/XgjMIHaK8AhtmwG/I2+XL
5Tb14buStodh6uAYQ33ODx4dQKIFzIuzWoPh3N54BDcCQQDgTy7bAoGc6/17fnCc
uZ5H0/Ldo4HB+rYWHMLzMFJ38qnmSkU2xCslb9zQfYR3bLrXU2dztiwSO4cIhTWZ
HREXAkEAtuoAlIGEVrsdZwVGFiPqtTuMA940/cRQEpN4AyuB2qMDzRbwJlJbb8BA
l/ft0c+e4okkhuHs/wlZyVNmCbQl+QJAJb+NnhPE5jictuynXOir52CWzY/XpWJg
xEXg1PY72q2+w9+Z2EaZEDrMCVYmNcbZhqUlksaEkijsZ5WrWHIYzwJAFFLycrU3
7YLXEVe1sJHOfM51lh5Bqa9LiMEQyt7hXq7vN0fdIjlsGVTVGyY9UbvbOlN6l/+E
ikPn88qVSwMIuA==
-----END PRIVATE KEY-----");

define('SIGN_NAME', 'X-Putao-Signature');


// 应用公共文件
/**
 * 检查权限
 * @param $userId  int        要检查权限的用户 ID
 * @param $name string  需要验证的规则
 * @param $relation string    如果为 'or' 表示满足任一条规则即通过验证;如果为 'and'则表示需满足所有规则才能通过验证
 * @return boolean            通过验证返回true;失败返回false
 */
function auth_check($uid, $name = null, $relation = 'or')
{
    if (empty($uid)) {
        return false;
    }
    if ($uid == 1) {
        return true;
    }

    if (empty($name)) {
        $request    = request();
        $module     = $request->module();
        $controller = $request->controller();
        $action     = $request->action();
        $name       = strtolower($module . "/" . $controller . "/" . $action);
    }
    return \app\common\controller\Auth::check($uid, $name, $relation);
}


function error($msg = 'failed',$code = 400, $more = [],$exit = true)
{

    // 返回数组
    $return = [
        'status'=>0,
        'code'=> $code,
        'msg'=> $msg,
        
        
    ];
    if(!empty($more)){
        foreach( $more as $key => $value ){
            $return[$key] = $value;
        }
    }
    // 是否强制输出
    if( $exit ) {
        json($return)->send();
        exit();
    }
    return json($return);
}

function success($data=null,$msg='success',$more=[],$exit=true)
{
    if (null === $data) {
        json(['status'=>1])->send();
        exit();
    }
    // 返回数组
    $return = [
        'status'=>1,
        'code'=>200,
        'msg'=>$msg
    ];
    if($data){
        $return['data'] = $data;
    }
    // 更多信息
    if(!empty($more)){
        foreach( $more as $key => $value ){
            $return[$key] = $value;
        }
    }
    // 是否强制输出
    if( $exit ){
        json($return)->send();
        exit();
    }
    return json($return);
}



function get_wx_token(){
    $url = 'http://www.mputao.com/putao/Member/WechatApi/tp5_get_wx_token';
    $res = \Curl::CPost($url,array('appid'=>'wxd0ab978ac3dbd725','appsecret'=>'817149d4bf4c733978df31a886d02800'));
    if($res['code']==1){
        return $res['info'];
    }else{
        return false;
    }
}
