<?php 
namespace app\purchase\controller;
use app\purchase\model\Imported as ImportedModel;
/**
 * 
 */
class Imported extends Base
{
	// 相关推荐车源
    public function recommond()
    {
        
    }

	public function my(ImportedModel $Imported)
	{
		$uid = request()->uid;

		$res = $Imported
		->alias('i')
		->field('i.*,b.name as brand_name,b.img')
		->join('think_sign_brands b','b.id = i.brand_id','LEFT')
		->order('id desc')
		->where(['i.user_id'=>$uid,'i.status'=>1,'i.is_delete'=>0])
		->select();

		return success($res);

		// if ($key_word) {
		// 	$Sql = $Sql->where('b.name|c.company_name|i.car_name','like','%'.$key_word.'%');
		// }
		// if ($brand_id) {
		// 	$Sql = $Sql->where('b.id',$brand_id);
		// }
		// return success($Sql
		// 	->order('i.id desc')
		// 	->where(['i.status'=>1,'i.is_delete'=>0])
		// 	->limit(($page_num-1)*$page_size,$page_size)
		// 	->select());
	}

	public function index($key_word="",$brand_id='',$page_num=1,$page_size=10,ImportedModel $Imported)
	{
		$uid = getUserId();

		$Sql = $Imported
		->alias('i')
		->field('i.*,company_name,u.name,u.phone,b.name as brand_name,b.img')
		->join('think_sign_brands b','b.id = i.brand_id','LEFT')
		->join('think_business_users_union u','u.id = i.user_id','LEFT')
		->join('purchase_user_relation ur','ur.user_id = i.user_id','LEFT')
		->join('purchase_company c','c.id = ur.company_id','LEFT');


		if ($key_word) {
			$Sql = $Sql->where('b.name|c.company_name|i.car_name','like','%'.$key_word.'%');

		}
		if ($brand_id) {
			$Sql = $Sql->where('b.id',$brand_id);
		}
		return success($Sql
			->order('i.id desc')
			->where(['i.status'=>1,'i.is_delete'=>0])
			->limit(($page_num-1)*$page_size,$page_size)
			->select());
	}

	public function read($id,ImportedModel $Imported)
	{
		$uid = getUserId();
		
		$data = $Imported
		->alias('i')
		->field('i.*,company_name,company_logo,ur.company_id,u.name,u.phone,b.name as brand_name,b.img')
		->join('think_sign_brands b','b.id = i.brand_id','LEFT')
		->join('think_business_users_union u','u.id = i.user_id','LEFT')
		->join('purchase_user_relation ur','ur.user_id = i.user_id','LEFT')
		->join('purchase_company c','c.id = ur.company_id','LEFT')
		->where(['i.status'=>1,'i.is_delete'=>0])
		->get(['i.id'=>$id]);
		return success($data);
	}

	public function save(ImportedModel $Imported)
	{
		$uid = request()->uid;
		
		$data = request()->only('brand_id,car_name,car_standard,car_color,car_procedure,note,car_price,province,city,region,car_type,photos','post');

		// $photos = \Upload::image();

		// $data['photos'] = implode(',', $photos);
		$data['photos'] = implode(',', $data['photos']);

		$res = $this->validate($data,'\app\purchase\validate\Ask.imported');
		if ($res !== true) {
			return error($res);
		}

		$data['user_id'] = $uid;
		$data['create_time'] = time();
		$iid = $Imported->insertGetId($data);

		if ($iid) {
			return success($iid,'发布成功');
		}
		else{
			return error('发布失败');
		}
	}

	public function delete($id,ImportedModel $Imported)
	{
		$uid = request()->uid;
		$data = ['is_delete'=>1];

		$res = $Imported->where(['id'=>$id,'user_id'=>$uid])
		->where(['status'=>1,'is_delete'=>0])

		->data($data)
		->update();
		if ($res) {
			return success($res,'删除成功');
		}
		else{
			return error('删除失败');
		}
	}


	public function update($id,ImportedModel $Imported)
	{
		$uid = request()->uid;

		// $res = $Imported->field('photos')->where(['id'=>$id,'user_id'=>$uid])->find();
		// if (empty($res)) {
		// 	return '非发布者不能编辑';
		// }

		// $orgin = $res['photos'];
		// $new_photos = \Upload::image([
		// 	'orgin'=>$orgin
		// ]);

		$data = request()->only('brand_id,car_name,car_standard,car_color,car_procedure,note,car_price,province,city,region,car_type,photos','post');

		$res = $this->validate($data,'\app\purchase\validate\Ask.imported');
		if ($res !== true) {
			return error($res);
		}

		// $data['photos'] = join($new_photos,',');
		$data['photos'] = join($data['photos'],',');
		$data['update_time'] = time();
		$res = $Imported->where(['id'=>$id,'user_id'=>$uid])
		->where(['status'=>1,'is_delete'=>0])
		->data($data)
		->update();

		 // return  $Imported->getLastSql();
		if ($res) {
			return success('','编辑成功');
		}
		else{
			return error('编辑失败');
		}
	}

}

