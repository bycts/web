<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<style>
.carousel-inner {
	position: relative;
}

img.carouselImage {
	
	height: 433px !important;
	width: 865px;
}
</style>
<div id="carouselproduct" class="carousel-of-product carousel slide1"
	data-ride="carousel" style="float:left">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#carouselproduct" data-slide-to="0" class="active"></li>
		<li data-target="#carouselproduct" data-slide-to="1"></li>
		<li data-target="#carouselproduct" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<img class="carousel carouselImage" src="img/carousel/1.jpg">
		</div>
		<div class="item">
			<img class="carouselImage" src="img/carousel/2.jpg">
		</div>
		<div class="item">
			<img class="carouselImage" src="img/carousel/3.jpg">
		</div>



	</div>

</div>
