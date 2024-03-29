<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单详细</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/order/desc.css'/>">
  </head>
  <style>
  #confirm {
	background: url(img/confirm.jpg) no-repeat;
	display: inline-block;
	height: 34px;
	width: 142px;
	font-size: 20px;
	font-weight: 900;
	color: #fff;
	text-align: left;
	padding-top: 6px;
	padding-left: 30px;
}

#cancel {
	background: url(img/hei_1_btn.jpg) no-repeat;
	display: inline-block;
	height: 34px;
	width: 142px;
	font-size: 20px;
	font-weight: 900;
	color: #fff;
	text-align: left;
	padding-top: 6px;
	padding-left: 30px;
}
.pay {
	background: url(img/sprites_orderdetails.gif)
		no-repeat;
	display: inline-block;
	background-position: 0 -200px;
	height: 34px;
	width: 142px;
	margin-top: 10px;
}
  
  </style>
<body>
	<div class="divOrder">
		<span>订单号：${order.oid }
<c:choose>
	<c:when test="${order.status eq 1 }">(等待付款)</c:when>
	<c:when test="${order.status eq 2 }">(准备发货)</c:when>
	<c:when test="${order.status eq 3 }">(等待确认)</c:when>
	<c:when test="${order.status eq 4 }">(交易成功)</c:when>
	<c:when test="${order.status eq 5 }">(已取消)</c:when>
</c:choose>	
		　　　下单时间：${order.ordertime }</span>
	</div>
	<div class="divContent">
		<div class="div2">
			<dl>
				<dt>收货人信息</dt>
				<dd>${order.address }</dd>
			</dl>
		</div>
		<div class="div2">
			<dl>
				<dt>商品清单</dt>
				<dd>
					<table cellpadding="0" cellspacing="0">
						<tr>
							<th class="tt">商品名称</th>
							<th class="tt" align="left">单价</th>
							<th class="tt" align="left">数量</th>
							<th class="tt" align="left">小计</th>
						</tr>


<c:forEach items="${order.orderItemList }" var="item">
						<tr style="padding-top: 20px; padding-bottom: 20px;">
							<td class="td" width="400px">
								<div class="bookname">
								  <img align="middle" width="70" src="img/big/${item.product.bigimg }"/>
								  <a href="<c:url value='/ProductServlet?method=load&bid=${item.product.bid }'/>">${item.product.bname }</a>
								</div>
							</td>
							<td class="td" >
								<span>&yen;${item.product.originalPrice }</span>
							</td>
							<td class="td">
								<span>${item.quantity }</span>
							</td>
							<td class="td">
								<span>&yen;${item.subtotal }</span>
							</td>			
						</tr>
</c:forEach>


					</table>
				</dd>
			</dl>
		</div>
		<div style="margin: 10px 10px 10px 550px;">
			<span style="font-weight: 900; font-size: 15px;">合计金额：</span>
			<span class="price_t">&yen;${order.total }</span><br/>
<c:if test="${order.status eq 1 }">
	<a href="<c:url value='/OrderServlet?method=paymentPre&oid=${order.oid }'/>" class="pay"></a><br/>
</c:if>
<c:if test="${order.status eq 1 and btn eq 'cancel'}">
    <a id="cancel" href="<c:url value='/OrderServlet?method=cancel&oid=${order.oid }'/>">取消订单</a><br/>
</c:if>
<c:if test="${order.status eq 3 and btn eq 'confirm'}">
	<a id="confirm" href="<c:url value='/OrderServlet?method=confirm&oid=${order.oid }'/>">确认收货</a><br/>
</c:if>	
		</div>
	</div>
</body>
</html>

