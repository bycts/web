<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    div.imgInimgAndInfo {
	width: 400px;
	float: left;
}
    div.imgAndInfo {
	margin: 70px 200px;
}
     div.infoInimgAndInfo div.productPriceDiv {
   
    height: 111px;
    padding: 13px;
    color: #666666;
    margin-top: 20px;
    width: 500px;
} 
div.infoInimgAndInfo div.productSaleAndReviewNumber {
    width: 500px;
    }
    
    div.serviceCommitment {
    margin: 30px 0px;   
    }
    div.infoInimgAndInfo span.serviceCommitmentLink a {
    color: red;}
    
    div.infoInimgAndInfo span.serviceCommitmentDesc {
  
    color: red;
}
div.buyDiv {
    margin-right: 150px;
    margin-top: 40px;
    }
    
    div.productReviewDiv {
    margin-left: 210px;
    width: 893px;
    }
    </style>

<div class="page">

<div class="imgAndInfo">

	<div class="imgInimgAndInfo">
		<img class="bigImg" src="img/big/${product.bigimg}">
		<div class="img4load hidden">
		<img src="${product.bigimg}">
		</div>
	</div>
	
	<div class="infoInimgAndInfo">
		
		<div class="productTitle">
		 ${product.bname} 
			
		</div>
		<div class="productSubTitle">
			周末 特惠 96元还送 精美礼品 
		</div>
		
		<div class="productPrice">
		
			<div class="productPriceDiv">
				<div class="gouwujuanDiv"><img height="16" src="img/site/gouwujuan.png">
				<span> 全天猫实物商品通用</span>
				
				</div>
				<div class="originalDiv">
					<span class="originalPriceDesc">价格</span>
					<span class="originalPriceYuan">¥</span>
					<span class="originalPrice">
					 ${product.originalPrice}  
										
					</span>
				</div>
				<div class="promotionDiv">
					<span class="promotionPriceDesc">促销价 </span>
					<span class="promotionPriceYuan">¥</span>
					<span class="promotionPrice">
					 ${product.promotionPrice} 
						
					</span>				
				</div>
			</div>
		</div>
		<div class="productSaleAndReviewNumber">
			<div>销量 <span class="redColor boldWord"> ${product.xiaoliang}   </span></div>	
			<div>累计评价 <span class="redColor boldWord"> ${product.pinglun} </span></div>	
		</div>
		<div class="serviceCommitment">
			<span class="serviceCommitmentDesc">服务承诺</span>
			<span class="serviceCommitmentLink">
				<a href="#nowhere">正品保证</a>
				<a href="#nowhere">极速退款</a>
				<a href="#nowhere">赠运费险</a>
				<a href="#nowhere">七天无理由退换</a>
			</span>
		</div>	
		<form id="form1" action="/Tianmall/CartItemServlet" method="post">
		<input type="hidden" name="method" value="add"/>
		<input type="hidden" name="bid" value="${product.bid }"/>
		我要买：<input id="cnt" style="width: 40px;text-align: center;" type="text" name="quantity" value="1"/>件
		<div class="buyDiv">
			<a class="buyLink" href="buyone"><button class="buyButton">立即购买</button></a>
			<a class="addCartLink" href="/Tianmall/CartItemServlet?method=add"><button class="addCartButton"><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车</button></a>
		</div>
		</form>
	</div>
	


	<div style="clear:both"></div>
	
</div>




</div>



