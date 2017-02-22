<link rel="stylesheet" type="text/css" href="styles/yanguango2o.css"/>
<div ng-controller="optist_Ctr">
	<!-- 导航条 -->
	<nav class="navbar navbar-default navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand">远程验光控制系统</a>
			</div>
			<div class="navbar-right">
				<a>
					<img src="img/car.png" class="img-circle img-header" width="40px" height="40px;" />
				</a>
			</div>
		</div>
	</nav>
	<!-- 主体 -->
	<div class="col-md-offset-2">
			<!-- 左边栏目 -->
			<div class="col-md-2 my-sidebar">
				<div class="h2">
					<p class="text-center h4">
						<span class="h1" ng-model="wait_number">{{wait_number}}</span>
						人
					</p>
					<p class="text-center h5">当前等待验光</p>
				</div>
				<div class="panel panel-success">
					<div class="panel-heading userData" >
						<span>用户数据</span>
					</div>
					<div class="">
						<ul class="list-group list-unstyled user">
							<li  class="list-item userTel">

								<span>手机号：</span>
								<input type="text" class="tel" />
							</li>
							<li  class="list-item">
								<span>右眼</span>
								<ul class="list-group list-unstyled clearfix">
									<li class="list-item">
										<span class="col-xs-5 col-md-5 text-right">近视度数:</span>
										<input value="213"/>	
										<!-- <span class="col-md-6">450</span> -->
									</li>
									<li class="list-item">
										<span class="col-md-5 text-right">散光度数:</span>
										<input value="213"/>	
										<!-- <span class="col-md-6">450</span> -->
									</li>
									<li class="list-item">
										<span class="col-md-5 text-right">散光轴位:</span>
										<input value="213"/>	
										<!-- <span class="col-md-6">450</span> -->
									</li>
								</ul>
							</li>
							<li  class="list-item">
								<span>左眼</span>
								<ul class="list-group list-unstyled clearfix">
									<li class="list-item">
										<span class="col-md-5 text-right">近视度数:</span>
										<input value="213"/>	
										<!-- <span class="col-md-6">450</span> -->
									</li>
									<li class="list-item">
										<span class="col-md-5 text-right">散光度数:</span>
										<input value="213"/>	
										<!-- <span class="col-md-6">450</span> -->
									</li>
									<li class="list-item">
										<span class="col-md-5 text-right">散光轴位:</span>
										<input value="213"/>	
										<!-- <span class="col-md-6">450</span> -->
									</li>

								</ul>
							</li>
							<li class="list-item">
								<span>瞳距</span>
								<ul class="list-group list-unstyled clearfix">
									<li class="list-item">
										<span class="col-md-5 text-right">瞳距:</span>
										<input value="213"/>	
										<!-- <span class="col-md-6">450</span> -->
									</li>
								</ul>
							</li>
							<li class="list-item ">
								<textarea class="beizu"></textarea>
							</li>
							<li class="list-item">
								<button class="btn btn-default btn-lg btn-success save center-block">保存</button>
							</li>
						</ul>
					</div>

				</div>
			</div>
			<!-- 右边栏目 -->
			<div class="col-md-12">
					<!-- 验光宝的框 -->
					<div class="col-md-3 div-1">
						<div class="panel panel-default">
							<div class="panel-heading">
								<span class="h3">验光宝</span>
							</div>
							<!-- for E -->
							<div class="panel-body" ng-if="yanguangbao == 'E'" >
								<a href="javascript:;" ng-click="distance_in()">
									<div class="Etop">
										<h1 class="text-center" ng-bind="distance">5</h1>
										<p class="text-center">当前距离（米）</p>
									</div>
								</a>
								<div class="Edown text-center">
									<div class="add">
										<button ng-click="addE()" class="btn btn-default">+</button>
									</div>
									<div class="middle">
										<span ng-bind="El">4.8</span><a ng-click="changeE()" href="javascript:;"><img ng-src="img/{{img_E}}" class="img-circle" /></a><span ng-bind="Er">0.8</span>
									</div>
									<div class="jian">
										<button ng-click="subE()" class="btn btn-default">-</button>
									</div>
								</div>

							</div>
							<!-- for RG -->
							<div class="panel-body" ng-if="yanguangbao == 'RG'">
								<img src="img/image_color_test.png" alt="RG" class="img-responsive">
							</div>
							<!-- for SG -->
							<div class="panel-body" ng-if="yanguangbao == 'SG'">
								<img src="img/image_astigmatism_test.png" alt="SG" class="img-responsive" >
							</div>
							<div class="panel panel-footer">
								<ul class="list-inline list-unstyle div-1-footer">
									<li><button ng-click="bao('RG')">红绿图</button></li><li><button ng-click="bao('E')">E</button></li><li><button ng-click="bao('SG')">散光图</button></li>	
								</ul>
							</div>

						</div>
					</div>

					<div class="col-md-3 div-1">
						<div class="panel panel-default">
							<div class="panel-heading">
								<span class="h3">验光宝</span>
							</div>
							<div class="panel-body">
								<a href="javascript:;" ng-click="distance_in()">
									<div class="Etop">
										<h1 class="text-center" ng-bind="distance">5</h1>
										<p class="text-center">当前距离（米）</p>
									</div>
								</a>
								<div class="Edown text-center">
									<div class="add">
										<button ng-click="addE()" class="btn btn-default">+</button>
									</div>
									<div class="middle">
										<span ng-bind="El">4.8</span><img src="img/1.jpg" class="img-circle" /><span ng-bind="Er">0.8</span>
									</div>
									<div class="jian">
										<button ng-click="subE()" class="btn btn-default">-</button>
									</div>
								</div>
							</div>
							<div class="panel panel-footer">
								<ul class="list-inline list-unstyle div-1-footer">
									<li><button>红绿图</button></li><li><button>E</button></li><li><button>散光图</button></li>	
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
			</div>
	</div>
	
	<!-- 弹幕 -->
	<div class="tanmuwrap" ng-show="danmu_dis">
		<div class="tanmu">
			<div class="panel panel-info">
				<div class="panel-heading ">
					<span class="h4 ">请输入距离</span>
				</div>
				<div class="panel-body text-center" style="padding-top: 10px;">
					<span>默认5米</span>
					<input type="text" name="distance" ng-model="_dis" />
				</div>
				<div class="panel-footer">
					<div class="text-right">
						<button class="btn btn-info" ng-click="queren_dis()">确定</button>
						&nbsp;
						<button  class="btn btn-info" ng-click="quxiao_dis()">取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- 视频 -->
	<script type="text/javascript">
		
	
		uservideo();
		
		// 视频
	    function uservideo(){ 
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
	               console.log("AudioTracks" , localMediaStream.getAudioTracks());
	               console.log("VideoTracks" , localMediaStream.getVideoTracks());
	           };
	       }, function(e) {
	           console.log('Reeeejected!', e);
	       });
	   
	       // 调节音量
	   
	       function changeVolum(){
	       	var video = document.getElementById('video');
	   	    var changeinside = document.getElementsByClassName('changeinside')[0];
	   	    video.volum = changeinside.offsetWidth*100/150*0.01;
	   	    console.log(video.volum)
	       }
	   
	       var changeWrap = document.getElementsByClassName('changeWrap')[0];
	       changeWrap.onmousedown = function(){
	   		var changeinside = document.getElementsByClassName('changeinside')[0];
	   		var div3 = document.getElementsByClassName('div-3')[0];
	   		var mysidebar = document.getElementsByClassName('my-sidebar')[0]
	   		var difX = event.clientX - div3.offsetLeft-mysidebar.offsetWidth-60;
	   		changeinside.style.width = difX+'px';
	   		changeVolum();
	   		document.onmousemove = function(event) {
	   			event = event || window.event;
	   			var l = event.clientX - div3.offsetLeft-mysidebar.offsetWidth-60;
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
	       reloadvideo.onclick = function(){
	       	var video = document.getElementById('video');
	       	video.load();
	       }
	   }
	</script>

</div>
