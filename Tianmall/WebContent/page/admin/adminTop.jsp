<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <style>
 .title{
 font-size: 25px;
 margin-left: 700px;
 }
 .admin{
 margin-left:90%;
 font-size: 15px;
color:red;
 }
 .navbar-brand{
 }
</style>
<div class="navitagorDiv" style="background-color:#D9E8E1;">
    <div class="navbar">
        <img style="margin-left:10px;margin-top:45px" class="pull-left" src="img/site/tmallbuy.png" height="45px">
         <div class="title">后台管理</div>
         <div class="admin">
         <span >管理员：${session.admin }</span>
         <a target="top" href="/Tianmall/admin.jsp">退出</a></div>
        <a class="navbar-brand" href="/Tianmall/AdminCategoryServlet?method=findAll">分类管理</a>
         <a class="navbar-brand" href="/Tianmall/AdminProductServlet?method=findByCategory&cid=10">商品管理</a>
        <a class="navbar-brand" href="/Tianmall/AdminUserServlet?method=findAll">用户管理</a>
        <a class="navbar-brand" href="/Tianmall/AdminOrderServlet?method=findAll">订单管理</a>

    </div>
    
    
    
   
</div>