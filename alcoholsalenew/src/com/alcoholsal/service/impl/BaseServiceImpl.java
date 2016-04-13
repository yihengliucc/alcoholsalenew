package com.alcoholsal.service.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.sql.Update;
import org.springframework.transaction.annotation.Transactional;

import com.alcoholsale.service.BaseService;

@Transactional
public class BaseServiceImpl implements BaseService{
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public Object findById(Class clazz, Serializable id) {
		Session session =sessionFactory.getCurrentSession();
		Object obj = session.load(clazz, id);
		return obj;
	}

	@Override
	public List getResult(String hql, Object[] parameters) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		if( parameters!=null && parameters.length>0){
			for(int i=0;i<parameters.length;i++)
				query.setParameter(i, parameters[i]);
		}
		return query.list();
	}


	@Override
	public void saveObject(Object obj) {
		sessionFactory.getCurrentSession().save(obj);
		
	}


	@Override
	public void deleteObject(Object obj) {
		Session session =null; 
		try {
			session = sessionFactory.getCurrentSession();
			session.delete(obj);
		} catch (HibernateException e) {
			e.printStackTrace();
		}finally{
			if(session!=null&&!session.isOpen()){
				session.close();
			}
		}
	}


	@Override
	public void updateObject(Object obj) {
		sessionFactory.getCurrentSession().update(obj);
		
	}
	// 分页
	@Override
	public List getResultByPage(String hql, Object[] parameters, int pageSize,
			int pageNow) {
		Session session=null;
		try {
			session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(hql);
			if( parameters!=null&&parameters.length>0){
				for(int i=0;i<parameters.length;i++)
					query.setParameter(i, parameters[i]);
			}
			query.setFirstResult((pageNow-1)*pageSize).setMaxResults(pageSize);
			return query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Object getCount(String hql, Object[] parameters) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(hql);
			// 注入？
			if (parameters != null && parameters.length > 0) {
				for (int i = 0; i < parameters.length; i++) {
					query.setParameter(i, parameters[i]);
				}
			}
			return query.uniqueResult();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public void deleteAllObject(Object obj) {
		String hql = "delete from " + obj + "where 1=1";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.executeUpdate();
	}

}
