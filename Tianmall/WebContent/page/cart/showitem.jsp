<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<html>
  <head>
    <title>showitem.jsp</title>
    

	<link rel="stylesheet" type="text/css" href="<c:url value='css/cart/showitem.css'/>">
	<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script src="<c:url value='/js/round.js'/>"></script>
<style type="text/css">
#addr {
	width: 500px;
	height: 32px;
	border: 1px solid #7f9db9;
	padding-left: 10px;
	line-height: 32px;
}

#linkSubmit {
	background: url(img/icon2.png) no-repeat;
	display: inline-block;
	background-position: 0px -35px;
	height: 40px;
	width: 190px;
	text-align: center;
	text-decoration: none;
	font-size: 24px;
	font-weight: 900;
	color: #ffffff;
	font-family: 黑体;
	line-height: 40px;
}

#linkSubmit:HOVER {
	background: url(img/icon2.png) no-repeat;
	display: inline-block;
	background-position: 0px -75px;
	height: 40px;
	width: 190px;
}

a {
	text-decoration: none;
	color: #018BD3;
}
</style>

<script type="text/javascript">
	//计算合计
	$(function() {
		var total = 0;
		$(".subtotal").each(function() {
			total += Number($(this).text());
		});
		$("#total").text(round(total, 2));
	});
</script>
  </head>
  
  <body>
  <c:choose>
  	<c:when test="${empty cartItemList }">嘻嘻~</c:when>
  	<c:otherwise> 
<form id="form1" action="<c:url value='/OrderServlet'/>" method="post">
	<input type="hidden" name="cartItemIds" value="${cartItemIds }"/>
	<input type="hidden" name="method" value="createOrder"/>
<table width="95%" align="center" cellpadding="0" cellspacing="0">
	<tr bgcolor="#efeae5">
		<td width="400px" colspan="5"><span style="font-weight: 900;">生成订单</span></td>
	</tr>
	<tr align="center">
		<td width="10%">&nbsp;</td>
		<td width="50%">商品名称</td>
		<td>单价</td>
		<td>数量</td>
		<td>小计</td>
	</tr>


<c:forEach items="${cartItemList }" var="cartItem">
	<tr align="center">
		<td align="right">
			<a class="linkImage" href="/Tianmall/ProductServlet?method=load&bid=${cartItem.product.bid }"><img border="0" width="54" align="top" src="img/big/${cartItem.product.bigimg }"/></a>
		</td>
		<td align="left">
			<a href="/Tianmall/ProductServlet?method=load&bid=${cartItem.product.bid }"><span>${cartItem.product.bname }</span></a>
		</td>
		<td>&yen;${cartItem.product.originalPrice }</td>
		<td>${cartItem.quantity }</td>
		<td>
			<span class="price_n">&yen;<span class="subtotal">${cartItem.subtotal }</span></span>
		</td>
	</tr>
</c:forEach>
	
	
	







	<tr>
		<td colspan="6" align="right">
			<span>总计：</span><span class="price_t">&yen;<span id="total">${total }</span></span>
		</td>
	</tr>
	<tr>
		<td colspan="5" bgcolor="#efeae5"><span style="font-weight: 900">收货地址</span></td>
	</tr>
	<tr>
		<td colspan="6">
			<input id="addr" type="text" name="address" value="合肥市 庐江县 国安村 9号603"/>
		</td>
	</tr>
	<tr>
		<td style="border-top-width: 4px;" colspan="5" align="right">
			<a id="linkSubmit" href="javascript:$('#form1').submit();">提交订单</a>
		</td>
	</tr>
</table>
</form>
  	 </c:otherwise>
  </c:choose> 
  </body>
</html>
