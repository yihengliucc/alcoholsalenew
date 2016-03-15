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
	private TCategory TCategory;
	private String proname;
	private String descr;
	private String img;
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
	public TProduct(TCategory TCategory, String proname, String descr,
			String img, Double normalprice, Double memberprice, Date pubdate,
			BigDecimal sales, Set TOrderitems, TStock stockid,Set<TImage> imageid) {
		this.TCategory = TCategory;
		this.proname = proname;
		this.descr = descr;
		this.img = img;
		this.normalprice = normalprice;
		this.memberprice = memberprice;
		this.pubdate = pubdate;
		this.sales = sales;
		this.TOrderitems = TOrderitems;
		this.stockid = stockid;
		this.imageid=imageid;
	}

	// Property accessors

	

	public TCategory getTCategory() {
		return this.TCategory;
	}

	public Integer getProid() {
		return proid;
	}

	public void setProid(Integer proid) {
		this.proid = proid;
	}

	public void setTCategory(TCategory TCategory) {
		this.TCategory = TCategory;
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

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
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