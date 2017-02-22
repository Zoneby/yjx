<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>验光师登录-isee在线验光系统</title>
	<!-- <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script> -->
	<script src="__PUBLIC__/js/jquery-1.11.1.js"></script>

	<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">

	<style type="text/css">
		.jumbtron{background-color: #5EC26C;}
		
	</style>

</head>
<body class="jumbtron">
	<div id="login" style="display:show" class="col-xs-5 col-md-3 col-xs-offset-4 col-md-offset-6 bg-success panel panel-default" style="margin-top: 100px;z-index: 999;">
		<div class="panel-haading">
			<h1 class="text-center">验光师登录</h1>
		</div>
		<div class="panel-body">
			<form class="horizontal"  id="login_form">
				<div class="form-group">
					<input type="text"  name="username" id="username" placeholder="登录名" class="form-control" />
				</div>
				<div class="form-group">
					<input type="password" name="password"  id="password" placeholder="密码" class="form-control" />
				</div>
				<div class="form-group">
					<a id="service_login" class="btn btn-primary form-button pull-right">登录</a>
				</div>
			</form>
		</div>
	</div>

	<!-- <button id="turn" style="display:none">开始验光</button> -->


<script src="__PUBLIC__/js/sha1.js"></script></body>
<script type="text/javascript">
	$("#service_login").click(
		function service(){
			$("#password").val(hex_sha1($("#password").val()));
			console.info($("#password").val());
			var msg = $('#login_form').serialize();
			$('#password').val("");
			console.info(msg);
			var url = "{:U('Index/service_login')}";
			$.ajax({
				url: url,
				type: "POST",
				data: msg,
				datatype: "JSON",
				success: function(msg){
					if(msg == -1){
						alert('failed');
					}else{
						type = msg;
						console.info(23);
						console.info(msg);
						login();
					}
	            }
			});
		}
	);
	var login = function() {
		var url = "{:U('Optist/index')}"
		if(type == 1){
			window.location.href = url;
		}
		else{
			alert("failed");
		}
	};
</script>
	

</body>
</html>