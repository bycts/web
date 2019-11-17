package ccit.byc.tamall.servlet;

import cn.itcast.servlet.BaseServlet;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ccit.byc.tamall.admain.Category;
import ccit.byc.tamall.service.CategoryService;

/**
 * 
 * 分类模块web层
 *
 */
@SuppressWarnings("serial")
@WebServlet("/CategoryServlet")
public class CategoryServlet extends BaseServlet {
	private CategoryService categoryService = new CategoryService();

	public String findAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * 1. 通过service得到所有的分类 2. 保存到request中，转发到
		 */

		List<Category> parents = categoryService.findAll();
		req.setAttribute("parents", parents);
		return "f:/page/home/categoryMenu.jsp";

	}
}
