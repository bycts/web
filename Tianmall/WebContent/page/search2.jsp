<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>serach</title>
</head>
<body>
   <a href="shouye.jsp"> <img id="logo" src="img/logo2 .png" style="width: 200px"
		class="logo">
	</a>
    
    <form action="/Tianmall/ProductServlet" method="get" >
    <input type="hidden" name="method" value="findByBname"/>
  <div class="searchDiv">
 <input name="bname" type="text" placeholder="男装  " id="SeaName">
  <button  type="submit" class="searchButton" id="search">搜索</button>
        </div> 
</form>
</body>
</html>