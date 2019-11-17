package ccit.byc.tamall.servlet;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ccit.byc.tamall.admain.Admin;
import ccit.byc.tamall.service.AdminService;

@SuppressWarnings("serial")
@WebServlet("/AdminServlet")
public class AdminServlet extends BaseServlet {
private AdminService adminService=new AdminService();
	
	public String login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*封装表单数据到admin
		*/
	
		Admin from=CommonUtils.toBean(req.getParameterMap(), Admin.class);
		Admin admin=adminService.login(from);
		if (admin==null) {
			req.setAttribute("msg", "用户名或密码错误！");
			return "f:/admin.jsp";
			
		}
		System.out.println(from+"11111");
		req.getSession().setAttribute("admin", admin);
		return "f:/productlist.jsp";
		
	}

}
