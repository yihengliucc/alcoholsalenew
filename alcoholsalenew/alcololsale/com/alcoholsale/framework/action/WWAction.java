package com.alcoholsale.framework.action;

import java.util.Map;

import com.alcoholsale.cc.sdk.context.EopSetting;
import com.alcoholsale.framework.database.Page;
import com.alcoholsale.framework.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

public class WWAction extends ActionSupport implements SessionAware {

	protected final Logger logger = Logger.getLogger(getClass());
	protected Page webpage;
	protected Map session = null;
	protected List msgs = new ArrayList();
	protected Map urls = new HashMap();
	protected Map blankUrls = new HashMap();
	protected static final String MESSAGE = "message";
	protected static final String JSON_MESSAGE = "json_message";
	protected String script = "";
	protected String json;
	protected int page;
	protected int pageSize;
	protected int rows;
	protected String pageId;
	private String sort;
	private String order;

	public String list_ajax() {
		return "list";
	}

	public String add_input() {
		return "add";
	}

	public String edit_input() {
		return "edit";
	}

	public int getPageSize() {
		if (this.rows == 0) {
/*			this.rows = StringUtil.toInt(EopSetting.BACKEND_PAGESIZE,
					Integer.valueOf(10)).intValue();	// 占时直接修改为10
*/			this.rows = StringUtil.toInt("10",
					Integer.valueOf(10)).intValue();
			}
		return this.rows;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPage() {
		this.page = (this.page < 1 ? 1 : this.page);
		return this.page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public Map getSession() {
		return this.session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	protected HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	protected HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	protected void render(String text, String contentType) {
		try {
			HttpServletResponse response = getResponse();
			response.setContentType(contentType);
			response.getWriter().write(text);
		} catch (IOException e) {
			System.err.println(e.getMessage());
		}
	}

	protected void renderText(String text) {
		render(text, "text/plain;charset=UTF-8");
	}

	protected void renderHtml(String text) {
		render(text, "text/html;charset=UTF-8");
	}

	protected void renderXML(String text) {
		render(text, "text/xml;charset=UTF-8");
	}

	protected void showSuccessJson(String message) {
		if (StringUtil.isEmpty(message)) {
			this.json = "{\"result\":1}";
		} else {
			this.json = ("{\"result\":1,\"message\":\"" + message + "\"}");
		}
	}

	protected void showSuccessJson(String message, Integer id) {
		if (StringUtil.isEmpty(message)) {
			this.json = "{\"result\":1}";
		} else {
			this.json = ("{\"result\":1,\"message\":\"" + message
					+ "\",\"id\":\"" + id + "\"}");
		}
	}

	protected void showErrorJson(String message) {
		if (StringUtil.isEmpty(message)) {
			this.json = "{\"result\":0}";
		} else {
			this.json = ("{\"result\":0,\"message\":\"" + message + "\"}");
		}
	}

	public void showGridJson(Page page) {
		this.json = ("{\"total\":" + page.getTotalCount() + ",\"rows\":"
				+ JSONArray.fromObject(page.getResult()).toString() + "}");
	}

	public void showGridJson(List list) {
		this.json = ("{\"total\":" + list.size() + ",\"rows\":"
				+ JSONArray.fromObject(list).toString() + "}");
	}

	public List getMsgs() {
		return this.msgs;
	}

	public void setMsgs(List msgs) {
		this.msgs = msgs;
	}

	public Map getUrls() {
		return this.urls;
	}

	public void setUrls(Map urls) {
		this.urls = urls;
	}

	public Page getWebpage() {
		return this.webpage;
	}

	public void setWebpage(Page webpage) {
		this.webpage = webpage;
	}

	public String getScript() {
		return this.script;
	}

	public void setScript(String script) {
		this.script = script;
	}

	public String getJson() {
		return this.json;
	}

	public void setJson(String json) {
		this.json = json;
	}

	public Map getBlankUrls() {
		return this.blankUrls;
	}

	public void setBlankUrls(Map blankUrls) {
		this.blankUrls = blankUrls;
	}

	public int getRows() {
		return this.rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String getSort() {
		return this.sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return this.order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getCtx() {
		HttpServletRequest req = getRequest();
		if (req != null) {
			return req.getContextPath();
		}
		return null;
	}

}
