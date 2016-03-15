package com.alcoholsale.web.struts2.action;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.alcoholsale.domain.TUser;
import com.alcoholsale.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements ServletRequestAware{
	private String username;
	private String password;
	private UserService userservice;
	private HttpServletRequest ServletRequest;
	private HttpSession session;
	private int pageSize;
	private int pageNow;
	private int userid;
	
	private TUser user;
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
	

	@Override
	public void setServletRequest(HttpServletRequest ServletRequest) {
		ServletRequest =this.ServletRequest;
	}
	
	public String login() throws Exception {
		TUser tuser = userservice.checkUser(username, password);
		ServletRequest=ServletActionContext.getRequest();
		session = ServletRequest.getSession();
		if (tuser!=null) {
			//Map session= ActionContext.getContext().getSession();
			//session.put("user", tuser);
			session.setAttribute("user", tuser);
			if(tuser.getGrade()==1){
				return "adminsuccess";
			}else{
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
	public String goLoginUI() throws Exception {
		return "success";
	}
	
	public String exit() throws Exception {
		session.invalidate();
		return "success";
	}
	
	public String goRegUI() throws Exception {
		return "success";
	}
	public String reg() throws Exception {
		// 插入用户信息到数据库
//		user.setUsername("liucheng");
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
}
