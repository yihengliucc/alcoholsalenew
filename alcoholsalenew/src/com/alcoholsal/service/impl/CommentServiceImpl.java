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
		tusercomment.setTcomment(tcomment);
		tusercomment.setTuser(user);
		this.saveObject(tcomment);
		this.saveObject(tusercomment);
		TProduct product = (TProduct) this.findById(TProduct.class, productid);
		Set<TComment> comments=product.getCommtentid();
		comments.add(tcomment);
		product.setCommtentid(comments);
		this.saveObject(comments);
	}

}
