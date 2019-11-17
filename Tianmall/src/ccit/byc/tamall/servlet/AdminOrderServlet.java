package ccit.byc.tamall.servlet;

import cn.itcast.servlet.BaseServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ccit.byc.tamall.admain.Order;
import ccit.byc.tamall.admain.User;
import ccit.byc.tamall.service.OrderService;

@WebServlet("/AdminOrderServlet")
public class AdminOrderServlet extends BaseServlet {
	private OrderService orderService=new OrderService();

	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		/*
		 * 4. 使用pc和cid调用service#findByCategory得到PageBean
		 */
		List<Order> pb = orderService.findAll();
		System.out.println(pb);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
		 */
		req.setAttribute("pb", pb);
		//return "f:/page/admin/order/list.jsp";
		return "f:/orderlist.jsp";
		
	}
	
	
	
	/**
	 * 查看订单详细信息
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String load(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid = req.getParameter("oid");
		Order order = orderService.load(oid);
		req.setAttribute("order", order);
		String btn = req.getParameter("btn");
		req.setAttribute("btn", btn);
		return "/page/admin/order/list.jsp";
	}
	
	
	
	public String cancel(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid = req.getParameter("oid");
		/*
		 * 校验订单状态
		 */
		int status = orderService.findStatus(oid);
		if(status != 1) {
			req.setAttribute("code", "error");
			req.setAttribute("msg", "状态不对，不能取消！");
			return "/page/admin/order/msg.jsp";
		}
		orderService.updateStatus(oid, 5);//设置状态为取消！
		req.setAttribute("code", "success");
		req.setAttribute("msg", "您的订单已取消");
		return "/page/admin/order/msg.jsp";		
	}
	
	
	
	
	
	public String deliver(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid = req.getParameter("oid");
		/*
		 * 校验订单状态
		 */
		int status = orderService.findStatus(oid);
		if(status !=2) {
			req.setAttribute("msg", "状态不对，不能发货！");
			return "/page/admin/order/msg.jsp";	
		}
		orderService.updateStatus(oid, 4);
		req.setAttribute("msg", "您的订单已发货");
		return "/page/admin/order/msg.jsp";			
	}
}

