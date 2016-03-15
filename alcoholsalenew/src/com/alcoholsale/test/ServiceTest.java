package com.alcoholsale.test;

public class ServiceTest {
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public void sayHello() {
		System.out.println("测试spring say hello!");
	}
}
