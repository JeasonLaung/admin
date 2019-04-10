<?php 
/**
 * 
 */
class Upload
{
  
  /**
   * @param  String  table   表名
   * @param  String  field   字段名
   * @param  String  id      对应id
   *
   * @param  Array   orgin   直接放数据库里面的数组 优先级小于 table
   *
   * @param  String  old_name  上传参数名默认photos
   * @param  String  upload_name  上传参数名默认uploads
   * @param  String  save_path  保存路径
   * @param  Array  indexs  索引数组
   * @param  Array  olds  路径数组
   * @param  String  size  限制大小
   * @param  String  ext  限制后缀名
   * @return String  图片路径数组
   */
  public static function image($config=[])
  {
    //上传的参数名
    $upload_name = @$config['upload_name'] ? $config['upload_name']: 'uploads';
    //判断
    $files = request()->file($upload_name);
    // halt($files==null);
    if (empty($files)) {
      return [];
      // json(['status'=>0,'msg'=>'找不到上传文件'])->send();
      // exit();
    }




    //表名
    // $table = @$config['table'] ? $config['table'] : '';
    //字段
    // $field = @$config['field'] ? $config['field'] : '';
    //id
    // $id = @$config['id'] ? $config['id'] : '';
    //上传图片路径id集
    // $indexs = @$config['indexs'] ? $config['indexs'] : '';
    //上传图片路径集
    // $olds = @$config['olds'] ? $config['olds'] : '';

    $orgin = @$config['orgin'] ? $config['orgin'] : [];

    //之前的路径名
    $old_name = @$config['old_name'] ? $config['old_name'] : 'photos';

    // if ($table) {
    //   $old = [];
    //   $res = \think\Db::table($table)->where(['id'=>$id])->value($field);
    //   $res = explode(',', $res);
    //   // $indexs = explode(',', request()->param($old_name));
    //   if ($olds) {
    //     foreach ($res as $item) { 
    //       if (in_array($item, $olds)) {
    //         $old[] = $item;
    //       }
    //       else{
    //         @unlink('.'.$res[$i]);
    //       }
    //     }
    //   }
    //   else {
    //     for ($i=0; $i < count($res); $i++) { 
    //       if (@in_array($i, $indexs)) {
    //         $old[] = $res[$i];
    //       }
    //       else{
    //         @unlink('.'.$res[$i]);
    //       }
    //     }
    //   }
      
    // }
    if ($orgin) {
      $olds = explode(',', request()->param($old_name));

      if (is_array($orgin)) {
        $res = $orgin;
      }
      else {
        $res = explode(',', $orgin);
      }
      foreach ($res as $item) { 
        if (in_array($item, $olds)) {
          $old[] = $item;
        }
        else{
          @unlink('.'.$item);
        }
      }
    }



    //上传位置
    $save_path = @$config['save_path'] ? $config['save_path'] : './upload/images/';
    //上传大小
    $size = @$config['size'] ? $config['size']: 1024*1024*2;
    
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
  }
}