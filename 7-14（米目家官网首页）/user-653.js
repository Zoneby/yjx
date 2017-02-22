var huan_id = null;
var huan_password = null;

$(document).ready(function() {

	conn = new Easemob.im.Connection({
		multiResources: Easemob.im.config.multiResources,
		https: Easemob.im.config.https,
		url: Easemob.im.config.xmppURL
	});
	//初始化连接
	conn.listen({
		//当连接成功时的回调方法
		onOpened: function() {
			console.info(conn);
			handleOpen(conn);
		},
		//当连接关闭时的回调方法
		onClosed: function() {
			handleClosed();
		},
		//收到文本消息时的回调方法
		onTextMessage: function(message) {

			handleTextMessage(message.data);
			//handleTextMessage(message);
		}
	});

	//login_im();
	var curr = {};
	curr.distance = 5;
	curr.deg = 0;
	curr.dushu = 4.0;

	//设置要显示的元素、传入索引1、2、3
	function changeSection(index) {
		$('section').hide();
		$('section').eq(index - 1).show();
		if (index == 2) {
			$('.scr_size_wrap').show();
		} else {
			$('.scr_size_wrap').hide();
		}
	}
	changeSection(2);

	// -------------------旋转图片-----------------------
	// 传入旋转角度、0-右、1-下、2-左、3-上
	function changeDegree(_deg) {
		var _img_e = $('#img_e');
		var deg = _deg; //获取旋转参数
		_img_e.css({
			'transform': 'rotate(' + deg * 90 + 'deg)',
			'-webket-transform': 'rotate(' + deg * 90 + 'deg)',
			'-o-transform': 'rotate(' + deg * 90 + 'deg)',
			'-moz-transform': 'rotate(' + deg * 90 + 'deg)',
			'-ms-transform': 'rotate(' + deg * 90 + 'deg)'
		})
	}
	changeDegree(0);


	// --------------------改变E图片大小-----------
	// 获得屏幕信息
	var _screenW = window.screen.width;
	var _screenH = window.screen.height;
	var _size = Math.sqrt(Math.pow(_screenW, 2) + Math.pow(_screenH, 2));
	var _screenSize = 14; //屏幕英寸
	function setimgW() {
		$('section img').width(_screenH * 2 / 3);
	}
	//radio屏幕大小选择
	var temp = $('.scr_size');
	temp.click(function() {
		_screenSize = $(this).val();
		changeImgSize(curr.dushu);
		$('#inputsize').val("");
	});
	//自行输入电脑尺寸
	$('#submit_btn').click(function() {
		$("input").removeAttr('checked');
		var inputsize = parseFloat($('#inputsize').val());
		if (inputsize) {
			$('#inputsize').val(inputsize);
			console.log('输入的尺寸:' + inputsize);
			_screenSize = inputsize;
			changeImgSize(curr.dushu);
		} else {
			$('#inputsize').val("请正确输入");
		}
	})
	// -------------------------退出------------------------
	$('#exit_btn').click(function(){
		$.ajax({
			url: 'Account/end_yg',
			data: {
				"flag": 1
			},
			type: 'POST',
			datatype: 'JSON',
			success: function(msg){
				conn.onClosed();
				console.info(msg);
				window.location.href = '/';
			},
			error: function(msg){
				console.info(msg);
			}
		});
	})

	/////////////////////// 选择屏幕大小2/////////////////
	// var temp_first = $('.size_scr');
	$('.size_scr').click(function() {
		var _id = parseFloat($(this).attr('id'));
		console.log(_id);
		temp.eq(_id).attr('checked',true);
		// temp.removeClass('active_scr_size');
		// $(this).addClass('active_scr_size');
		_screenSize = parseFloat($(this).text());
		changeImgSize(curr.dushu);
		$('.scr_size_first').hide();
		$('#controller_wrap').show();
	});
	$('#inputsize_first').change(function() {
		var _size = $(this).val();
		if (parseFloat(_size)) {
			_screenSize = parseFloat(_size);
			changeImgSize(curr.dushu);
			$('#inputsize').val(_screenSize);
			$('.scr_size_first').hide();
			$('#controller_wrap').show();

		} else {
			$(this).val("请正确输入");
		}
	})

	//改变img大小

	function changeImgSize(x) {
		curr.dushu = x;
		var my_dpi = _size / _screenSize; //1英寸有多少点

		console.log('屏幕尺寸:' + _screenSize + '英寸');
		console.log("分辨率：" + _screenW + '*' + _screenH)
		console.log('比率：' + my_dpi);
		// 设置图片大小
		var _img = document.getElementById('img_e');
		var N = (x - 4.0) * 10;

		_img.style.width = 7.3 * 0.3937008 * my_dpi / Math.pow(1.259, N) + 'px';
		_img.style.height = 7.3 * 0.3937008 * my_dpi / Math.pow(1.259, N) + 'px';
		var temp = $('#E_distance').text();
		_img.style.width = (_img.style.width / 5) * temp;
		_img.style.height = _img.style.width;
	}
	changeImgSize(4.0)


	// 距离
	function changeDistance(_distance) {
		$('#E_distance').text(_distance);
	};
	changeDistance(4);
	$("#login").click(
		function() {
			$("#password").val(hex_sha1($("#password").val()));
			console.info($("#password").val());
			var msg = $('#login_form').serialize();
			$("#password").val("");
			console.info(msg);

			$.ajax({
				url: 'Account/login',
				type: "POST",
				data: msg,
				datatype: "JSON",
				success: function(msg) {
					if (msg == 0) {
						alert('failed');
					} else {
						huan_id = msg.huan_name;
						huan_password = msg.huan_password;
						login_im();
					}
				},
				error: function(msg) {
					console.info(msg);
				}
			});
		}
	)


	// 改变散光轴位，_deg为多少度360为一周
	function changeSanguangRotate(_deg) {
		$('.sg_img').css({
			'transform': 'rotate(' + _deg + 'deg)',
			'-webket-transform': 'rotate(' + _deg + 'deg)',
			'-o-transform': 'rotate(' + _deg + 'deg)',
			'-moz-transform': 'rotate(' + _deg + 'deg)',
			'-ms-transform': 'rotate(' + _deg + 'deg)'
		});
	}
	// 散光中，散光图和横竖图的切换0-散光图,1-横竖图
	function changeSanguangImg(_img) {
		if (_img == 0) {
			$('.sg_img').attr({
				'src': './Public/img/image_astigmatism.png'
			});
		} else if (_img == 1) {
			$('.sg_img').attr({
				'src': './Public/img/image_astigmatism_degree.png'
			});
		} else {
			console.log("找不到图片：" + _img)
		}
	}
	// 接口
	// changeSection(2); //1,2,3
	// changeDistance(4);  //12345
	// changeDegree(2);  //传入旋转角度、0-右、1-下、2-左、3-上
	// changeImgSize(5.2); //传入近视度数
	var login_im = function() {
		setTimeout(function() {
			//根据用户名密码登录系统
			console.info("here");
			conn.open({
				apiUrl: Easemob.im.config.apiURL,
				user: huan_id,
				pwd: huan_password,
				//连接时提供appkey
				appKey: Easemob.im.config.appkey
			});
			return false;
		}, 50);
	}

	var handleClosed = function(){
		console.info("Closed");
	}
	var handleOpen = function(conn) {
		//从连接中获取到当前的登录人注册帐号名
		scan_flag = true;
		curUserId = conn.context.userId;
		console.info(curUserId);
		$("#user_login").hide();
		$("#login_success").show();
		conn.setPresence();
		if (conn.isOpened()) {
			conn.heartBeat(conn);
		}
	};

	var handleTextMessage = function(message) {
		var mes = JSON.parse(message);
		if (mes.action == 1) {
			changeSection(1);
		} else if (mes.action == 2) {
			changeSection(2);
			changeDistance(mes.dis);
			console.info(mes.dis);
			changeDegree(mes.direction);
			changeImgSize(mes.degree_num);
		} else if (mes.action == 3) {
			changeSection(3);
			changeSanguangRotate(mes.degree);
			console.info(mes.pi);
			changeSanguangImg(mes.pi);
		}else if(mes.action == 4){
			window.location.href = 'Account/userend';
		}
	}
	setimgW();


});