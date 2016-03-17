package com.alcoholsale.web.struts2.action;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

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
	private HttpServletRequest ServletRequest;
	private HttpSession session;
	private int proid;
	private  File[] myfile;
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
	public String queryall(){
		List<TProduct> lst=productservice.queryProduct(pageSize, pageNow);
		List<TProduct> lstcount = productservice.queryProduct(0, 0);
		ServletRequest=ServletActionContext.getRequest();
		session = ServletRequest.getSession();
		if(lst.size()>0)
		session.setAttribute("allproduct", lst);
		session.setAttribute("productcount",  (lstcount.size()-1)/pageSize+1);
		session.setAttribute("pageNow", pageNow);
		return "success";
	}
	
	public String addproductUi(){
		return "success";
	}
	public String addproduct() throws Exception{
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		Date pubdate=sdf.parse(sdf.format(date));
		product.setPubdate(pubdate);
		product.setImage(myfileFileName[0]);
		productservice.saveObject(stock);
		product.setStockid(stock);
		productservice.saveObject(product);
		//获取当前需要保存的文件路径
		String path=ServletActionContext.getServletContext().getRealPath("myfile").toString();
		System.out.println(path);
		File file=new File(path);
	    if(!file.exists())
		file.mkdirs();
	    for(int i=0;i<myfile.length;i++){
	    	File file2=new File(file,myfileFileName[i]);
	    	FileUtils.copyFile(myfile[i], file2);
	    	productservice.saveObject(new TImage(myfileFileName[i],product));
	    }
		this.setPageNow(1);
		return SUCCESS;
	}
	public String deleteproduct(){
		TProduct product = (TProduct) productservice.findById(TProduct.class, proid);
		this.setPageNow(1);
		productservice.deleteObject(product);
		return SUCCESS;
	}
	public String findproduct(){
		TProduct product = (TProduct) productservice.findById(TProduct.class, proid);
		ServletRequest=ServletActionContext.getRequest();
		session = ServletRequest.getSession();
		session.setAttribute("product", product);
		return SUCCESS;
	}
	public String updateProduct(){
		TProduct product1 = (TProduct) productservice.findById(TProduct.class, proid);
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
		ServletRequest=this.ServletRequest;
	}
	
	// 跳转到商品详情展示页面
	public String customershowdetail() throws Exception{
		return "success";
	}
}
