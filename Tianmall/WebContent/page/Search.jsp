<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>serach</title>
</head>
<style>
img.logo {
	position: absolute;
	left: 190px;
	top: 30px;
}

div.searchDiv {
	background-color: #C40000;
	width: 538px;
	margin: 48px auto;
	padding: 1px;
	height: 40px;
	display: block;
}

div.searchDiv input {
	width: 420px;
	border: 1px solid transparent;
	height: 36px;
	margin: 1px;
	outline: none;
}

div.searchBelow {
	margin-top: 3px;
	margin-left: 0px;
}

div.searchBelow a {
	padding: 0px 20px 0px 20px;
	font-size: 12px;
}
</style>

<body>
	<!-- 实现查询功能 -->
	<a href="shouye.jsp"> <img id="logo" src="img/logo2 .png" style="width: 200px"
		class="logo">
	</a>

	 <form action="/Tianmall/ProductServlet" method="post">
		 <input type="hidden" name="method" value="findByBname" /> 
		<div class="searchDiv">
			<input name="bname" type="text" placeholder="男装  " id="SeaName">
			 <button type="submit" class="searchButton" id="search">搜索</button> 
			<!--  分类 -->
			<div class="searchBelow">
				<a class=""
					href="/Tianmall/ProductServlet?method=findByCategory&cid=10"> <span
					class="">女装</span></a> <a class=""
					href="/Tianmall/ProductServlet?method=findByCategory&cid=11"> <span
					class="">男装</span></a> <a class=""
					href="/Tianmall/ProductServlet?method=findByCategory&cid=3"> <span
					class="">运动</span></a> <a class=""
					href="/Tianmall/ProductServlet?method=findByCategory&cid=5"> <span
					class="">玩偶</span></a> <a class=""
					href="/Tianmall/ProductServlet?method=findByCategory&cid=6"> <span
					class="">零食</span></a>

			</div>


		</div>
 </form>
</body>
</html>