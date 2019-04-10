<?php 

/**
 * 安全
 */
class Safe 
{
	public static function filter($str='')
	{
		$search = [
			'/<[^>]*script[^<]*>/i',
			'/<[^>]*meta[^<]*>/i',
			'/<[^>]*title[^<]*>/i',
			'/<[^>]*iframe[^<]*>/i',
			'/<[^>]*frame[^<]*>/i',
			'/<[^>]*style[^<]*>/i',
			'/<[^>]*html[^<]*>/i',
			'/<[^>]*body[^<]*>/i',
			'/<[^>]*title[^<]*>/i',
			'/<[^>]*link[^<]*>/i',
		];
		return preg_replace($search, '', $str);
	}
	public static function strict($str='')
	{
		return preg_replace('/<[^>].*>/', '', $str);
	}
	public function request($strict=true)
	{
		
	}
}

