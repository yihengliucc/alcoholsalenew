package com.alcoholsale.domain;

import java.lang.Integer;

/**
 * TOrderitem entity. @author MyEclipse Persistence Tools
 */

public class TOrderitem implements java.io.Serializable {

	// Fields

	private  Integer itemid;
	private TProduct TProduct;
	private Double unitprice;
	private  Integer pcount;

	// Constructors

	/** default constructor */
	public TOrderitem() {
	}


	// Property accessors

	public Integer getItemid() {
		return this.itemid;
	}

	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}

	public TProduct getTProduct() {
		return this.TProduct;
	}

	public void setTProduct(TProduct TProduct) {
		this.TProduct = TProduct;
	}

	public Double getUnitprice() {
		return this.unitprice;
	}

	public void setUnitprice(Double unitprice) {
		this.unitprice = unitprice;
	}

	public Integer getPcount() {
		return this.pcount;
	}

	public void setPcount(Integer pcount) {
		this.pcount = pcount;
	}

}