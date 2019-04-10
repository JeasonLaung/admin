<?php
namespace app\article\controller;

use app\common\controller\Base;
use app\common\controller\Index as CommonIndex;


class Index extends Base
{


    /*
     * 上传图片
     * */
    public function uploadImg(){
        $type = config('upload_config');
        switch ($type){
            case 1:
                $result = CommonIndex::uploadOnline($this->request->param());
                if($result){
                    $res['error'] = 0;
                    $res['url'] = 'http:' . $result['url'];
                }else{
                    $res['error'] = 1;
                    $res['message'] = '上传错误';
                }
                echo json_encode($res);die;
                break;
            case 0:
            default:
                $result = CommonIndex::uploadLocal($this->request->file('imgFile'));
                if($result){
                    $this->result($result,0,'图片上传成功');
                }else{
                    $this->result('',1,'图片上传出错');
                }
        }
    }
}
