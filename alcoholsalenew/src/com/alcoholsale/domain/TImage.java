package com.alcoholsale.domain;

import java.io.Serializable;

public class TImage implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer imageid;
	private String imagename;
	private TProduct product;
	public TImage(){}
	public TImage(String imagename,TProduct product){
		this.imagename=imagename;
		this.product=product;
	}
	public Integer getImageid() {
		return imageid;
	}
	public void setImageid(Integer imageid) {
		this.imageid = imageid;
	}
	public String getImagename() {
		return imagename;
	}
	public void setImagename(String imagename) {
		this.imagename = imagename;
	}
	public TProduct getProduct() {
		return product;
	}
	public void setProduct(TProduct product) {
		this.product = product;
	}
	
	
}
