package com.alcoholsale.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TProduct entity. @author MyEclipse Persistence Tools
 */

public class TProduct implements java.io.Serializable {

	// Fields

	private Integer proid;
	private String proname;
	private String descr;
	private Double normalprice;
	private Double memberprice;
	private Date pubdate;
	private BigDecimal sales;
	private Set TOrderitems = new HashSet(0);
	private  TStock stockid;
	private Set<TImage> imageid;

	// Constructors

	/** default constructor */
	public TProduct() {
	}

	/** full constructor */
	public TProduct(String proname, String descr,
			String img, Double normalprice, Double memberprice, Date pubdate,
			BigDecimal sales, Set TOrderitems, TStock stockid,Set<TImage> imageid) {
		this.proname = proname;
		this.descr = descr;
		this.normalprice = normalprice;
		this.memberprice = memberprice;
		this.pubdate = pubdate;
		this.sales = sales;
		this.TOrderitems = TOrderitems;
		this.stockid = stockid;
		this.imageid=imageid;
	}


	public Integer getProid() {
		return proid;
	}

	public void setProid(Integer proid) {
		this.proid = proid;
	}

	public String getProname() {
		return this.proname;
	}

	public void setProname(String proname) {
		this.proname = proname;
	}

	public String getDescr() {
		return this.descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public Double getNormalprice() {
		return this.normalprice;
	}

	public void setNormalprice(Double normalprice) {
		this.normalprice = normalprice;
	}

	public Double getMemberprice() {
		return this.memberprice;
	}

	public void setMemberprice(Double memberprice) {
		this.memberprice = memberprice;
	}

	public Date getPubdate() {
		return this.pubdate;
	}

	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}

	public BigDecimal getSales() {
		return this.sales;
	}

	public void setSales(BigDecimal sales) {
		this.sales = sales;
	}

	public Set getTOrderitems() {
		return this.TOrderitems;
	}

	public void setTOrderitems(Set TOrderitems) {
		this.TOrderitems = TOrderitems;
	}

	public TStock getStockid() {
		return stockid;
	}

	public void setStockid(TStock stockid) {
		this.stockid = stockid;
	}

	public Set<TImage> getImageid() {
		return imageid;
	}

	public void setImageid(Set<TImage> imageid) {
		this.imageid = imageid;
	}

}