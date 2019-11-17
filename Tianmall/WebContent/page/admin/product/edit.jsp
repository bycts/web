<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
<link rel="stylesheet" type="text/css" href="<c:url value='/jquery/jquery.datepick.css'/>">
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick-zh-CN.js'/>"></script>
<script>

</script>
<style type="text/css">
body {
	font-size: 10pt;
	color: #404040;
	font-family: SimSun;
}

table {
	font-size: 10pt;
	margin-top: 15px;
	margin-left: 50px;
	width: 680px;
}

td {
	height: 25px;
}

.tp {
	border: 1px solid #dcdcdc;
	float: left;
}

ul {
	list-style: none;
}

li {
	margin: 10px;
}

.editform{
            margin-left: auto;
            margin-right: auto;
            max-width: 500px;
            background: #F8F8F8;
            padding: 30px 30px 20px 30px;
            font: 12px Arial, Helvetica, sans-serif;
            color: #666;
            border-radius: 5px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;

}

.editform h1{
font-size: 25px;
padding: 0px 0px 10px 40px;
display: block;
border-bottom:1px solid #E4E4E4;
margin: -10px -15px 30px -10px;;
color: #888;

}
.editform h1>span {
display: block;
font-size: 11px;
}


.editform .button{
            background-color: #9DC45F;
            border-radius: 5px;
            -webkit-border-radius: 5px;
            -moz-border-border-radius: 5px;
            border: none;
            padding: 10px 25px 10px 25px;
            color: #FFF;
            text-shadow: 1px 1px 1px #949494;
            margin-left:150px;
}
</style>
  </head>  
  <body>
  <div>
   <form action="/Tianmall/AdminProductServlet"  method="post" id="form" class="editform">
      <input type="hidden" name="bid" value="${product.bid }"/>
      <input type="hidden" name="method" value="edit"/>
      <h1>修改商品
     <span>Please fill all the texts in the fields.</span>
     </h1>
    <div>
	    <ul>
	    	<li>商品名称:<input id="bname" type="text" name="bname" value="${product.bname }" style="width:300px;"/></li>
	    	<li>标题1：   <input id="ptitle" type="text" name="ptitle" value="${product.ptitle }" style="width:200px;"/></li>
	    	<li>当前价：<input id="originalPrice" type="text" name="originalPrice" value="${product.originalPrice }" style="width:200px;"/></li>
	    	<li>定价：　<input id="promotionPrice" type="text" name="promotionPrice" value="${product.promotionPrice }" style="width:200px;"/>
	    	
	    </ul>
		
		<table>
			<tr>
				<td colspan="3">
					销量：<input type="text" id="xiaoliang" name="xiaoliang" value="${product.xiaoliang }" style="width:150px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					评论：<input type="text" name="pinglun" id="pinglun" value="${product.pinglun }" style="width:150px;"/>
				</td>
			</tr>			
			<tr>
				<td>
					分类：<select name="cid" id="cid">
						<option value="">====请选择分类====</option>
<c:forEach items="${parents }" var="parent">
			    		<option value="${parent.cid }">${parent.cname }</option>
</c:forEach>

					</select>
				</td>
				
				<td></td>
			</tr>
			<tr>
				<td>
				<button class="btn btn-success button"  type="submit">修          改</button>
				</td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
   </form>
  </div>

  </body>
</html>
