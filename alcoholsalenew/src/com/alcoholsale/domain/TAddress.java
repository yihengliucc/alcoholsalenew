package com.alcoholsale.domain;

import java.io.Serializable;

public class TAddress implements Serializable {
	private Integer addressid;
	private TUser  user;       		// 所属用户
	private String address;			// 地址
	// 下面新增
	private String name;			// 地址对应联系人姓名
	private String phone;			// 地址对应联系人电话
	private Integer isdefault; 		// 是否设为默认收货地址
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getIsdefault() {
		return isdefault;
	}
	public void setIsdefault(Integer isdefault) {
		this.isdefault = isdefault;
	}
	public Integer getAddressid() {
		return addressid;
	}
	public void setAddressid(Integer addressid) {
		this.addressid = addressid;
	}

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public TUser getUser() {
		return user;
	}
	public void setUser(TUser user) {
		this.user = user;
	}
	
	
}
