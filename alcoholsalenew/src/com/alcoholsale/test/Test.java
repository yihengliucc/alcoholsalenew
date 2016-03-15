package com.alcoholsale.test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import com.alcoholsale.util.Tools;
public class Test {
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
		ServiceTest serviceTest = (ServiceTest) ac.getBean("testService");
		System.out.println(serviceTest.getName());
		serviceTest.sayHello();
	}
}
