<?php 
class Curl
{
    /**
     * @param $url
     * @return bool|mixed
     */
    static public function get($url){
        $oCurl = curl_init();
        if(stripos($url,"https://")!==FALSE){
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, FALSE);
            curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
        }
        curl_setopt($oCurl, CURLOPT_URL, $url);
        curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1 );
        $sContent = curl_exec($oCurl);
        $aStatus = curl_getinfo($oCurl);
        curl_close($oCurl);
        if(intval($aStatus["http_code"])==200){
            return $sContent;
        }else{
            return false;
        }
    }

    /**
     * @param $url
     * @return bool|mixed
     */
    static public function getXml($url){
        $oCurl = curl_init();
        if(stripos($url,"https://")!==FALSE){
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, FALSE);
            curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
        }
        curl_setopt($oCurl, CURLOPT_URL, $url);
        curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1 );
        $sContent = curl_exec($oCurl);
        $aStatus = curl_getinfo($oCurl);
        curl_close($oCurl);
        $xml = simplexml_load_string($sContent);
        if($xml){
            return $xml;
        }else{
            return false;
        }


    }
    /**
     * POST 请求
     * @param string $url
     * @param array $param
     * @param boolean $post_file 是否文件上传
     * @return string content
     */
    static public function post($url,$param,$post_file=false,$header=false){
        $oCurl = curl_init();
        if(stripos($url,"https://")!==FALSE){
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
        }
        // if (is_string($param) || $post_file) {
        //     $strPOST = $param;
        // } else{
        //     $aPOST = array();
        //     foreach($param as $key=>$val){
        //         $aPOST[] = $key."=".urlencode($val);
        //     }
        //     $strPOST =  join("&", $aPOST);
        // }

        if (is_array($param)) {
            $param = http_build_query($param);
        }
        curl_setopt($oCurl, CURLOPT_URL, $url);
        curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1 );
        curl_setopt($oCurl, CURLOPT_POST,true);
        curl_setopt($oCurl, CURLOPT_POSTFIELDS,$param);
        if($header){
            $headers = array( 
                "POST ".$page." HTTP/1.0", 
                "Content-type: text/xml;charset=\"utf-8\"", 
                "Accept: text/xml", 
                "Cache-Control: no-cache", 
                "Pragma: no-cache", 
                "SOAPAction: \"run\"", 
                "Content-length: ".strlen($xml_data), 
                "Authorization: Basic " . base64_encode($credentials) 
            ); 
            curl_setopt($oCurl, CURLOPT_HTTPHEADER, $headers);
        }
        $sContent = curl_exec($oCurl);
        $aStatus = curl_getinfo($oCurl);
        curl_close($oCurl);
        // dump(json_decode($sContent));
        if(intval($aStatus["http_code"])==200){
            return $sContent;
        }else{
            return false;
        }
    }


    /**
     * POST 请求
     * @param string $url
     * @param array $post_data
     * @param boolean $type 参数是否http_build_query编译
     * @param array $headers 请求的文件头
     * @param boolean $jsonreturn 是否返回json
     * @return array content
     */
    static public function CPost($url,$post_data,$type=false,$headers=array(),$jsonreturn=true){
        //初始化
        $curl = curl_init();
        //设置抓取的url
        curl_setopt($curl, CURLOPT_URL, $url);
        //设置头文件的信息作为数据流输出
        curl_setopt($curl, CURLINFO_HEADER_OUT, false);
        //设置获取的信息以文件流的形式返回，而不是直接输出。
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_HEADER, false);
        if(!empty($headers)){
            curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
        }
        //设置post方式提交
        curl_setopt($curl, CURLOPT_POST, 1);
        //传参
        if(!$type){
            curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($post_data));
        }else{
            curl_setopt($curl, CURLOPT_POSTFIELDS, $post_data);
        }
        //执行命令
        $data = curl_exec($curl);
        //获得返回的数据
        if($jsonreturn) $data = json_decode($data,true);

        //关闭URL请求
        curl_close($curl);
        return $data;
    }


    static public function getCurlFileMedia($file_path){
        if (class_exists('\CURLFile')) {// 这里用特性检测判断php版本
            $data =  new \CURLFile($file_path,"","");//>=5.5
        } else {
            $data =  '@' . $file_path;//<=5.5
        }
        return $data;

    }
    static public function  curlFile($url,$data){
// 兼容性写法参考示例
        $curl = curl_init();
        if (class_exists('\CURLFile')) {// 这里用特性检测判断php版本
            curl_setopt($curl, CURLOPT_SAFE_UPLOAD, true);

        } else {
            if (defined('CURLOPT_SAFE_UPLOAD')) {
                curl_setopt($curl, CURLOPT_SAFE_UPLOAD, false);
            }
        }
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_POST, 1 );
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_USERAGENT,"TEST");
        $result = curl_exec($curl);
    //    $error = curl_error($curl);
        $status = curl_getinfo($curl);
        curl_close($curl);
        if(intval($status["http_code"])==200){
            return $result;
        }else{
            return false;
        }



    }


    /**
     * 生成安全JSON数据
     * @param array $array
     * @return string
     */
    static public function jsonEncode($array)
    {
        return preg_replace_callback('/\\\\u([0-9a-f]{4})/i', create_function('$matches', 'return mb_convert_encoding(pack("H*", $matches[1]), "UTF-8", "UCS-2BE");'), json_encode($array));
    }

    static public function  curlDownload($url, $dir)
    {
        $ch = curl_init($url);
        $fp = fopen($dir, "wb");
        curl_setopt($ch, CURLOPT_FILE, $fp);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        $res = curl_exec($ch);
        curl_close($ch);
        fclose($fp);
        return $res;
    }
}