package com.alcoholsale.service;

import java.util.List;

import com.alcoholsale.domain.TAddress;
import com.alcoholsale.domain.TUser;
import com.alcoholsale.domain.address.City;
import com.alcoholsale.domain.address.Province;
import com.alcoholsale.domain.address.Town;

public interface AddressService extends BaseService {
	/**
	 * 获取省会信息
	 * @param 不传入参数，获取所有值
	 */
	public List<Province> getProvince();
	/**
	 * 获取市信息
	 * @param province 传入要查询的省，获取市信息
	 */
	public List<City> getCity(Province province);
	/**
	 * 获取县信息
	 * @param city 传入要查询的市，获取到县信息
	 */
	public List<Town> getTown(City city);
	
	/**
	 * 获取所有地址
	 * @param user 传入需要查询才用户
	 */
	public List<TAddress> getAllAddress(TUser user);
	
	/**
	 * 获取指定用户和地址id号的地址对象
	 * 
	 */
	public TAddress getAddress(Integer addressid);
}
