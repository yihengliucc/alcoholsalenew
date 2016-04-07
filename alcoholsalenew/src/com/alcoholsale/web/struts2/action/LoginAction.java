package com.alcoholsale.web.struts2.action;


import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.alcoholsale.domain.TAddress;
import com.alcoholsale.domain.TCartProduct;
import com.alcoholsale.domain.TProduct;
import com.alcoholsale.domain.TUser;
import com.alcoholsale.service.AddressService;
import com.alcoholsale.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements ServletRequestAware{
	private String username;
	private String password;
	private UserService userservice;
	private HttpServletRequest servletRequest;
	private HttpSession session;
	private int pageSize;
	private int pageNow;
	private int userid;
	private List<TAddress> address;
	private TUser user;
	private AddressService addressService;
	
	public AddressService getAddressService() {
		return addressService;
	}
	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}
	public TUser getUser() {
		return user;
	}
	public void setUser(TUser user) {
		this.user = user;
	}
	public String getUsername() {
		return username;
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

	public UserService getUserservice() {
		return userservice;
	}

	public void setUserservice(UserService userservice) {
		this.userservice = userservice;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	
	public List<TAddress> getAddress() {
		return address;
	}
	public void setAddress(List<TAddress> address) {
		this.address = address;
	}
	@Override
	public void setServletRequest(HttpServletRequest ServletRequest) {
		ServletRequest =this.servletRequest;
	}
	
	public String login() throws Exception {
		TUser tuser = userservice.checkUser(username, password);
		servletRequest=ServletActionContext.getRequest();
		session = servletRequest.getSession();
		if (tuser!=null) {
			//Map session= ActionContext.getContext().getSession();
			//session.put("user", tuser);
			session.setAttribute("user", tuser);
			if(tuser.getGrade()==1){
				session.removeAttribute("logininfo");
				return "adminsuccess";
			}else{
			session.removeAttribute("logininfo");
			return "success";
			}
		} else {
			System.out.println("failer。。。");			
			session.setAttribute("logininfo", "用户名密码错误！");
			return "failer";
		}
	}
	
	public String queryuser() throws Exception {
		List<TUser> tuser = (List<TUser>) userservice.queryAllUser(pageSize, pageNow);
		List<TUser> tusercount = userservice.queryAllUser(0, 0);
		session.setAttribute("alluser", tuser);
		session.setAttribute("tusercount",  (tusercount.size()-1)/pageSize+1);
		session.setAttribute("pageNow", pageNow);
		return "success";
	}
	
	public String deleteUser() throws Exception{
		TUser tuser = (TUser) userservice.findById(TUser.class, userid);
		this.setPageNow(1);
		userservice.deleteObject(tuser);
		return "success";
	}
	
	public String goUpdate(){
		return SUCCESS;
	}
	
	public String updateUser(){
		servletRequest=ServletActionContext.getRequest();
		session = servletRequest.getSession();
		TUser tuser = (TUser) session.getAttribute("user");
	    Set<TAddress> tSet = new HashSet<TAddress>(address);  
		tuser.setAddress(tSet);
	    tuser.setEmail(user.getEmail());
	    tuser.setPassword(user.getPassword());
	    tuser.setPhone(user.getPhone());
	    tuser.setUsername(user.getUsername());
	    userservice.updateUser(tuser);
		return SUCCESS;
	}
	
	public String goLoginUI() throws Exception {
		return "success";
	}
	
	public String exit() throws Exception {
		// 用这个方法比比较好，用invalidate方法不但会清除所有session里面的东西，如果已经清除了的话会报空指针的错误
		//session.removeAttribute("user");
		/*if (session.getAttribute("user") != null) {
			session.invalidate();
		}
		return "success";*/
		// 判断session是否已经失效
		servletRequest=ServletActionContext.getRequest();
		// 传递参数true，但session过期时，新的session就会被创建；后面就可以用sessin.isNew方法来判断session是否是同一个session
		session = servletRequest.getSession(true);
		 if (!session.isNew()) {
			 session.invalidate(); 
		 }
		 return "success";
	}
	
	public String goRegUI() throws Exception {
		// 判断session是否已经失效
		servletRequest=ServletActionContext.getRequest();
		session = servletRequest.getSession(true);
		 if (!session.isNew()) {
			 session.invalidate(); 
		 }
		return "success";
	}
	public String reg() throws Exception {
		// 插入用户信息到数据库
		user.setRegdate(new java.util.Date());
		user.setGrade(2);
		userservice.saveObject(user);
		return "success";
	}
	public String left() throws Exception {
		return "success";
	}
	public String right() throws Exception {
		return "success";
	}
	// 跳转到购物车
	public String goCart() throws Exception {
		// 设置session中所有商品isCheck字段为0，即未选中
		servletRequest = ServletActionContext.getRequest();
		HashMap<Integer, TCartProduct> cartProducts = (HashMap<Integer, TCartProduct>) servletRequest
				.getSession().getAttribute("cartProducts");
		
		if (cartProducts != null) {
			// 遍历商品进行设置
			Iterator iter = cartProducts.entrySet().iterator();
			while (iter.hasNext()) {
				Map.Entry entry = (Map.Entry) iter.next();
				Object key = entry.getKey();
				TCartProduct val = (TCartProduct) entry.getValue();
	System.out.println("设置商品isChecked：" + val.getProduct().getProname());			
				val.setIsChecked(0);
			}
			
		}
		
		return "success";
	}
	
	// 跳转到确定订单页面
	public String confirmOrder() throws Exception {
		// 获取用户信息
		servletRequest = ServletActionContext.getRequest();
/*		try {
		TUser user = (TUser) servletRequest.getSession().getAttribute("user");
		System.out.println(user.getUsername());
		} catch (Exception e) {
			return "login";
		}*/

		TUser user = (TUser) servletRequest.getSession().getAttribute("user");
		try {
			System.out.println(user.getUsername());
		} catch (Exception e) {
			e.printStackTrace();
			return "login";
		}
		// 获取订单确定页面需要的信息并写入到session供其调用
		List<TAddress> addresses = addressService.getAllAddress(user);
		servletRequest.setAttribute("addresses", addresses);
		
		return "success";
	}
}
