package com.alcoholsale.domain;

import java.lang.Integer;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TUser entity. @author MyEclipse Persistence Tools
 */

public class TUser implements java.io.Serializable {

	// Fields

	private Integer userid;
	private String username;
	private String password;
	private String email;
	private String phone;
	private Date regdate;
	private Integer grade;
	private Set TOrders = new HashSet(0);
	private Set<TAddress> address = new HashSet<TAddress>();
	private Set<TUserComment> tusercomment = new HashSet<TUserComment>();
	// Constructors

	/** default constructor */
	public TUser() {
	}

	public TUser(String username) {
		this.username = username;
	}


	

	public String getUsername() {
		return this.username;
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getRegdate() {
		return this.regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public Set getTOrders() {
		return this.TOrders;
	}

	public void setTOrders(Set TOrders) {
		this.TOrders = TOrders;
	}

	public Set<TAddress> getAddress() {
		return address;
	}

	public void setAddress(Set<TAddress> address) {
		this.address = address;
	}

	public Set<TUserComment> getTusercomment() {
		return tusercomment;
	}

	public void setTusercomment(Set<TUserComment> tusercomment) {
		this.tusercomment = tusercomment;
	}

}