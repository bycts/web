<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">

</script>
<style>
.con {
	width: 1000px;
	padding-right: 0px;
	margin: auto;
	padding-top: 24px;
}

.con .con-body .brandWall-item {
	width: 485px;
	margin-right: -70px;
	float: right;
}

.con .con-body .brandWall-itemlast {
	width: 485px;
}

.con .con-body .head1 {
	height: 54px;
	background: #fff;
	font-size: 0;
	border-style: solid;
	border-width: 0 0 1px;
	border-color: #eee;
}

.con .con-body .head1 span {
	display: inline-block;
	color: #000
}

.con .con-body .head1 .cn {
	display: inline-block;
	font-size: 18px;
	font-weight: 700;
	color: #333;
	line-height: 54px;
	height: 18px;
	margin-left: 10px
}

.con .con-body .head1 .en {
	display: inline-block;
	font-size: 14px;
	font-weight: 700;
	color: #333;
	margin-left: 10px;
	line-height: 24px;
	height: 44px
}

.con .con-body .more {
	margin-left: 200px;
	width: 52px;
	height: 54px;
	line-height: 54px;
	z-index: 99;
	background-size: 18px 18px;
	background-image:
		url(//img.alicdn.com/tfs/TB1B7RoaMMPMeJjy1XcXXXpppXa-36-36.png);
	background-repeat: no-repeat;
	background-position: right center;
	padding-right: 30px;
	font-size: 16px;
	color: #666;
	overflow: hidden
}

.body .img2 {
	margin-left: 108px;
	margin-top: 20px;
}

.con .con-body .body .img1 {
	width: 100%;
}

.eachCategoryProducts {
	margin-top: 70px;
}

.floor-sub-name {
	margin-left: 25px;
}

span .categoryTitle {
	font-size: 20px;
	margin-left: 14px;
}

.line-body {
	width: 100%;
	height: 618px;
	margin-top: 10px;
	overflow: hidden
}

.line-body .big-banner {
	float: left;
	position: relative;
	width: 235px;
	height: 618px;
}

.line-body .big-banner img {
	display: block;
	width: 100%;
	height: 618px;
}

.line-body .big-banner:hover .hover {
	height: 120px;
	transform: rotate(0deg);
	-webkit-transform: rotate(0deg);
}

.hover {
	width: 150px;
	background: rgba(0, 0, 0, 0.1);
	position: absolute;
	top: 470px;
	left: 0;
	text-align: center;
	color: #ffffff;
	transform: rotate(55deg);
	-webkit-transform: rotate(55deg);
	transition: all 0.5s;
	-wekit-transition: all 0.5s;
	overflow: hidden;
	height: 0;
	z-index: 4000;
	margin-left: 30px;
}

.hover h3 {
	font-size: 15px;
	color: white;
	border-bottom: 2px solid rgba(76, 179, 77, 0.5);
	padding-bottom: 10px;
}

.hover p {
	font-size: 15px;
	color: white;
}

div.productItem {
	width: 300px;
	height: 285px;
	border: 1px solid white;
	background-color: white;
	margin: 8px 4px;
	float: left;
	cursor: pointer;
}
div.productItem:hover {
	border: 1px solid #FFFFFF;
}
div.productItem img {
	width: 260px;
	height: 206px;
}

div.floor-name .floor-img img {
	width: 24px;
	height: 25px;
}
</style>

<div class="CategoryProducts">
	<a class="body" href=""> <img class="img2" src="img/11.png">
	</a>
	<div class=con>
		<div class=con-body>
			<div class=content>

				<div class="brandWall-item" data-length="3">
					<div class="head1">
						<span class="cn">聚名品</span> <span class="en">LUXURY CHANNEL</span>
						<a class="more" href="/Tianmall/ProductServlet?method=findByCategory&cid=11">更多</a>
					</div>
					<a class="body" href="/Tianmall/ProductServlet?method=load&bid=118"> <img class="img1" src="img/big/11/18.jpg">
					</a>
				</div>

				<div class="brandWall-itemlast" data-length="3">
					<div class="head1">
						<span class="cn">品牌活动</span> <span class="en">BRAND
							ACTIVITY</span> <a class="more" href="/Tianmall/ProductServlet?method=findByCategory&cid=6">更多</a>
					</div>
					<a class="body" href="/Tianmall/ProductServlet?method=load&bid=69"> <img class="img1" src="img/big/6/9.jpg">
					</a>
				</div>
			</div>
		</div>
	</div>




	<div class="eachCategoryProducts">
		<div class="left-mark"></div>
		<span class="categoryTitle">美丽人生 <span class="floor-sub-name">FASHION
				& BEAUTY</span>
		</span> <br>


		<div class=line-body>
			<div class=big-banner>
				<a class="" href="/Tianmall/ProductServlet?method=load&bid=1011"> <img src="img/clothes/1.jpg">

					<div class="hover">
						<h3>乐町连衣裙法国小众甜美蓝白格子连衣裙</h3>
						<p>¥ 329.90</p>
					</div>
				</a>

			</div>



			<div class="productItem">
				<a href="/Tianmall/ProductServlet?method=load&bid=1"><img src="img/big/10/1.jpg"></a> <a
					class="productItemDescLink" href="/Tianmall/ProductServlet?method=load&bid=1"> <span
					class="productItemDesc">早秋新品白兔印花垂坠感半身裙中长裙女腰带装饰时尚百搭 </span>
				</a> <span class="productPrice"> ¥ 1390</span>
			</div>
			<div class="productItem">
				<a href="/Tianmall/ProductServlet?method=load&bid=10"><img src="img/big/10/10.jpg"></a> <a
					class="productItemDescLink" href="/Tianmall/ProductServlet?method=load&bid=10"> <span
					class="productItemDesc">雪纺红色波点吊带连衣裙2019新款女装中长款仙女裙子夏蛋糕裙 </span>
				</a> <span class="productPrice"> ¥ 119</span>
			</div>
			<div class="productItem">
				<a href="/Tianmall/ProductServlet?method=load&bid=2"><img src="img/big/10/2.jpg"></a> <a
					class="productItemDescLink" href="/Tianmall/ProductServlet?method=load&bid=2"> <span
					class="productItemDesc">早秋新品通勤简约V领羊绒单畦系扣女士针织开衫 </span>
				</a> <span class="productPrice"> ¥ 2190</span>
			</div>
			<div class="productItem">
				<a href="/Tianmall/ProductServlet?method=load&bid=3"><img src="img/big/10/3.jpg"></a> <a
					class="productItemDescLink" href="/Tianmall/ProductServlet?method=load&bid=3"> <span
					class="productItemDesc">早秋新品半高圆领抽条女士针织衫落肩袖纯羊绒衫 </span>
				</a> <span class="productPrice"> ¥ 2340</span>
			</div>
			<div class="productItem">
				<a href="/Tianmall/ProductServlet?method=load&bid=4"><img src="img/big/10/4.jpg"></a> <a
					class="productItemDescLink" href="/Tianmall/ProductServlet?method=load&bid=4"> <span
					class="productItemDesc">通勤V领撞色提花女羊绒开衫宽松百搭 </span>
				</a> <span class="productPrice"> ¥ 344</span>
			</div>
			<div class="productItem">
				<a href="/Tianmall/ProductServlet?method=load&bid=5"><img src="img/big/10/5.jpg"></a> <a
					class="productItemDescLink" href="/Tianmall/ProductServlet?method=load&bid=5"> <span
					class="productItemDesc">2019新款女夏季休闲小个子甜美流行裙子仙女超仙森系</span>
				</a> <span class="productPrice"> ¥ 239</span>
			</div>
			<div class="productItem">
				<a href="/Tianmall/ProductServlet?method=load&bid=6"><img src="img/big/10/6.jpg"></a> <a
					class="productItemDescLink" href="/Tianmall/ProductServlet?method=load&bid=6"> <span
					class="productItemDesc">夏装韩版气质休闲小个子网红裙子 </span>
				</a> <span class="productPrice"> ¥ 129</span>
			</div>
			<div class="productItem">
				<a href="/Tianmall/ProductServlet?method=load&bid=7"><img src="img/big/10/7.jpg"></a> <a
					class="productItemDescLink" href="/Tianmall/ProductServlet?method=load&bid=7"> <span
					class="productItemDesc">夏装流行仙女显瘦气质牛油果绿收腰雪纺长裙子 </span>
				</a> <span class="productPrice"> ¥ 119</span>
			</div>
			


		</div>
	</div>


	<div class="eachCategoryProducts">
		<div class="floor-name floor-img">
			<img
				src="https://img.alicdn.com/tfs/TB1Q67hXPihSKJjy0FeXXbJtpXa-428-50.png" style="width:20%">
		</div>

		<div class=line-body>
			<div class=big-banner>
				<a class="" href="/Tianmall/ProductServlet?method=load&bid=21"> <img src="img/markt/1.jpg">

					<div class="hover">
						<h3>Dava沐浴露</h3>
						<p>¥ 39.90</p>
					</div>
				</a>

			</div>



			<div class="productItem">
				<a href="/Tianmall/ProductServlet?method=load&bid=4"><img src="img/big/10/4.jpg"></a> <a
					class="productItemDescLink" href="/Tianmall/ProductServlet?method=load&bid=4"> <span
					class="productItemDesc">通勤V领撞色提花女羊绒开衫宽松百搭 </span>
				</a> <span class="productPrice"> ¥ 344</span>
			</div>
			<div class="productItem">
				<a href="/Tianmall/ProductServlet?method=load&bid=2"><img src="img/big/10/2.jpg"></a> <a
					class="productItemDescLink" href="/Tianmall/ProductServlet?method=load&bid=2"> <span
					class="productItemDesc">早秋新品通勤简约V领羊绒单畦系扣女士针织开衫 </span>
				</a> <span class="productPrice"> ¥ 2190</span>
			</div>
			<div class="productItem">
				<a href="/Tianmall/ProductServlet?method=load&bid=51"><img src="img/big/5/1.jpg"></a> <a
					class="productItemDescLink" href="/Tianmall/ProductServlet?method=load&bid=51"> <span
					class="productItemDesc">BT21圣诞节毛绒玩偶公仔娃娃玩具抱枕摆件 </span>
				</a> <span class="productPrice"> ¥79</span>
			</div>
			<div class="productItem">
				<a href="/Tianmall/ProductServlet?method=load&bid=52"><img src="img/big/5/2.jpg"></a> <a
					class="productItemDescLink" href="/Tianmall/ProductServlet?method=load&bid=52"> <span
					class="productItemDesc">BT21圣诞节毛绒玩偶公仔娃娃玩具抱枕摆件 </span>
				</a> <span class="productPrice"> ¥79</span>
			</div>

				<div class="productItem">
				<a href="/Tianmall/ProductServlet?method=load&bid=64"><img src="img/big/6/4.jpg"></a> <a
					class="productItemDescLink" href="/Tianmall/ProductServlet?method=load&bid=64"> <span
					class="productItemDesc"> 新货散装夏威夷果1000g净重袋装奶油味零食坚果干果整箱2斤  </span>
				</a> <span class="productPrice"> ¥56</span>
			</div>
			<div class="productItem">
				<a href="/Tianmall/ProductServlet?method=load&bid=65"><img src="img/big/6/5.jpg"></a> <a
					class="productItemDescLink" href="/Tianmall/ProductServlet?method=load&bid=65"> <span
					class="productItemDesc"> 双鱼猪肉脯400克*2袋 靖江特产猪肉脯猪肉干散装碎片肉类零食包邮   </span>
				</a> <span class="productPrice"> ¥116</span>
			</div>
			<div class="productItem">
				<a href="/Tianmall/ProductServlet?method=load&bid=66"><img src="img/big/6/6.jpg"></a> <a
					class="productItemDescLink" href="/Tianmall/ProductServlet?method=load&bid=66"> <span
					class="productItemDesc"> 江中 江中猴姑饼干20天装960g 酥性零食猴头菇饼干猴菇早餐代餐  </span>
				</a> <span class="productPrice"> ¥56</span>
			</div>
			<div class="productItem">
				<a href="/Tianmall/ProductServlet?method=load&bid=67"><img src="img/big/6/7.jpg"></a> <a
					class="productItemDescLink" href="/Tianmall/ProductServlet?method=load&bid=67"> <span
					class="productItemDesc"> 红薯干紫薯条组合零食无糖自制地瓜片软糯香酥脆番薯片农家芋头片   </span>
				</a> <span class="productPrice"> ¥116</span>
			</div>
		</div>
	</div>

	<div class="eachCategoryProducts">
		<div class="left-mark"></div>
		<span class="categoryTitle">天猫国际 <span class="floor-sub-name">TIANMAO
				& INTERNATIONAL</span>
		</span> <br>

		<div class=con>
			<div class=con-body>
				<div class=content>

					<div class="brandWall-item" data-length="3">
						<div class="head1">
							<span class="cn">聚名品</span> <span class="en">LUXURY
								CHANNEL</span>

						</div>
						<a class="body" href="/Tianmall/ProductServlet?method=findByCategory&cid=10"> <img class="img1" src="img/clothes/101.jpg">
						</a>
					</div>

					<div class="brandWall-itemlast" data-length="3">
						<div class="head1">
							<span class="cn">品牌女装</span> <span class="en">BRAND
								ACTIVITY</span>

						</div>
						<a class="body" href="/Tianmall/ProductServlet?method=findByCategory&cid=10"> <img class="img1" src="img/clothes/102.jpg">
						</a>
					</div>

				</div>
			</div>
		</div>

		<div class=con>
			<div class=con-body>
				<div class=content>

					<div class="brandWall-item" data-length="3">
						<div class="head1">
							<span class="cn">美妆</span> <span class="en">LUXURY
								CHANNEL</span>

						</div>
						<a class="body" href="/Tianmall/ProductServlet?method=findByCategory&cid=12"> <img class="img1" src="img/clothes/121.jpg">
						</a>
					</div>

					<div class="brandWall-itemlast" data-length="3">
						<div class="head1">
							<span class="cn">唇釉</span> <span class="en">BRAND
								ACTIVITY</span>

						</div>
						<a class="body" href="/Tianmall/ProductServlet?method=findByCategory&cid=12"> <img class="img1" src="img/clothes/122.jpg">
						</a>
					</div>

				</div>
			</div>
		</div>






	</div>



</div>


