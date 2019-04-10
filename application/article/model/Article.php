<?php
namespace app\article\model;

use app\common\model\Base;
use think\Db;

class Article extends Base
{

    protected $insert = ['article_createtime','uid'];
    protected $update = ['article_updatetime'];

    protected function setArticleCreatetimeAttr()
    {
        return time();
    }
    protected function setUidAttr()
    {
        return session('user.id');
    }

    protected function setArticleUpdatetimeAttr()
    {
        return time();
    }

    public function addArticle($data){
        $this->startTrans();
        try{
            $this->allowField(true)->isUpdate(false)->save($data);
            $id = $this->getLastInsID();
            if(!empty($data['position'])){
                $position = [];
                foreach ((array)$data['position'] as $v){
                    $temp = [];
                    $temp['pid'] = $v;
                    $temp['cid'] = $id;
                    $temp['type'] = 1;
                    $position[] = $temp;
                }
                Db::name('position_access')->insertAll($position);
            }
            $content['aid'] = $id;
            $content['article_content'] = $data['article_content'];
            Db::name('article_data')->insert($content);
            $this->commit();
            return true;
        }catch (\Exception $e){
            $this->rollback();
            return false;
        }
    }

    public function editArticle($data){
        $this->startTrans();
        try{
            $this->allowField(true)->isUpdate(true)->save($data);
            if(!empty($data['position'])){
                $position = [];
                $where = [];
                $where[] = ['cid', '=', $data['id']];
                $where[] = ['type', '=', 1];
                $list = Db::name('position_access')->where($where)->field('pid,id')->select();
                $pid = [];
                $delete = [];
                foreach ($list as $vl){
                    $pid[] = $vl['pid'];
                    if(!in_array($vl['pid'], (array)$data['position'])){
                        $delete[] = $vl['id'];
                    }
                }
                foreach ((array)$data['position'] as $v){
                    if(empty($pid) || !in_array($v, $pid)){
                        $temp = [];
                        $temp['pid'] = $v;
                        $temp['type'] = 1;
                        $temp['cid'] = $data['id'];
                        $position[] = $temp;
                    }
                }
                if(!empty($position)){
                    Db::name('position_access')->insertAll($position);
                }
                if(!empty($delete)){
                    Db::name('position_access')->where([['id', 'in', $delete], ['type', '=', 1]])->delete();
                }
            }else{
                Db::name('position_access')->where([['cid', '=', $data['id']], ['type', '=', 1]])->delete();
            }
            if(!empty($data['article_content'])){
                $content['article_content'] = $data['article_content'];
                Db::name('article_data')->where('aid', $data['id'])->update($content);
            }
            $this->commit();
            return true;
        }catch (\Exception $e){
            $this->rollback();
            return false;
        }
    }

    public function getArticle($where){
        return $this->alias('a')->join('article_data d', 'a.id=d.aid', 'left')->where($where)->field('a.*,d.article_content')->find();
    }


    public function deleteArticle($id){
        $this->startTrans();
        try{
            $this->where('id', $id)->delete();
            $where = [];
            $where[] = ['cid', '=', $id];
            $where[] = ['type', '=', 1];
            Db::name('position_access')->where($where)->delete();
            Db::name('article_data')->where('aid', $id)->delete();
            $this->commit();
            return true;
        }catch (\Exception $e){
            $this->rollback();
            return false;
        }
    }

    public function articleList($where){
        $field = ['a.id', 'a.pid', 'a.article_title', 'a.article_status', 'a.article_createtime', 'a.istop', 'a.article_icon', 'a.browser_count', 'a.article_sort','c.column_title'];
        return $this->alias('a')->join('article_column c', 'a.pid=c.id')->where($where)->order('article_sort desc')->field($field)->paginate(30);
    }
}
