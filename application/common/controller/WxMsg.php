<?php
namespace app\common\Controller;
use think\Controller;
define("TOKEN", "jeasonlaung");

class WxMsg extends Controller {
    
    public function check_server(){     //校验服务器地址URL
        if (isset($_GET['echostr'])) {
            $this->valid();
        }else{
            $this->responseMsg();
        }
    }
    public function valid()
    {
        $echoStr = $_GET["echostr"];
        if($this->checkSignature()){
            header('content-type:text');
            return $echoStr;
        }else{
            echo false;
            exit;
        }
    }
    private function checkSignature()
    {
        $signature = $_GET["signature"];
        $timestamp = $_GET["timestamp"];
        $nonce = $_GET["nonce"];
    
        $token = TOKEN;
        $tmpArr = array($token, $timestamp, $nonce);
        sort($tmpArr, SORT_STRING);
        $tmpStr = implode( $tmpArr );
        $tmpStr = sha1( $tmpStr );
    
        if( $tmpStr == $signature ){
            return true;
        }else{
            return false;
        }
    }
    public function responseMsg()
    {
        $postStr = $GLOBALS["HTTP_RAW_POST_DATA"];
    
        if (!empty($postStr) && is_string($postStr)){
            //禁止引用外部xml实体
            //libxml_disable_entity_loader(true);
            
            //$postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
            $postArr = json_decode($postStr,true);
            if(!empty($postArr['MsgType']) && $postArr['MsgType'] == 'text'){   //文本消息
                $fromUsername = $postArr['FromUserName'];   //发送者openid
                $toUserName = $postArr['ToUserName'];       //小程序id
                $textTpl = array(
                    "ToUserName"=>$fromUsername,
                    "FromUserName"=>$toUserName,
                    "CreateTime"=>time(),
                    "MsgType"=>"transfer_customer_service",
                );
                exit(json_encode($textTpl));
            }elseif(!empty($postArr['MsgType']) && $postArr['MsgType'] == 'image'){ //图文消息
                $fromUsername = $postArr['FromUserName'];   //发送者openid
                $toUserName = $postArr['ToUserName'];       //小程序id
                $textTpl = array(
                    "ToUserName"=>$fromUsername,
                    "FromUserName"=>$toUserName,
                    "CreateTime"=>time(),
                    "MsgType"=>"transfer_customer_service",
                );
                exit(json_encode($textTpl));
            }elseif($postArr['MsgType'] == 'event' && $postArr['Event']=='user_enter_tempsession'){ //进入客服动作
                $fromUsername = $postArr['FromUserName'];   //发送者openid
                $content = '您好，有什么能帮助你?';
                $data=array(
                    "touser"=>$fromUsername,
                    "msgtype"=>"text",
                    "text"=>array("content"=>$content)
                );
                $json = json_encode($data,JSON_UNESCAPED_UNICODE);  //php5.4+
                
                $access_token = $this->get_accessToken();
                /* 
                 * POST发送https请求客服接口api
                 */
                $url = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=".$access_token;
                //以'json'格式发送post的https请求
                // $curl = curl_init();
                // curl_setopt($curl, CURLOPT_URL, $url);
                // curl_setopt($curl, CURLOPT_POST, 1); // 发送一个常规的Post请求
                // curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
                // curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
                // if (!empty($json)){
                //     curl_setopt($curl, CURLOPT_POSTFIELDS,$json);
                // }
                // curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
                // //curl_setopt($curl, CURLOPT_HTTPHEADER, $headers );
                // $output = curl_exec($curl);
                // if (curl_errno($curl)) {
                //     echo 'Errno'.curl_error($curl);//捕抓异常
                // }
                // curl_close($curl);
                $output = \Curl::post($url,$json);
                if($output == 0){
                    echo 'success';exit;
                }
                
            }else{
                exit('aaa');
            }
        }else{
            echo "";
            exit;
        }
    }
    /* 调用微信api，获取access_token，有效期7200s -xzz0704 */
    public function get_accessToken(){
        /* 在有效期，直接返回access_token */
        if(cache('access_token')){
            return cache('access_token');
        }
        /* 不在有效期，重新发送请求，获取access_token */
        else{
            $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx2e14b7e0120070db&secret=bf4b963ec77343d30a3389207a5eac32';
            $result = \Curl::get($url);
            $res = json_decode($result,true);   //json字符串转数组
    
            if($res){
                cache('access_token',$res['access_token'],7100);
                return cache('access_token');
            }else{
                return 'api access_token return error';
            }
        }
    }
}