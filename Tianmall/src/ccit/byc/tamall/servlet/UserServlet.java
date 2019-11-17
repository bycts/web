package ccit.byc.tamall.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ccit.byc.tamall.admain.Category;
import ccit.byc.tamall.admain.User;
import ccit.byc.tamall.service.UserService;
import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

@SuppressWarnings("serial")
@WebServlet("/UserServlet")
public class UserServlet extends BaseServlet {
	private UserService userService = new UserService();

	public String regist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 封装表单数据到User对象中
		 */
		User formUser = CommonUtils.toBean(request.getParameterMap(), User.class);
		/*
		 * 2. 校验之, 如果校验失败，保存错误信息，返回到regist.jsp显示
		 */
		Map<String, String> errors = validateRegist(formUser, request.getSession());
		if (errors.size() > 0) {
			request.setAttribute("form", formUser);
			request.setAttribute("errors", errors);
			return "f:/register.jsp";
		}

		/*
		 * 3. 使用service完成业务
		 */
		userService.regist(formUser);
		/*
		 * 4. 保存成功信息，转发到msg.jsp显示！
		 */
		request.setAttribute("code", "success");
		request.setAttribute("msg", "注册成功！");
		return "f:/registersucess.jsp";
	}

	/**
	 * 注册校验
	 * 
	 * @param formUser
	 * @return
	 */
	private Map<String, String> validateRegist(User formUser, HttpSession session) {
		Map<String, String> errors = new HashMap<String, String>();
		/*
		 * 1. 校验登录名
		 */
		String loginname = formUser.getLoginname();
		if (loginname == null || loginname.trim().isEmpty()) {
			errors.put("loginname", "用户名不能为空！");
		}
		/*
		 * 2. 校验登录密码
		 */
		String loginpass = formUser.getLoginpass();
		if (loginpass == null || loginpass.trim().isEmpty()) {
			errors.put("loginpass", "密码不能为空！");
		}

		/*
		 * 3. 确认密码校验
		 */
		String reloginpass = formUser.getReloginpass();
		if (reloginpass == null || reloginpass.trim().isEmpty()) {
			errors.put("reloginpass", "确认密码不能为空！");
		} else if (!reloginpass.equals(loginpass)) {
			errors.put("reloginpass", "两次输入不一致！");
		}
		return errors;

	}

	/**
	 * ajax用户名是否注册校验
	 * 
	 * @param requst
	 * @param response
	 * @return
	 * @throws Exception
	 */
	
	  public String ajaxVaildatename(HttpServletRequest request,
	  HttpServletResponse response) throws Exception {
	  String loginname = request.getParameter("name");
	 boolean b = userService.ajaxVaildatename(loginname);
	 
	 /**
		 * 3. 发给客户端
		 */
			 response.getWriter().print(b); 
			 
			 return null;
			 
			  }
			 

	/**
	 * 登录功能
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String loginpass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * 1. 封装表单数据到User 2. 校验表单数据 3. 使用service查询，得到User 4. 查看用户是否存在，如果不存在： *
		 * 保存错误信息：用户名或密码错误 * 保存用户数据：为了回显 * 转发到login.jsp 5. 如果存在，查看状态，如果状态为false： *
		 * 保存错误信息：您没有激活 * 保存表单数据：为了回显 * 转发到login.jsp 6. 登录成功： * 保存当前查询出的user到session中 *
		 * 保存当前用户的名称到cookie中，注意中文需要编码处理。
		 */
		/*
		 * 1. 封装表单数据到user
		 */
		User formUser = CommonUtils.toBean(req.getParameterMap(), User.class);
		/*
		 * 2. 校验
		 */
		Map<String, String> errors = validateLogin(formUser, req.getSession());
		if (errors.size() > 0) {
			req.setAttribute("form", formUser);
			req.setAttribute("errors", errors);
			return "f:/login.jsp";
		}

		/*
		 * 3. 调用userService#login()方法
		 */
		User user = userService.login(formUser);
		/*
		 * 4. 开始判断
		 */
		if (user == null) {
			req.setAttribute("user", formUser);
			return "f:/login.jsp";
		} else {
			// 保存用户到session
			req.getSession().setAttribute("sessionUser", user);
			// 获取用户名保存到cookie中
			String loginname = user.getLoginname();
			loginname = URLEncoder.encode(loginname, "utf-8");
			Cookie cookie = new Cookie("loginname", loginname);
			cookie.setMaxAge(60 * 60 * 24 * 10);// 保存10天
			resp.addCookie(cookie);			
			return "r:/shouye.jsp";// 重定向到主页
		}

	}

	/*
	 * 登录校验方法，内容等你自己来完成
	 */
	private Map<String, String> validateLogin(User formUser, HttpSession session) {
		Map<String, String> errors = new HashMap<String, String>();
		/*
		 * 1. 校验登录名
		 */
		String loginname = formUser.getLoginname();
		if (loginname == null || loginname.trim().isEmpty()) {
			errors.put("loginname", "用户名不能为空！");
		}
		/*
		 * 2. 校验登录密码
		 */
		String loginpass = formUser.getLoginpass();
		if (loginpass == null || loginpass.trim().isEmpty()) {
			errors.put("loginpass", "密码不能为空！");
		}
		return errors;
	}

	/**
	 * 退出功能
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String quit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().invalidate();
		return "r:/login.jsp";

	}
	
	
	public String findAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		List<User> users = userService.findAll();
		req.setAttribute("users", users);
		return "f:/page/admin/user/list.jsp";
	}
	
	
public String updateStatus(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

	String code = req.getParameter("activationCode");
	try {
		userService.updateStatus(code);
		req.setAttribute("code", "success");//通知msg.jsp显示对号
	} catch (Exception e) {
		
		req.setAttribute("msg", e.getMessage());
		req.setAttribute("code", "error");
	}
	return "f:/page/loginPage.jsp";
}
	}
	
