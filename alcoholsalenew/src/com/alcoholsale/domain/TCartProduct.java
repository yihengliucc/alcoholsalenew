package com.alcoholsale.domain;

public class TCartProduct implements java.io.Serializable {
	// Fields
	
	private Integer cartproid;
	private TProduct product;
	private Integer quantity;
	private Double totalPrice;
	
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double d) {
		this.totalPrice = d;
	}
	public Integer getCartproid() {
		return cartproid;
	}
	public void setCartproid(Integer cartproid) {
		this.cartproid = cartproid;
	}
	public TProduct getProduct() {
		return product;
	}
	public void setProduct(TProduct product) {
		this.product = product;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	
}
