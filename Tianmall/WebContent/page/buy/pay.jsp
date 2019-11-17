<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>pay.jsp</title>
   
	
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<style type="text/css">
body {
	font-size: 10pt;
	color: #404040;
}

.divContent {
	width: 880px;
	height: 100px;
	background-color: #efeae5;
	margin-left: 50px;
	line-height: 100px;
	color: #404040;
	border: 5px solid #efeae5;
}

.divBank {
	
	
	margin-left: 50px;
	margin-top: 20px;
}

.linkNext {
	background: url(img/icon2.png) no-repeat;
	display: inline-block;
	background-position: 0 -35px;
	height: 40px;
	width: 190px;
	margin: 0;
	text-align: center;
	text-decoration: none;
	font-size: 24px;
	font-weight: 900;
	color: #ffffff;
	line-height: 40px;
	font-family: 黑体;
}

.linkNext:HOVER {
	background: url(img/icon2.png) no-repeat;
	display: inline-block;
	background-position: 0 -75px;
	height: 40px;
	width: 190px;
	poorfish: expression(this.onclick = function jiesuan(){return true});
}


</style>
<script type="text/javascript">
$(function() {
	$("img").click(function() {
		$("#" + $(this).attr("name")).attr("checked", true);
	});
});
</script>
  </head>
  
  <body>
<div class="divContent">
	<span class="spanPrice">支付金额：</span><span class="price_t">&yen;${order.total }</span>
	<span class="spanOid">编号：${order.oid }</span>
</div>
<form action="<c:url value='/OrderServlet'/>" method="post" id="form1" target="_top">
<input type="hidden" name="method" value="confirm"/>
<div class="divBank">
	<div style="margin: 40px;">
		<a href="" class="linkNext">支付</a>
	</div>
</div>
</form>
  </body>
</html>
