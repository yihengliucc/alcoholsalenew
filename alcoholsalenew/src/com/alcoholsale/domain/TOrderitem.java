package com.alcoholsale.domain;

import java.lang.Integer;

/**
 * TOrderitem entity. @author MyEclipse Persistence Tools
 */

public class TOrderitem implements java.io.Serializable {

	// Fields

	private  Integer itemid;
	private TOrder TOrder;
	private TProduct TProduct;
	private Double unitprice;
	private  Integer pcount;

	// Constructors

	/** default constructor */
	public TOrderitem() {
	}

	/** full constructor */
	public TOrderitem(TOrder TOrder, TProduct TProduct, Double unitprice,
			Integer pcount) {
		this.TOrder = TOrder;
		this.TProduct = TProduct;
		this.unitprice = unitprice;
		this.pcount = pcount;
	}

	// Property accessors

	public Integer getItemid() {
		return this.itemid;
	}

	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}

	public TOrder getTOrder() {
		return this.TOrder;
	}

	public void setTOrder(TOrder TOrder) {
		this.TOrder = TOrder;
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