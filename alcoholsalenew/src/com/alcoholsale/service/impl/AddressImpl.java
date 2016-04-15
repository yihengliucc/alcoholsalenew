package com.alcoholsale.service.impl;

import java.util.List;

import com.alcoholsale.domain.TAddress;
import com.alcoholsale.domain.TUser;
import com.alcoholsale.domain.address.City;
import com.alcoholsale.domain.address.Province;
import com.alcoholsale.domain.address.Town;
import com.alcoholsale.service.AddressService;

public class AddressImpl extends BaseServiceImpl implements AddressService {

	@Override
	public List<Province> getProvince() {
		String hql = "from Province";
		List<Province> provinces = this.getResult(hql, null);
		return provinces;
	}

	@Override
	public List<City> getCity(Province province) {
		String hql = "from City where province = ?";
		Object obj[] = {province};
		List<City> citys = this.getResult(hql, obj);
		return citys;
	}

	@Override
	public List<Town> getTown(City city) {
		String hql = "from Town where city = ?";
		Object obj[] = {city};
		List<Town> towns = this.getResult(hql, obj);
		return towns;
	}

	@Override
	public List<TAddress> getAllAddress(TUser user) {
		String hql = "from TAddress where user = ? order by isdefault desc, addressid desc";
		Object obj[] = {user};
		List<TAddress> addresses = this.getResult(hql, obj);
		return addresses;
	}

	@Override
	public TAddress getAddress(Integer addressid) {
		TAddress address = (TAddress) this.findById(TAddress.class, addressid);
		return address;
	}

}
