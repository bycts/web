<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<style>
.registerForm {
	margin-left: auto;
	margin-right: auto;
	max-width: 700px;
	background: white;
	padding: 30px 30px 20px 30px;
	font: 12px Arial, Helvetica, sans-serif;
	color: #666;
	border-radius: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
}

.registerForm h1 {
	font-size: 25px;
	padding: 0px 0px 10px 40px;
	display: block;
	border-bottom: 1px solid #E4E4E4;
	margin: -10px -15px 30px -10px;;
	color: #888;
}

.registerForm h1>span {
	display: block;
	font-size: 11px;
}

table.registerTable {
	color: #3C3C3C;
	font-size: 16px;
	table-layout: fixed;
}

.registerError {
	width: 400px;
	margin-left: 550px;
	margin-top: 10px;
}

.registername {
	font-size: 20px;
}

.registerLeft {
	font-size: 15px;
}

.error {
	font-size: 20px;
	color: red;
	margin-left: 90px
}

.errorclass {
	background: url(/Tianmall/img/error.png) no-repeat;
	color: #f40000;
	font-size: 14px;
	border: 1px solid #ffb8b8;
	background-color: #fbf2f2;
	padding: 8px 8px 8px 35px;
}

table.registerTable td {
	padding: 16px 10px;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".errorclass").each(function() {
			showError($(this));

		});
		/* 	
		 $(".inputClass").focus(function(){
		 var lableId= $(this).attr("id")+"Error";
		 $("#"+lableId).text("");
		 showError($("#"+lableId)); 
		 });

		 $(".inputClass").blur(function(){
		 var id=$(this).attr("id");
		 var funName="validate"+id+"()";
		 eval(funName);
		
		 });  */

		$("#submitBtn").click(function() {
			var bool = true;
			if (!validatename()) {
				bool = false;
			}
			if (!validatepassword()) {
				bool = false;
			}
			if (!validaterepassword()) {
				bool = false;
			}

			return bool;

		});

	});
	function showError(ele) {
		var text = ele.text();
		if (!text) {
			ele.css("display", "none");
		} else {
			ele.css("display", "");
		}
	}

	function validatename() {
		var id = "loginname";
		var value = $("#" + id).val();

		if (!value) {
			$("#" + id + "Error").text("用户名不能为空");
			showError($("#" + id + "Error"));
			return false;
		}
		$.ajax({
			url : "/Tianmall/UserServlet",
			data : {
				method : "ajaxVaildatename",
				name : value
			},
			type : "post",
			dataType : "json",
			async : false,
			cache : false,
			success : function(result) {
				if (!result) {
					$("#" + id + "Error").text("用户名已被注册");
					showError($("#" + id + "Error"));
					return false;
				}
			}

		});
		return true;
	}
	function validatepassword() {
		var id = "loginpass";
		var value = $("#" + id).val();

		if (!value) {
			$("#" + id + "Error").text("密码不能为空");
			showError($("#" + id + "Error"));
			return false;
		}
		return true;
	}
	function validaterepassword() {
		var id = "reloginpass";
		var value = $("#" + id).val();

		if (!value) {
			$("#" + id + "Error").text("确认密码不能为空");
			showError($("#" + id + "Error"));
			return false;
		}
		if (value != $("#loginpass").val()) {
			$("#" + id + "Error").text("两次输入不一致");
			showError($("#" + id + "Error"));
			return false;
		}
		return true;

	}
</script>

<div class="register">
	<form action="/Tianmall/UserServlet" method="POST" id="registerForm"
		class="registerForm">
		<input type="hidden" name="method" value="regist" />
		<h1>
			用户注册 <span>Please fill all the texts in the fields.</span>
		</h1>
		<table class="registerTable" align="center">
			<tr>
				<td class="registername">设置会员名</td>
				<td></td>
			</tr>
			<tr>
				<td class="registerLeft">登陆名</td>
				<td class="registerRight"><input class="inputClass"
					name="loginname" id="loginname" placeholder="设置会员名"
					value="${form.loginname }"></td>
				<td><label class="errorclass" id="loginnameError">${errors.loginame}</label></td>
			</tr>
			<tr>
				<td class="registername">设置登陆密码</td>
			</tr>
			<tr>
				<td class="registerLeft">登陆密码</td>
				<td class="registerRight"><input class="inputClass"
					name="loginpass" id="loginpass" type="password"
					placeholder="设置登陆密码" value="${form.loginpass }"></td>
				<td><label class="errorclass" id="loginpassError">${errors.loginpass}</label></td>
			</tr>

			<tr>
				<td class="registerLeft">密码确认</td>
				<td class="registerRight"><input class="inputClass"
					id="reloginpass" name="reloginpass" type="password"
					placeholder="请再次输入你的密码" value="${form.reloginpass }"></td>
				<td><label class="errorclass" id="reloginpassError">${errors.reloginpass}</label></td>
			</tr>

			<tr>
				<td colspan="2" class="registerButton"><input type="image"
					src="<c:url value='/img/regist1.jpg'/>" id="submitBtn" /></td>
			</tr>
		</table>
	</form>
</div>
