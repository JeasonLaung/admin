<?php
namespace app\common\Controller;

use think\Controller;
use think\Db;

class IkCrm extends Controller {
    //爱客api域名
    private $ikDomain = 'https://dingtalk.e.ikcrm.com';
    //爱客api接口地址
    private $ikAPIs = array(
        'login' => '/api/v2/auth/login',
        'customer' => '/api/v2/customers',
        'user' => '/api/v2/user/simple_list',
        'customerName' => '/api/v2/customers/search_duplicates',
        'wirteFollow' => '/api/v2/revisit_logs',
        'customFields' => '/api/v2/custom_fields',
        'customerAdmin' => '/api/pc/customers',
        'products'=>'/api/v2/products',
        'contracts'=>'/api/v2/contracts',
        'common_customers'=>'/api/v2/common_customers',
    );
    //爱客crm账号
    private $ikUser = '18665407882';
    //爱客crm密码
    private $ikPwd = 'zyy24680.';
    //爱客公用参数
    private $ikDevice = 'dingtalk';
    private $ikVersionCode = '3.13.0';

    //钉钉api域名
    private $dtDomain = 'https://oapi.dingtalk.com';
    //钉钉api请求header
    private $dtPostHeader = 'Content-Type: application/json';
    //钉钉CorpID
    private $dtCorpID = 'dinge6712ed2d13c4fa8';
    //钉钉CorpSecret
    private $dtCorpSecret = 'jyR4aJW4kC5DXikSzXDjtPFylKQ838jnUs_9ypzUelPOgKiR7EOf_JZkZ4JBuGix';
    //钉钉api接口地址
    private $dtAPIs = array(
        'access_token' => '/gettoken'
    );

    //操作内容
    //获取钉钉access_token
    private function getDTAccessToken($prefix = 'dingtalk_') {
        $token = S($prefix.'access_token');
        if($token) return $token;
        $params = array('corpid'=>$this->dtCorpID,'corpsecret'=>$this->dtCorpSecret);
        $url = $this->dtDomain.$this->dtAPIs['access_token'].'?'.http_build_query($params);
        $getRes = curlGet($url);
        try{
            $getRes = json_decode($getRes,true);
        }catch(\Exception $e) {
            return false;
        }
        if($getRes['errcode'] !== 0) return false;
        $token = $getRes['access_token'];
        S($prefix.'access_token',$token,$getRes['expires_in'] - 600);
        return $token;
    }

    //获取爱客user_token，测试服从正式服中调用获取
    private function getIKUserToken() {
        $url = 'http://www.mputao.com/putao/Member/ikCrm/TP5GetIKToken';
        $data['name'] = $this->ikUser;
        $data['pwd'] = $this->ikPwd;
        $res = \Curl::CPost($url,$data);
        if($res['code']==1){
            return $res['info'];
        }else{
            return false;
        }
    }

    public function getBrandID($name = '') {
        /*if(empty($name)) return false;
        $url = $this->ikDomain.'/api/v2/custom_fields/customer/by_group';
        $postData = array(
                'device'=>$this->ikDevice,
                'version_code'=>$this->ikVersionCode,
                'user_token'=>$this->getIKUserToken(),
            );
        $url .= '?'.http_build_query($postData);
        $res = curlGet($url);
        $customer = json_decode($res,true);
        if($customer['code'] !== 0) return false;
        $brandArr = '';
        foreach($customer['data']['custom_field_groups'][0]['custom_fields'][3]['input_field_options']['collection_options'] as $ck=>$cv) {
            $brandArr .= "'".$cv['value']."'=>'".$cv['label']."',";
        }
        file_put_contents('./brandArr.txt', count($customer['data']['custom_field_groups'][0]['custom_fields'][3]['input_field_options']['collection_options']).' --- '.$brandArr);
        die;*/
        $brandArr = array('sel_6010'=>'平行进口','sel_0082'=>'凯迪拉克','sel_24c8'=>'一汽马自达','select_ce2ad79d0766'=>'五菱','select_54d354389962'=>'北汽','select_2395a436d827'=>'众泰','select_6e2881c40a6b'=>'吉利','select_196c5554c44e'=>'启辰','select_8d0aa06798bd'=>'奇瑞','select_ecc428600ee2'=>'知豆','select_cf19553bc197'=>'哈弗','select_2d84d16d'=>'别克','select_780de263'=>'长安福特','select_4a3c6f28'=>'一汽丰田','select_9a911155'=>'比亚迪','select_d0f4a58d'=>'Jeep进口','select_527cb659'=>'东风标致','select_254e397a'=>'东风雪铁龙','select_79fcd029'=>'宝马','select_50f78410'=>'现代','select_5017c546'=>'广汽丰田','select_7f352065'=>'广汽传祺','select_05d6f996'=>'长安马自达','select_b294adab'=>'东风日产','select_dbb58878'=>'上海大众','select_0f660687'=>'雪佛兰','select_9daeb7dc'=>'沃尔沃','select_531ca9a5'=>'一汽大众','select_79fcd239'=>'广汽本田','select_63f108823'=>'东风本田','select_19eca74c'=>'奥迪','select_21767f91721a'=>'斯柯达','select_b1d92237'=>'奔驰','select_c4684ddcf00c'=>'外部贷款客户','select_63f10887'=>'菲亚特','select_5664fad47d0f'=>'长安','select_6e567098'=>'东风悦达起亚','select_f59f0ff1'=>'雷克萨斯','select_fb19dca0270f'=>'保时捷','select_605da1d0b279'=>'林肯','select_f61dbec8'=>'奇瑞捷豹路虎','select_1bce52bc1b39'=>'雪铁龙','sel_cd9c'=>'阿尔法・罗密欧','select_26855df8f840'=>'其他');
        $brandID = array_search($name,$brandArr);
        if($brandID === false) {
            $last = end($brandArr);
            $brandID = $last['value'];
        }
        return $brandID;
    }

    public function addIKCustomer($signData = array(),$errlog = true) {
        if(empty($signData)) return false;
        $retry = 0;
        do{
            $retry++;
            $token = $this->getIKUserToken();
        }while(!$token&&$retry<3);
        $url = $this->ikDomain.$this->ikAPIs['customer'];
        $postData = array(
            'device'=>$this->ikDevice,
            'version_code'=>$this->ikVersionCode,
            'user_token'=>$this->getIKUserToken(),
            'customer[name]'=>$signData['name'],
            'customer[user_id]'=>'1892887', //购车客服梁伟棠
            'customer[company_name]'=>empty($signData['company']) ? '' : $signData['company'],
            'customer[category]'=>'10556678',
            'customer[source]'=>empty($signData['source']) ? '11007466' : $signData['source'],
            'customer[address_attributes][phone]'=>$signData['phone'],
            'customer[text_asset_4b74a32b]'=>$this->getBrandID($signData['brand']),
            'customer[text_asset_2f30dee5]'=>$signData['module'],
            'customer[text_asset_8f1d0a14]'=>$signData['loans'] ? 'select_e2e1cfb1' : 'select_331cf85e',
            'customer[datetime_asset_4bc23245]'=>$signData['createtime'] ? date('Y-m-d H:i:s',$signData['createtime']) : date('Y-m-d H:i:s'),
            'customer[text_asset_947fc8]'=>$signData['channel'],
            'customer[note]'=>empty($signData['tips']) ? '' : $signData['tips']
        );
        $getRes = \Curl::CPost($url,$postData,true);
        if($getRes['code'] !== 0&&$errlog) {
            //添加失败记录数据
            Db::table('think_ikcrm_input_log')->insert(array('sid'=>$signData['id'],'errmsg'=>$getRes['message'].'('.$getRes['error'].')','errcode'=>$getRes['code'],'createtime'=>time()));
        }
        return $getRes;
    }

    public function editIKCustomer($cid = 0, $updateData = array(), $sid = 0, $errlog = true) {
        if(empty($updateData)) return false;
        $retry = 0;
        do{
            $retry++;
            $token = $this->getIKUserToken();
        }while(!$token&&$retry<3);
        $url = $this->ikDomain.$this->ikAPIs['customer'].'/'.$cid;
        $postData = array(
            'device'=>$this->ikDevice,
            'version_code'=>$this->ikVersionCode,
            'user_token'=>$this->getIKUserToken()
        );
        $postData = array_merge($postData, $updateData);
        $getRes = \Curl::CPost($url,$postData,true);
        if($getRes['code'] !== 0&&$errlog) {
            //添加失败记录数据
            Db::table('think_ikcrm_input_log')->insert(array('sid'=>$sid,'errmsg'=>$getRes['message'].'('.$getRes['error'].')','errcode'=>$getRes['code'],'createtime'=>time()));
        }
        return $getRes;
    }

    //公海客户转移 1892887-> 堂哥客服手机
    public function transCommonCustomers($cid = 0, $sid = 1892887, $errlog = true) {
        if(empty($cid||$sid)) return false;
        $retry = 0;
        do{
            $retry++;
            $token = $this->getIKUserToken();
        }while(!$token&&$retry<3);
        $url = $this->ikDomain.$this->ikAPIs['common_customers'].'/'.$cid.'/transfer';
        $postData = array(
            'device'=>$this->ikDevice,
            'version_code'=>$this->ikVersionCode,
            'user_token'=>$this->getIKUserToken(),
            'id'=>$cid,
            'user_id'=>$sid,
        );
        $getRes = \Curl::CPost($url,$postData,true);
        if($getRes['code'] !== 0&&$errlog) {
            //添加失败记录数据
            Db::table('think_ikcrm_input_log')->insert(array('sid'=>$sid,'errmsg'=>$getRes['message'].'('.$getRes['error'].')','errcode'=>$getRes['code'],'createtime'=>time()));
        }
        return $getRes;
    }


    public function getIKUser($gid = 0,$num = 10) {
        $getData = array(
            'device'=>$this->ikDevice,
            'version_code'=>$this->ikVersionCode,
            'user_token'=>$this->getIKUserToken(),
            'per_page'=>$num
        );
        if($gid) $getData['department_id'] = $gid;
        $url = $this->ikDomain.$this->ikAPIs['user'].'?'.http_build_query($getData);
        $res = \Curl::get($url);
        try{
            $res = json_decode($res,true);
        }catch(\Exception $e){
            return false;
        }
        if(isset($res['code'])&&$res['code'] !== 0) return false;
        return $res;
    }


    //写跟进
    public function WriteFollow($loggable_id = 0, $content = '', $loggable_type = 'Customer'){
        $getData = array(
            'device'=>$this->ikDevice,
            'version_code'=>$this->ikVersionCode,
            'user_token'=>$this->getIKUserToken(),
        );
        $getData['revisit_log[loggable_id]'] = $loggable_id;
        $getData['revisit_log[content]'] = $content;
        $getData['revisit_log[loggable_type]'] = $loggable_type;
        $url = $this->ikDomain.$this->ikAPIs['wirteFollow'];
        $res = \Curl::CPost($url,$getData,true);
        if(isset($res['code']) && $res['code'] !== 0) return false;
        return $res;
    }

    //查找重复，获取用户
    public function getCustomers($query='',$num=10){
        $getData = array(
            'device'=>$this->ikDevice,
            'version_code'=>$this->ikVersionCode,
            'user_token'=>$this->getIKUserToken(),
            'per_page'=>$num
        );
        if($query) $getData['query'] = $query;
        $url = $this->ikDomain.$this->ikAPIs['customerName'].'?'.http_build_query($getData);
        $res = \Curl::get($url);
        try{
            $res = json_decode($res,true);
        }catch(\Exception $e){
            return false;
        }
        if(isset($res['code'])&&$res['code'] !== 0) return false;
        return $res;
    }

    //获取客户详细信息
    public function getConsumers($id=0,$page='0',$per_page='10',$query = array()){
        $getData = array(
            'device'=>$this->ikDevice,
            'version_code'=>$this->ikVersionCode,
            'user_token'=>$this->getIKUserToken(),
            'page'=>$page,
            'per_page'=>$per_page
        );
        if(!empty($query)) $getData = array_merge($getData, $query);
        if($id){
            $url = $this->ikDomain.$this->ikAPIs['customer'].'/'.$id.'?'.http_build_query($getData);
        }else{
            $url = $this->ikDomain.$this->ikAPIs['customer'].'?'.http_build_query($getData);
        }
        $res = \Curl::get($url);
        try{
            $res = json_decode($res,true);
        }catch(\Exception $e){
            return false;
        }
        if(isset($res['code'])&&$res['code'] !== 0) return false;
        return $res;
    }

    //获取客户车辆订单信息
    public function getCar($name=''){
        $getData = array(
            'device'=>$this->ikDevice,
            'version_code'=>$this->ikVersionCode,
            'user_token'=>$this->getIKUserToken(),
            'order'=>'name desc'
        );
        if($name) $getData['query'] = $name;
        $url = $this->ikDomain.$this->ikAPIs['products'].'?'.http_build_query($getData);
        $res = \Curl::get($url);
        try{
            $res = json_decode($res,true);
        }catch(\Exception $e){
            return false;
        }
        if(isset($res['code'])&&$res['code'] !== 0) return false;
        return $res;
    }

    //通用获取数据方法
    public function commonGetData($api = '',$addition = '',$query = array()){
        $getData = array(
            'device'=>$this->ikDevice,
            'version_code'=>$this->ikVersionCode,
            'user_token'=>$this->getIKUserToken()
        );
        if(empty($api)) return false;
        elseif(!empty($query)) $getData = array_merge($getData,$query);
        $url = $this->ikDomain.$this->ikAPIs[$api].$addition.'?'.http_build_query($getData);
        $res = \Curl::get($url);
        try{
            $res = json_decode($res,true);
        }catch(\Exception $e){
            return false;
        }
        if(isset($res['code'])&&$res['code'] !== 0) return false;
        return $res;
    }
}