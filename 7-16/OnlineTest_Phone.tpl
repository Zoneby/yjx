<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Optist</title>

  <script src="__PUBLIC__/pc/sdk/strophe.js"></script>
  <script src="__PUBLIC__/pc/sdk/easemob.im-1.1.js"></script>
  <script src="__PUBLIC__/pc/sdk/easemob.im-1.1.shim.js"></script><!--兼容老版本sdk需引入此文件-->
  <script src="__PUBLIC__/pc/js/easemob.im.config.js"></script>
  <!-- 导入jQuery -->
  <!-- <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script> -->
   <script type="text/javascript" src="__PUBLIC__/pc/js/jquery-1.12.2.min.js"></script>
  <!-- 导入bootstrap -->
  <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" />

  <!-- 导入js -->

  <!-- 导入样式 -->
  <link rel="stylesheet" type="text/css" href=" __PUBLIC__/pc/css/yanguango2o.css" />
</head>
<body>


<div id="yanguang" style="display: none">

  <div class="col-md-offset-2 col-sm-offset-2">
    <div class="col-md-12">
      <!-- 验光宝框 -->
      <div class="col-md-3 div-1">
        <div class="panel panel-default">

          <!-- for RG红绿图 -->
          <div class="panel-body" id='RG' style="display: none">
            <img src="__PUBLIC__/pc/images/image_color_test.png" alt="RG" class="img-responsive" />
          </div>

          <!-- for E近视测试 -->
          <div class="panel-body" id="E" style="display: block;">
            <div class="Etop">
              <h1 class="text-center" id="distance">5</h1>
              <p class="text-center">当前距离（米）</p>
            </div>
            <div class="Edown text-center">
              <div class="add">
                <button id="addE" class="btn btn-default">+</button>
              </div>
              <div class="middle">
                <span id="deg1">0.1</span>
                <img id="picture" src="__PUBLIC__/pc/images/0.png" class="img-circle" width="30px"/>
                <span id="deg2">4.0</span>
              </div>
              <div class="jian">
                <button id="subE" class="btn btn-default">-</button>
              </div>
            </div>

          </div>
        </div>
      </div>
</div>
<label id="public_path" style="display: none">{$public}</label>
<label id="goal" style="display: none">{$goal}</label>
<label id="name" style="display: none">{$result['huan_name']}</label>
<label id="password" style="display: none">{$result['huan_password']}</label>
<script src='__PUBLIC__/pc/js/optist.js' type="text/javascript"></script>
  

</body>
</html>