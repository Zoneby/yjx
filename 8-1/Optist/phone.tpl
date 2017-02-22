<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta content="yes" name="apple-moblie-web-app-capable">
	<meta content="yes" name="apple-touch-fullscreen">
	<meta content="telphone=no,email=no" name="format-detection">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no"/>
	<title>手机远程验光</title>
  <!-- from index.tpl -->
  <script src="__PUBLIC__/sdk/strophe.js"></script>
  <script src="__PUBLIC__/sdk/easemob.im-1.1.js"></script>
  <script src="__PUBLIC__/sdk/easemob.im-1.1.shim.js"></script><!--兼容老版本sdk需引入此文件-->
  <script src="__PUBLIC__/mobile/js/easemob.im.config.js"></script>
  <script src="__PUBLIC__/js/jquery-1.11.1.js"></script>
  <!-- 导入bootstrap -->
  <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" />
	<script type="text/javascript" src="__PUBLIC__/js/flexible.js"></script>

  <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/phone-index.css">
</head>

<body>
	<header>
		<nav>
			<a  class="e-click-link" id="first-logo"></a>
			<a  class="rg-link" id="second-logo"></a>
			<a  class="agtm-link" id="third-logo"></a>
			<a  class="input-link" id="fourth-logo"></a>
		</nav>
	</header>
  <!-- for E-test -->
	<div class="page" id="first-page" style="display: block;">
		<div class="panel-body" id="E" style="display: block;">
            <div class="Etop">
              <h1 class="text-center" style="font-size: 48px;"><span id="distance_input">5</span></h1>
              <p class="text-center now-distance">当前距离（米）</p>
            </div>
            <div class="Edown text-center">
              <div class="add">
                <button id="addE" class="btn btn-default">+</button>
              </div>
              <div class="middle">
                <span id="deg1">0.1</span>
                <img id="picture" src="__PUBLIC__/img/0.png" class="img-circle"/>
                <span id="deg2">4.0</span>
              </div>
              <div class="sub">
                <button id="subE" class="btn btn-default">-</button>
              </div>
            </div>
          </div>
	</div>
  <!-- for RG -->
	<div class="page" id="second-page" style="display: none;">
		<div class="panel-body" id='RG'>
            <img src="__PUBLIC__/img/image_color_test.png" alt="RG" class="img-responsive" />
         </div>
	</div>

	<!-- for SG散光 -->
	<div class="page" id="third-page" style="display: none;">
		<div id='SG' style="display: block;">
            <div class="panel-body" id="sg_right">
            	<div class="SGtop">
                	<div class="SG_right SGtop_left" style="width: 50%;"></div>
                	<div class="SGtop_right">
                  	<h1 id="right_curr_zhouwei" class="text-center">0</h1>
                  	<p class="text-center">当前轴位</p>
                </div>
            </div>
              	<div class="SGmiddle">
                	<div>
                  		<button id="right_zhouwei_sub5" class="btn btn-default btn-lg SGsub">-</button> <b>5</b>
                  		<button id="right_zhouwei_add5" class="btn btn-default btn-lg SGadd">+</button>
                	</div>
                	<div>
                  	<button id="right_zhouwei_sub1" class="btn btn-default btn-lg SGsub">-</button> <b>1</b>
                  	<button id="right_zhouwei_add1" class="btn btn-default btn-lg SGadd">+</button>
                	</div>
              	</div>
              	<div class="SGdown">
                	<div id="right_row_col_div" class="row_col_div center-block btn btn-default btn-lg">
                  	<p class="text-center">右横竖线</p>
                </div>
            </div>
        </div>
        <div class="panel-body" id="sg_left" style="display:none;">
            <div class="SGtop">
                <div class="SG_left SGtop_left col-md-6"></div>
                <div class="SGtop_right col-md-6">
                  <h1 id="left_curr_zhouwei" class="text-center">0</h1>
                  <p class="text-center">当前轴位</p>
                </div>
            </div>
              <div class="SGmiddle">
                <div>
                  <button id="left_zhouwei_sub5" class="btn btn-default btn-lg SGsub">-</button>
                  <b>5</b>
                  <button id="left_zhouwei_add5" class="btn btn-default btn-lg SGadd">+</button>
                </div>
                <div>
                  <button id="left_zhouwei_sub1" class="btn btn-default btn-lg SGsub">-</button>
                  <b>1</b>
                  <button id="left_zhouwei_add1" class="btn btn-default btn-lg SGadd">+</button>
                </div>
              </div>
              <div class="SGdown">
                <div id="left_row_col_div" class="row_col_div center-block btn btn-default btn-lg">
                  <p class="text-center">横竖线</p>
                </div>
              </div>
            </div>
        </div>
	</div>
  <!--  for input-agtm-msg -->
	<div class="page" id="fourth-page" style="display: none;">
	<div class="container" id="containerId">
	    <notempty name="error">
	    <p  class="new_1" style="color:red">{$error}</p>
	    </notempty>
	    <!-- pc form id="ygd"-->
	    <form id="ygd" >
	            <div class="phone_p">
	                <p class="new_1">验光单所属：</p>
	                <input type="text" name="phone" id="customer_tel">
	            </div>
	            <!-- 度数 -->
	            <p class="list_p">度数（SPH）</p>
	            <select class="select_left" id="selectId_1" name="left_myopia_degree">
	            </select>
	            <select class="select_right" id="selectId_2" name="right_myopia_degree">
	            </select> 


	            <!-- 瞳距 -->
	            <p class="list_p">瞳距（PD）</p>
	            <select class="select_bottom" id="selectId_3" name="pupillary_distance">
	            </select>

	            <!-- 散光 -->
	            <p class="list_p">散光（CYL）</p>
	            <select class="select_left" id="selectId_4" name="left_astigmia_degree">
	            </select> 
	            <select class="select_right" id="selectId_5" name="right_astigmia_degree">
	            </select>

	            <!-- 散光方向 -->
	            <p class="list_p" id="selectIdhide">轴位（AIXS）</p>
	            <select class="select_left selecting" id="selectId_6" name="left_astigmia_direction">
	            </select> 
	            <select class="select_right selecting" id="selectId_7" name="right_astigmia_direction">
	            </select>
	        </form>
	        <div class="buy_div">
	            <div class="col-2">
	                <button type="submit" id="customer_save" class="btn btn-warning">保存</button>
	            </div>
	        </div>
  </div>

<script type="text/javascript" src="__PUBLIC__/mobile/js/phone-index-four-page.js"></script>
<script src="__PUBLIC__/js/jquery.mobile-1.4.5.js"></script>

<label id="public_path" style="display: none">{$public}</label>
<label id="name" style="display: none">{$result['huan_name']}</label>
<label id="password" style="display: none">{$result['huan_password']}</label>
<label id="goal" style="display: none">{$goal_id}</label>
<script src='__PUBLIC__/mobile/js/optist.js' type="text/javascript"></script>
<script src='__PUBLIC__/mobile/js/controller.js' type="text/javascript"></script>
</body>

</html>