<?php 
namespace app\purchase\controller;
use \Firebase\JWT\JWT;
use EasyWeChat\Factory;

/**
 * 
 */
class Test extends \think\Controller
{
	
	public function index()	
  {
    // $formId = input('formId');
    // dump($formId);
    $app = Factory::miniProgram(config('easy_wechat'));
    // $app = Factory::officialAccount($config);
    // $access_token = $app->access_token()->getToken();

    $res = $app->template_message->send([
        'touser' => 'oJ-sB5Rh4LjNtbIOveNsAbKZq8KI',
        'template_id' => 'iXD2DFD2wJ9LT7_ghEFgaGJaXN6sMxW4y28c0l-UqTM',
        'form_id' => "8c13cc4a3f5b4945bfd46c177a481f38",
        'data' => [
            'keyword1' => '车辆',
            'keyword2' => '报价人',
        ],
    ]);
    halt($res);

		// $payload = [
		// 	'uid' => 1,
  //           //开始时间
  //           "iat" => $_SERVER['REQUEST_TIME'],
  //           //一天过期
  //           "exp" => $_SERVER['REQUEST_TIME'] + 86400,
  //       ];
		// return $jwt = JWT::encode($payload, PRIVATE_KEY, 'RS256');
		// $payload = [
		// 	'uid' => 1,
  //           //开始时间
  //           "iat" => $_SERVER['REQUEST_TIME'],
  //           //一天过期
  //           "exp" => $_SERVER['REQUEST_TIME'] + 86400,
  //       ];
		// $jwt = JWT::encode($payload, PRIVATE_KEY, 'RS256');
  //       return json(['status'=>1])->header([SIGN_NAME=>$jwt])->send();
	}


  /**
   * @param  String  $table   表名
   * @param  String  $field   字段名
   * @param  String  $indexs  索引数组
   * @return String  图片路径数组
   * @param  String  $name   上传参数名
   */
  public static function upload($config=[])
  {
    //判断
    $files = request()->file($upload_name);
    if (!$files) {
      json(['status'=>0,'msg'=>'找不到上传文件']);
    }




    //表名
    $table = @$config['table'] ? $config['table'] : '';
    //字段
    $field = @$config['field'] ? $config['field'] : '';
    //id
    $id = @$config['id'] ? $config['id'] : '';
    //上传图片路径id集
    $indexs = @$config['indexs'] ? $config['indexs'] : '';
    //上传图片路径集
    $olds = @$config['olds'] ? $config['olds'] : '';
    //之前的路径名
    $old_name = @$config['old_name'] ? $config['old_name'] : 'photos';

    if ($table) {
      $old = [];
      $res = \think\Db::table($table)->where(['id'=>$id])->value($field);
      $res = explode(',', $res);
      $indexs = explode(',', request()->param($old_name));
      if ($olds) {
        foreach ($res as $item) { 
          if (in_array($item, $olds)) {
            $old[] = $item;
          }
          else{
            @unlink('.'.$res[$i]);
          }
        }
      }
      else {
        for ($i=0; $i < count($res); $i++) { 
          if (@in_array($i, $indexs)) {
            $old[] = $res[$i];
          }
          else{
            @unlink('.'.$res[$i]);
          }
        }
      }
      
    }


    //上传位置
    $save_path = @$config['save_path'] ? $config['save_path'] : './upload/images/';
    //上传大小
    $size = @$config['size'] ? $config['size']: 1024*1024*2;
    //上传的参数名
    $upload_name = @$config['upload_name'] ? $config['upload_name']: 'uploads';
    // 后缀名
    $ext = @$config['ext'] ? $config['ext'] : 'jpg,png,gif,ico,jpeg,pdf,xlsx,xls';



    if (!is_array($files)) {
      //单个文件
      $info = $files
        ->validate(['size'=>$size,'ext'=>$ext])
        ->move($save_path);
        if($info){
          return $save_path. date('Ymd') . '/' .  $info->getFilename();
        }
        else{
          return '';
        }
    }
    else {
      //多文件
      $tmp = [];
      foreach ($files as $file) {
        $info = $file
        ->validate(['size'=>$size,'ext'=>$ext])
        ->move($save_path);
        if($info){
          $tmp[] = substr($save_path,1). date('Ymd') . '/' .  $info->getFilename();
        }
      }
      return isset($old) ? array_merge($old,$tmp) : $tmp;
    }







    // $_name = $this->request->param('_name');
    // $file = $this->request->file('file');
    //     $info = $file
    //     ->validate(['size'=>15678,'ext'=>'jpg,png,gif,jpeg,pdf,xlsx,xls'])
    //     ->move('./upload/images');
    //     if($info){
    //       return json(['path'=>'/upload/images/'. date('Ymd') . '/' .  $info->getFilename(),'_name'=>$_name]);
    //   }
    //   else{
    //     return json(['error'=>1,'msg'=>$file->getError(),'_name'=>$_name]);
    //   }
    // halt($_FILES);


    // $files = $this->request->file('uploads');
    // // $res = $files->validate(['size'=>15678,'ext'=>'jpg,png,gif,jpeg,pdf,xlsx,xls']);
    // // $file = $_FILES;
    // // halt($files);

    // $photos = explode(',',$this->request->param('photos'));

    // //检验路径不能存在异常
    // foreach ($photos as $photo) {
      
    // }

    // // halt($photos);
    // $uploads = [];
    // foreach ($files as $file) {
    //   $info = $file->move('./upload/images');
    //   if ($info) {
    //     $uploads[] = '/upload/images/'. date('Ymd') . '/' .  $info->getFilename();
    //   }
    // }

    // return json(array_merge($photos,$uploads));
  }
}

