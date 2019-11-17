package ccit.byc.tamall.servlet;

import cn.itcast.servlet.BaseServlet;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ccit.byc.tamall.admain.PageResult;
import ccit.byc.tamall.admain.Product;
import ccit.byc.tamall.service.ProductService;

@SuppressWarnings("serial")
@WebServlet("/ProductServlet")
public class ProductServlet extends BaseServlet {
	private ProductService productService = new ProductService();

	public String findByCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cid = request.getParameter("cid");
		List<Product> products = productService.findByCategory(cid);
		request.setAttribute("products", products);
		return "f:/searchResult.jsp";
	}

	/**
	 * 按bid查询
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String load(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bid = req.getParameter("bid");// 获取链接的参数bid
		Product product = productService.load(bid);// 通过bid得到book对象
		req.setAttribute("product", product);// 保存到req中
		return "f:/gowuche.jsp";// 转发到
	}

	public String findByBname(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String bname = request.getParameter("bname");
		bname = "零食";
		/*
		 * String bname=new String(str.getBytes("UTF-8"),"gb2312"); String bname = new
		 * String(str.getBytes("iso-8859-1"), "utf-8"); bname = "装";
		 */
		List<Product> products = productService.findByBname(bname);
		request.setAttribute("products", products);
		return "f:/searchResult.jsp";
	}
	
	/*public String findBname(HttpServletRequest request, HttpServletResponse response) {
		String bname = request.getParameter("bname");
		List<Product> products = productService.findByBname(bname);
		request.setAttribute("products", products);
		return "f:/searchResult.jsp";
		
	}*/
	public String findByPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 String cid = request.getParameter("cid");//分类
		 String page = request.getParameter("page");//显示页数
		 
		 //2.判断
		 int currentPage = 1;
		 int pageCount = 5;//每页显示6条数据,这个内部定义，不让外面传参数
		 if(page != null){
			 currentPage = Integer.parseInt(page);
		 }
		 //3.调用service
		 PageResult<Product> products = productService.findPageProducts(currentPage, pageCount, cid);
		 System.out.println(products +"11111");
		 
		 //4.跳转
		 request.setAttribute("products",products);
		 request.setAttribute("cid", cid);	
		 return "f:/searchResult.jsp";
	}
}

