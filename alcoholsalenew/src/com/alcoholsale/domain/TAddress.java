package com.alcoholsale.domain;

import java.io.Serializable;

public class TAddress implements Serializable {
	private Integer addressid;
	private String addressname;
	private TUser  user;
	
	public Integer getAddressid() {
		return addressid;
	}
	public void setAddressid(Integer addressid) {
		this.addressid = addressid;
	}
	public String getAddressname() {
		return addressname;
	}
	public void setAddressname(String addressname) {
		this.addressname = addressname;
	}
	public TUser getUser() {
		return user;
	}
	public void setUser(TUser user) {
		this.user = user;
	}
	
	
}
