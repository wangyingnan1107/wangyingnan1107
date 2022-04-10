<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>实验室管理系统登陆</title>
<!-- path=LIMS_SSM
basePath = http :// mysql : 8080 / LIMS_SSM / -->
<link rel="stylesheet" href="<%=basePath%>resources/lib/layui-v2.5.5/css/layui.css" media="all">
<!-- link rel="shortcut icon" 指定网站小图标 -->
<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="<%=basePath%>resources/css/oksub.css" />
<style>
#weather-float-he {
	position: fixed !important;
	z-index: 99999 !important;
	left: 0 !important;
	top: 0 !important;
	transform: scale(.9);
}

#weather-float-he div[data-v-0a6ec0b4] {
	box-shadow: none !important;
	top: 42px !important;
}

#weather-float-he div[data-v-0a6ec0b4] div {
	position: static !important;
}

body, html {
	margin: 0;
	width: 100%;
	height: max-content;
}

html, body {
	width: 100%;
	height: 100%;
	overflow: hidden
}

body {
	background: #1E9FFF;
}

body:after {
	content: '';
	background-repeat: no-repeat;
	background-size: cover;
	-webkit-filter: blur(3px);
	-moz-filter: blur(3px);
	-o-filter: blur(3px);
	-ms-filter: blur(3px);
	filter: blur(3px);
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	z-index: -1;
}

.layui-container {
	width: 100%;
	height: 100%;
	overflow: hidden
}

.admin-login-background {
	width: 360px;
	height: 300px;
	position: absolute;
	left: 50%;
	top: 40%;
	margin-left: -180px;
	margin-top: -100px;
}

.logo-title {
	text-align: center;
	letter-spacing: 2px;
	padding: 14px 0;
}

.logo-title h1 {
	color: #1E9FFF;
	font-size: 25px;
	font-weight: bold;
}

.login-form {
	background-color: #fff;
	border: 1px solid #fff;
	border-radius: 3px;
	padding: 14px 20px;
	box-shadow: 0 0 8px #eeeeee;
}

.login-form .layui-form-item {
	position: relative;
}

.login-form .layui-form-item label {
	position: absolute;
	left: 1px;
	top: 1px;
	width: 38px;
	line-height: 36px;
	text-align: center;
	color: #d2d2d2;
}

.login-form .layui-form-item input {
	padding-left: 36px;
}

.captcha {
	width: 60%;
	display: inline-block;
}

.captcha-img {
	display: inline-block;
	width: 34%;
	float: right;
}

.captcha-img img {
	height: 34px;
	border: 1px solid #e6e6e6;
	height: 36px;
	width: 100%;
}
</style>
</head>
<body>

	<div class="layui-container">
		<div class="admin-login-background">
			<div class="layui-form login-form">
				<form class="layui-form" method="post" action="<%=basePath %>admin/adminLogin">
					<div class="layui-form-item logo-title">
						<h1>实验室管理系统登录</h1>
					</div>
					<div class="layui-form-item">
						<label class="layui-icon layui-icon-username" for="username"></label>
						<input type="text" name="aid" lay-verify="required"
							placeholder="用户名" autocomplete="off" class="layui-input"
							value="">
					</div>
					<div class="layui-form-item">
						<label class="layui-icon layui-icon-password" for="password"></label>
						<input type="password" name="apwd"
							lay-verify="required|password" placeholder="密码"
							autocomplete="off" class="layui-input" value="">
					</div>

					<div class="layui-form-item">
						<label class="layui-icon layui-icon-vercode" for="captcha"></label>
						<input type="text" name="captcha" lay-verify="required|captcha"
							placeholder="图形验证码" autocomplete="off"
							class="layui-input verification captcha" value="">
						<div class="captcha-img">
							<img id="captchaPic"
								src="<%=basePath%>resources/images/captcha.jpg">
						</div>
					</div>
					<div class="layui-form-item" pane="">

						<input type="radio" name="rol" value="教师" title="教师" checked="">
						<input type="radio" name="rol" value=学生 " title="学生"> 
						<input type="radio" name="rol" value="管理员" title="管理员">
					</div>
					<div class="layui-form-item">
						<button
							class="layui-btn layui-btn layui-btn-normal layui-btn-fluid"
							lay-submit="" lay-filter="login">登 入</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		WIDGET = {
			FID : 'FS17XUsOiV'
		}
	</script>
	<script type="text/javascript"
		src="https://apip.weatherdt.com/float/static/js/r.js?v=1111"></script>
	<script
		src="<%=basePath%>resources/lib/jquery-3.4.1/jquery-3.4.1.min.js"
		charset="utf-8"></script>
	<script src="<%=basePath%>resources/lib/layui-v2.5.5/layui.js"
		charset="utf-8"></script>
	<script
		src="<%=basePath%>resources/lib/jq-module/jquery.particleground.min.js"
		charset="utf-8"></script>
	<script>
		layui.use([ 'form' ], function() {
			var form = layui.form, layer = layui.layer;

			// 登录过期的时候，跳出ifram框架
			if (top.location != self.location)
				top.location = self.location;

			// 粒子线条背景
			$(document).ready(function() {
				$('.layui-container').particleground({
					dotColor : '#7ec7fd',
					lineColor : '#7ec7fd'
				});
			});

			// 进行登录操作
			/* form.on('submit(login)', function(data) {
				data = data.field;
				if (data.username == '') {
					layer.msg('用户名不能为空');
					return false;
				}
				if (data.password == '') {
					layer.msg('密码不能为空');
					return false;
				}
				if (data.captcha == '') {
					layer.msg('验证码不能为空');
					return false;
				}
				

				
				 layer.msg('登录成功', function() {
					window.location = 'admin/a_index.jsp';
				}); 
				return false;
			}); */
		});
	</script>
</body>
</html>