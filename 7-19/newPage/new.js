$(function(){


	/*禁止滚动*/
	/*fitst改变选项*/
	$('.selectA .left').click(function(){
        $('.selectA .left').removeClass('importantA');
        $(this).addClass('importantA');
        // alert(this)
    	});
	$('.selectB .left').click(function(){
        $('.selectB .left').removeClass('importantB');
        $(this).addClass('importantB');
        // alert(this)
    	});
	/*页面切换*/
	$('.btn_jss').click(function(){
		$('.index').removeClass('show');
		$('.first').addClass('show');
	});
	$('.bottom-img').click(function(){
		$('.first').removeClass('show');
		$('.second').addClass('show');
	});
	$('.btn_second').click(function(){
		$('.second').removeClass('show');
		$('.lead').addClass('show');
	});
	$('.btn_js').click(function(){
		$('.lead').removeClass('show');
		$('.degreesText').addClass('show');
		document.addEventListener('touchmove', function (event) {
		event.preventDefault();
		}, false);
	});

	var num = 1;
	var count = 0;
	var Acount = 0;

	//记录错误次数,对一次就清0；错误了则累加
	//错误连续错两次则退出，记录当前的尺寸。从而判断是否老化
	var wrong = 0;

	var size = [];
	/*
	*滑动前，加载一个初始尺寸'4.4'
	*滑动时，如果对，则变小。错则再显示一次变化方向的。
	*
	*json｛'1': ,
	*		'2' ,
	*		'3' ,
	*		'4' 
	*	｝
	*
	*img.style.width = 7.3 * 0.3937008 * my_dpi / Math.pow(1.259, N) + 'px';
	*/
	//初始化e的方向与大小
	


	$(".degreesText").swipe({
			swipe:function(event,direction,distance,duration,fingerCount){

				//Todo
				judgeDireaction(num,direction);
				randomDireaction();
				var i = $('.importantA p').html();
				var j = $('.importantB p').html();
				if (j=='是'&&i!='40以下') {
					$('.title-num').html('您以前有近视，需要前往医院进行验光哦。');
						$('.title-b').html('');
					}else{
						switch (i){
							case "40以下":
								$('.title-num').html('小伙子，40岁以下还不需要戴老花镜的');
								$('.title-b').html('');
								break;
							case '40-45':
								$('.title-num').html('100度');
								break;
							case '46-50':
								$('.title-num').html('150度');
								break;
							case '51-55':
								$('.title-num').html('200度');
								break;
							case '56-60':
								$('.title-num').html('250度');
								break;
							case '61-65':
								$('.title-num').html('300度');
								break;
							case '66-70':
								$('.title-num').html('350度');
								break;
							case '71以上':
								$('.title-num').html('400度');
								break;
						}
					}
				
		}
	})

	//获取屏幕的DPI
	
	function js_getDPI() {
		var arrDPI = new Array();
	    if (window.screen.deviceXDPI != undefined) {
	        arrDPI[0] = window.screen.deviceXDPI;
	        arrDPI[1] = window.screen.deviceYDPI;
	    }
	    else {
	        var tmpNode = document.createElement("DIV");
	        tmpNode.style.cssText = "width:1in;height:1in;position:absolute;left:0px;top:0px;z-index:99;visibility:hidden";
	        document.getElementsByTagName('body')[0].appendChild(tmpNode);
	        arrDPI[0] = parseInt(tmpNode.offsetWidth);
	        arrDPI[1] = parseInt(tmpNode.offsetHeight);
	        tmpNode.parentNode.removeChild(tmpNode);    
	    }
	    return arrDPI;
	}
	function getSize(){
		var arrDPI = js_getDPI();
		var degrees = [4.4,4.5,4.6,4.7,4.9];
		var N = 0;
		
		var img_X = 0;
		for (var i = 0;i<degrees.length; i++) {
			N = (degrees[i] - 4.0) * 10;
			img_X =parseInt(0.12*(7.3 * 0.3937008 * arrDPI[0] / Math.pow(1.259, N)));
			img_y =parseInt(0.12*(7.3 * 0.3937008 * arrDPI[1] / Math.pow(1.259, N)));
			var str= img_X+','+img_y;
			var strr = str.split(",");

			size.push(strr);
		}
	}
	getSize();
	//产生随机数1到4，并且分别为上下左右4方向
	function randomDireaction() {
		var i=parseInt(Math.random()*4+1);
			if (num==i) {
				return;
			}else{
				num=i;
				$('.e_img').width(size[Acount][0]);
				$('.e_img').height(size[Acount][1]);
				switch(num){
					case 1:
						$(".e_img").removeClass().addClass("e_img direction_p3");
						break;
					case 2:
						$(".e_img").removeClass().addClass("e_img direction_p1");
						break;
					case 3:
						$(".e_img").removeClass().addClass("e_img direction_p2");
						break;
					case 4:
						$("e_img").removeClass().addClass("e_img");
						break;
				}
			}
			

			
		}
		randomDireaction();
		//根据数字判断方向
		function judgeDireaction(num,TDirection){
			if ((TDirection=="up"&&num==1)||(TDirection=="down"&&num==2)||(TDirection=="left"&&num==3)||(TDirection=="right"&&num==4)) {
					//改变e的尺寸
					Acount++;
					if (Acount==5) {
						//滑动都正确，此时跳转页面
							$('.degreesText').removeClass('show');
							$('.degrees').addClass('show');
						return 0;
					}
					$('.e_img').width(size[Acount][0]);
					$('.e_img').height(size[Acount][1]);
					wrong=0;

					
			}else{
					wrong++;
					if (wrong==2) {
						//某次的E，连续错了两次，此时跳转页面
						$('.degreesText').removeClass('show');
						$('.degrees').addClass('show');
					}
			}
		}
	

	//最后页面返回重新测试
	$('.left-b').click(function(){
		window.location.href='http://192.168.50.45/newPage/new.html';
	});
})

		

		