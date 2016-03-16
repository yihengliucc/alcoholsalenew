package com.alcoholsale.service;

import com.alcoholsale.domain.TComment;
import com.alcoholsale.domain.TUser;

public interface CommentService extends BaseService {
	//传递商品编号，用户，评论
	public void add(Integer productid,TUser user,TComment tcomment);
}
