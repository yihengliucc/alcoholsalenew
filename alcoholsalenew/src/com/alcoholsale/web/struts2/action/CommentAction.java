package com.alcoholsale.web.struts2.action;

import com.alcoholsale.service.CommentService;

public class CommentAction {
	private CommentService commentService;

	public CommentService getCommentService() {
		return commentService;
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	
}
