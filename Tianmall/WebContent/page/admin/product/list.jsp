<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>分类列表</title>
  </head>
  <style>
table {
	font-family: 宋体;
	font-size: 11pt;
	border-color: rgb(78, 78, 78);
	width: 60%;
}

td {
	padding: 6px;
}

.trTitle {
	 height:27px;
	background: rgb(238, 64, 64);
	color: #fff;
}

.trOneLevel {
	background-color: #fff;
	font-weight: 900;
}

.captionAddOneLevel {
	line-height: 30px;
}

.trTwoLevel {
	text-align: right;
	font-size: 10pt;
}

a {
	text-decoration: none;
	color: #018BD3;
}

a:visited {
	color: #018BD3;
}

a:hover {
	color: #FF6600;
	text-decoration: underline;
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
    <h1 class="label label-info">商品管理</h1>
    <table align="center" border="1" cellpadding="0" cellspacing="0">
    	<tr class="trTitle">
    		<th>id</th>
    		<th>商品名称</th>
    		<th>标题</th>
    		<th>价格</th>
    		<th>标价</th>
    		<th>销量</th>
    		<th>评论</th>
    		<th>大图</th>
    		<th>操作</th>
    	</tr>
 <c:forEach items="${products }" var="product">   	
    	<tr class="trOneLevel" >
    		<td width="200px;">${product.bid }</td>
    		<td width="600px;">${product.bname }</td>
    	    <td width="400px;">${product.ptitle }</td>
    		<td width="200px;">${product.originalPrice }</td>
    		<td width="200px;">${product.promotionPrice }</td>
    		<td width="200px;">${product.xiaoliang }</td>
    		<td width="200px;">${product.pinglun }</td>
    		<td width="200px;"><img border="0" width="70"src="img/big/${product.bigimg }"/></td>	
    		<td width="300px;">
    		  <a href="/Tianmall/AdminProductServlet?method=addPre">添加商品</a><br>
    		  <a href="<c:url value='/AdminProductServlet?method=load&bid=${product.bid }'/>">修改商品</a><br>
    		  <a onclick="return confirm('您是否真要删除该商品？')" href="<c:url value='/AdminProductServlet?method=delete&bid=${product.bid }'/>">删除商品</a>
    		</td>
    	</tr>
</c:forEach>


    </table>
  </body>
</html>
