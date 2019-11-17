package ccit.byc.tamall.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ccit.byc.tamall.admain.Admin;
import ccit.byc.tamall.admain.Category;
import ccit.byc.tamall.admain.User;
import ccit.byc.tamall.service.CategoryService;
import ccit.byc.tamall.service.ProductService;
import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

@SuppressWarnings("serial")
@WebServlet("/AdminCategoryServlet")
public class AdminCategoryServlet extends BaseServlet {
	private CategoryService categoryService = new CategoryService();
	private ProductService productService = new ProductService(); 
	
	/**
	 * 查询所有分类
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setAttribute("parents", categoryService.findAll());
		return "f:categorylist.jsp";
	}
	
	/**
	 * 添加分类
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String add(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 封装表单数据到Category中
		 * 2. 调用service的add()方法完成添加
		 * 3. 调用findAll()，返回list.jsp显示所有分类
		 */
		Category parent = CommonUtils.toBean(req.getParameterMap(), Category.class);
		parent.setCid(CommonUtils.uuid());//设置cid
		categoryService.add(parent);
		return findAll(req, resp);
	}
	
	
	/**
	 * 修改分类：第一步
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String editPre(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 获取链接中的cid
		 * 2. 使用cid加载Category
		 * 3. 保存Category
		 * 4. 转发到edit.jsp页面显示Category
		 */
		String cid = req.getParameter("cid");
		Category parent = categoryService.load(cid);
		req.setAttribute("parent", parent);
		return "f:/page/admin/category/edit.jsp";
	}
	
	/**
	 * 修改分类：第二步
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String edit(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		 * 1. 封装表单数据到Category中
		 * 2. 调用service方法完成修改
		 * 3. 转发到list.jsp显示所有分类（return findAll();）
		 */
		Category parent = CommonUtils.toBean(req.getParameterMap(), Category.class);
		categoryService.edit(parent);
		return findAll(req, resp);
	}
	
	
	
	public String delete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		    String cid = req.getParameter("cid");
			categoryService.delete(cid);
			return findAll(req, resp);
		
	}
	
	
}
	
