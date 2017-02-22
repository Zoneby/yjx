<!DOCTYPE html>
<html>
<head>
    <title>解除手机号绑定</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no"/>
    <meta name="format-detection" content="telephone=no" />
    <!-- 引入bootstrap的css样式 -->
    <load href="__PUBLIC__/optometry/css/bootstrap.min.css" />
    <!-- <script type="text/javascript" src="dist/js/jquery-1.12.2.min.js"></script> -->
    <!-- <script type="text/javascript" src="dist/js/bootstrap.min.js"></script> -->
	<!-- 内部样式 -->
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
			margin:2.8em 0 0.5em 0;
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
<body>
	<div class="container">
		<p class="title-p">随时随地关注账号信息</p>
		<div class="link">
			<p class="link-p">目前已绑定<span class="number">“手机号”</span></p>
			
		</div>
		<div class="link-img-r"> 
			<img class="img-responsive img" src="__PUBLIC__/optometry/images/right.png">
		</div>
		<form class="account_detach_form" action="{:U('User/accountDetach')}" method="post">

		<!-- <input  type="hidden" name="openid" value="{$openid}">
		<input  type="hidden" name="url" value="{$url}"> -->

		<input id="phone" class="link-input" type="text" name="phone" value="{$phone}" readOnly="true" >
		<input class="link-button" type="submit" name="submit" value="残忍解除手机绑定">
		</form>
		<div class="link-img-l"> 
			<img class="img-responsive img" src="__PUBLIC__/optometry/images/left.png">
		</div>
		<p class="bottom-p">如有疑问，请致电020-29895619</p>
	</div>
	
	<!-- <div class="wrap2">
		<div class="d"></div>
		<div class="content">
			<div class="pic account_detach_pic"></div>
		</div>	
		<div class="account_info">目前绑定的号码</div>
		<div class="account_num">{$phone}</div>
		<form class="account_detach_form" action="{:U('User/accountDetach')}" method="post">
		    <input type="hidden" name="phone" value="{$phone}">
		    <input class="account_detach_submit" type="submit" name="submit" value="解除绑定">
		</form>
		<div class="bottom">
			<p>如有疑问请致电020-29895619</p>
		</div>  	
	</div> -->
	<!-- <load href="__PUBLIC__/optometry/js/jquery-1.11.1.min.js" /> -->
	<!-- <load href="__PUBLIC__/optometry/js/account.js" /> -->
</body>
</html>