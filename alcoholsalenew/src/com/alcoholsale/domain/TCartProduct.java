package com.alcoholsale.domain;

public class TCartProduct implements java.io.Serializable {
	// Fields
	
	private Integer cartproid;
	private TProduct product;
	private Integer quantity;
	private Double totalPrice;
	private Integer isChecked;  // 增加一个字段表明用户购物车中是否选中此商品 
	
	public Integer getIsChecked() {
		return isChecked;
	}
	public void setIsChecked(Integer isChecked) {
		this.isChecked = isChecked;
	}
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
