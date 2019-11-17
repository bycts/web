<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>添加分类</title>
     <link rel="stylesheet" type="text/css" href="<c:url value='/css/fore/style.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/bootstrap/3.3.6/bootstrap.min.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<style type="text/css">
	div.addDiv{
	width:500px;
	margin-left:500px;
	
	}
	td{padding:5px;}
	</style>
	<script type="text/javascript">
		function checkForm() {
			if(!$("#cname").val()) {
				alert("分类名不能为空！");
				return false;
			}
			if(!$("#desc").val()) {
				alert("分类描述不能为空！");
				return false;
			}
			return true;
		}
	</script>
  </head>
  
  <body>
<div class="panel panel-warning addDiv">
	  <div class="panel-heading">添加分类</div>
	  <div class="panel-body"> 
	    	<form id="addForm" action="<c:url value='/AdminCategoryServlet'/>" method="post" onsubmit="return checkForm()">
    	        <input type="hidden" name="method" value="add"/>
	    		<table class="addTable">
	    			<tbody><tr>
	    				<td>分类名称: </td>
	    				<td><input name="cname" class="form-control" id="cname" type="text"></td>
	    			</tr>
	    			<tr>
	    				<td>分类描述: </td>
	    				<td>
	    					<textarea rows="5" cols="50" name="desc" id="desc"></textarea>
	    				</td>
	    			</tr>
	    			<tr class="submitTR">
	    				<td align="center" colspan="2">
	    					<button class="btn btn-success" type="submit">提 交</button>
	    					<input type="button" class="btn btn-success" value="返回" onclick="history.go(-1)"/>
	    				</td>
	    			</tr>
	    		</tbody></table>
	    	</form>
	  </div>
	</div>
</body>
</html>