package com.alcoholsale.admin.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.alcoholsale.admin.jdk.context.MyContext;
import com.alcoholsale.admin.reourse.IIndexItemManager;
import com.alcoholsale.admin.reourse.IndexItemManager;
import com.alcoholsale.admin.reourse.model.MySite;
import com.alcoholsale.admin.resource.domain.IndexItem;
import com.alcoholsale.admin.service.AdminService;
import com.alcoholsale.service.OrdersService;
import com.alcoholsale.service.ProductService;
import com.alcoholsale.service.impl.OrdersServiceImpl;
import com.alcoholsale.service.impl.ProductServiceImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport implements ServletRequestAware {
	// Fields
	private HttpServletRequest servletRequest;
	private AdminService adminService;
	private HttpSession session;
	private List<IndexItem> itemList;
	private String ctx;
	private IIndexItemManager indexItemManager;
	private MySite site;
	private OrdersService orderService;
	private ProductService productService;
	private Map orders;
	private Map products;
	
	public Map getOrders() {
		return orders;
	}

	public void setOrders(Map orders) {
		this.orders = orders;
	}

	public Map getProducts() {
		return products;
	}

	public void setProducts(Map products) {
		this.products = products;
	}

	public OrdersService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrdersService orderService) {
		this.orderService = orderService;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setOrderService(OrdersServiceImpl orderService) {
		this.orderService = orderService;
	}

	public void setProductService(ProductServiceImpl productService) {
		this.productService = productService;
	}

	public MySite getSite() {
		return site;
	}

	public void setSite(MySite site) {
		this.site = site;
	}

	public IIndexItemManager getIndexItemManager() {
		return indexItemManager;
	}

	public void setIndexItemManager(IIndexItemManager indexItemManager) {
		this.indexItemManager = indexItemManager;
	}

	public String getCtx() {
		return ctx;
	}

	public void setCtx(String ctx) {
		this.ctx = ctx;
	}

	public List<IndexItem> getItemList() {
		return itemList;
	}

	public void setItemList(List<IndexItem> itemList) {
		this.itemList = itemList;
	}

	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}

	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		servletRequest =this.servletRequest;
	}
	
	
	// Action methods
	
	public String adminExit() throws Exception {
		// 判断session是否已经失效
		servletRequest=ServletActionContext.getRequest();
		// 传递参数true，但session过期时，新的session就会被创建；后面就可以用sessin.isNew方法来判断session是否是同一个session
		session = servletRequest.getSession(true);
		 if (!session.isNew()) {
			 try {
				session.invalidate(); 
				sendMsg("{\"result\":\"1\"}");
			} catch (Exception e) {
				sendMsg("{\"message\":\"注销失败！\"}");
				e.printStackTrace();
			}
		 }
		 return null;
	}
	
	/**
	 * 获取首页需要展示的类别
	 * @return
	 * @throws Exception
	 */
	public String adminIndex() throws Exception {
		this.ctx = ServletActionContext.getRequest().getContextPath();
        if ("/".equals(this.ctx)) {
            this.ctx = "";
          }
        
        // 给itemList赋值
        this.itemList = indexItemManager.list();
		return "success";
	}
	
	/**
	 * 获取站点信息
	 * @return
	 */
	public String baseIndexItem() {
		
		MySite mysite = new MySite();
		mysite.setSitename("品牌酒");
		mysite.setCreatetime(1460344096L);
		mysite.setLastlogin(System.currentTimeMillis());
		site = mysite;
		return "base";
	}
	
	/**
	 * 获取首页订单信息
	 * @return
	 */
	public String shopIndexItem() {
		this.orders = this.orderService.orderStatusStatistic();
		return "order";
	}
	
	public String productIndexItem() {
		this.products = this.productService.productStatistic();
		return "product";
	}
	
	
	// 用户返回值到页面，ajax返回值
	public void sendMsg(String content) throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(content);
	}



}
