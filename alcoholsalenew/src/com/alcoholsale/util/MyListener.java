package com.alcoholsale.util;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alcoholsal.service.impl.UserServiceImpl;
import com.alcoholsale.domain.TProduct;
import com.alcoholsale.service.UserService;

public class MyListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}
	public ServletContext application;
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("-----------进入初始化所有商品-------------");
		application = arg0.getServletContext();
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		UserService userservice=(UserService) ac.getBean("userservice");
		List<TProduct>  products=userservice.getResult("from TProduct", null);
		System.out.println("======================"+products.size());
		application.setAttribute("products", products);
	}

}
