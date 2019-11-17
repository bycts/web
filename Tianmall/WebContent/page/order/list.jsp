<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>订单列表</title>
  
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/order/list.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/pager/pager.css'/>" />
    <script type="text/javascript" src="<c:url value='/jsps/pager/pager.js'/>"></script>
  </head>
  <style>
  .divMain{
  margin-left:300px;
  margin-Top:30px;
   }
  
  .tt {
	height: 25px;
	font-family: Arial;
	color: #878787;
}
  .divTitle {
	border: 1px solid #d0d0d0;
	background-position: 0 -132px;
	margin-left: 2px;
	height: 30px;
	width: 99.8%;
	line-height: 30px;
}
  .divBody {
	background: url(img/paginating_bg.png) repeat-x;
	border-top: 2px solid #FE7C2C;
	height: 35px;
	width: 100%;
	text-align: right;
}
.aSubmit:HOVER {
	border: 1px solid #c1c1c1;
	padding:1px 4px 1px 4px;
	color: #555555;
	background: url(img/qd.png) repeat-x;
}
  
  </style>
  <body>
<div class="divMain">
	<div class="divTitle">
		<span style="margin-left: 150px;margin-right: 280px;">商品信息</span>
		<span style="margin-left: 40px;margin-right: 38px;">金额</span>
		<span style="margin-left: 50px;margin-right: 40px;">订单状态</span>
		<span style="margin-left: 50px;margin-right: 50px;">操作</span>
	</div>
	<br/>
	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">

<c:forEach items="${pb }" var="order">

		<tr class="tt">
			<td width="320px">订单号：<a  href="<c:url value='/OrderServlet?method=load&oid=${order.oid }'/>">${order.oid }</a></td>
			<td width="200px">下单时间：${order.ordertime }</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr style="padding-top: 10px; padding-bottom: 10px;background-color: #FCFCFC;">
			<td colspan="2">


  <c:forEach items="${order.orderItemList }" var="orderItem">
	<a class="link2" href="/Tianmall/ProductServlet?method=load&bid=${orderItem.product.bid }">
	    <img border="0" width="70" src="img/big/${orderItem.product.bigimg }"/>
	</a>
  </c:forEach>
	



			</td>
			<td width="115px">
				<span class="price_t">&yen;${order.total }</span>
			</td>
			<td width="142px">
<c:choose>
	<c:when test="${order.status eq 1 }">(等待付款)</c:when>
	<c:when test="${order.status eq 2 }">(准备发货)</c:when>
	<c:when test="${order.status eq 3 }">(等待确认)</c:when>
	<c:when test="${order.status eq 4 }">(交易成功)</c:when>
	<c:when test="${order.status eq 5 }">(已取消)</c:when>
</c:choose>			

			</td>
			<td>
			<a href="<c:url value='/OrderServlet?method=load&oid=${order.oid }'/>">查看</a><br/>
<c:if test="${order.status eq 1 }">
				<a href="<c:url value='/OrderServlet?method=paymentPre&oid=${order.oid }'/>">支付</a><br/>
				<a href="<c:url value='/OrderServlet?method=load&oid=${order.oid }&btn=cancel'/>">取消</a><br/>						
</c:if>
<c:if test="${order.status eq 3 }">
				<a href="<c:url value='/OrderServlet?method=load&oid=${order.oid }&btn=confirm'/>">确认收货</a><br/>
</c:if>
			</td>
		</tr>
</c:forEach> 



	</table>
	<br/>
	
</div>
  </body>
</html>
