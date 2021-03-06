<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Optist</title>

  <script src="__PUBLIC__/sdk/strophe.js"></script>
  <script src="__PUBLIC__/sdk/easemob.im-1.1.js"></script>
  <script src="__PUBLIC__/sdk/easemob.im-1.1.shim.js"></script><!--兼容老版本sdk需引入此文件-->
  <script src="__PUBLIC__/js/easemob.im.config.js"></script>
  <!-- 导入jQuery -->
  <!-- <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script> -->
  <script src="__PUBLIC__/js/jquery-1.11.1.js"></script>
  <!-- 导入bootstrap -->
  <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" />

  <!-- 导入js -->

  <!-- 导入样式 -->
  <link rel="stylesheet" type="text/css" href=" __PUBLIC__/css/yanguango2o.css" />
</head>
<body>

<div id="yanguang" style="display: none">
  <!-- 导航条 -->
  <nav class="navbar navbar-default navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand">远程验光控制系统</a>
      </div>
       <div class="navbar-right">
        <select class='btn btn-default'  style="margin: 5px 30px 0 0 ;">
          <option id="btn_working" class='btn btn-default'>上班中</option>
          <option id="btn_rest" class='btn btn-default'>休息中</option>
        </select>

        <button id="btn_exit" class='btn btn-default' style="margin: 5px 10px 0 0; ">退出</button>
      </div>

    </div>
  </nav>
  <!-- 左边栏目 -->
  <div class="col-md-2 col-sm-2 my-sidebar">
    <div class="panel panel-success">
      <div class="panel-heading userData" >
        <span>用户数据</span>
      </div>
      <form id="ygd">
        <ul class="list-group list-unstyled user">
          <li  class="list-item userTel">
            <span>手机号：</span>
            <input name='phone' type="text" id='customer_tel'  class="tel" />
          </li>
          <li  class="list-item">
            <span>右眼</span>
            <ul class="list-group list-unstyled clearfix">
              <li class="list-item">
                <span class="col-xs-5 col-md-5 text-right">近视度数:</span>
                <input  name='right_myopia_degree' type="text" id='customer_right_myopia_degree' value="0"/>
              </li>
              <li class="list-item">
                <span class="col-md-5 text-right">散光度数:</span>
                <input name="right_astigmia_degree" type="text" id='customer_rightEye_sanguang' value="0"/>
              </li>
              <li class="list-item">
                <span class="col-md-5 text-right">散光轴位:</span>
                <input name="right_astigmia_direction" type="text" id='customer_rightEye_zhouwei' value="0"/>
              </li>
            </ul>
          </li>
          <li  class="list-item">
            <span>左眼</span>
            <ul class="list-group list-unstyled clearfix">
              <li class="list-item">
                <span class="col-md-5 text-right">近视度数:</span>
                <input name="left_myopia_degree" type="text" id='customer_left_myopia_degree' value="0"/>
              </li>
              <li class="list-item">
                <span class="col-md-5 text-right">散光度数:</span>
                <input name="left_astigmia_degree" type="text" id='customer_leftEye_sanguang' value="0"/>
              </li>
              <li class="list-item">
                <span class="col-md-5 text-right">散光轴位:</span>
                <input name="left_astigmia_direction" type="text" id='customer_leftEye_zhouwei' value="0"/>

              </li>

            </ul>
          </li>
          <li class="list-item">
            <span>瞳距</span>
            <ul class="list-group list-unstyled clearfix">
              <li class="list-item">
                <span class="col-md-5 text-right">瞳距:</span>
                <input name='pupillary_distance' type="text" id='customer_tongju' value="0"/>
              </li>
            </ul>
          </li>
          <li class="list-item">
            <a id="customer_save" class="btn btn-default btn-lg btn-success save center-block">保存</a>
          </li>
          <li id="customer_over" class="list-item">
            <a class="btn btn-default btn-lg btn-danger save center-block">结束</a>
          </li>
        </ul>
      </form>
    </div>

  </div>

  <!-- 右边栏目 -->
  <div class="col-md-offset-2 col-sm-offset-2">
    <div class="col-md-12">
      <!-- 验光宝框 -->
      <div class="col-md-3 div-1">
        <div class="panel panel-default">
          <div class="panel-heading">
            <span class="h3">验光宝</span>
          </div>

          <!-- for RG红绿图 -->
          <div class="panel-body" id='RG' style="display: none">
            <img src="__PUBLIC__/img/image_color_test.png" alt="RG" class="img-responsive" />
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
                <img id="picture" src="__PUBLIC__/img/0.png" class="img-circle" width="30px"/>
                <span id="deg2">4.0</span>
              </div>
              <div class="jian">
                <button id="subE" class="btn btn-default">-</button>
              </div>
            </div>

          </div>

          <!-- for SG散光 -->
          <div id='SG' style="display: none;">
            <div class="panel-body" id="sg_right">
              <div class="SGtop">
                <div class="SG_right SGtop_left col-md-6"></div>
                <div class="SGtop_right col-md-6">
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

          <!-- 脚部选择 -->
          <div class="panel panel-footer">
            <ul id="ygb_footer" class="list-inline list-unstyle div-1-footer">
              <li><button id='click_RG'>红绿图</button></li><li><button class="bgccc" id="click_E">E</button></li><li><button id="click_SG">散光图</button></li> 
            </ul>
          </div>

        </div>
      </div>

      <!-- 牛眼框 -->
      <div class="col-md-3 div-2">
        <div class="panel panel-default" id="NY_wrap">
          <div class="panel-heading">
            <span class="h3 nomp">牛眼</span>
          </div>
          <!-- for 右眼 -->
          <div class="panel-body" id="right_eye" >
            <div class="NYtop">
              <p>
                <span>右近视度数：</span> <i id="right_jinshi">0</i>
              </p>
              <p>
                <span>散光度数：</span> <i id="right_sanguang">0</i>
              </p>
              <p>
                <span>散光轴位：</span>
                <button id="rr_sg_sub5" class="btn btn-default btn-lg SG_sub5">-</button>
                <input id="right_zhouwei" type='button' value='0' class="btn btn-default btn-lg sguan" />
                <button id="rr_sg_add5" class="btn btn-default btn-lg SG_add5">+</button>
              </p>
            </div>
            <div class="NYmiddle">
              <h4 class="clearfix">
                <button class="bothEye btn btn-default pull-right" style="margin-right: 20px;">双眼</button>
              </h4>
              <h4>近视：</h4>
              <div class="text-center">
                <button id="rr_jinshi_sub25" class="btn btn-default btn-lg jinshi_sub25">-</button>
                <input type='button' value='0' id="rr_jinshi" class="btn btn-default btn-lg jinshi" />
                <button id="rr_jinshi_add25" class="btn btn-default btn-lg jinshi_add25">+</button>
              </div>

              <h4>散光：</h4>
              <div class="btn-group" id="rr_sanguang_div">
                <input type="button" class="btn btn-default" value='0' />
                <input type="button" class="btn btn-default" value='50' />
                <input type="button" class="btn btn-default" value='75' />
                <input type="button" class="btn btn-default" value='100' />
                <input type="button" class="btn btn-default" value='125' />
                <input type="button" class="btn btn-default" value='150' />
              </div>
            </div>
          </div>
          <!-- for 左眼 -->
          <div class="panel-body" id="left_eye"  >
            <div class="NYtop">
              <p>
                <span>左近视度数：</span>
                <i id="left_jinshi">0</i>
              </p>
              <p>
                <span>散光度数：</span>
                <i id="left_sanguang">0</i>
              </p>
            </div>
            <div class="NYmiddle">
              <p>
                <span>散光轴位：</span>
                <i id="left_zhouwei">0</i>
              </p>
              <h4 class="clearfix">
                <button class="bothEye btn btn-default pull-right" style="margin-right: 20px;">双眼</button>
              </h4>
              <h4>近视：</h4>
              <div class="text-center">
                <button id="ll_jinshi_sub25" class="btn btn-default btn-lg jinshi_sub25">-</button>
                <input id="ll_jinshi" type='button' value='0' class="btn btn-default btn-lg jinshi" />
                <button id="ll_jinshi_add25" class="btn btn-default btn-lg jinshi_add25">+</button>
              </div>
              <h4>散光：</h4>
              <div class="btn-group" id="ll_sanguang_div">
                <input type="button" class="btn btn-default" value='0' />
                <input type="button" class="btn btn-default" value='50' />
                <input type="button" class="btn btn-default" value='75' />
                <input type="button" class="btn btn-default" value='100' />
                <input type="button" class="btn btn-default" value='125' />
                <input type="button" class="btn btn-default" value='150' />
              </div>
            </div>
          </div>

          <!-- footer 按钮部分 -->
          <div class="panel panel-footer">
            <ul class="list-inline list-unstyle div-1-footer div-2-footer" id="NY_btn_div">
              <li>
                <button class="bgccc" >右眼</button>
              </li><li>
                <button >左眼</button>
              </li>
            </ul>
          </div>

        </div>
      </div>

      <!-- 视频框 -->
      <div class="col-md-4 div-3">
        <div class="panel panel-default">
          <div class="panel-heading">
            <span class="h3">视频</span>
          </div>
          <div class="panel-body">
            <video id="video" autoplay controls style="width: 100%;height: auto;"></video>
          </div>
          <div class="panel panel-footer">
            <span class="btn btn-default" id="yinpin">音频</span>
            <div class="changeWrap">
              <div class="changeinside"></div>
            </div>
            <span class="btn btn-default">麦克风</span>
            <span class="btn btn-default pull-right" id='reloadvideo'>刷新</span>
          </div>

        </div>
      </div>
      <!-- 等待列表 volist-->
      <div class="col-md-4 div-3">
        <div class="panel panel-default">
          <div class="panel-heading">
            <span class="h4">
              目前等待人数
              <i id="waitingCount">1</i>
              人
            </span>
          </div>
          <div id="wait_queue" class="panel-body">
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 弹幕 -->
  <div class="tanmuwrap" style="display: none;">
    <div class="tanmu">
      <div class="panel panel-info">
        <div class="panel-heading ">
          <span class="h4 ">请输入距离</span>
        </div>
        <div class="panel-body text-center" style="padding-top: 10px;">
          <span>默认5米</span>
          <input id="distance_input" type="text" name="distance" value="5" />
        </div>
        <div class="panel-footer">
          <div class="text-right">
            <button id="distance_confirm" class="btn btn-info">确定</button>
            &nbsp;
            <button id="distance_cancel"  class="btn btn-info">取消</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 选择框弹幕 -->
  <div class="sgzhouweidanmu">
    <div class="sgzhouweichoose" >
      <p class="text-center h4">选择轴位</p>
      <div class="choose_wrap center-block">
        <input type="button" class="btn btn-default" value='0' />
        <input type="button" class="btn btn-default" value='5' />
        <input type="button" class="btn btn-default" value='10' />
        <input type="button" class="btn btn-default" value='15' />
        <input type="button" class="btn btn-default" value='20' />
        <input type="button" class="btn btn-default" value='25' />
        <input type="button" class="btn btn-default" value='30' />
        <input type="button" class="btn btn-default" value='35' />
        <input type="button" class="btn btn-default" value='40' />
        <input type="button" class="btn btn-default" value='45' />
        <input type="button" class="btn btn-default" value='50' />
        <input type="button" class="btn btn-default" value='55' />
        <input type="button" class="btn btn-default" value='60' />
        <input type="button" class="btn btn-default" value='65' />
        <input type="button" class="btn btn-default" value='70' />
        <input type="button" class="btn btn-default" value='75' />
        <input type="button" class="btn btn-default" value='80' />
        <input type="button" class="btn btn-default" value='85' />
        <input type="button" class="btn btn-default" value='90' />
        <input type="button" class="btn btn-default" value='95' />
        <input type="button" class="btn btn-default" value='100' />
        <input type="button" class="btn btn-default" value='105' />
        <input type="button" class="btn btn-default" value='110' />
        <input type="button" class="btn btn-default" value='115' />
        <input type="button" class="btn btn-default" value='120' />
        <input type="button" class="btn btn-default" value='125' />
        <input type="button" class="btn btn-default" value='130' />
        <input type="button" class="btn btn-default" value='135' />
        <input type="button" class="btn btn-default" value='140' />
        <input type="button" class="btn btn-default" value='145' />
        <input type="button" class="btn btn-default" value='150' />
        <input type="button" class="btn btn-default" value='155' />
        <input type="button" class="btn btn-default" value='160' />
        <input type="button" class="btn btn-default" value='165' />
        <input type="button" class="btn btn-default" value='170' />
        <input type="button" class="btn btn-default" value='175' />
        <input type="button" class="btn btn-default" value='180' />

      </div>
    </div>
  </div>
  <div class="jinshidanmu">
    <div class="jinshichoose" >
      <p class="text-center h4">选择度数</p>
      <div class="choose_wrap center-block">
        <input type="button" class="btn btn-default" value='0' />
        <input type="button" class="btn btn-default" value='0.25' />
        <input type="button" class="btn btn-default" value='0.50' />
        <input type="button" class="btn btn-default" value='0.75' />
        <input type="button" class="btn btn-default" value='1.00' />
        <input type="button" class="btn btn-default" value='1.25' />
        <input type="button" class="btn btn-default" value='1.50' />
        <input type="button" class="btn btn-default" value='1.75' />
        <input type="button" class="btn btn-default" value='2.00' />
        <input type="button" class="btn btn-default" value='2.25' />
        <input type="button" class="btn btn-default" value='2.50' />
        <input type="button" class="btn btn-default" value='2.75' />
        <input type="button" class="btn btn-default" value='3.00' />
        <input type="button" class="btn btn-default" value='3.25' />
        <input type="button" class="btn btn-default" value='3.50' />
        <input type="button" class="btn btn-default" value='3.75' />
        <input type="button" class="btn btn-default" value='4.00' />
        <input type="button" class="btn btn-default" value='4.25' />
        <input type="button" class="btn btn-default" value='4.50' />
        <input type="button" class="btn btn-default" value='4.75' />
        <input type="button" class="btn btn-default" value='5.00' />
        <input type="button" class="btn btn-default" value='5.25' />
        <input type="button" class="btn btn-default" value='5.50' />
        <input type="button" class="btn btn-default" value='5.75' />
        <input type="button" class="btn btn-default" value='6.00' />
        <input type="button" class="btn btn-default" value='6.25' />
        <input type="button" class="btn btn-default" value='6.50' />
        <input type="button" class="btn btn-default" value='6.75' />
        <input type="button" class="btn btn-default" value='7.00' />
        <input type="button" class="btn btn-default" value='7.25' />

      </div>
    </div>
  </div>

  <!-- 休息一下弹幕 -->
  <div id="restdanmu" style="display: block;">
    <div class="rest_inside">
      <div id="danmu_wait_queue" class="panel-body">
        <section class="waiting currwaiting" id="1">
          <img src="__PUBLIC__/img/image_header.png" />
          <p>王大发</p>
        </section>
      </div>
      <div class="panel-footer">
        <button id="_rest" class="btn-block btn btn-primary ">休息一下?</button>
        <!-- <button id="_continue" class="btn-block btn btn-primary ">继续验光?</button> -->
      </div>
    </div>
  </div>


</div>
<label id="public_path" style="display: none">{$public}</label>
<label id="name" style="display: none">{$result['huan_name']}</label>
<label id="password" style="display: none">{$result['huan_password']}</label>
<script src='__PUBLIC__/js/optist.js' type="text/javascript"></script>
<script src='__PUBLIC__/js/controller.js' type="text/javascript"></script>
  

</body>
</html>