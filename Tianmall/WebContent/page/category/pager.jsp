<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.pagination {
	padding: 5px;
	width: 600px;
	margin: 5px;
	text-align: center;
}

.pagination ul {
	margin: 5;
	padding: 5;
	font-size: 12px;
}

.pagination li {
	list-style-type: none;
	display: inline;
	padding: 1px;
	margin: 1px;
}

.pagination a, .pagination a:visited {
	padding: 5px;
	border: 1px solid #9aafe5;
	text-decoration: none;
	color: #2e6ab1;
}

.pagination a:hover, .pagination a:active {
	border: 1px solid #2b66a5;
	color: #000;
	background-color: lightyellow;
}

.pagination li.currentpage {
	font-weight: bold;
	padding: 5px;
	border: 1px solid navy;
	background-color: #2e6ab1;
	color: #FFF;
}

.pagination li.disablepage {
	padding: 5px;
	border: 1px solid #929292;
	color: #929292;
}

.pagination li.nextpage {
	font-weight: bold;
	padding: 5px;
}
</style>
<div class="divBody">
	<div class="pagination">
	<a href="productServlet?method=findByPage">上一页</a>
	<a href="productServlet?method=findByPage">下一页</a>
									<%-- <ul>
										<!-- 显示上一页 -->
										<c:if test="${products.currentPage > 1}">
											<li><a href="Tianmall/productServlet?method=findByPage&bid=${bid}&page=${products.currentPage+1}">上一页</a></li>
                                          </c:if>
										<span>第${products.currentPage}页/共 ${products.totalPage}页</span> 
										<!-- 显示下一页 -->
										<c:if test="${products.currentPage < products.totalPage}">
											<li><a href="Tianmall/productServlet?method=findByPage&bid=${bid}&page=${products.currentPage+1}">下一页</a></li>
										</c:if>
										
									</ul> --%>
									
								</div>
</div>