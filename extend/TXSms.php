<?php

// use think\facade\Session;

use \app\common\model\SmsLog;


class TXSms {
    const SmsApi = 'https://yun.tim.qq.com/v5/tlssmssvr/sendsms?sdkappid=%s&random=%s';
    const SmsAppId = '1400189945';
    const SmsKey = 'f1905309b825f7e152e5d86ac3d1cebd';
    // const SmsCodeSession = 'sms';
    const SmsCodeLifeTime = 300;
    const SmsTimes = 100000000;
    /**
     * 发送手机短信
     * @param $phone 发送手机号
     * @return Boolean 是否发送成功
     */
    public static function send($phone,$sign_id=''/*防爆短信标示*/)
    {
        $SmsLog = new SmsLog;
        
        // 同一个签名id一天内只能发5条
        $now = time();
        $times = $SmsLog->whereBetween('createtime', sprintf('%s,%s',$now-43200,$now+43200))->count('id');
        if ($times > self::SmsTimes) {
            return error('本日消息配额已用完');
        }


        $strAppKey = "f1905309b825f7e152e5d86ac3d1cebd"; //sdkappid 对应的 appkey，需要业务方高度保密
        $strRand = mt_rand(1000000,9999999);//url 中的 random 字段的值
        $strTime = time(); //UNIX 时间戳
        $strMobile = $phone; //tel 的 mobile 字段的内容
        
        $sig = hash('sha256',sprintf('appkey=%s&random=%s&time=%s&mobile=%s',
                                    $strAppKey,
                                    $strRand,
                                    $strTime,
                                    $strMobile));

        $random =  mt_rand(1000, 9999);
        $data = '{
            "params": [
                "'.$random.'"
            ],
            "sig": "'.$sig.'",
            "sign": "198683",
            "tel": {
                "mobile": "'.$phone.'",
                "nationcode": "86"
            },
            "time": '.$strTime.',
            "tpl_id": 290629
        }';
        // 
        // $session_data = [
        //     'phone'=>$phone,
        //     'code'=>$random,
        //     'deadtime'=>time()+self::SmsCodeLifeTime,
        // ];
        // Session::set(self::SmsCodeSession, $session_data);

        $api = sprintf(self::SmsApi, self::SmsAppId, $strRand);

        $SmsLog->insert([
            'code'=>$random,
            'createtime'=>time(),
            'tel'=>$phone,
            'type'=>7,
            // 'sign_id'=>$sign_id
        ]);
        return ['result'=>0];
        // return json_decode(\Curl::post($api, $data),true);
    }
    // public static function captcha($phone)
    // {
    //     $rand = mt_rand(1000,9999);
    //     $text = '验证码为'.$rand;
    //     $session_data = [
    //         'phone'=>$phone,
    //         'code'=>$rand,
    //         'deadtime'=>time()+self::SmsCodeLifeTime,
    //     ];
    //     Session::set(self::SmsCodeSession, $session_data);
    //     return self::send($phone,$text);
    // }

    public static function checkCaptcha($phone,$captcha)
    {
        $SmsLog = new SmsLog;
        // $captcha = Session::get(self::SmsCodeSession);
        // if($captcha['deadtime'] < time()){
        //     return '验证码已过期';
        // }
        // if($captcha['phone'] != $phone){
        //     return '该手机号与发送验证码的手机号不一致';
        // }
        // if($captcha['captcha'] != $captcha){
        //     return '验证码不正确';
        // }
        $res = $SmsLog->order('createtime desc')->get(['tel'=>$phone]);
        if (empty($res)) {
            return '验证码不正确';
        }
        else if ($res['code'] != $captcha) {
            return '验证码不正确';
        }
        else if($res['createtime'] + self::SmsCodeLifeTime < time()){
            return '验证码已过期';
        }

        //正确，判断是否恒等于true
        return true;
    }

}