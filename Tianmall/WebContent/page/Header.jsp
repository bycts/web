<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<title>header</title>
</head>
<style>
</style>
<body>
	<nav class="top">
		<a href="shouye.jsp"> <span style="color: #C40000; margin: 0px"
			class=" glyphicon glyphicon-home redColor"></span>Tianmall首页
		</a> <span>欢迎来Tianmall</span>

		<!-- 做出登陆后有实时的用户名，退出功能，购物车件数 -->
		<a href="login.jsp"> </a> <a href="/Tianmall/UserServlet?method=quit">退出</a>
		<c:choose>
			<c:when test="${empty sessionScope.sessionUser }">
				<a href="login.jsp">请登录</a>
				<a href="register.jsp">免费注册</a>
			</c:when>
		</c:choose>

		<span class="pull-right"> <a href="/Tianmall/OrderServlet?method=myOrders">我的订单</a> <a
			href="/Tianmall/CartItemServlet?method=myCart"> <span style="color: #C40000; margin: 0px"
				class=" glyphicon glyphicon-shopping-cart redColor"></span> 我的购物车
		</a>
		</span>

	</nav>
</body>
</html>