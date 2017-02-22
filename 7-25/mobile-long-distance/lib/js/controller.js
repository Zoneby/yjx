// 牛眼函数
$('document').ready(function() {
  // -------------------验光宝footer部分-----------------
  var div_1_btn = $('#ygb_footer').find('button');
  div_1_btn.click(function(){
    div_1_btn.removeClass('bgccc');
    $(this).addClass('bgccc');
  })
  // ---------------------导航条-----------------------
  // ---------------------导航条-----------------------
  var nav_btn = {
    working:null,
    rest:null,
    exit:null
  }
  nav_btn.working = $('#btn_working');
  nav_btn.rest = $('#btn_rest');
  nav_btn.exit = $('#btn_exit');

  nav_btn.working.click(function(){
    nav_btn.rest.css({'background-color':'#fff'});
    this.style.backgroundColor = '#ccc';
  })
  nav_btn.rest.click(function(){
    nav_btn.working.css({'background-color':'#fff'});
    this.style.backgroundColor = '#ccc';
  })
  nav_btn.exit.click(function(){
    user = null;
    conn.onClosed();
    window.location.href = '/i';
  })


  // ------------------左边栏用户数据开始------------------
  var _customer = function() {
    this.tel = null;
    this.rightEye = {
      jinshi: null,
      sanguang: null,
      zhouwei: null
    };
    this.leftEye = {
      jinshi: null,
      sanguang: null,
      zhouwei: null
    };
    this.tongju = null;
    this.beizu = null;
    return this;
  };
  //获取元素,存放元素的对象
  var customer = new _customer();

  customer.tel = $('#customer_tel');
  customer.rightEye.jinshi = $('#customer_right_myopia_degree');
  customer.rightEye.sanguang = $('#customer_rightEye_sanguang');
  customer.rightEye.zhouwei = $('#customer_rightEye_zhouwei');
  customer.leftEye.jinshi = $('#customer_left_myopia_degree');
  customer.leftEye.sanguang = $('#customer_leftEye_sanguang');
  customer.leftEye.zhouwei = $('#customer_leftEye_zhouwei');
  customer.tongju = $('#customer_tongju');
  customer.beizu = $('#customer_beizu');


  // 保存按钮
  $("#customer_save").click(function() {
      console.info('Yes');
      var msg = $('#ygd').serialize();
      console.info(msg);
      $.ajax({
        url: 'Optist/save_ygd',
        data: msg,
        type: 'POST',
        datatype: 'JSON',
        success: function(msg){
            if(msg > 0){
              alert('保存成功!');
            }
          },
        error: function(msg){
          console.info(msg);
        }
      });


    })
    // 结束按钮
  $("#customer_over").click(function() {
    $('#_rest').text("休息一下");
    var message = {};
    message.User_id = currentUserId;
    $.ajax({
      url: 'Optist/end_yg',
      type: 'POST',
      data: message,
      success: function(msg){
        if(msg == 1){
          $('#customer_tel').val(null);
          get();
          $('#restdanmu').show();
          var content = {};
          content.action = 4;
          content.control = 400;
          var msg = JSON.stringify(content);
          var options = {
              to : user,
              msg : msg,
              type: "chat"
          };
          conn.sendTextMessage(options);
        }
      },
      error: function(msg){
        console.info(msg);
      }
    });

    // 正在验光的人的id
    
    $('#_rest').click(function() {
      $(this).text('休息中。。。。');
    });
    // $('.currwaiting').click(function(){
      // $(this).
    // });
    // $('#_continue').click(function() {
    //   $('#restdanmu').hide();
    // })
  });
  // ------------------左边栏用户数据结束------------------



  // --------------获取弹幕所有元素-------------
  var jinshidanmu = $('.jinshidanmu');
  // ---------------------------牛眼开始------------------------
  // 创建眼睛对象储存数据
  function eye() {
    this.jinshi = 0;
    this.sanguang = 0;
    this.zhouwei = 0;
    this.deg = 0;
    return this;
  }
  // 更新对象的top数据，同时更新左边栏用户数据
  eye.prototype.updata_jinshi = function(obj, _eye) {
    // 更新牛眼top数据栏
    obj.text(this.jinshi);
    // 更新用户近视数据栏
    customer[_eye].jinshi.val(this.jinshi);
  }
  eye.prototype.updata_sanguang = function(obj, _eye) {
    // 更新牛眼top数据栏
    obj.text(this.sanguang);
    // 更新用户散光数据栏
    customer[_eye].sanguang.val(this.sanguang);
  }
  eye.prototype.updata_zhouwei = function(obj, _eye) {
      // 更新牛眼top数据栏
      obj.val(this.zhouwei);
      // 更新用户轴位数据栏
      customer[_eye].zhouwei.val(this.zhouwei);
    }
    // 牛眼中左眼右眼
  var right = new eye();
  var left = new eye();
  var eyeSide = 0;

  
  function sendControl() {
	var isTwoEye = $('.bothEye').hasClass("bgccc");
	
	//左眼
	var c = left.sanguang;
	var b = (left.jinshi * 100) % 150;
	var a = (left.jinshi * 100) - b;
	if(c > 0) {
		c = c / 25 - 1;
	}
	if(b > 0) {
		b = b / 25;
	}
	if(!isTwoEye && eyeSide != 1) {
		a = 5;
	}
	else if(a > 0) {
		a = a / 150;
	}
	
	//右眼
	var f = right.sanguang;
	var e = (right.jinshi * 100) % 150;
	var d = (right.jinshi * 100) - e;
	if(f > 0) {
		f = f / 25 - 1;
	}
	if(e > 0) {
		e = e / 25;
	}
	if(!isTwoEye && eyeSide != 0) {
		d = 5;
	}
	else if(d > 0) {
		d = d / 150
	}
	
	var command = "a" + a + ",b" + b + ",c" + c + ",d" + d + ",e" + e + ",f" + f;
    var content = {};
	content.control = 200;
    content.command = command;
    var msg = JSON.stringify(content);
    var options = {
        to : user,
        msg : msg,
        type: "chat"
    };
	conn.sendTextMessage(options);
  }
  

  // ------------------------右眼开始----------------
  // 获取牛眼上面显示数据的元素
  var right_jinshi = $('#right_jinshi');
  var right_sanguang = $('#right_sanguang');
  var right_zhouwei = $('#right_zhouwei');

  // 获取近视三个按钮
  var rr_jinshi_sub25 = $('#rr_jinshi_sub25');
  var rr_jinshi = $('#rr_jinshi');
  var rr_jinshi_add25 = $('#rr_jinshi_add25');

  rr_jinshi.click(function() {
    jinshidanmu.css({
      'display': 'block'
    });
    var _that = $(this);
    $('.choose_wrap').find('input').click(function() {
      jinshidanmu.css({
        'display': 'none'
      });
      right.jinshi = $(this).val()
      _that.val(right.jinshi);
      rr_jinshi.val(right.jinshi);
      right.updata_jinshi(right_jinshi, 'rightEye');
	  
	  sendControl();
    })
  })
  rr_jinshi_sub25.click(function() {
    if(right.jinshi > 0 ){
      right.jinshi = (rr_jinshi.val() - 0.25).toFixed(2);
      rr_jinshi.val(right.jinshi);
      right.updata_jinshi(right_jinshi, 'rightEye');
    	sendControl();
    };
  
  });
  rr_jinshi_add25.click(function() {
    if(right.jinshi < 7.25){
      right.jinshi = (rr_jinshi.val() - 0 + 0.25).toFixed(2);
      rr_jinshi.val(right.jinshi);
      right.updata_jinshi(right_jinshi, 'rightEye');
	  
	   sendControl();
    };
  });
    // 获取散光按钮
  $('#rr_sanguang_div').find('input').click(function() {
    var _this = $(this);
    _this.siblings().removeClass("bgccc");
    _this.addClass("bgccc");
    right.sanguang = _this.val();
    right.updata_sanguang(right_sanguang, 'rightEye');
	
	sendControl();
  });
  // -----------------------右眼结束---------------------


  // ---------------------左眼开始--------------------
  // 获取牛眼上面显示数据的元素
  var left_jinshi = $('#left_jinshi');
  var left_sanguang = $('#left_sanguang');
  var left_zhouwei = $('#left_zhouwei');
  // 获取近视三个按钮
  var ll_jinshi_sub25 = $('#ll_jinshi_sub25');
  var ll_jinshi = $('#ll_jinshi');
  var ll_jinshi_add25 = $('#ll_jinshi_add25');

  ll_jinshi.click(function() {
    jinshidanmu.css({
      'display': 'block'
    });
    var _that = $(this);
    $('.choose_wrap').find('input').click(function() {
      jinshidanmu.css({
        'display': 'none'
      });
      left.jinshi = $(this).val()
      _that.val(left.jinshi);
      ll_jinshi.val(left.jinshi);
      left.updata_jinshi(left_jinshi, 'leftEye');
	  
	  sendControl();
    })
  })
  ll_jinshi_sub25.click(function() {
    if(left.jinshi > 0){
      left.jinshi = (ll_jinshi.val() - 0.25).toFixed(2);
      ll_jinshi.val(left.jinshi);
      left.updata_jinshi(left_jinshi, 'leftEye');
    
      sendControl();
    };
    
  });
  ll_jinshi_add25.click(function() {
    if(left.jinshi < 7.50){
      left.jinshi = (ll_jinshi.val() - 0 + 0.25).toFixed(2);
      ll_jinshi.val(left.jinshi);
      left.updata_jinshi(left_jinshi, 'leftEye');
    
      sendControl();
    };
      
  });
    // 获取散光按钮
  $('#ll_sanguang_div').find('input').click(function() {
    var _this = $(this);
    _this.siblings().removeClass("bgccc");
    _this.addClass("bgccc");
    left.sanguang = _this.val();
    left.updata_sanguang(left_sanguang, 'leftEye');
	
	sendControl();
  });
  // -----------------------左眼结束------------------------

  // -----------------------双眼开始-----------------------------
  $('.bothEye').click(function() {
      $('.bothEye').toggleClass('bgccc');
	  
	  sendControl();
    })
    // -----------------------双眼结束-----------------------------



  // -------------------牛眼下方按钮样式---------------------
  var NY_btn_lists = $('#NY_btn_div').find("button"); //获取牛眼两个按钮
  var rightEye = $('#right_eye'); //获取右眼牛眼框
  var leftEye = $('#left_eye'); //获取左眼牛眼框
  var sg_right = $('#sg_right'); //获取右眼散光
  var sg_left = $('#sg_left'); //获取左眼散光

  //右眼按钮，同时控制验光宝中散光图
  NY_btn_lists.eq(0).click(function() {
      NY_btn_lists.removeClass('bgccc');
      $(this).addClass('bgccc');
      leftEye.hide();
      rightEye.show();
      sg_left.hide();
      sg_right.show();
	  
	  eyeSide = 0;
	  sendControl();
    })
    // 左眼按钮，同时控制验光宝中散光图
  NY_btn_lists.eq(1).click(function() {
      NY_btn_lists.removeClass('bgccc');
      $(this).addClass('bgccc');
      rightEye.hide();
      leftEye.show();
      sg_right.hide();
      sg_left.show();
	  
	  eyeSide = 1;
	  sendControl();
    })
    // -------------------牛眼下方按钮样式结束-------------------


  // ----------------------等待列表开始-----------------
  var waiteCount = $('#waitingCount');
  var waitinglist = $('.waiting');
  waitinglist.click(function() {
      waitinglist.removeClass('currwaiting');
      $(this).addClass('currwaiting');
    })
    // ------------------等待列表结束---------------------



  // -----------------------散光开始-----------------------
  // ------------------右眼----------------
  var right_curr_zhouwei = $('#right_curr_zhouwei');
  var right_SGtop_left = $('.SG_right');
  var right_top = 0;
  rightSanguang();
  function changeSG(){
    var content = {};
	  content.control = 400;
    content.degree = right.deg;
    content.pi = right_top;
    content.action = 3;
    console.info(content);
    var msg = JSON.stringify(content);
    var options = {
        to : user,
        msg : msg,
        type: "chat"
      };
      //console.info(messageContent);
      conn.sendTextMessage(options);
  }
  function rightSanguang() {
    // 横竖线
    $('#right_row_col_div').click(function() {
        right_SGtop_left.toggleClass('SGtop_left_change');
        if(right_SGtop_left.hasClass('SGtop_left_change')){
            right_top = 1;
        }else{
          right_top = 0;
        }
        changeSG();
    })
      // 轴位加减
    function updata_right_sanguang_zhouwei(_num) {
        var _text = Number(right_curr_zhouwei.text());
        var curr = _text + _num;
        if (curr < 0) {
          curr += 180;
        }
        // 更新验光宝轴位
        right_curr_zhouwei.text(curr % 180);
        // 储存在变量中，并更新牛眼轴位
        right.zhouwei = curr % 180;
        right.updata_zhouwei(right_zhouwei, 'rightEye');
        // 更新旋转角度
        right.deg +=_num;
        right_SGtop_left.css({'transform':'rotate('+right.deg+'deg)',
          '-webket-transform':'rotate('+right.deg+'deg)',
          '-o-transform':'rotate('+right.deg+'deg)',
          '-moz-transform':'rotate('+right.deg+'deg)',
          '-ms-transform':'rotate('+right.deg+'deg)'
        })
      right_SGtop_left.removeClass('SGtop_left_change');
      right_top = 0;      
    }
    function sendSG(messageContent){
      var content = {};
	  content.control = 400;
      content.action = 3;
      content.pi = right_top;
      content.degree = messageContent;
      var msg = JSON.stringify(content);
      console.info(msg);
      console.info(user);
      var options = {
        to : user,
        msg : msg,
        type: "chat"
      };
      //console.info(messageContent);
      conn.sendTextMessage(options);
    }

    $('#right_zhouwei_add5').click(function() {
        updata_right_sanguang_zhouwei(5);
        sendSG(right.deg);
    })
    $('#right_zhouwei_sub5').click(function() {
      updata_right_sanguang_zhouwei(-5);
      sendSG(right.deg);
    })
    $('#right_zhouwei_add1').click(function() {
      updata_right_sanguang_zhouwei(1);
      sendSG(right.deg);
    })
    $('#right_zhouwei_sub1').click(function() {
      updata_right_sanguang_zhouwei(-1);
      sendSG(right.deg);
    })
  }


  // --------------------左眼-------------------
  var left_curr_zhouwei = $('#left_curr_zhouwei');
  var left_SGtop_left = $('.SG_left');
  var left_top = 0;
  leftSanguang();

  function changeSG_left(){
    var content = {};
	content.control = 400;
    content.degree = left.deg;
    content.pi = left_top;
    content.action = 3;
    var msg = JSON.stringify(content);
    var options = {
        to : user,
        msg : msg,
        type: "chat"
      };
      //console.info(messageContent);
      conn.sendTextMessage(options);
  }
  function leftSanguang() {

    // 横竖线
    $('#left_row_col_div').click(function() {
        left_SGtop_left.toggleClass('SGtop_left_change');
        if(left_SGtop_left.hasClass('SGtop_left_change')){
            left_top = 1;
        }else{
          left_top = 0;
        }
        changeSG_left();
    })
      // 轴位加减
    function updata_left_sanguang_zhouwei(_num) {
      var _text = Number(left_curr_zhouwei.text());
      var curr = _text + _num;
      if (curr < 0) {
        curr += 180;
      }
      left_curr_zhouwei.text(curr % 180);

      left.zhouwei = curr % 180;
      left.updata_zhouwei(left_zhouwei, 'leftEye');
      // 更新旋转角度
      left.deg +=_num;
      left_SGtop_left.css({'transform':'rotate('+left.deg+'deg)',
        '-webket-transform':'rotate('+left.deg+'deg)',
        '-o-transform':'rotate('+left.deg+'deg)',
        '-moz-transform':'rotate('+left.deg+'deg)',
        '-ms-transform':'rotate('+left.deg+'deg)'
      })
      left_SGtop_left.removeClass('SGtop_left_change');
      left_top = 0;
    }
    function sendSG(messageContent){
      var content = {};
	    content.control = 400;
      content.action = 3;
      content.pi = left_top;
      content.degree = messageContent;
      var msg = JSON.stringify(content);
      console.info(msg);
      console.info(user);
      var options = {
        to : user,
        msg : msg,
        type: "chat"
      };
      //console.info(messageContent);
      conn.sendTextMessage(options);
    }
    $('#left_zhouwei_add5').click(function() {
      updata_left_sanguang_zhouwei(5);
      sendSG(left.deg);
    })
    $('#left_zhouwei_sub5').click(function() {
      updata_left_sanguang_zhouwei(-5);
      sendSG(left.deg);
    })
    $('#left_zhouwei_add1').click(function() {
      updata_left_sanguang_zhouwei(1);
      sendSG(left.deg);
    })
    $('#left_zhouwei_sub1').click(function() {
        updata_left_sanguang_zhouwei(-1);
        sendSG(left.deg);
      })
      // ------------------------散光结束------------------
  }
})