package com.alcoholsale.web.struts2.action;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.alcoholsale.domain.TCartProduct;
import com.alcoholsale.domain.TImage;
import com.alcoholsale.domain.TProduct;
import com.alcoholsale.domain.TStock;
import com.alcoholsale.domain.TUser;
import com.alcoholsale.service.ProductService;
import com.opensymphony.xwork2.ActionSupport;

public class ProductAction extends ActionSupport implements ServletRequestAware {
	private TProduct product;
	private TStock stock;
	private int pageSize;
	private int pageNow;
	private ProductService productservice;
	private HttpServletRequest servletRequest;
	private HttpSession session;
	private int proid;
	private File[] myfile;
	private String[] myfileFileName;

	public void setProduct(TProduct product) {
		this.product = product;
	}

	public TProduct getProduct() {
		return product;
	}

	public TStock getStock() {
		return stock;
	}

	public void setStock(TStock stock) {
		this.stock = stock;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getProid() {
		return proid;
	}

	public void setProid(int proid) {
		this.proid = proid;
	}

	public File[] getMyfile() {
		return myfile;
	}

	public void setMyfile(File[] myfile) {
		this.myfile = myfile;
	}

	public String[] getMyfileFileName() {
		return myfileFileName;
	}

	public void setMyfileFileName(String[] myfileFileName) {
		this.myfileFileName = myfileFileName;
	}

	public void setProductservice(ProductService productservice) {
		this.productservice = productservice;
	}

	public String queryall() {
		List<TProduct> lst = productservice.queryProductByPage(pageSize,
				pageNow);
		int pageCount = productservice.getPageCount(pageSize);
		servletRequest = ServletActionContext.getRequest();
		session = servletRequest.getSession();
		if (lst.size() > 0)
			session.setAttribute("allproduct", lst);
		session.setAttribute("productcount", pageCount);
		session.setAttribute("pageNow", pageNow);
		return "success";
	}

	public String addproductUi() {
		return "success";
	}

	public String addproduct() throws Exception {

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		Date pubdate = sdf.parse(sdf.format(date));
		product.setPubdate(pubdate);
		product.setImage(myfileFileName[0]);
		productservice.saveObject(stock);
		product.setStockid(stock);
		productservice.saveObject(product);
		// 获取当前需要保存的文件路径
		String path = ServletActionContext.getServletContext()
				.getRealPath("myfile").toString();
		System.out.println(path);
		File file = new File(path);
		if (!file.exists())
			file.mkdirs();
		for (int i = 0; i < myfile.length; i++) {
			File file2 = new File(file, myfileFileName[i]);
			FileUtils.copyFile(myfile[i], file2);
			productservice.saveObject(new TImage(myfileFileName[i], product));
		}
		this.setPageNow(1);
		return SUCCESS;
	}

	public String deleteproduct() {
		TProduct product = (TProduct) productservice.findById(TProduct.class,
				proid);
		this.setPageNow(1);
		productservice.deleteObject(product);
		return SUCCESS;
	}

	public String findproduct() {
		TProduct product = (TProduct) productservice.findById(TProduct.class,
				proid);
		servletRequest = ServletActionContext.getRequest();
		session = servletRequest.getSession();
		session.setAttribute("product", product);
		return SUCCESS;
	}

	public String updateProduct() {
		TProduct product1 = (TProduct) productservice.findById(TProduct.class,
				proid);
		this.setPageNow(1);
		product.setPubdate(product1.getPubdate());
		stock.setProduct(product);
		product.setProid(proid);
		product.setStockid(stock);
		productservice.updateObject(product);
		return SUCCESS;
	}

	public ProductService getProductservice() {
		return productservice;
	}

	@Override
	public void setServletRequest(HttpServletRequest ServletRequest) {
		ServletRequest = this.servletRequest;
	}

	// 跳转到商品详情展示页面
	public String customershowdetail() throws Exception {
		TProduct product = productservice.getProductById(proid);

		// 获取session，不能放在构造函数或是类中，应该放在每个具体的方法中，这样才能保证每次产生对象时独立建立了一个req
		servletRequest = ServletActionContext.getRequest();
		session = servletRequest.getSession();
		session.setAttribute("product", product);

		return "success";
	}

	// 跳转到index页面
	public String goIndex() throws Exception {
		int pageSize = 15;
		servletRequest = ServletActionContext.getRequest();
		session = servletRequest.getSession();
		List<TProduct> products = productservice.queryProductByPage(pageSize,
				pageNow);
		int pageCount = productservice.getPageCount(pageSize);
		// 分页有的商品
		session.setAttribute("products", products);
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("pageNow", pageNow);

		return "success";
	}

	// 添加购物车
	public String addCart() throws Exception {
		// 获取session，不能放在构造函数或是类中，应该放在每个具体的方法中，这样才能保证每次产生对象时独立建立了一个req
		servletRequest = ServletActionContext.getRequest();
		session = servletRequest.getSession();

		// 接受用户购买数量
		int addquantity = Integer.parseInt(servletRequest
				.getParameter("addquantity"));

		TProduct product = (TProduct) session.getAttribute("product");
		System.out.println("添加到购物车商品名称：" + product.getProname());
		// 查询商品库存
		int quantity = product.getStockid().getQuantity(); // 当前库存,添加到购物车后需要考虑减少购物车中的数量，否则可以一直购买
		quantity = quantity - addquantity; // 购买后的库存
		System.out.println("购买后的库存量：" + quantity);

		/**
		 * 判断库存是否充足，库存充足进行添加到购物车session中
		 */
		if (quantity >= 0) {
			/*
			 * product.getStockid().setQuantity(quantity); //
			 * 逻辑上可能加入购物车不减少数量，等确定付款时在到数据库减少数量
			 * productservice.updateObject(product); // 更新数据库
			 */
			// 保存到session中
			// 使用HashMap保存
			HashMap<Integer, TCartProduct> cartProducts = (HashMap<Integer, TCartProduct>) servletRequest
					.getSession().getAttribute("cartProducts");
			if (cartProducts == null) {
				cartProducts = new LinkedHashMap<Integer, TCartProduct>();
				TCartProduct cartProduct = new TCartProduct();
				// cartProduct.set
				cartProduct.setProduct(product);
				cartProduct.setQuantity(addquantity);
				cartProduct.setTotalPrice(product.getMemberprice()
						* addquantity);

				cartProducts.put(product.getProid(), cartProduct);
				servletRequest.getSession().setAttribute("cartProducts",
						cartProducts);

			} else {
				// 判断是否存在商品
				if (cartProducts.containsKey(product.getProid())) {
					// 购买过此商品
					TCartProduct cartProduct = cartProducts.get(product
							.getProid());
					cartProduct.setQuantity(cartProduct.getQuantity()
							+ addquantity);
					cartProduct.setTotalPrice(cartProduct.getQuantity()
							* product.getMemberprice());
					// 不需要存入hashmap中，产品为引用，改变数量即可

				} else {
					// 未购买过次商品
					TCartProduct cartProduct = new TCartProduct();
					cartProduct.setProduct(product);
					cartProduct.setQuantity(addquantity);
					cartProduct.setTotalPrice(cartProduct.getQuantity()
							* product.getMemberprice());

					// 存入map
					cartProducts.put(product.getProid(), cartProduct);

				}
				// 存入session
				servletRequest.getSession().setAttribute("cartProducts",
						cartProducts);
			}

			// 计算购物车商品总数量
			// 商品总数量，需要遍历
			Iterator iter = cartProducts.entrySet().iterator();
			int cartQuantity = 0; // 购物商品总数量
			int cartCatalog = 0; // 购物车商品样数
			Double cartTotalPrice = 0.0; // 购物车商品总价
			while (iter.hasNext()) {
				Map.Entry entry = (Map.Entry) iter.next();
				Object key = entry.getKey();
				TCartProduct val = (TCartProduct) entry.getValue();
				cartQuantity = cartQuantity + val.getQuantity();
				cartCatalog += 1;
				cartTotalPrice = cartTotalPrice + val.getTotalPrice();
				System.out.println("-------名称：" + val.getProduct().getProname()
						+ "数量：" + val.getQuantity());
			}
			servletRequest.getSession().setAttribute("cartQuantity",
					cartQuantity); // 购物车商品总数量
			servletRequest.getSession()
					.setAttribute("cartCatalog", cartCatalog); // 购物车商品样数
			servletRequest.getSession().setAttribute("cartTotalPrice",
					cartTotalPrice); // 商品总价
			System.out.println("购物样数：" + cartCatalog);

			sendMsg("{'info':'ok','quantity':" + quantity + ",'cartQuantity':"
					+ cartQuantity + "}");
		} else {
			sendMsg("{'info':'quantitynotsufficient'}");
		}

		return null; // 要使用异步的返回值 需要return null
	}

	// 用户返回值到页面，ajax返回值
	public void sendMsg(String content) throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(content);
	}

	// 修改购物车
	public String modCart() throws Exception {
		System.out.println("删除--+++++");
		servletRequest = ServletActionContext.getRequest();
		session = servletRequest.getSession();
		String modMethod = servletRequest.getParameter("modMethod");
		Integer proid = Integer.parseInt(servletRequest.getParameter("proid"));

		// 取出cartProducts
		HashMap<Integer, TCartProduct> cartProducts = (HashMap<Integer, TCartProduct>) servletRequest
				.getSession().getAttribute("cartProducts");

		if ("add".equals(modMethod)) { // 增加
			System.out.println("修改方式：" + modMethod + "proid:" + proid);

			TCartProduct cartProduct = cartProducts.get(proid);
			cartProduct.setQuantity(cartProduct.getQuantity() + 1);
			cartProduct.setTotalPrice(cartProduct.getQuantity()
					* cartProduct.getProduct().getMemberprice());

		} else if ("reduce".equals(modMethod)) { // 减少
			System.out.println("删除-----------");
			System.out.println("修改方式：" + modMethod + "proid:" + proid);

			TCartProduct cartProduct = cartProducts.get(proid);
			cartProduct.setQuantity(cartProduct.getQuantity() - 1);
			cartProduct.setTotalPrice(cartProduct.getQuantity()
					* cartProduct.getProduct().getMemberprice());
		} else if ("delete".equals(modMethod)) { // 删除
			System.out.println("修改方式：" + modMethod + "proid:" + proid);
			cartProducts.remove(proid);
		} else if ("checked".equals(modMethod)) { // 选中商品
System.out.println("选中商品：" + proid);
			TCartProduct cartProuduct = cartProducts.get(proid);
			cartProuduct.setIsChecked(1);
		}
		// 存入session
		servletRequest.getSession().setAttribute("cartProducts", cartProducts);

		// 计算购物车商品总数量
		// 商品总数量，需要遍历
		Iterator iter = cartProducts.entrySet().iterator();
		int cartQuantity = 0; // 购物商品总数量
		int cartCatalog = 0; // 购物车商品样数
		Double cartTotalPrice = 0.0; // 购物车商品总价
		while (iter.hasNext()) {
			Map.Entry entry = (Map.Entry) iter.next();
			Object key = entry.getKey();
			TCartProduct val = (TCartProduct) entry.getValue();
			cartQuantity = cartQuantity + val.getQuantity();
			if (1 == val.getIsChecked()) {
				cartCatalog += 1;
				cartTotalPrice = cartTotalPrice + val.getTotalPrice();
			}
			System.out.println("-------名称：" + val.getProduct().getProname()
					+ "数量：" + val.getQuantity());
		}
		servletRequest.getSession().setAttribute("cartQuantity", cartQuantity); // 购物车商品总数量
		servletRequest.getSession().setAttribute("cartCatalog", cartCatalog); // 购物车商品样数
		servletRequest.getSession().setAttribute("cartTotalPrice",
				cartTotalPrice); // 商品总价

		return null;
	}
}
