<?php
namespace app\article\controller;

use app\common\controller\Base;
use app\article\model\Article as ArticleModel;
use app\article\validate\Article as ArticleValidate;
use app\article\model\Position;
use app\article\model\PositionAccess;
use app\common\model\Tree;
use app\article\model\ArticleColumn;
use app\common\controller\Index;

class Article extends Base
{

    /*
     * 文章栏目列表
     * */
    public function index(ArticleModel $article, ArticleColumn $column, Tree $tree)
    {
        $keyword = $this->request->get('search_key');
        $pid = $this->request->get('pid', 0);
        $where = [];
        if(!empty($keyword)){
            $where[] = ['a.article_title|a.article_subtitle','like','%'.$keyword.'%'];
        }
        if(!empty($pid)){
            $where[] = ['a.pid', '=', $pid];
        }

        $tree_data = array();
        $list = $column->selectData([['type', '=', 1]], ['id','pid', 'column_title'], 'id asc')->toArray();
        foreach ($list as $key => $value) {
            $tree_data[$value['id']] =$value;
        }
        $str = "<option value='\$id' \$selected>\$spacer \$column_title</option>";
        $tree->init($tree_data);
        $selectCategory = $tree->get_tree(0, $str, $pid);
        $this->assign('option', $selectCategory);

        $list = $article->articleList($where);
        $list->appends($this->request->param());
        $this->assign('list', $list);
        $this->assign('search_key', $keyword);
        $this->assign('pid', $pid);
        return $this->fetch('index');
    }

    /*
     * 发布文章
     * */
    public function addArticle(ArticleModel $article, ArticleColumn $column, Tree $tree, Position $position){
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $validate = new ArticleValidate;
            if (!$validate->check($data)) {
                $this->result('', 1, $validate->getError());
            }
            if($article->addArticle($data)){
                $this->result('', 0, '添加成功');
            }else{
                $this->result('', 1, '添加失败');
            }
        }
        $tree_data = array();
        $list = $column->selectData([['type', '=', 1]], ['id','pid', 'column_title'], 'id asc')->toArray();
        foreach ($list as $key => $value) {
            $tree_data[$value['id']] =$value;
        }
        $str = "<option value='\$id' \$selected>\$spacer \$column_title</option>";
        $tree->init($tree_data);
        $selectCategory = $tree->get_tree(0, $str);
        $this->assign('option', $selectCategory);

        $where[] = ['position_status', '=', 0];
        $field = ['id', 'position_name'];
        $this->assign('position', $position->selectData($where, $field, 'position_sort desc')->toArray());
        return $this->fetch('add_article');
    }


    /*
     * 编辑文章
     * */
    public function editArticle(ArticleModel $article, ArticleColumn $column, Tree $tree, Position $position){
        $id = intval($this->request->param('id'));
        if(empty($id)){
            if(!$this->request->isAjax()){
                $this->error('参数错误',null,"",2);
            }else{
                $this->result('', 1, '参数错误');
            }
        }
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $validate = new ArticleValidate;
            if (!$validate->check($data)) {
                $this->result('', 1, $validate->getError());
            }
            if($article->editArticle($data)){
                $this->result('', 0, '编辑成功');
            }else{
                $this->result('', 1, '编辑失败');
            }
        }
        $tree_data = array();
        $list = $column->selectData([['type', '=', 1]], ['id','pid', 'column_title'], 'id asc')->toArray();
        foreach ($list as $key => $value) {
            $tree_data[$value['id']] =$value;
        }
        $str = "<option value='\$id' \$selected>\$spacer \$column_title</option>";
        $tree->init($tree_data);

        $info = $article->getArticle([["a.id", '=', $id]]);
        $this->assign('info', $info);
        $selectCategory = $tree->get_tree(0, $str, $info['pid']);
        $this->assign('option', $selectCategory);

        $access = new PositionAccess();
        $this->assign('access', $access->sgetAccess([['cid', '=', $id], ['type', '=', 1]]));
        $where[] = ['position_status', '=', 0];
        $field = ['id', 'position_name'];
        $this->assign('position', $position->selectData($where, $field, 'position_sort desc')->toArray());
        return $this->fetch('edit_article');
    }


    public function deleteArticle(ArticleModel $article){
        if ($this->request->isPost()) {
            $id = $this->request->param("id", 0, 'intval');
            if(empty($id)){
                $this->result('', 1, '参数错误!');
            }
            if ($article->deleteArticle($id)) {
                $this->result('', 0, '删除成功!');
            } else {
                $this->result('', 1, '删除失败!');
            }
        }
    }

    public function uploadImg(){
        $type = config('upload_config');
        switch ($type){
            case 1:
                $result = Index::uploadOnline($this->request->param());
                break;
            case 0:
            default:
            $result = Index::uploadLocal($this->request->file('imgFile'));
        }
        if($result){
            $res['error'] = 0;
            $res['url'] = 'http:' . $result['url'];
        }else{
            $res['error'] = 1;
            $res['message'] = '上传错误';
        }
        echo json_encode($res);die;
    }
}
