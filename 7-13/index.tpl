<html>
<head>
	<!--导入webim js_sdk-->
  <script src="__PUBLIC__/pc/sdk/strophe.js"></script>
  <script src="__PUBLIC__/pc/sdk/easemob.im-1.1.js"></script>
  <script src="__PUBLIC__/pc/sdk/easemob.im-1.1.shim.js"></script>
  <!--兼容老版本sdk需引入此文件-->

  <!--config-->
  <script src="__PUBLIC__/pc/js/easemob.im.config.js"></script>
  <!-- 导入jQuery -->
  <script type="text/javascript" src="__PUBLIC__/pc/js/jquery-1.12.2.min.js"></script>
  <!-- 导入js -->
  <script src='__PUBLIC__/pc/js/user.js' type="text/javascript"></script>
  <!-- 导入bootstrap -->
  <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">

  <!-- 导入样式 -->
  <link rel="stylesheet" type="text/css" href=" __PUBLIC__/pc/css/user.css" />
  
</head>
<body>
	<span id="unique_id" style="display:none">{$unique_id}</span>
	<span id="unique" style="display:none">{$unique_password}</span>
	<div id="code" class="mbl" style="display: show">
		<!--二维码-->
		<img src="{:U('OnlineTest/getqrcode',array('id'=>$unique_id))}" style="padding:0px;"><br/>
	</div>
	 <!-- 登录成功 -->
	<div id="login_success" style="display: none">
	    <!-- 屏幕大小选择 -->
	    <div class="scr_size_first">
	       <img src="__PUBLIC__/pc/images/computer_e.png" />
	       <h2>请选择您当前的屏幕尺寸</h2>
	       <h4>通过尺寸测量屏幕尺寸，选择正确尺寸开始验光</h4>
	       <div>
	        	<span id="0_size" class="size_scr"> <i></i>
	          		<b>14</b>寸
	        	</span>
	        	<span id="1_size" class="size_scr"> <i></i>
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
		      <img src="__PUBLIC__/pc/images/image_color_test.png"/>
		    </section>
		    <!-- 近视测试 -->
		    <section class="e_section">
		        <p>
		          当前距离： <b id="E_distance">5</b>
		          &nbsp;米
		        </p>
		        <div>
		          <img id="img_e" src="__PUBLIC__/pc/images/image_e.png"/>
		        </div>
	        </section>
	      <!-- 散光图 -->
		    <section class='sg_section'>
		      <img class="sg_img" src="__PUBLIC__/pc/images/image_astigmatism.png" />
		      <img class="sg_img" style="display: none;" src="__PUBLIC__/pc/images/image_astigmatism.png" />
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
	<script type="text/javascript">
		var scan_flag = false;
		function scan(){
			$.ajax({
		        url: 'getUser/id/{$unique_id}',
		        type: 'POST',
		        datatype: 'JSON',
		        success: function(msg){
		           	msg = JSON.parse(msg);
		           	var temp = msg['error'];
		           	if(msg['error']){
		           		scan_flag = false;
		           		console.info(msg['error']);
		           	}
		           	else{
		           		scan_flag = true;
		           	}
		        },
		        error: function(msg){
		          console.info(msg);
		        }
		    });
		}

		
	</script>
</body>
</html>