<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
div.categoryWithCarousel div.rightPage {
	width: 825px;
	height: 510px;
	background-color: white;
	margin-left: 220px;
	display: none;
	position: absolute;
	left: 0;
	top: 0;
	z-index: 1;
}

div.categoryWithCarousel div.each:hover {
	background-color: white;
}

div.categoryWithCarousel div.each span {
	margin-right: 10px;
}

div.categoryWithCarousel div.each {
	height: 37px;
	line-height: 30px;
	padding-left: 10px;
	font-size: 14px;
}

div.rightPage a {
	color: #999;
	font-size: 14px;
	margin: 8px;
}

div.rightPage a:hover {
	color: #C40000;
	text-decoration: none;
}

div.rightPage div.row {
	margin: 20px 80px 0px 80px;
}

div.rightPage div.row div.seperator {
	margin-top: 20px;
	border-bottom-style: dashed;
	border-bottom-width: 1px;
	border-bottom-color: #e7e7e7;
}

div.categoryWithCarousel div.head {
	margin-left: 248px;
}
</style>
<script>
	function showrightPage(cid) {
		$("div.each[cid=" + cid + "]").css("background-color", "white");
		$("div.each[cid=" + cid + "] a").css("color", "pink");
		$("div.rightPage[cid=" + cid + "]").show();
	}

	function hiderightPage(cid) {
		$("div.each[cid=" + cid + "]").css("background-color", "white");
		$("div.each[cid=" + cid + "] a").css("color", "black");
		$("div.rightPage[cid=" + cid + "]").hide();
	}
	$(function() {
		$("div.each").mouseenter(function() {
			var cid = $(this).attr("cid");
			showrightPage(cid);
		});
		$("div.each").mouseleave(function() {
			var cid = $(this).attr("cid");
			hiderightPage(cid);
		});
		$("div.rightPage").mouseenter(function() {
			var cid = $(this).attr("cid");
			showrightPage(cid);
		});
		$("div.rightPage").mouseleave(function() {
			var cid = $(this).attr("cid");
			hiderightPage(cid);
		});

	});
</script>

<div class="categoryWithCarousel">

	<div class="headbar show1">
		<div class="head">
			<span style="margin-left: 10px" class="glyphicon glyphicon-th-list"></span>
			<span style="margin-left: 10px">商品分类</span>
		</div>

		<!-- <div class="rightMenu">
			<span><a href=""><img src="img/site/chaoshi.png" /></a></span> <span><a
				href=""><img src="img/site/guoji.png" /></a></span>
		</div> -->

	</div>
	<div style="float: left">
		<iframe src="<c:url value='/CategoryServlet?method=findAll'/>"
			name="left" style="width: 200px; height: 430px; margin-left: 250px;"></iframe>
	</div>
	<div style="position: relative; left: 0; top: 0;">
		<%@include file="rightPage.jsp"%>
	</div>

	<%@include file="carousel.jsp"%>

</div>
