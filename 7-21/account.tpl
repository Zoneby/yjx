<!DOCTYPE html>
<html>
<head>
    <title>绑定手机号</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no"/>
    <meta name="format-detection" content="telephone=no" />
    <!-- 引入bootstrap的css样式 -->
    <load href="__PUBLIC__/optometry/css/bootstrap.min.css" />
    <style type="text/css">
		
		body{
			background-color: #fff;
			font-family: "Microsoft YaHei" ! important;
			
			/*background-color: #FACF0D;*/
			background-color: #ef9236;

			}
		.container{
			max-width: 768px;
			width: 100%;
			text-align: center;
		
			/*background-color: #FACF0D;*/
			background-color: #ef9236;

		}
		.title-p{
			margin:6.6em 0 1.3em 0;
			font-size: 1.5em;
			color: #fff;
		}
		.link{
			margin:1.8em 2.8em;
			padding: 0.8em;
			background-color: #fff;
			border: 1px solid #fff;
			border-radius:4px;
		}
		.link-p{
			font-size: 1.2em;
			color: #000;
			margin:0;
		}
		.link-img-r{
			width: 20%;
			position: absolute;
			top: 8.7em;
			right: 0;
		}
		.link-img-l{
			width: 20%;
			position: absolute;
			top: 14.2em;
			left: 0;
		}
		.number{
			font-size: 1.25em;
			color: #4094E5;
		}
		.link-input:focus,
		.link-input:active:focus,
		.link-input.active:focus,
		.link-input.focus,
		.link-input:active.focus,
		.link-input.active.focus
		.link-input:focus{ 
		 	outline: none; 
		 	font-size: 1.25em;
		 	line-height: normal;
		 }
		@media (min-width: 320px){ 
		    .link-input{
				width: 74%;
				height: 53px;
				border: 1px solid #fff;
				border-radius:4px;
				text-align: center;
				font-size: 1.25em;
				color: #000;
			}
			.link-button{
				width: 74%;
			    margin: 1.8em 0em 1.8em 0em;
			    padding: 0.8em;
			    background-color: #ffe400;
			    border: 2px solid #ffe400;
			    border-radius: 4px;
			    margin-bottom: 2em;
			    font-size: 1.2em;
			    color: #545454;
			}
			.bottom-p{
				margin: 5.5em auto 0.5em auto;
				font-size: 1em;
				color: #fff;
				text-align: center;
			}
		}
		@media (min-width: 360px){ 
		    .link-input{
				width: 77%;
				height: 51px;
				border: 1px solid #fff;
				border-radius:4px;
				text-align: center;
				font-size: 1.25em;
				color: #000;
			}
			.link-button{
				width: 76.6%;
			    margin: 1.8em 0em 1.8em 0em;
			    padding: 0.8em;
			    background-color: #ffe400;
			    border: 2px solid #ffe400;
			    border-radius: 4px;
			    margin-bottom: 2em;
			    font-size: 1.2em;
			    color: #545454;
			}
			.bottom-p{
				margin: 12.5em auto 0.5em auto;
				font-size: 1em;
				color: #fff;
				text-align: center;
			}
		}
	</style>
</head>
<!-- <load href="__PUBLIC__/optometry/css/common.css" /> -->
<!-- <load href="__PUBLIC__/optometry/css/account.css" /> -->
<body>
	<div class="container">
		<p class="title-p">想时刻关注账号信息？</p>
	
		<div class="link-img-r"> 
			<img class="img-responsive img" src="__PUBLIC__/optometry/images/right.png">
		</div>
		<form class="account_form" action="{:U('User/account')}" method="post">
		<input  type="hidden" name="openid" value="{$openid}">
		<input  type="hidden" name="url" value="{$url}">
		<input id="phone" class="link-input" type="tel" name="phone" placeholder="请输入手机号码">
		<input class="link-button" type="submit" name="submit" value="憋说话，点我绑定！">
		</form>
		<div class="link-img-l"> 
			<img class="img-responsive img" src="__PUBLIC__/optometry/images/left.png">
		</div>
		<p class="bottom-p">如有疑问，请致电020-29895619</p>
	</div>

	<!-- <div class="wrap2">
		<div class="d"></div>
		<div class="content">

			<div class="account_pic"></div>
		</div>	
		<form class="account_form" action="{:U('User/account')}" method="post">
			<input class="account_phone" type="number" id="phone" name="phone" placeholder="此处请填写手机号码">
		    <input type="hidden" name="openid" value="{$openid}">
		    <input type="hidden" name="url" value="{$url}">
			<input class="account_submit" type="submit" name="submit" value="确认绑定">
		</form>
		<div class="bottom">
			<p>如有疑问请致电020-29895619</p>
		</div>  	
	</div> -->
	<load href="__PUBLIC__/optometry/js/jquery-1.11.1.min.js" />
	<load href="__PUBLIC__/optometry/js/account.js" />
</body>
</html>