package com.alcoholsale.domain.address;

import java.util.HashSet;
import java.util.Set;

/**
 * City entity. @author MyEclipse Persistence Tools
 */

public class City implements java.io.Serializable {

	// Fields

	private Integer idcity;
	private Province province;
	private String cityname;
	private Set towns = new HashSet(0);

	// Constructors

	/** default constructor */
	public City() {
	}

	/** minimal constructor */
	public City(String cityname) {
		this.cityname = cityname;
	}

// Property accessors

	public Integer getIdcity() {
		return this.idcity;
	}

	public void setIdcity(Integer idcity) {
		this.idcity = idcity;
	}

	public Province getProvince() {
		return this.province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

	public String getCityname() {
		return this.cityname;
	}

	public void setCityname(String cityname) {
		this.cityname = cityname;
	}

	public Set getTowns() {
		return this.towns;
	}

	public void setTowns(Set towns) {
		this.towns = towns;
	}
}