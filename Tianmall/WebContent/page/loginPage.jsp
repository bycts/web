<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<style>
div.loginpage {
	background-color: white;
	position: absolute;
	right: 180px;
	top: 180px;
	width: 350px;
	height: 400px;
	padding: 60px 25px 80px 25px;
}

div.loginacount {
	color: #3C3C3C;
	font-size: 16px;
	font-weight: bold;
}

.loginErrorMessageDiv {
	margin-top: -25px;
}
}
</style>
<script>
	$(function() {
		$(".loginErrorMessageDiv").each(function() {
			showError($(this));

		});

		function showError(ele) {
			ele.css("display", "none");
		}

		$("form.loginForm").submit(function() {
			var bool = true;
			if (!validatename()) {
				bool = false;
			}
			if (!validatepassword()) {
				bool = false;
			}

			return bool;
		});

		$("form.loginForm input").keyup(function() {
			$("div.loginErrorMessageDiv").hide();
		});

		var left = window.innerWidth / 2 + 162;
		$("div.loginSmallDiv").css("left", left);
	});

	function validatename() {
		if (0 == $("#loginname").val().length) {
			$("span.errorMessage").html("请输入账号名");
			$("div.loginErrorMessageDiv").show();
			return false;
		}
		return true;
	}
	function validatepassword() {
		if (0 == $("#loginpass").val().length) {
			$("span.errorMessage").html("请输入密码");
			$("div.loginErrorMessageDiv").show();
			return false;
		}
		return true;
	}
</script>

<div id="login">

	<div class="simpleLogo" >
		<a href="shouye.jsp"><img src="img/logo2 .png"style="width: 200px"></a>
	</div>

	<img id="loginBackgroundImg" class="loginBackgroundImg"
		src="img/login/1.jpg" style="width: 80%">

	<form class="loginForm" action="/Tianmall/UserServlet" method="post">
		<input type="hidden" name="method" value="loginpass" />
		<div id="loginpage" class="loginpage">
			<div class="loginErrorMessageDiv">
				<div class="alert alert-danger">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close"></button>
					<span class="errorMessage"></span>
				</div>
			</div>

			<div class="loginacount">账户登录</div>
			<div class="loginInput">
				<span class="loginInputIcon "> <span
					class=" glyphicon glyphicon-user"></span>
				</span> <input id="loginname" name="loginname" placeholder="手机/会员名/邮箱"
					type="text" value="${user.loginname }">
			</div>

			<div class="loginInput ">
				<span class="loginInputIcon "> <span
					class=" glyphicon glyphicon-lock"></span>
				</span> <input id="loginpass" name="loginpass" type="password"
					placeholder="密码" type="text" value="${user.loginpass }">
			</div>
			<span class="text-danger">不要输入真实的天猫账号密码</span><br>
			<br>

			<div>
				<a class="notLink" href="#nowhere">忘记登录密码</a> <a href="register.jsp"
					class="pull-right">免费注册</a>
			</div>
			<div style="margin-top: 20px">
				<button class="btn btn-block redButton" type="submit">登录</button>
			</div>
		</div>
	</form>

</div>
