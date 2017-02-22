<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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

<style type="text/css">
 
</style>
<body >
<div id="all" style="overflow: hidden;">
    <div id="first_page" class="page" style="display:block;">
        <div class="up_box_first" style="padding-top: 5%;">
          <h1 class="title_first">请选择屏幕尺寸</h1>
        </div>
        <div class="down_box_first">
          <div style="padding-left: 0.5em;">
            <span id="size_0" class="circle circle_bg"><p class="p_click">14寸</p></span>
          </div>
          <div style="padding-right: 0.5em;">
            <span id="size_1" class="circle"><p>15.6寸</p></span>
          </div>
          <div style="padding-left: 0.5em; padding-top:1em;">
            <span id="size_2" class="circle"><p>23寸</p></span>
          </div>
          <div style="padding-right: 0.5em; padding-top:1em;">
            <input class="circle_input" type="text" id="inputsize_first" name="size" placeholder="手动编辑" onchange="myInput(this.id)"/>
          </div>
        </div>
        <div class="footer_box_first"><button id="btn1" class="btn_first">下一步</button></div>
    </div>

      <div id="second_page" class="page" style="display: none;">
        <div class="up_box_second" style="padding-top: 5%;">
          <div class="header">
            <div>
              <h1 style="font-size: 2em;">请选择一个合适的测量距离</h1>
              <h2 style="text-align: center; font-size: 1.5em;color: #aaa;">(人眼与电脑屏幕的距离)</h2>
            </div>
          </div>
        </div>
        <div class="down_box_second">
          <div style="padding-left: 0.5em;">
            <span id="distance_0" class="circle circle_bg"><p class="p_click">2米</p></span>
          </div>
          <div style="padding-right: 0.5em;">
            <span id="distance_1" class="circle"><p>3米</p></span>
          </div>
          <div style="padding-left: 0.5em; padding-top:1em;">
            <span id="distance_2" class="circle"><p>4米</p></span>
          </div>
          <div style="padding-right: 0.5em; padding-top:1em;">
            <input class="circle_input" type="text" id="inputdistance_first" name="size" placeholder="手动编辑" onchange="myInput(this.id)"/>
          </div>
        </div>
        <div class="footer_box_second">
            <button  class="btn_first" id="btn2">下一步</button>
        </div>
      </div>

      <div id="third_page" class="page" style="display: none;">
        <div class="up_box_third">
          <div>
            <h1 class="title_three">点击屏幕的E字开口方向</h1>
            <h2 style="text-align:center;">当前距离
            <select name="meters">
              <option value="3">3米</option>
              <option value="4">4米</option>
              <option value="5">5米</option>
            </select>
            </h2>
          </div>
        </div>
        <div class="down_box_third">
          <div class="">
            <img class="one" src="__PUBLIC__/mobile/images/E.png">
          </div>
          <div  class="">
            <img class="two" src="__PUBLIC__/mobile/images/E.png">
          </div>
          <div  class="">
            <img class="three" src="__PUBLIC__/mobile/images/E.png">
          </div>
          <div  class="">
            <img class="four" src="__PUBLIC__/mobile/images/E.png">
          </div>
        </div>
      </div>
</div>

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
          <div class="panel-body" id="E" style="display: none;">
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
<script type="text/javascript">
    $(document).ready(function() {
        $('#all').css('height',$(window).height);
        $('#third_page').css('height',$(window).height);

      $('.circle, .circle_input').click(function() {
        var spanId = $(this).attr('id');
        $('.circle').removeClass('circle_bg');
        $('p').removeClass('p_click');
        $('#'+spanId).addClass('circle_bg').children('p').addClass('p_click');
        $('.circle_input').removeClass('circle_bg');
        // console.log(spanId);
        // console.log(this);
      });
      
      $('#btn1').click(function() {
        $('#first_page').css({'display':'none'});
        $('#second_page').css({'display':'block'});
      });
      $('#btn2').click(function() {
        $('#second_page').css({'display':'none'});
        $('#third_page').css({'display':'block'});
      });
    });
    function myInput(input_Id) {
      $('#'+input_Id).addClass('circle_bg');
//      console.log(input_Id);
    }
</script>

</body>
</html>