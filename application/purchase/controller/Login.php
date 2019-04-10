<?php 
namespace app\purchase\controller;
use \Firebase\JWT\JWT;
use app\purchase\model\User as UserModel;
use app\purchase\model\UserRelation;
use EasyWeChat\Factory;

class Login extends \think\Controller
{
	// const AppId     = 'wxc25ad882a0959830';
    // const AppSecret = 'd5865f5aabc7ee01f764f10f22e48172';
    // 获取小程序openid和unionid
    const code2Session = 'https://api.weixin.qq.com/sns/jscode2session?appid=%s&secret=%s&js_code=%s&grant_type=authorization_code';

    protected $session_key;

    protected function decode($encryptedData,$iv)
    {
        $session = request()->header('X-Putao-Session');;
        $app = Factory::miniProgram(config('easy_wechat'));
        $decryptedData = $app->encryptor->decryptData($session, $iv, $encryptedData);
        return $decryptedData;
    }


    public function get_phone($encryptedData,$iv)
    {
        $de = $this->decode($encryptedData,$iv);
        $phone = $de['phoneNumber'];
        if ($phone) {
            return success($phone);
        }
        else{
            return error('获取手机失败');
        }
    }

    public function register_by_phone($phone,$encryptedData,$iv,UserRelation $UserRelation,UserModel $User)
    {
        $payload = [
            // 'uid'=>$res['id'],
            //开始时间
            "iat" => $_SERVER['REQUEST_TIME'],
            //一天过期
            "exp" => $_SERVER['REQUEST_TIME'] + 86400,
        ];

        //此时获取的加密数据为userinfo的
        $user_info = $this->decode($encryptedData,$iv);
         /*更改*/
        $openid = $user_info['openId'];
       /**/

       /*终极目标未手机*/

      $user = $User
        ->field('id')
        ->where(['phone'=>$phone])
        ->find();

      // 存在用户
        if (!empty($user)) {
            // 直接返回签名
            $payload['uid'] = $user['id'];
            //存unionid
            $res = $User
            ->where('id',$user['id'])
            ->data(['wxunionid'=>$openid])
            ->update();

            // 然后插入user_relation
            $res = $UserRelation->insert([
                'user_id'=>$user['id'], //默认为普通用户组
            ],true); 

            // 成功返回一个用户头
            if ($res) {
                $jwt = JWT::encode($payload, PRIVATE_KEY, 'RS256');
                return json(['status'=>1])->header([SIGN_NAME=>$jwt])->send();
            }
            else{
                return error('register 1,注册失败');
            }
        }
        else {
            // 不存在整条数据插入
            $data = ['phone'=>$phone,'wxunionid'=>$openid,'nickname' => $user_info['nickName'],'name' => $user_info['nickName']];
            
            $uid = $User->insertGetId($data);

            // 再插入用户关联表
            $res1 = $UserRelation->insert([
                'user_id'=>$uid//默认为10,指向普通用户组
            ],true); 

            if ($uid) {
                //返回签名
                $payload['uid'] = $uid;
                
                $jwt = JWT::encode($payload, PRIVATE_KEY, 'RS256');
                return json(['status'=>1])->header([SIGN_NAME=>$jwt])->send();
            }
            else{
                return error('register 2,注册失败');
            }

        }







        
        // $session_arr = \Curl::get(sprintf(self::code2Session,config('APP_ID'),config('APP_SECRET'),$code));
        // $session = @json_decode($session_arr,true)['session_key'];
        // $session = (request()->header())['X-Putao-Session'];

        // $app = Factory::miniProgram(config('easy_wechat'));
        // $decryptedData = $app->encryptor->decryptData($session, $iv, $encryptedData);
        // halt($decryptedData);
    }


    public function info(UserModel $User)
    {

        // $uid = getUserId();
        $uid = getUserId();
        if (empty($uid)) {
            //不存在用户返回需要登陆信息
            return error('还没登录',999);
        }
        // $uid = request()->uid;
        $user = $User
        ->alias('u')
        ->field('u.phone,u.name,u.nickname,c.company_name,c.id as company_id,u.id,c.group_id as role,ur.is_admin')
        ->join('purchase_user_relation ur', 'ur.user_id = u.id')
        ->join('purchase_company c', 'c.id = ur.company_id','LEFT')
        ->where('u.id',$uid)
        ->find();
        if (empty($user)) {
            return error('请先注册或登录');
        }
        else {
            if (empty($user['role'])) {
                $user['role'] = 10;
            }
            return success($user);
        }
    }

    // 每次用户打开小程序都会重新登录
	public function login($code,UserModel $User)
	{
		$payload = [
            // 'uid'=>$res['id'],
            //开始时间
            "iat" => $_SERVER['REQUEST_TIME'],
            //一天过期
            "exp" => $_SERVER['REQUEST_TIME'] + 86400,
        ];
        $openid = $this->getOpenId($code);
		$user = $User
        ->alias('u')
		->field('id')
        ->join('purchase_user_relation','user_id = u.id')
		->where(['wxunionid'=>$openid])
		->find();
		if (empty($user)) {
			//不存在用户返回需要登陆信息
			return json(['msg'=>'还没注册','code'=>998,'status'=>0])->header(['X-Putao-Session'=>$this->session_key])->send();
		}

        $payload['uid'] = $user['id'];

		//成功
		$jwt = JWT::encode($payload, PRIVATE_KEY, 'RS256');
        return json(['status'=>1])->header([SIGN_NAME=>$jwt,'X-Putao-Session'=>$this->session_key])->send();
	}

	// 发送验证码
	public function captcha(UserModel $User)
    {

        $data = $this->request->only('phone','POST');
        $phone = @$data['phone'];
        // 需要添加异常多次发送短信
        $res = preg_match('/^1[3-9]\d{9}$/', $phone);
        if(true != $res){
            //  验证失败输出错误信息
            return error('手机号不正确');
        }

        // $openid = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE1NTM2MDY5ODMsImV4cCI6MTU1MzY5MzM4MywidWlkIjoxNzA3M30.GuiOCfWAbEnfM7l6Ug9SwZhoZubijfkwqVplEqQa6tJqaB7nnjFqGktQ3ms0GMnGZuYooOLSOEnJcRJRDzOQLj_1ebzX0IwOt23EVZ-3itQ32sc--HR1R0dY2nUmiiMvmJYtRSIeBX0MmvrmGO10q49KFZoK3pGgxIDdGNll88w';

        $res = \TXSms::send($phone);

        if($res['result'] !== 0){
            // 失败
            return error('发送失败');
        }
        else{
            return success('','发送成功');
        }
    }

    //注册/手机登录
	public function register($phone,$captcha,$code='',$nickname='',UserModel $User,UserRelation $UserRelation)
	{
		if(!\TXSms::checkCaptcha($phone,$captcha)){
			return error('验证码错误');
		}

		$payload = [
            // 'uid'=>$res['id'],
            //开始时间
            "iat" => $_SERVER['REQUEST_TIME'],
            //一天过期
            "exp" => $_SERVER['REQUEST_TIME'] + 86400,
        ];
		$openid = $this->getOpenId($code);
     // $openid = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE1NTM2MDY5ODMsImV4cCI6MTU1MzY5MzM4MywidWlkIjoxNzA3M30.GuiOCfWAbEnfM7l6Ug9SwZhoZubijfkwqVplEqQa6tJqaB7nnjFqGktQ3ms0GMnGZuYooOLSOEnJcRJRDzOQLj_1ebzX0IwOt23EVZ-3itQ32sc--HR1R0dY2nUmiiMvmJYtRSIeBX0MmvrmGO10q49KFZoK3pGgxIDdGNll88w';   // 
     // 
		$user = $User
		->field('id')
		->where(['phone'=>$phone])
		->whereOr(['wxunionid'=>$openid])
		->find();

		// 存在用户
		if (!empty($user)) {
			// 直接返回签名
			$payload['uid'] = $user['id'];
			//存unionid
			$res = $User
            ->where('id',$user['id'])
            ->data(['wxunionid'=>$openid])
            ->update();
            // 然后插入group
            $res = $UserRelation->insert([
                'user_id'=>$user['id'], //默认为普通用户组
            ],true); 

			if ($res) {
				$jwt = JWT::encode($payload, PRIVATE_KEY, 'RS256');
            	return json(['status'=>1])->header([SIGN_NAME=>$jwt])->send();
			}
			else{
				return error('register 1');
			}
        }
        else {
        	// 不存在整条数据插入
        	$data = ['phone'=>$phone,'wxunionid'=>$openid,'nickname' => @$user_info['nickName']];
        	
			$uid = $User->insertGetId($data);

            // 再插入用户关联表
            $res1 = $UserRelation->insert([
                'user_id'=>$uid//默认为10,指向普通用户组
            ],true); 

			if ($uid) {
                //返回签名
                $payload['uid'] = $uid;
                
				$jwt = JWT::encode($payload, PRIVATE_KEY, 'RS256');
				return json(['status'=>1])->header([SIGN_NAME=>$jwt])->send();
			}
			else{
				return error('register 2');
			}

        }

	}

	//获取openid获取unionid
    private function getOpenId($code){
        $api = sprintf(self::code2Session ,config('APP_ID'),config('APP_SECRET'), $code);
        
        //获取到openid和session_key
        $res = \Curl::get($api);
        $res = json_decode($res,true);
        // dump($res);
        // 提取openid
        $openid = @$res['openid'];
        $this->session_key = @$res['session_key'];

        // 没有openid的情况
        if(!$openid){
            return error('无法获取openid',500);
        }
        
        //获取openid成功返回
        return $openid;
    }
}