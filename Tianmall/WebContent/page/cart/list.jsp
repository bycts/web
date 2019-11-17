<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<script src="<c:url value='/js/round.js'/>"></script>
<style>
table {
	font-size: 10px;
	border-color: #efeae5;
	border-style: solid;
	border-width: 5px;
	color: #404040;
}

td {
	border-color: #efeae5;
	border-style: solid;
	border-width: 0;
	border-bottom-width: 1px;
	padding: 10px;
}

.jian:HOVER {
	background: url(img/icon.png) no-repeat;
	display: inline-block;
	background-position: -166px -125px;
	height: 11px;
	width: 11px;
	margin: 0;
}

.jian {
	background: url(img/icon.png) no-repeat;
	display: inline-block;
	 background-position: -166px -145px; 
	height: 11px;
	width: 11px;
	margin: 0;
}

.jia:HOVER {
	background: url(img/icon.png) no-repeat;
	display: inline-block;
	background-position: -178px -125px;
	height: 11px;
	width: 11px;
	margin: 0;
}

.jia {
	background: url(img/icon.png) no-repeat;
	display: inline-block;
	background-position: -178px -145px;
	height: 11px;
	width: 11px;
	margin: 0;
}

.jiesuan {
	background: url(img/icon.png) no-repeat;
	display: inline-block;
	background-position: 0 -35px;
	height: 40px;
	width: 190px;
	margin: 0;
}

.kill {
	background: url(img/icon.png) no-repeat;
	display: inline-block;
	background-position: 0 -480px;
	height: 40px;
	width: 190px;
}

.jiesuan:HOVER {
	background: url(img/icon.png) no-repeat;
	display: inline-block;
	background-position: 0 -75px;
	height: 40px;
	width: 190px;
	poorfish: expression(this.onclick = function jiesuan(){return true
}

);
}
.quantity {
	width: 25px;
	text-align: center;
	margin: 0;
}

a {
	text-decoration: none;
	color: #018BD3;
}

a:visited {
	color: #018BD3;
}

a:hover {
	color: #FF6600;
	text-decoration: underline;
}

a.linkImage {
	border: 1px solid #ffffff;
	display: inline-block;
}

a.linkImage:HOVER {
	border: 1px solid #d0d0d0;
	display: inline-block;
}

a.linkImage:active {
	border: 1px dotted #404040;
	display: inline-block;
}

.price_n {
	color: #c30;
	font-weight: bold;
	padding-right: 10px;
	font-family: Arial;
}

.price_t {
	color: #c30;
	font-weight: bold;
	padding-right: 10px;
	font-family: Arial;
	font-size: 15pt;
}

.spanEmpty {
	margin-top: 50px;
	font-size: 24px;
	font-weight: 900;
}

.tdBatchDelete {
	border-top-width: 5px;
	border-bottom-width: 0px;
}

.tdTotal {
	border-top-width: 5px;
}
</style>
<script type="text/javascript">
$(function(){//方法可以在外面，但click事件必须在里面调用
	showTotal();//计算总计
	/*
	给全选添加click事件
	*/
	$("#selectAll").click(function() {
		/*
		1. 获取全选的状态
		*/
		var bool = $("#selectAll").attr("checked");
		/*
		2. 让所有条目的复选框与全选的状态同步
		*/
		setItemCheckBox(bool);
		/*
		3. 让结算按钮与全选同步
		*/
		setJieSuan(bool);
		/*
		4. 重新计算总计
		*/
		showTotal();
	});
	
	
		$(".jia").click(function() {
			// 获取cartItemId
			var id = $(this).attr("id").substring(0, 32);
			// 获取输入框中的数量
			var quantity = $("#" + id + "Quantity").val();
			sendUpdateQuantity(id, Number(quantity)+1);//转换为数值
		});
		
		
		$(".jian").click(function() {
			// 获取cartItemId
			var id = $(this).attr("id").substring(0, 32);
			// 获取输入框中的数量
			var quantity = $("#" + id + "Quantity").val();
			// 判断当前数量是否为1，如果为1,那就不是修改数量了，而是要删除了。
			if(quantity == 1) {
				if(confirm("您是否真要删除该条目？")) {
					location = "/Tianmall/CartItemServlet?method=batchDelete&cartItemIds=" + id;
				}
			} else {
				sendUpdateQuantity(id, quantity-1);
			}
		});
		
		
		/*
		给所有条目的复选框添加click事件
		*/
		$(":checkbox[name=checkboxBtn]").click(function() {
			var all = $(":checkbox[name=checkboxBtn]").length;//所有条目的个数
			var select = $(":checkbox[name=checkboxBtn][checked=true]").length;//获取所有被选择条目的个数

			if(all == select) {//全都选中了
				$("#selectAll").attr("checked", true);//勾选全选复选框
				setJieSuan(true);//让结算按钮有效
			} else if(select == 0) {//谁都没有选中
				$("#selectAll").attr("checked", false);//取消全选
				setJieSuan(false);//让结算失效
			} else {//选中一部分
				$("#selectAll").attr("checked", false);//取消全选
				setJieSuan(true);//让结算有效				
			}
			showTotal();//重新计算总计
		});

	
});

//请求服务器，修改数量。
function sendUpdateQuantity(id, quantity) {
	$.ajax({
		async:false,
		cache:false,
		url:"/Tianmall/CartItemServlet",
		data:{method:"updateQuantity",cartItemId:id,quantity:quantity},
		type:"POST",
		dataType:"json",
		success:function(result) {
			//1. 修改数量
			$("#" + id + "Quantity").val(result.quantity);
			//2. 修改小计
			$("#" + id + "Subtotal").text(result.subtotal);
			//3. 重新计算总计
			showTotal();
		}
	});
}

/*
 * 计算总计
 */
function showTotal() {
	var total = 0;
	/*
	1. 获取所有的被勾选的条目复选框！循环遍历之
	*/
	$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
		//2. 获取复选框的值，即其他元素的前缀
		var id = $(this).val();
		//3. 再通过前缀找到小计元素，获取其文本
		var text = $("#" + id + "Subtotal").text();
		//4. 累加计算
		total += Number(text);
	});
	
	// 5. 把总计显示在总计元素上
	$("#total").text(round(total, 2));//round()函数的作用是把total保留2位
}

/*
* 统一设置所有条目的复选按钮
*/
function setItemCheckBox(bool) {
	$(":checkbox[name=checkboxBtn]").attr("checked", bool);
}
/*
 * 设置结算按钮样式
 */
 function setJieSuan(bool) {
		if(bool) {
			$("#jiesuan").removeClass("kill").addClass("jiesuan");
			$("#jiesuan").unbind("click");//撤消当前元素止所有click事件
		} else {
			$("#jiesuan").removeClass("jiesuan").addClass("kill");
			$("#jiesuan").click(function() {return false;});
		}
		
	}
 /*
  * 批量删除
  */
 function batchDelete() {
 	// 1. 获取所有被选中条目的复选框
 	// 2. 创建一数组，把所有被选中的复选框的值添加到数组中
 	// 3. 指定location为CartItemServlet，参数method=batchDelete，参数cartItemIds=数组的toString()
 	var cartItemIdArray = new Array();
 	$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
 		cartItemIdArray.push($(this).val());//把复选框的值添加到数组中
 	});
 	location = "/Tianmall/CartItemServlet?method=batchDelete&cartItemIds=" + cartItemIdArray;
 }
 /*
 * 结算
 */
function jiesuan() {
	// 1. 获取所有被选择的条目的id，放到数组中
	var cartItemIdArray = new Array();
	$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
		cartItemIdArray.push($(this).val());//把复选框的值添加到数组中
	});	
	// 2. 把数组的值toString()，然后赋给表单的cartItemIds这个hidden
	$("#cartItemIds").val(cartItemIdArray.toString());
	// 把总计的值，也保存到表单中
	$("#hiddenTotal").val($("#total").text());
	// 3. 提交这个表单
	$("#jieSuanForm").submit();
}
</script>
<body>

	 <c:choose> 
	<c:when test="${empty cartItemList }">
			<table width="95%" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td align="right"><img align="top"
				src="<c:url value='/img/icon_empty.png'/>" /></td>
			<td><span class="spanEmpty">您的购物车中暂时没有商品</span></td>
		</tr>
	</table>
		</c:when> 
	 <c:otherwise> 
	 
	 
	 
	<table width="95%" align="center" cellpadding="0" cellspacing="0">
	<tr align="center" bgcolor="#efeae5">
		<td align="left" width="50px">
			<input type="checkbox" id="selectAll" checked="checked"/><label for="selectAll">全选</label>
		</td>
		<td colspan="2">商品名称</td>
		<td>单价</td>
		<td>数量</td>
		<td>小计</td>
		<td>操作</td>
	</tr>
	 
	 
	<c:forEach items="${cartItemList }" var="cartItem">
			<tr align="center">
				<td align="left"><input value="${cartItem.cartItemId }"
					type="checkbox" name="checkboxBtn" checked="checked" /></td>
				<td align="left" width="70px"><a class="linkImage"
					href="/Tianmall/ProductServlet?method=load&bid=${cartItem.product.bid }"><img border="0"
						width="54" align="top"
						src="img/big/${cartItem.product.bigimg}" /></a></td>
				<!-- 小图 -->
				<td align="left" width="400px"><a
					href="/Tianmall/ProductServlet?method=load&bid=${cartItem.product.bid }"><span>${cartItem.product.bname }</span></a>
				</td>
				<td><span>&yen;<span class="currPrice">${cartItem.product.originalPrice }</span></span></td>
				<td>
				<a class="jian" id="${cartItem.cartItemId }Jian"></a>
				
				
				<input	class="quantity" readonly="readonly" id="${cartItem.cartItemId }Quantity" type="text"
					value="${cartItem.quantity }" />
					
					<a class="jia" id="${cartItem.cartItemId }Jia"></a>
										</td>
				<td width="100px"><span class="price_n">&yen;
				<span class="subTotal" id="${cartItem.cartItemId }Subtotal">${cartItem.subtotal }</span></span>
				</td>
				<td><a
					href="/Tianmall/CartItemServlet?method=batchDelete&cartItemIds=${cartItem.cartItemId }">删除</a>
				</td>
			</tr>
		</c:forEach>

		<tr>
			<td colspan="4" class="tdBatchDelete"><a href="javascript:batchDelete();">批量删除</a></td>
				
			<td colspan="3" align="right" class="tdTotal">
			<span>总计：</span>
			<span class="price_t">&yen;<span id="total"> </span></span></td>
		</tr>
		<tr>
			<td colspan="7" align="right">
			<a href="javascript:jiesuan();" id="jiesuan" class="jiesuan"></a></td>
		</tr>
	</table>
	<form id="jieSuanForm" action="<c:url value='/CartItemServlet'/>"
		method="post">
		<input type="hidden" name="cartItemIds" id="cartItemIds" /> 
		<input type="hidden" name="total" id="hiddenTotal" />
		<input type="hidden" name="method" value="loadCartItems" />
	</form>

	  </c:otherwise> 
		</c:choose> 
</body>
</html>
