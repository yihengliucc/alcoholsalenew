package com.alcoholsale.admin.framework.context.webcontext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.alcoholsale.admin.framework.context.webcontext.impl.WebSessionContextImpl;

public class ThreadContextHolder {
	protected static final Logger logger = Logger
			.getLogger(ThreadContextHolder.class);
	private static ThreadLocal<WebSessionContext> SessionContextThreadLocalHolder = new ThreadLocal();
	private static ThreadLocal<HttpServletRequest> HttpRequestThreadLocalHolder = new ThreadLocal();
	private static ThreadLocal<HttpServletResponse> HttpResponseThreadLocalHolder = new ThreadLocal();

	public static void setHttpRequest(HttpServletRequest request) {
		HttpRequestThreadLocalHolder.set(request);
	}

	public static HttpServletRequest getHttpRequest() {
		return (HttpServletRequest) HttpRequestThreadLocalHolder.get();
	}

	public static void remove() {
		SessionContextThreadLocalHolder.remove();
		HttpRequestThreadLocalHolder.remove();
		HttpResponseThreadLocalHolder.remove();
	}

	public static void setHttpResponse(HttpServletResponse response) {
		HttpResponseThreadLocalHolder.set(response);
	}

	public static HttpServletResponse getHttpResponse() {
		return (HttpServletResponse) HttpResponseThreadLocalHolder.get();
	}

	public static void setSessionContext(WebSessionContext context) {
		SessionContextThreadLocalHolder.set(context);
	}

	public static void destorySessionContext() {
		WebSessionContext context = (WebSessionContext) SessionContextThreadLocalHolder
				.get();
		if (context != null) {
			context.destory();
		}
	}

	public static WebSessionContext getSessionContext() {
		if (SessionContextThreadLocalHolder.get() == null) {
			SessionContextThreadLocalHolder.set(new WebSessionContextImpl());
		}
		return (WebSessionContext) SessionContextThreadLocalHolder.get();
	}
}
