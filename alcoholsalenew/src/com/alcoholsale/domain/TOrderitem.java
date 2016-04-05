package com.alcoholsale.domain;

import java.lang.Integer;

/**
 * TOrderitem entity. @author MyEclipse Persistence Tools
 */

public class TOrderitem implements java.io.Serializable {

	// Fields

	private  Integer itemid;
	private TOrder order;
	private TProduct product;
	private Double unitprice;
	private  Integer pcount;
	
	// Getters and setters
	
	public Integer getItemid() {
		return itemid;
	}
	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}
	public TOrder getOrder() {
		return order;
	}
	public void setOrder(TOrder order) {
		this.order = order;
	}
	public TProduct getProduct() {
		return product;
	}
	public void setProduct(TProduct product) {
		this.product = product;
	}
	public Double getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(Double unitprice) {
		this.unitprice = unitprice;
	}
	public Integer getPcount() {
		return pcount;
	}
	public void setPcount(Integer pcount) {
		this.pcount = pcount;
	}

	

}