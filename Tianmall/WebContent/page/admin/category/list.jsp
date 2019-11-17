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
	padding:7px;
}

.trTitle {
	background: rgb(238, 64, 64);
	color: #fff;
}
th {
    padding: 7px;
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
    <h1 class="label label-info">分类管理</h1>
    <table align="center" border="1" cellpadding="0" cellspacing="0">
    	<tr class="trTitle">
    		<th>分类名称</th>
    		<th>描述</th>
    		<th>操作</th>
    		<th>商品管理</th>
    	</tr>
<c:forEach items="${parents }" var="parent">    	
    	<tr class="trOneLevel">
    		<td width="200px;">${parent.cname }</td>
    		<td width="200px;">${parent.desc }</td>
    		<td width="200px;">
    		  <a href="<c:url value='/page/admin/category/add.jsp'/>">添加分类</a>
    		  <a href="<c:url value='/AdminCategoryServlet?method=editPre&cid=${parent.cid }'/>">修改</a>
    		  <a onclick="return confirm('您是否真要删除该分类？')" href="<c:url value='/AdminCategoryServlet?method=delete&cid=${parent.cid }'/>">删除</a>
    		</td>
    		<td><a href="/Tianmall/AdminProductServlet?method=findByCategory&cid=${parent.cid}">
    		查看商品详细信息
    		</a>
    		</td>  
    	</tr>
</c:forEach>


    </table>
  </body>
</html>
