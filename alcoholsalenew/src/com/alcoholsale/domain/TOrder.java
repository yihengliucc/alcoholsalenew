package com.alcoholsale.domain;

import java.lang.Integer;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TOrder entity. @author MyEclipse Persistence Tools
 */

public class TOrder implements java.io.Serializable {

	// Fields

	private  Integer orderid;
	private TUser TUser;
	private String addr;
	private Date oderdate;
	private  Integer status;
	private Date paydate;
	private Set TOrderitems = new HashSet(0);

	// Constructors

	/** default constructor */
	public TOrder() {
	}

	/** full constructor */
	public TOrder(TUser TUser, String addr, Date oderdate, Integer status,
			Date paydate, Set TOrderitems) {
		this.TUser = TUser;
		this.addr = addr;
		this.oderdate = oderdate;
		this.status = status;
		this.paydate = paydate;
		this.TOrderitems = TOrderitems;
	}

	// Property accessors

	public Integer getOrderid() {
		return this.orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public TUser getTUser() {
		return this.TUser;
	}

	public void setTUser(TUser TUser) {
		this.TUser = TUser;
	}

	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Date getOderdate() {
		return this.oderdate;
	}

	public void setOderdate(Date oderdate) {
		this.oderdate = oderdate;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getPaydate() {
		return this.paydate;
	}

	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}

	public Set getTOrderitems() {
		return this.TOrderitems;
	}

	public void setTOrderitems(Set TOrderitems) {
		this.TOrderitems = TOrderitems;
	}

}