<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
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
	  <div class="panel-heading">修改分类</div>
	  <div class="panel-body"> 
	    	<form id="addForm" action="<c:url value='/AdminCategoryServlet'/>" method="post" onsubmit="return checkForm()">
    	        <input type="hidden" name="cid" value="${parent.cid }"/>
    	            <input type="hidden" name="method" value="edit"/>
    	            
	    		<table class="addTable">
	    			<tbody><tr>
	    				<td>分类名称: </td>
	    				<td><input name="cname" class="form-control" id="cname" type="text" value="${parent.cname }"></td>
	    			</tr>
	    			<tr>
	    				<td>分类描述: </td>
	    				<td>
	    					<textarea rows="5" cols="50" name="desc" id="desc">${parent.desc }</textarea>
	    				</td>
	    			</tr>
	    			<tr class="submitTR">
	    				<td align="center" colspan="2">
	    					<button class="btn btn-success" type="submit">修改</button>
	    					<input type="button" class="btn btn-success" value="返回" onclick="history.go(-1)"/>
	    				</td>
	    			</tr>
	    		</tbody></table>
	    	</form>
	  </div>
	</div>
</body>
</html>
