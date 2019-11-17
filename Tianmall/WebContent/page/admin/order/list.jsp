<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
  <head>
    <title>订单列表</title>
    <script type="text/javascript" src="<c:url value='/jsps/pager/pager.js'/>"></script>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <!-- <link href="css/order.css" rel="stylesheet"> -->
  </head>
  <style>
table {
	font-family: 宋体;
	font-size: 11pt;
	border-color: rgb(78, 78, 78);
	width: 60%;
}

.tit {
    height:25px;
	background: rgb(238, 64, 64);
	color: #fff;
}
.listDataTableDiv{
width:90%;
margin-left:50px;
margin-top:50px;
}
.label-info{
background-color:#5bc0de
}
.label{
display:inline;
padding:.2em .6em .3em;
font-size:13px;
font-weight:700;
line-height:1;
color:#fff;
text-align:center;
white-space:nowrap;
vertical-align:baseline;
border-radius:.25em;
margin-left:10px;
}

  </style>
  
  <body>
   <h1 class="label label-info">订单管理</h1>
<%-- <div class="divMain">
	<div class="title">
		<div class="tit">
			<span style="margin-left: 150px;margin-right:180px;">商品信息</span>
			<span style="margin-left: 40px;margin-right: 100px;">金额</span>
			<span style="margin-left: 80px;margin-right: 53px;">订单状态</span>
			<span style="margin-left: 20px;">操作</span>
		</div>
	</div>
	<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" class="table">
<c:forEach items="${pb }" var="order">	
	
		<tr class="tt">
			<td width="320px">订单号：<a  href="/Tianmall/AdminOrderServlet?method=load&oid=${order.oid }">${order.oid }</a></td>
			<td width="213px">下单时间：${order.ordertime }</td>
			<td width="178px">&nbsp;</td>
			<td width="205px">&nbsp;</td>
			<td>&nbsp;</td>
		</tr>	

		<tr style="padding-top: 10px; padding-bottom: 10px;">
			<td colspan="2">


  <c:forEach items="${order.orderItemList }" var="orderItem">
	    <img border="0" width="70" src="<c:url value='/${orderItem.product.bigimg }'/>"/>
  </c:forEach>

			</td>
			<td style="padding-left: 0">
				<span class="price_t">&yen;${order.total }</span>
			</td>
			<td>
<c:choose>
	<c:when test="${order.status eq 1 }">(等待付款)</c:when>
	<c:when test="${order.status eq 2 }">(准备发货)</c:when>
	<c:when test="${order.status eq 3 }">(等待确认)</c:when>
	<c:when test="${order.status eq 4 }">(交易成功)</c:when>
	<c:when test="${order.status eq 5 }">(已取消)</c:when>
</c:choose>	
			</td>
						
			<td >

	

<c:if test="${order.status eq 1  }">
    <button class="cancel" onclick="cancelOrder(this)" name="${order.oid }">取消</button>
	 <a id="cancel" href="<c:url value='/AdminOrderServlet?method=cancel&oid=${order.oid }'/>">取消</a> 
</c:if>	
	
<c:if test="${order.status eq 2  }">
	<a id="deliver" href="<c:url value='/AdminOrderServlet?method=deliver&oid=${order.oid }'/>">发货</a>
</c:if>

			</td>
		</tr>
</c:forEach>

	</table>
	<br/>
</div>
 --%>



<div class="listDataTableDiv">
		<table class="table table-striped table-bordered table-hover  table-condensed">
			<thead>
				<tr class="success">
					<th>订单号</th>
					<th>图片</th>
					<th></th>
					 <th>下单时间</th>
					<th>总计</th>
					<th>订单状态</th>
					<th>操作</th> 
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pb }" var="order">
				<tr>
				
					<td><a>${order.oid }</a></td>
					
					<td colspan="2">
                                 <c:forEach items="${order.orderItemList }" var="orderItem">
                                
	                                 <img border="0" width="70" src="img/big/${orderItem.product.bigimg }"/>
                                    </c:forEach>
                         </td>
                         
   <td >${order.ordertime }</td>
       <td style="padding-left: 0">
				<span class="price_t">&yen;${order.total }</span>
			    </td>
					 	
				<td>
<c:choose>
	<c:when test="${order.status eq 1 }">(等待付款)</c:when>
	<c:when test="${order.status eq 2 }">(准备发货)</c:when>
	<c:when test="${order.status eq 3 }">(等待确认)</c:when>
	<c:when test="${order.status eq 4 }">(交易成功)</c:when>
	<c:when test="${order.status eq 5 }">(已取消)</c:when>
</c:choose>	
			</td>
	
		<td >

	

<c:if test="${order.status eq 1  }">
	 <a id="cancel" href="<c:url value='/AdminOrderServlet?method=cancel&oid=${order.oid }'/>">取消</a> 
</c:if>	
	
<c:if test="${order.status eq 2  }">
	<a id="deliver" href="<c:url value='/AdminOrderServlet?method=deliver&oid=${order.oid }'/>">发货</a>
</c:if>

			</td> 
	
	
				</tr>
				
			</c:forEach>
			</tbody>
		</table>
	</div>





  </body>
</html>
