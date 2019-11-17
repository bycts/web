package ccit.byc.tamall.servlet;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ccit.byc.tamall.admain.Category;
import ccit.byc.tamall.admain.Product;
import ccit.byc.tamall.service.CategoryService;
import ccit.byc.tamall.service.ProductService;

@WebServlet("/AdminProductServlet")
public class AdminProductServlet extends BaseServlet {
	private ProductService productService=new ProductService();
	private CategoryService  categoryService = new CategoryService();
	
	/**
	 * 显示所有分类
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid=request.getParameter("cid");
		List<Product> products=productService.findByCategory(cid);
		request.setAttribute("products", products);
		return "f:/productlist.jsp";
		
	}
	
	
	
	
	public String add(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Map map = req.getParameterMap();
		Product product = CommonUtils.toBean(map, Product.class);
		Category category = CommonUtils.toBean(map, Category.class);
		product.setCategory(category);
		
		productService.add(product);
		req.setAttribute("msg", "添加商品成功");

		return "f:/page/adminmsg.jsp";
		
		
	}
	
	
	public String addPre(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		List<Category> parents = categoryService.findParents();
		req.setAttribute("parents", parents);
		return "f:/page/admin/product/add.jsp";
	}

	
	
	public String delete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String bid = req.getParameter("bid");
		productService.delete(bid);
		req.setAttribute("msg", "删除商品成功！");
		return "f:/page/adminmsg.jsp";
	}
	
	/**
	 * 
	 * 加载商品
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String load(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 获取bid，得到product对象，保存之
		 */
		String bid = req.getParameter("bid");
		Product product = productService.load(bid);
		req.setAttribute("product", product);
		
		/*
		 * 2. 获取所有一级分类，保存之
		 */
		req.setAttribute("parents", categoryService.findParents());
		
		
		return "f:/page/admin/product/edit.jsp";
	}
	
	
	
	public String edit(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		 
		Map map = req.getParameterMap();
		Product product = CommonUtils.toBean(map, Product.class);
		Category category = CommonUtils.toBean(map, Category.class);
		product.setCategory(category);
		
		productService.edit(product);
		System.out.println(product);
		req.setAttribute("msg", "修改商品成功！");
		return "f:/page/adminmsg.jsp";
	}
	
}
