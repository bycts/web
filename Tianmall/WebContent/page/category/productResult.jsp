<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<style>

.productResultPage img {
  
    height: 40%;
    width: 100%;
    margin-top: 30px;
   
}
div.productItem {
	width: 300px;
	height: 285px;
	border: 1px solid white;
	background-color: white;
	margin: 8px 4px;
	float: left;
	cursor: pointer;
	 margin-left: 200px;
}

div.productItem img {
    width: 230px;
    height: 168px;
   
}
div.productItem:hover {
	border: 1px solid #FFFFFF;
}
</style>

<div class="productResultPage">
	<img alt="" src="img/product.jpg">
	
	<c:forEach items="${products }" var="product">
		<div class="productResult" >

			<div class="productItem">
				<a href="/Tianmall/ProductServlet?method=load&bid=${product.bid}"><img src="img/big/${product.bigimg }"></a> <a
					class="productItemDescLink" href="/Tianmall/ProductServlet?method=load&bid=${product.bid}"> <span
					class="productItemDesc" style="font-size:15px" >${product.bname} </span>
				</a><a style="color:red;font-size:15px;margin-left:50px">￥</a> <span claproductss="productPrice" style="color:red;font-size:15px;">${product.promotionPrice }</span>
			</div>
		</div>
		</c:forEach>
</div>
<%--  <%@include file="pager.jsp"%> --%>