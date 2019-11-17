<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
<script type="text/javascript">

$(function() {
	$("#box").attr("checked", false);
	$("#formDiv").css("display", "none");
	$("#show").css("display", "");	
	
	// 操作和显示切换
	$("#box").click(function() {
		if($(this).attr("checked")) {
			$("#show").css("display", "none");
			$("#formDiv").css("display", "");
		} else {
			$("#formDiv").css("display", "none");
			$("#show").css("display", "");		
		}
	});
});

function loadChildren() {
	/*
	1. 获取pid
	2. 发出异步请求，功能之：
	  3. 得到一个数组
	  4. 获取cid元素(<select>)，把内部的<option>全部删除
	  5. 添加一个头（<option>请选择2级分类</option>）
	  6. 循环数组，把数组中每个对象转换成一个<option>添加到cid中
	*/
	// 1. 获取pid
	var pid = $("#pid").val();
	// 2. 发送异步请求
	$.ajax({
		async:true,
		cache:false,
		url:"/goods/admin/AdminBookServlet",
		data:{method:"ajaxFindChildren", pid:pid},
		type:"POST",
		dataType:"json",
		success:function(arr) {
			// 3. 得到cid，删除它的内容
			$("#cid").empty();//删除元素的子元素
			$("#cid").append($("<option>====请选择2级分类====</option>"));//4.添加头
			// 5. 循环遍历数组，把每个对象转换成<option>添加到cid中
			for(var i = 0; i < arr.length; i++) {
				var option = $("<option>").val(arr[i].cid).text(arr[i].cname);
				$("#cid").append(option);
			}
		}
	});
}

/*
 * 点击编辑按钮时执行本函数
 */
function editForm() {
	$("#method").val("edit");
	$("#form").submit();
}
/*
 * 点击删除按钮时执行本函数
 */
 function deleteForm() {
	$("#method").val("delete");
	$("#form").submit();	
}

</script>
  </head>
  
  <body>
    <input type="checkbox" id="box"><label for="box">编辑或删除</label>
    <br/>
    <br/>
 <div class="page">

<div class="imgAndInfo">

	<div class="imgInimgAndInfo">
		<img class="bigImg" src="${product.bigimg}">
		<div class="img4load hidden">
		<img src="${product.bigimg}">
		</div>
	</div>
	
	<div class="infoInimgAndInfo">
		
		<div class="productTitle">
		 ${product.bname} 
			
		</div>
		
		<div class="productPrice">
		
			<div class="productPriceDiv">

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
	</div>
	</div>
	</div>
		
  
  
  <div id='formDiv'>
   <form action="<c:url value='/admin/AdminBookServlet'/>" method="post" id="form">
    <input type="hidden" name="method" id="method"/>
   	<input type="hidden" name="bid" value="${book.bid }"/>
    <div class="imgAndInfo">

	<div class="imgInimgAndInfo">
		<img class="bigImg" src="${product.bigimg}">
		<div class="img4load hidden">
		<img src="${product.bigimg}">
		</div>
	</div>
	
	<div class="infoInimgAndInfo">
		
		<div class="productTitle">
		 ${product.bname} 
			
		</div>
		
		<div class="productPrice">
		
			<div class="productPriceDiv">

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
	</div>
		一级分类：<select name="pid" id="pid" onchange="loadChildren()">
						<option value="">==请选择分类==</option>
<c:forEach items="${parents }" var="parent">
  <option value="${parent.cid }" <c:if test="${book.category.parent.cid eq parent.cid }">selected="selected"</c:if>>${parent.cname }</option>
</c:forEach>
					</select>
	
	
	
	</div>
	
				
				
                 <input onclick="editForm()" type="button" name="method" id="editBtn" class="btn" value="修         改">
					<input onclick="deleteForm()" type="button" name="method" id="delBtn" class="btn" value="删　　除">
			
	
   </form>
  </div>

  </body>
</html>
