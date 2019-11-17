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
   <h1 class="label label-info">用户管理</h1>
      <table align="center" border="1" cellpadding="0" cellspacing="0">
    	<tr class="trTitle">
    		<th>id</th>
    		<th>用户名</th>
    		
    	</tr>
<c:forEach items="${users }" var="user">    	
    	<tr class="trOneLevel">
    		<td width="200px;">${user.uid }</td>
    		<td>${user.loginname }</td>
    	</tr>
</c:forEach>


    </table>
  </body>
</html>
