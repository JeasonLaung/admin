<?php
namespace app\index\controller;
use think\Controller;
use EasyWeChat\Factory;
// header('Content-type:text');
// define("TOKEN", "jeasonlaung");
// 
class Index extends Controller {
    public function index($code,$encryptData,$iv)
    {
        // $iv = "2LzDVOYGZVEgHhkJR6kKTA==";
        // $encryptData = "Vq8V2iJNr/DIr2oJnyml1CvWhrYEB5u6KzIRg5/6ziuYehdq/JtHtayBcSab/naSTyOt049P1bzaIcGAcURoiH/x7lMOPiR3tKRQpFFfm6MEVBwGCf2sG+VTYU+E+Tt92G97CanqmnBq+a0XkHZtva4UreFIu/7qw3hZQCr3QdZIsAs2734yh/9GBG4d8b4N//w+uSDIJCqRH9O/wZR0vg7BogdHGeDu0FKJ4mvNfayDgMktm1oioktkU5NbTCeA1gDKC5+Xmh4GUu9Tqj9SJwfdN2z39Cqa6XgJ0NIbe6/B+0d6MH4AlBhiREnEDaVvk7SU+VyEFIfUAhlMmDqG5QTrWtPEFQKNne7NXqEYcqRUyohGGEb2vpi9LeTyxs2o6xukd/TPSmnNnfjIi6QWTv2OdkaHLttIqpI3V3CqQoKmGTzyCy+SuFA5IaJaOJe+PZIcO1mvs3ZL2wdj3Mvw/GREh117M3QOaYBp3kZsGnY=";
        $session = $this->session_key($code);
        
        halt($this->decrypte($session,$iv,$encryptData));
    }
    public function decrypte($session,$iv,$encryptData) {
        $config = [
            'app_id'=>'wxc25ad882a0959830',
            'secret'=>'d5865f5aabc7ee01f764f10f22e48172',
        ];

        $app = Factory::miniProgram($config);

        $decryptedData = $app->encryptor->decryptData($session, $iv, $encryptData);
        halt($decryptedData);
    }
    public function session_key($js_code)
    {
        
        $config = [
            'app_id'=>'wxc25ad882a0959830',
            'secret'=>'d5865f5aabc7ee01f764f10f22e48172',
        ];
        // if (!cache('session')) {
        $url = 'https://api.weixin.qq.com/sns/jscode2session?appid=%s&secret=%s&js_code=%s&grant_type=authorization_code';
        $session_arr = \Curl::get(sprintf($url,$config['app_id'],$config['secret'],$js_code));
        dump($session_arr);
        $session = @json_decode($session_arr,true)['session_key'];
        dump($session);
        
        // cache('session',$session);
        return $session;
        // }
        // else {
        //     $session = cache('session');
        // }

            // dump($session);
            
            /**
             * 绑定公众号才能获取unionid
             */
            

            /**
             * 手机
             */
            // array(4) {
            //   ["phoneNumber"] => string(11) "18680026210"
            //   ["purePhoneNumber"] => string(11) "18680026210"
            //   ["countryCode"] => string(2) "86"
            //   ["watermark"] => array(2) {
            //     ["timestamp"] => int(1554306828)
            //     ["appid"] => string(18) "wxc25ad882a0959830"
            //   }
            // }

        // }
        

        // return 123;
        // file_put_contents('log.txt', $this->request->param());
        // $config = [
        //     'app_id' => 'wx2e14b7e0120070db',
        //     'secret' => 'bf4b963ec77343d30a3389207a5eac32',
        //     'token'=>'jeasonlaung',
        //     // 'acs'
        //     // 下面为可选项
        //     // 指定 API 调用返回结果的类型：array(default)/collection/object/raw/自定义类名
        //     'response_type' => 'array',

        //     'log' => [
        //         'level' => 'debug',
        //         'file' => __DIR__.'/wechat.log',
        //     ],
        //     'verify'=>false,
        // ];

        // $app = Factory::miniProgram($config);
        // $app->customer_service->messages($startTime, $endTime, $msgId = 1, $number = 10000);
        // $openId = 'okwrs0BeeIkgLKnKGretvx-9EyPs';
        // $message = 'hello';
        // $app->customer_service->message($message)->to($openId)->send();
    }
    // public function index(){
    //     file_put_contents('log.txt', '进入');

    //     if (isset($_GET['echostr'])) {
    //         $this->valid();
    //     }else{
    //         $this->responseMsg();
    //     }
    // }
    
    // public function check_server(){     //校验服务器地址URL
        
    // }
    // public function valid()
    // {
    //     $echoStr = $_GET["echostr"];
    //     if($this->checkSignature()){
    //         header('content-type:text');
    //         echo $echoStr;
    //         exit;
    //     }else{
    //         echo $echoStr.'+++'.TOKEN;
    //         exit;
    //     }
    // }
    // private function checkSignature()
    // {
    //     $signature = $_GET["signature"];
    //     $timestamp = $_GET["timestamp"];
    //     $nonce = $_GET["nonce"];
    
    //     $token = TOKEN;
    //     $tmpArr = array($token, $timestamp, $nonce);
    //     sort($tmpArr, SORT_STRING);
    //     $tmpStr = implode( $tmpArr );
    //     $tmpStr = sha1( $tmpStr );
    
    //     if( $tmpStr == $signature ){
    //         return true;
    //     }else{
    //         return false;
    //     }
    // }
    // public function responseMsg()
    // {
    //     $postStr = $GLOBALS["HTTP_RAW_POST_DATA"];
    //     file_put_contents('log.txt', $postStr);
    //     if (!empty($postStr) && is_string($postStr)){
    //         //禁止引用外部xml实体
    //         //libxml_disable_entity_loader(true);
            
    //         //$postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
    //         // $postArr = json_decode($postStr,true);
    //         if(!empty($postArr['MsgType']) && $postArr['MsgType'] == 'text'){   //文本消息
    //             $fromUsername = $postArr['FromUserName'];   //发送者openid
    //             $toUserName = $postArr['ToUserName'];       //小程序id
    //             $textTpl = array(
    //                 "ToUserName"=>$fromUsername,
    //                 "FromUserName"=>$toUserName,
    //                 "CreateTime"=>time(),
    //                 "MsgType"=>"transfer_customer_service",
    //             );
    //             exit(json_encode($textTpl));
    //         }elseif(!empty($postArr['MsgType']) && $postArr['MsgType'] == 'image'){ //图文消息
    //             $fromUsername = $postArr['FromUserName'];   //发送者openid
    //             $toUserName = $postArr['ToUserName'];       //小程序id
    //             $textTpl = array(
    //                 "ToUserName"=>$fromUsername,
    //                 "FromUserName"=>$toUserName,
    //                 "CreateTime"=>time(),
    //                 "MsgType"=>"transfer_customer_service",
    //             );
    //             exit(json_encode($textTpl));
    //         }elseif($postArr['MsgType'] == 'event' && $postArr['Event']=='user_enter_tempsession'){ //进入客服动作
    //             $fromUsername = $postArr['FromUserName'];   //发送者openid
    //             $content = '您好，有什么能帮助你?';
    //             $data=array(
    //                 "touser"=>$fromUsername,
    //                 "msgtype"=>"text",
    //                 "text"=>array("content"=>$content)
    //             );
    //             $json = json_encode($data,JSON_UNESCAPED_UNICODE);  //php5.4+
                
    //             $access_token = $this->get_accessToken();
    //             /* 
    //              * POST发送https请求客服接口api
    //              */
    //             $url = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=".$access_token;
    //             //以'json'格式发送post的https请求
    //             $curl = curl_init();
    //             curl_setopt($curl, CURLOPT_URL, $url);
    //             curl_setopt($curl, CURLOPT_POST, 1); // 发送一个常规的Post请求
    //             curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
    //             curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
    //             if (!empty($json)){
    //                 curl_setopt($curl, CURLOPT_POSTFIELDS,$json);
    //             }
    //             curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    //             //curl_setopt($curl, CURLOPT_HTTPHEADER, $headers );
    //             $output = curl_exec($curl);
    //             if (curl_errno($curl)) {
    //                 echo 'Errno'.curl_error($curl);//捕抓异常
    //             }
    //             curl_close($curl);
    //             if($output == 0){
    //                 echo 'success';exit;
    //             }
                
    //         }else{
    //             exit('aaa');
    //         }
    //     }else{
    //         echo "";
    //         exit;
    //     }
    // }
    // /* 调用微信api，获取access_token，有效期7200s -xzz0704 */
    // public function get_accessToken(){
    //     /* 在有效期，直接返回access_token */
    //     if(cache('access_token')){
    //         return cache('access_token');
    //     }
    //     /* 不在有效期，重新发送请求，获取access_token */
    //     else{
    //         $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx2e14b7e0120070db&secret=bf4b963ec77343d30a3389207a5eac32';
    //         $result = \Curl::get($url);
    //         $res = json_decode($result,true);   //json字符串转数组
    
    //         if($res){
    //             cache('access_token',$res['access_token'],7100);
    //             return cache('access_token');
    //         }else{
    //             return 'api return error';
    //         }
    //     }
    // }
}