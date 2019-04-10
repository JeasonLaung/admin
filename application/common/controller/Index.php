<?php

namespace app\common\controller;

use think\Controller;
use think\File;

class Index extends Controller
{

    public static function uploadLocal(File $file){
        try{
            $res = $file->move('./upload/images/' . date('Ymd'),md5('Meteor' . time()));
            return ['url' => '//' . $_SERVER['HTTP_HOST'] . '/upload/images/' . date('Ymd') .'/'. $res->getSaveName()];
        }catch (\Exception $e){
            return false;
        }
    }

    public static function uploadOnline($param){
        $config = config('upyun_config');
        $serviceConfig = new Config($config['bucket'], $config['user'], $config['pwd']);
        $serviceConfig->setFormApiKey('lDtZkCWKKbD6b9kWU6W3JboT0gA=');
        $data['save-key'] = $param['path'];
        $data['expiration'] = time() + 120;
        $data['bucket'] = $config['bucket'];
        $policy = Util::base64Json($data);
        $uri = '/' . $data['bucket'];
        $signature = Signature::getBodySignature($serviceConfig, 'POST', $uri, null, $policy);
        return (array(
            'policy' => $policy,
            'authorization' => $signature
        ));
    }
}
