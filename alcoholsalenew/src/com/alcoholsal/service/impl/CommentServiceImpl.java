package com.alcoholsal.service.impl;

import java.util.Set;

import com.alcoholsale.domain.TComment;
import com.alcoholsale.domain.TProduct;
import com.alcoholsale.domain.TUser;
import com.alcoholsale.domain.TUserComment;
import com.alcoholsale.service.CommentService;

public class CommentServiceImpl  extends BaseServiceImpl implements CommentService{

	@Override
	public void add(Integer productid, TUser user, TComment tcomment) {
		TUserComment tusercomment = new TUserComment();
		//将评论对象保存到中间对象中
		tusercomment.setTcomment(tcomment);
		//将评用户对象保存到中间对象中
		tusercomment.setTuser(user);
		//将评论对象写入数据库
		this.saveObject(tcomment);
		//将中间对象写入数据库
		this.saveObject(tusercomment);
		TProduct product = (TProduct) this.findById(TProduct.class, productid);
		//取出商品说有评论
		Set<TComment> comments=product.getCommtentid();
		//增加当前评论
		comments.add(tcomment);
		//改变商品对象的评论数量
		product.setCommtentid(comments);
		//修改商品对象的评论数到数据库
		this.saveObject(product);
	}

}
