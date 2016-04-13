package com.alcoholsale.admin.jdk.context;

import javax.servlet.http.HttpServletRequest;

import com.alcoholsale.admin.reourse.model.MySite;

public class MyContext {
	private static ThreadLocal<HttpServletRequest> HttpRequestHolder = new ThreadLocal<HttpServletRequest>();
	private static ThreadLocal<MyContext> MyContextHolder = new ThreadLocal<MyContext>();
	
	public static ThreadLocal<HttpServletRequest> getHttpRequestHolder() {
		return HttpRequestHolder;
	}
	public static void setHttpRequestHolder(
			ThreadLocal<HttpServletRequest> httpRequestHolder) {
		HttpRequestHolder = httpRequestHolder;
	}
/*	public static ThreadLocal<MyContext> getMyContextHolder() {
		return MyContextHolder;
	}
	public static void setMyContextHolder(ThreadLocal<MyContext> myContextHolder) {
		MyContextHolder = myContextHolder;
	}*/
	
	public static void setContext(MyContext context){
		MyContextHolder.set(context);
	}
	
	public static MyContext getContext(){
		MyContext context =  MyContextHolder.get();
		return context;
	}
	
	// 当前站点
	private MySite currentSite;

	public MySite getCurrentSite() {
		return currentSite;
	}
	public void setCurrentSite(MySite currentSite) {
		this.currentSite = currentSite;
	}
	
	
	//得到当前站点上下文
/*	public String getContextPath(){
		if("2".equals(EopSetting.RUNMODE) ){
			EopSite site  = this.getCurrentSite();
			StringBuffer context = new StringBuffer("/user");
			context.append("/");
			context.append(site.getUserid());
			context.append("/");
			context.append(site.getId());
			return context.toString();
		}else{
			return "";
		}
	}*/

}
