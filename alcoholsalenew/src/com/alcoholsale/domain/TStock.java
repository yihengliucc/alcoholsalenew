package com.alcoholsale.domain;

import java.math.BigDecimal;

/**
 * TStock entity. @author MyEclipse Persistence Tools
 */

public class TStock implements java.io.Serializable {

	// Fields

	private Integer stockid;
	private TProduct product;
	private Integer quantity;

	// Constructors

	/** default constructor */
	public TStock() {
	}

	/** full constructor */
	public TStock(TProduct product, Integer quantity) {
		this.product = product;
		this.quantity = quantity;
	}

	// Property accessors

	
	public Integer getStockid() {
		return stockid;
	}

	public void setStockid(Integer stockid) {
		this.stockid = stockid;
	}

	public TProduct getProduct() {
		return product;
	}

	public void setProduct(TProduct product) {
		this.product = product;
	}

	public Integer getQuantity() {
		return this.quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

}