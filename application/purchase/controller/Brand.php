<?php 
namespace app\purchase\controller;

use app\purchase\model\Brand as BrandModel;
use app\purchase\model\FollowBrand;
/**
 * 品牌（会显示是否关注）
 */
class Brand extends \think\Controller
{
	public function index(BrandModel $Brand)
	{
		return success($Brand
			->field('id,letter,name,img')
			->where('pid',0)
			->order('letter asc')
			->select());		
	}
	

	/**
	 * 品牌下车型
	 * @param  [type]     $id    [description]
	 * @param  BrandModel $Brand [description]
	 * @return [type]            [description]
	 */
	public function type($brand_id,BrandModel $Brand)
	{
		return success($Brand->alias('b')
				->field('id,letter,name')
				->where('pid',$brand_id)
				->order('name asc')
				->select());
	}

	/**
	 * 删除品牌关注
	 * @param  array $brand_id [description]
	 * @return [type]           [description]
	 */
	public function follow($brand_id,FollowBrand $FollowBrand)
	{
		$uid = getUserId();
        if (empty($uid)) {
            //不存在用户返回需要登陆信息
            return error('还没登录',999);
        }
		
		$res = $FollowBrand->field('id')->get(['user_id'=>$uid,'brand_id'=>$brand_id]);

		if (empty($res)) {
			$fid =  $FollowBrand->insertGetId(['user_id'=>$uid,'brand_id'=>$brand_id,'create_time'=>time()]);
		} else {
			$fid = $res['id'];
		}
		return success(['id'=>$fid]);
	}

	/**
	 * 删除品牌关注
	 * @param  array $brand_id [description]
	 * @return [type]           [description]
	 */
	public function unfollow($brand_id,FollowBrand $FollowBrand)
	{
		$uid = getUserId();
        if (empty($uid)) {
            //不存在用户返回需要登陆信息
            return error('还没登录',999);
        }

		$res = $FollowBrand->where(['user_id'=>$uid,'brand_id'=>$brand_id])->delete();

		if ($res) {
			return success('','取消关注成功');	
		} else {
			return error('取消关注失败');
		}
	}

	/**
	 * 删除品牌关注
	 * @param  array $brand_id [description]
	 * @return [type]           [description]
	 */
	public function get_follow(BrandModel $Brand)
	{
		$uid = getUserId();
        if (empty($uid)) {
            //不存在用户返回需要登陆信息
            return error('还没登录',999);
        }

		return success($Brand->alias('b')->field('b.id,b.letter,b.name,b.img,!ISNULL(fb.id) as followed')
				->join('purchase_follow_brand fb', 'fb.brand_id = b.id and fb.user_id = '.$uid,'RIGHT')
				->where('b.pid',0)
				->order('letter asc')
				->select());
	}
}