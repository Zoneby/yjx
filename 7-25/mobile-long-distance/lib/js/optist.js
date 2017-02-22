var conn = null;
var data = 0;
var degree = [
	"0.1", "4.0", "0.12", "4.1", "0.15", "4.2", "0.2", "4.3",
	"0.25", "4.4", "0.3", "4.5", "0.4", "4.6", "0.5", "4.7",
	"0.6", "4.8", "0.8", "4.9", "1.0", "5.0", "1.2", "5.1",
	"1.5", "5.2", "2.0", "5.3"
];
var huan_id = null;
var huan_pass = null;
var user = null;
var distance = 5;
var degree_number = 1;
var timer = null;
var curUserId = null;
var position = 0;
// 正在验光的人的id
var currentUserId = -1;
var pub = $('#public_path').text();

var change_position = function() {
	var temp = position;
	while (1) {
		position = parseInt(3 * Math.random());
		if (position != temp) {
			break;
		}
	}
	console.info(position);

	$("#picture").attr("src", pub + "/img/" + position + ".png")
}
var sendvision = function() {
	var content = {};
	content.control = 400;
	content.action = 2;
	content.direction = position;
	content.dis = $('#distance_input').val() - 0;
	content.degree_num = degree[degree_number] - 0;
	sendmessage(content);
};

function uservideo() {
	console.info('1');
	var getUserMedia = (navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia);

	getUserMedia.call(navigator, {
		video: true,
		audio: true
	}, function(localMediaStream) {
		var video = document.getElementById('video');
		video.src = window.URL.createObjectURL(localMediaStream);
		video.onloadedmetadata = function(e) {
			console.log("Label: " + localMediaStream.label);
			console.log("AudioTracks", localMediaStream.getAudioTracks());
			console.log("VideoTracks", localMediaStream.getVideoTracks());
		};
	}, function(e) {
		console.log('Reeeejected!', e);
	});

	// 调节音量

	function changeVolum() {
		var video = document.getElementById('video');
		var changeinside = document.getElementsByClassName('changeinside')[0];
		video.volum = changeinside.offsetWidth * 100 / 150 * 0.01;
		console.log(video.volum)
	}

	var changeWrap = document.getElementsByClassName('changeWrap')[0];
	changeWrap.onmousedown = function() {
		var changeinside = document.getElementsByClassName('changeinside')[0];
		var div3 = document.getElementsByClassName('div-3')[0];
		var mysidebar = document.getElementsByClassName('my-sidebar')[0]
		var difX = event.clientX - div3.offsetLeft - mysidebar.offsetWidth - 60;
		changeinside.style.width = difX + 'px';
		changeVolum();
		document.onmousemove = function(event) {
			event = event || window.event;
			var l = event.clientX - div3.offsetLeft - mysidebar.offsetWidth - 60;
			if (l < 0) {
				l = 0;
			} else if (l > 150) {
				l = 150;
			}
			changeinside.style.width = l + 'px';
			changeVolum();
		}
		document.onmouseup = function() {
			document.onmousemove = null;
		}
	}

	//重载视频
	var reloadvideo = document.getElementById('reloadvideo');
	reloadvideo.onclick = function() {
		var video = document.getElementById('video');
		video.load();
	}
}

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
			console.info("closed");
		},
		//收到文本消息时的回调方法
		onTextMessage: function(message) {
			handleTextMessage(message);
		},
		//异常时的回调方法
		onError: function(message) {
			handleError(message);
		}
	});

	var showVisionUI = function() {
		$("#E").show();
	}
	var hideVisionUI = function() {
		$("#E").hide();
	}
	var showColortestUI = function() {
		$("#RG").show();
	}
	var hideColortestUI = function() {
		$("#RG").hide();
	}
	var showSgtestUI = function() {
		$("#SG").show();
	}
	var hideSgtestUI = function() {
		$("#SG").hide();
	}
	var hideLoginUI = function() {
		$("#login").hide();
	}
	$("#distance").click(function() {
		$('.tanmuwrap').show();
		$('#distance_confirm').click(function() {
			var _distance = $('#distance_input').val();
			if (parseFloat(_distance)) {
				$('#distance').text(_distance);
				$('.tanmuwrap').hide();
			};
		});
		$('#distance_cancel').click(function() {
			$('.tanmuwrap').hide();
		});



		sendvision();
	});

	$("#click_E").click(function() {
		showVisionUI();
		hideSgtestUI();
		hideColortestUI();
		sendvision();
	});

	$("#picture").click(function() {
		change_position();
	})

	$("#click_RG").click(function() {
		var content = {};
		content.control = 400;
		content.action = 1;
		sendmessage(content);
		showColortestUI();
		hideSgtestUI();
		hideVisionUI();
	});
	$("#click_SG").click(function() {
		var content = {};
		content.control = 400;
		content.action = 3;
		showSgtestUI();
		hideVisionUI();
		hideColortestUI();
		sendmessage(content);
	});
	$("#picture").click(function() {
		//change_position();
		sendvision();
	});
	$("#subE").click(function() {
		if (degree_number == 1) {
			alert("min");
			return false;
		}

		var deg1 = degree_number - 2;
		var deg2 = degree_number - 3;
		$("#deg1").text(degree[deg2]);
		$("#deg2").text(degree[deg1]);
		degree_number = degree_number - 2;
		change_position();
		sendvision();
	});
	$("#addE").click(function() {
		if (degree_number == 27) {
			alert("max");
			return false;
		}
		var deg1 = degree_number + 2;
		degree_number = degree_number + 2;
		var deg2 = deg1 - 1;
		$("#deg1").text(degree[deg2]);
		$("#deg2").text(degree[deg1]);
		change_position();
		sendvision();
	});
	$("#btn_exit").click(function() {
		user = null;
		$("#choicemodal").hide();
		$("#quit").hide();
		$("#continue").show();
		conn.onClosed();
	});
	huan_id = $("#name").text();
	huan_pass = $("#password").text();
	$("#name").remove();
	$("#password").remove();
	login();
});

var hideLoginUI = function() {
	$("#login").hide();
}
var handleTextMessage = function(message) {
	console.info(message);
	console.info("received");
	var g = message.data;
	console.info(g);
	console.info(g["action"]);
};
var count = function() {
	console.info(1);
}
var handleOpen = function(conn) {
	//从连接中获取到当前的登录人注册帐号名
	curUserId = conn.context.userId;
	console.info(curUserId);

	conn.setPresence();
	if (conn.isOpened()) {
		conn.heartBeat(conn);
	}
	$.ajax({
		url: 'Optist/getUse',
		type: "POST",
		data: {
			"flag": 1
		},
		datatype: "JSON",
		success: function(msg) {
			$('#yanguang').show();
			console.info(msg);

			var waitingCount = $('#waitingCount'),
				wait_queue = $('#wait_queue'),
				danmu_wait_queue = $('#danmu_wait_queue');

			if (msg == null) {
				waitingCount.text(0);
				wait_queue.empty();
				danmu_wait_queue.empty();
				danmu_wait_queue.text('现在没有人哦！！！！');
			} else {
				waitingCount.text(msg.length);
				wait_queue.empty();
				danmu_wait_queue.empty();
				// 插入队列
				for (var i = 0, len = msg.length; i < len; i++) {
					var temp = "<section id=" + msg[i].customer_id +" fullname="+msg[i].fullname+ "  class=\"waiting currwaiting\"><img src=\"" + pub + "/img/image_header.png\"/><p>" + msg[i].nickname + "</p></section>";
					danmu_wait_queue.append(temp);
				};
				// 选择客户,判断是否正在验光
				if (currentUserId == -1) {
					$('.currwaiting').click(function() {
						var _that = $(this);
						_that.prependTo(_that.parent());
						var _id = _that.attr('id');
						var fullname = _that.attr('fullname');
						$('#customer_tel').val(fullname);
						currentUserId = _id;
						console.info(currentUserId);
						user = "imglasses" + _id;

						$('#restdanmu').hide();
						_html = danmu_wait_queue.html();
						wait_queue.html(_html);
						// 为这个user验光
						uservideo();
					});
				} else {
					var _that = $('.currwaiting').find('#' + currentUserId);
					_that.prependTo(_that.parent());
					_html = danmu_wait_queue.html();
					wait_queue.html(_html);
				}

			}

		},
		error: function() {
			alert("error");
		}
	});
	setInterval("get()", 60000);
};

var get = function() {
	$.ajax({
		url: 'Optist/getUse',
		type: "POST",
		data: {
			"flag": 1
		},
		success: function(msg) {
			console.info(msg);
			var waitingCount = $('#waitingCount'),
				wait_queue = $('#wait_queue'),
				danmu_wait_queue = $('#danmu_wait_queue');

			if (msg == null) {
				waitingCount.text(0);
				wait_queue.empty();
				danmu_wait_queue.empty();
				danmu_wait_queue.text('现在没有人哦！！！！');
			} else {
				waitingCount.text(msg.length);
				wait_queue.empty();
				danmu_wait_queue.empty();
				// 插入队列
				for (var i = 0, len = msg.length; i < len; i++) {
					var temp = "<section id=" + msg[i].customer_id + " fullname="+msg[i].fullname + "  class=\"waiting currwaiting\"><img src=\"" + pub + "/img/image_header.png\"/><p>" + msg[i].nickname + "</p></section>";
					danmu_wait_queue.append(temp);
				};
				// 选择客户,判断是否正在验光
				if (currentUserId == -1) {
					$('.currwaiting').click(function() {
						var _that = $(this);
						_that.prependTo(_that.parent());
						
						var _id = _that.attr('id');
						currentUserId = _id;
						console.info(currentUserId);
						user = "imglasses" + _id;
						var fullname = _that.attr('fullname');
						$('#customer_tel').val(fullname);

						$('#restdanmu').hide();
						_html = danmu_wait_queue.html();
						wait_queue.html(_html);
					});
				} else {
					var _that = $('#' + currentUserId);
					user = "imglasses" + currentUserId;
					console.info(_that);
					_that.prependTo(danmu_wait_queue);
					_html = danmu_wait_queue.html();
					console.info(danmu_wait_queue.html());
					wait_queue.html(_html);
				}

			}
		},
		error: function() {
			clearInterval(timer);
			alert("error");
		}
	});
	console.info(1);
}

var handleError = function(e) {
	curChatRoomId = null;

	//clearPageSign();
	e && e.upload && $('#fileModal').modal('hide');
	if (curUserId == null) {
		//hiddenWaitLoginedUI();
		alert(e.msg + ",请重新登录");
		showLoginUI();
	} else {
		var msg = e.msg;
		if (e.type == EASEMOB_IM_CONNCTION_SERVER_CLOSE_ERROR) {
			if (msg == "" || msg == 'unknown') {
				alert("服务器断开连接,可能是因为在别处登录");
			} else {
				alert("服务器断开连接");
			}
		} else if (e.type === EASEMOB_IM_CONNCTION_SERVER_ERROR) {
			if (msg.toLowerCase().indexOf("user removed") != -1) {
				alert("用户已经在管理后台删除");
			}
		} else {
			alert(msg);
		}
	}
	conn.stopHeartBeat(conn);
};

function login() {
	setTimeout(function() {
		//根据用户名密码登录系统
		console.info("here");
		conn.open({
			apiUrl: Easemob.im.config.apiURL,
			user: huan_id,
			pwd: huan_pass,
			//连接时提供appkey
			appKey: Easemob.im.config.appkey
		});
		return false;
	}, 50);
}

function sendmessage(messageContent) {
	console.info(messageContent);
	var msg = JSON.stringify(messageContent);
	console.info(msg);
	var options = {
		to: user,
		msg: msg,
		type: "chat"
	};
	//console.info(messageContent);
	conn.sendTextMessage(options);
}