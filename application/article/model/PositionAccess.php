<?php
namespace app\article\model;

use app\common\model\Base;

class PositionAccess extends Base
{

    public function sgetAccess($where){
        return $this->where($where)->column('pid');
    }
}
