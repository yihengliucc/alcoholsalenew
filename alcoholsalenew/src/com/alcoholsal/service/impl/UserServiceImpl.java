package com.alcoholsal.service.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import com.alcoholsale.domain.TUser;
import com.alcoholsale.service.UserService;
@Transactional
public class UserServiceImpl extends BaseServiceImpl implements UserService {

	@Override
	public TUser checkUser(String name, String password) {
		try {
			System.out.println("================="+password);
			String hql = " from TUser where username=? and passwd=?";
			Object obj[]={name,password};
			List<TUser> lst = this.getResult(hql, obj);
			if(lst.size()==1){
			return	lst.get(0);
			}else{
			return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List queryAllUser( int pageSize,
			int pageNow) {
		String hql = " from TUser";
		if(pageSize==0 && pageNow==0){
			List<TUser> lst=this.getResult(hql, null);
			return lst;
		}else{
			List<TUser> lst = this.getResultByPage(hql, null, pageSize, pageNow);
			return lst;
		}
	}

	
}
