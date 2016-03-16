package com.alcoholsale.service;

import java.util.List;

import com.alcoholsale.domain.TUser;

public interface UserService  extends BaseService {
//登入方法校验
	public   TUser checkUser(String name,String password);
//分页查询所有用户
	public List queryAllUser(int pageSize,int PageNow);
//修改用户信息
	public void updateUser(TUser tuser);
}
