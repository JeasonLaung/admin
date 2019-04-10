<?php 

namespace app\api\controller;
// use app\common\controller\Base;
use app\common\model\File as FileModel;

// class Upload extends Base
class Upload extends \think\Controller
{
	/*
	 * 针对单个文件
	 */
	public function upload(FileModel $FileModel)
	{
		checkLogin();
		// return json(['a'=>1]);
		$file = $this->request->file('file');
		if (empty($file)) {
			return json(['error'=>400,'msg'=>'empty file']);
		}
		// halt();
		$hash = $file->md5();
		//先找数据库有没有
		$path = $FileModel->where(['hash'=>$hash])->value('path');

		//存在直接返回
		if(!empty($path)){
			return json(['path'=>$path]);
		}

		//不存在,插入并返回
        $info = $file
        ->validate(['size'=>1024*1024*5,'ext'=>'jpg,png,ico,gif,jpeg,pdf,xlsx,xls'])
        ->move('./upload');
        if($info){
        	// $path = '/upload/images/'. date('Ymd') . '/' .  $info->getFilename();
        	$path = '/upload/'. date('Ymd') . '/' .  $info->getFilename();
        	//存入数据库
        	$data = ['create_time'=>time(),'hash'=>$hash,'path'=>$path,'user_id'=>request()->uid];
        	$FileModel->insert($data);

        	return json(['path'=>$path]);
   		}
   		else{
   			return json(['error'=>1,'msg'=> $file->getError()]);
   		}
		// if($info){
	 //        // 成功上传后 获取上传信息
	 //        // 输出 jpg
	 //        echo $info->getExtension();
	 //        // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
	 //        echo $info->getSaveName();
	 //        // 输出 42a79759f284b767dfcb2a0197904287.jpg
	 //        echo $info->getFilename(); 
	 //    }else{
	 //        // 上传失败获取错误信息
	 //        echo $file->getError();
	 //    }
	}
	// public function delete($name='')
	// {
	// 	// halt(__FILE__);
	// 	if (preg_match('/\.\./', $name)) {
	// 		return '^-^';
	// 	}
	// 	if (!preg_match('/^\/upload\/image/', $name)) {
	// 		return '^-^';
	// 	}
	// 	$name = stripslashes($name);
	// 	// echo '.\upload\images\20190325\ec0266660eba85c585fa052d9d304493';
	// 	return json(['status'=>@unlink('./'.$name)]);
	// }
}