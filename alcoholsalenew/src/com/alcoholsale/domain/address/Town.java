package com.alcoholsale.domain.address;

import java.util.HashSet;
import java.util.Set;

/**
 * Town entity. @author MyEclipse Persistence Tools
 */

public class Town implements java.io.Serializable {

	// Fields

	private Integer idtown;
	private City city;
	private String townname;

	// Constructors

	/** default constructor */
	public Town() {
	}

	/** minimal constructor */
	public Town(City city, String townname) {
		this.city = city;
		this.townname = townname;
	}

	
	// Property accessors

	public Integer getIdtown() {
		return this.idtown;
	}

	public void setIdtown(Integer idtown) {
		this.idtown = idtown;
	}

	public City getCity() {
		return this.city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public String getTownname() {
		return this.townname;
	}

	public void setTownname(String townname) {
		this.townname = townname;
	}
}