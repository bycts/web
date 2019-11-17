<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.body{
background: url(img/03.jpg) ;

}
.titl{
margin-left:600px;
color:red;
}
.from{
margin-left:550px;
}
.name{
font-size: 15px;
}
.pwd{
margin-top:10px;

}
</style>
<script type="text/javascript">
function checkForm() {
	if(!$("#adminname").val()) {
		alert("管理员名称不能为空！");
		return false;
	}
	if(!$("#adminpwd").val()) {
		alert("管理员密码不能为空！");
		return false;
	}
	return true;
}
</script>

</head>
<body class="body">
	 <div class="adminimg">
	<h3 class="titl">管理员登录页面</h3>
<hr/>
  <p style="font-weight: 900; color: red">${msg }</p>
<form action="/Tianmall/AdminUserServlet" method="post" onsubmit="return checkForm()" target="_top" class="from" name="from">
	<input type="hidden" name="method" value="findAll"/>
	<div>
	<span class="name">管理员账户：</span><input type="text" name="adminname" value="" id="adminname"/><br/>
	</div>
	<div class="pwd">
	<span class="name">密　　　码：</span><input type="password" name="adminpwd" id="adminpwd"/><br/>
	</div>
	<input type="submit" class="btn btn-larg" style="margin-left:100px;margin-top:10px" value="进入后台"/>
</form>
</div> 
</body>
</html>