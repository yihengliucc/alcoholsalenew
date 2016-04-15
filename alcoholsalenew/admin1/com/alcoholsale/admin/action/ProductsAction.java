package com.alcoholsale.admin.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.alcoholsale.framework.action.WWAction;
import com.alcoholsale.framework.database.Page;
import com.opensymphony.xwork2.ActionSupport;

public class ProductsAction extends WWAction {
	
	// Fields
	private String ctx;
	private List tagList;
	protected Boolean is_edit;
	private String optype = "no";
	
	
	public List getTagList() {
		return tagList;
	}

	public void setTagList(List tagList) {
		this.tagList = tagList;
	}

	public Boolean getIs_edit() {
		return is_edit;
	}

	public void setIs_edit(Boolean is_edit) {
		this.is_edit = is_edit;
	}

	public String getOptype() {
		return optype;
	}

	public void setOptype(String optype) {
		this.optype = optype;
	}

	public String getCtx() {
		return ctx;
	}

	public void setCtx(String ctx) {
		this.ctx = ctx;
	}

	/**
	 * 管理界面展示所有商品
	 * @return
	 */
	public String list() {
		this.ctx = ServletActionContext.getRequest().getContextPath();
        if ("/".equals(this.ctx)) {
            this.ctx = "";
          }
System.out.println("进入商品展示list action");
		
		this.webpage = new Page();
		
		return "list";
	}
	
	public String batchEdit() {
		System.out.println("进入商品batchEdit");
		return "batchedit";
	}
}