<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>验光师登录-isee在线验光系统</title>
	<script src="__PUBLIC__/sdk/strophe.js"></script>
  	<script src="__PUBLIC__/sdk/easemob.im-1.1.js"></script>
  	<script src="__PUBLIC__/sdk/easemob.im-1.1.shim.js"></script>
  	<!--兼容老版本sdk需引入此文件-->

  	<!--config-->
  	<script src="__PUBLIC__/mobile/js/easemob.im.config.js"></script>

  	<!-- 导入jQuery -->
	<script src="__PUBLIC__/js/jquery-1.11.1.js"></script>

	<link rel="stylesheet" type="text/css" href="__PUBLIC__/css/user.css">
	<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">


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
		<div class="QRcode">
	      <img  width="160px" height="160px" src="{:U('Index/getqrcode',array('id'=>$id))}" />
	    </div>
    </div>
    <div id="login_success" style="display: none">
    <!-- 屏幕大小选择 -->
	    <div class="scr_size_first">
	      <img src="__PUBLIC__/img/computer_e.png" />
	      <h2>请选择您当前的屏幕尺寸</h2>
	      <h4>通过尺寸测量屏幕尺寸，选择正确尺寸开始验光</h4>
	      <div>
	        <span id="0_size" class="size_scr"> <i></i>
	          <b>14</b>寸
	        </span>
	        <span id="1_zise" class="size_scr"> <i></i>
	          <b>15.6</b>寸
	        </span>
	      </div>
	      <div>
	        <span id="3_size" class="size_scr">
	          <i></i>
	          <b>23</b>寸
	        </span>
	        <input type="text" id="inputsize_first" name="size" placeholder="手动填写" />
	      </div>
	    </div>
	    <!-- 控制wrap -->
	    <div id="controller_wrap" style="display:none;">
	      <!-- 红绿图 -->
	      <section class="hl_section">
	        <img src="__PUBLIC__/img/image_color_test.png"/>
	      </section>
	      <!-- 近视测试 -->
	      <section class="e_section">
	        <p>
	          当前距离： <b id="E_distance">5</b>
	          &nbsp;米
	        </p>
	        <div>
	          <img id="img_e" src="__PUBLIC__/img/image_e.png"/>
	        </div>
	      </section>
	      <!-- 散光图 -->
	      <section class='sg_section'>
	        <img class="sg_img" src="__PUBLIC__/img/image_astigmatism.png" />
	        <img class="sg_img" style="display: none;" src="__PUBLIC__/img/image_astigmatism.png" />
	      </section>
	      <!-- 屏幕大小选择 -->
	      <div class="scr_size_wrap">
	        <span>请选择你的电脑尺寸：</span>
	        <div class="input_wrap">
	          <input type="radio" class="scr_size" name="_screenSize" value="14" />
	          <label>14</label>
	        </div>
	        <div class="input_wrap">
	          <input type="radio" class="scr_size" name="_screenSize" value="15.6" />
	          <label>15.6</label>
	        </div>
	        <div class="input_wrap">
	          <input type="radio" class="scr_size" name="_screenSize" value="23" />
	          <label>23</label>
	        </div>

	        <span>
	          其他：
	          <input id="inputsize" type="text"   />
	          <button id="submit_btn">确定</button>
	        </span> 
	        <b class="tip">选择你的电脑尺寸</b>

	        <button id="exit_btn" style="margin-left: 30px;">退出</button>
	      </div>
	    </div>

  	</div>
	<!-- <button id="turn" style="display:none">开始验光</button> -->

	
	<script src="__PUBLIC__/js/sha1.js"></script></body>
	<script src="__PUBLIC__/js/login.js"></script>
	<script src="__PUBLIC__/mobile/js/user.js"></script>
	<script type="text/javascript">
		var url = "{:U('Index/qrcode_login')}";
		var flag = 0;
		var search = function(){
			$.ajax({
				url: url,
				data: {
					id: "{$id}"
				},
				type: "POST",
				datatype: "JSON",
				success: function(msg){
					 msg = JSON.parse(msg);
	                var temp = msg['error'];
	                if(msg['error']){
	                  flag = 0;
	                  console.info(msg['error']);
	                }
	                else{
	                  	flag = 1;
						console.info('{$id}');
						huan_id = "{$id}";
             	 		huan_password = "{$password}";
						setTimeout(function(){
			                console.info("here");
			                conn.open({
			                  apiUrl : Easemob.im.config.apiURL,
			                  user : huan_id,
			                  pwd :  huan_password,
			                  //连接时提供appkey
			                  appKey : Easemob.im.config.appkey
			                });
			                return false;
			            }, 50);
					}
				},
				error: function(msg){
					console.info(msg);
				}
			});
		}

		var scan_time = function(){
			if(flag == 1){
				return;
			}
			search();
			setTimeout(scan_time,2000);
		}
		scan_time();


	</script>
	

</body>
</html>