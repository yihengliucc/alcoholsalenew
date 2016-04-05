package com.alcoholsale.web.struts2.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.mail.search.SentDateTerm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.alcoholsale.domain.TAddress;
import com.alcoholsale.domain.TOrder;
import com.alcoholsale.domain.TOrderitem;
import com.alcoholsale.domain.TUser;
import com.alcoholsale.domain.address.City;
import com.alcoholsale.domain.address.Province;
import com.alcoholsale.domain.address.Town;
import com.alcoholsale.service.AddressService;
import com.alcoholsale.service.OrdersService;
import com.opensymphony.xwork2.ActionSupport;

public class OrdersAction extends ActionSupport implements ServletRequestAware {
	private OrdersService orderservice;
	private TOrder torder;
	private TOrderitem torderitem;
	private HttpServletRequest request;
	private Integer productid;
	private Integer taddr;
	private AddressService addressService;

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public Integer getTaddr() {
		return taddr;
	}

	public void setTaddr(Integer taddr) {
		this.taddr = taddr;
	}

	public AddressService getAddressService() {
		return addressService;
	}

	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}

	public OrdersService getOrderservice() {
		return orderservice;
	}

	public void setOrderservice(OrdersService orderservice) {
		this.orderservice = orderservice;
	}

	public TOrder getTorder() {
		return torder;
	}

	public void setTorder(TOrder torder) {
		this.torder = torder;
	}

	public TOrderitem getTorderitem() {
		return torderitem;
	}

	public void setTorderitem(TOrderitem torderitem) {
		this.torderitem = torderitem;
	}

	// 增加订单方法
	/**
	 * @return
	 */
	public String addOrder() {
		request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		TUser tuser = (TUser) session.getAttribute("user");
		orderservice.addOrder(productid, tuser, taddr, torder, torderitem);
		return SUCCESS;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	// 获取地址用于选择
	public String getAddress() throws Exception{
		request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		// fields 定义json变量
		String json_province = "{\"provinces\":[";  				// {"provinces":[{"provinceid":1,"provincename":"江西省"},{"provinceid":2,"provincename":"浙江省"}]}
		String json_city = "{\"cities\":[";						// {"citys":[{"cityid":1,"cityname":"南昌市"}]}
		String json_town = "{\"towns\":[";						// {"towns":[{"townid":1,"townname":"新建县"}]}
		// 判断用户是要获取省、市还是县的信息
		String addrflag = request.getParameter("addrflag");

		if ("all".equals(addrflag)) {
			// 初始值，用于首次弹出窗口展示用
			// 省
			List<Province> provinces = addressService.getProvince();
			for (int i = 0; i < provinces.size() - 1; i++) {
				Province province = provinces.get(i);
				json_province = json_province + "{\"provinceid\":" + province.getIdprovince() + ",\"provincename\":\"" + province.getName() + "\"},"; 
			}
			json_province = json_province + "{\"provinceid\":" + provinces.get(provinces.size() - 1).getIdprovince() + ",\"provincename\":\"" + provinces.get(provinces.size() - 1).getName() + "\"}]}";			
			// 传回ajax

            sendMsg(json_province);	

			
			
			//sendMsg("{\"info\":\"quantitynotsufficient\"}"); 	// 放到最后，紧接着需要return null
		} else if ("city".equals(addrflag)) {
			// 获取用户选择的省
			int provinceid = Integer.parseInt(request.getParameter("provinceid"));
			// 市
			Province province = (Province) addressService.findById(
					Province.class, provinceid);
			List<City> cities = addressService.getCity(province);
			for (int i = 0; i < cities.size() - 1; i++) {
				City city = cities.get(i);
				json_city = json_city + "{\"cityid\":" +  city.getIdcity() + ",\"cityname\":\"" + city.getCityname() + "\"},";
			}
			json_city = json_city + "{\"cityid\":" + cities.get(cities.size() - 1).getIdcity() + ",\"cityname\":\"" + cities.get(cities.size() - 1).getCityname() + "\"}]}";			
			// 回传ajax
			sendMsg(json_city);
			
		} else if ("town".equals(addrflag)) {
			// 获取用户选择的市
			int cityid = Integer.parseInt(request.getParameter("cityid"));
			// 区县
			City city = (City) addressService.findById(City.class, cityid);
			List<Town> towns = addressService.getTown(city);
			for (int i = 0; i < towns.size(); i++) {
				Town town = towns.get(i);
				json_town = json_town + "{\"townid\":" +  town.getIdtown() + ",\"townname\":\"" + town.getTownname() + "\"},";
			}
			json_town = json_town + "{\"townid\":" + towns.get(towns.size() - 1).getIdtown() + ",\"townname\":\"" + towns.get(towns.size() - 1).getTownname() + "\"}]}";			
			sendMsg(json_town);
		}

		return null;
	}
	
	// 自定义方法，用户返回值到页面，ajax返回值
	 public void sendMsg(String content) throws IOException {  
	        HttpServletResponse response = ServletActionContext.getResponse();  
	        response.setContentType("text/html;charset=utf-8");
	        response.setCharacterEncoding("UTF-8");  
	        response.getWriter().write(content);  
	    }  
	 
	/**
	 * 用于增加地址的action
	 */
	 public String addAddress() throws Exception {
		 // 获取传递过来的用户信息
		 String consignee = request.getParameter("consignee");
		 String shippingAddress = request.getParameter("shippingAddress");
		 String phone = request.getParameter("phone");
System.out.println(consignee + shippingAddress + phone);
		 
		 // 获取当前用户信息
		TUser user = null;
		try {
			user = (TUser) request.getSession().getAttribute("user");
System.out.println(user.getUsername() + "||" + user.getUserid());
		} catch (Exception e) {
			e.printStackTrace();
			sendMsg("{\"addinfo\":\"nologin\"}");
		}
		 
		 TAddress newAddress = new TAddress();
		 newAddress.setUser(user);
		 newAddress.setAddress(shippingAddress);
		 newAddress.setName(consignee);
		 newAddress.setPhone(phone);
		 newAddress.setIsdefault(0);
		 
		 try {
			 addressService.saveObject(newAddress);
			 sendMsg("{\"addinfo\":\"addsuccess\",\"addressid\":\"" + newAddress.getAddressid() + "\"}");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; 
	 }
	 
	 // 删除地址action
	 public String delAddress() throws Exception{
		 request = ServletActionContext.getRequest();
		 // 获取要删除地址的id号
		 Integer addressid = Integer.parseInt(request.getParameter("addressid"));
System.out.println(addressid);
		 try {
			 TAddress address = addressService.getAddress(addressid);
			 addressService.deleteObject(address);
			 sendMsg("{\"deleteinfo\":\"delsuccess\"}");
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return null;
	 }
}
