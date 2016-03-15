package com.alcoholsale.domain;

import java.lang.Integer;
import java.util.HashSet;
import java.util.Set;

/**
 * TCategory entity. @author MyEclipse Persistence Tools
 */

public class TCategory implements java.io.Serializable {

	// Fields

	private  Integer catid;
	private String catname;
	private  Integer supid;
	private String descr;
	private Set TProducts = new HashSet(0);

	// Constructors

	/** default constructor */
	public TCategory() {
	}

	/** full constructor */
	public TCategory(String catname, Integer supid, String descr,
			Set TProducts) {
		this.catname = catname;
		this.supid = supid;
		this.descr = descr;
		this.TProducts = TProducts;
	}

	// Property accessors

	public Integer getCatid() {
		return this.catid;
	}

	public void setCatid(Integer catid) {
		this.catid = catid;
	}

	public String getCatname() {
		return this.catname;
	}

	public void setCatname(String catname) {
		this.catname = catname;
	}

	public Integer getSupid() {
		return this.supid;
	}

	public void setSupid(Integer supid) {
		this.supid = supid;
	}

	public String getDescr() {
		return this.descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public Set getTProducts() {
		return this.TProducts;
	}

	public void setTProducts(Set TProducts) {
		this.TProducts = TProducts;
	}

}