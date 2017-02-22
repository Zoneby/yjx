<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>pc端结果页面</title>

	<style type="text/css">
		* {
			margin: 0;
			padding: 0;
		}
		html body {
			width: 100%;
			height: 100%;
			background-color: #002e63;
			font-family: 'Microsoft Yahei';
		}
		.up-part {
			/*width: 1160px;*/
			width: 950px;
			/*margin-top:152px;*/
			margin: 52px auto 0;
			text-align: center;
		}
		.circle {
			float: left;
			margin: 0 auto;
			width: 329px;
			height: 329px;
			border-radius: 50%;
			border: 4px solid #fff;
			color: #fff;
			background-color: #4a90e2;
			text-align: center;
		}
		.circle-title {
			margin-top: 71px;
			font-size: 20px;
		}
		.result-num {

			font-size: 100px;
		}
		.circle-tips {
			color: #9fcbff;
			font-size: 14px;
		}
		.up-part-right {
			float: left;
			margin-top: 97px;
			margin-left: 115px;
			text-align: left;
		}
		.result-msg, .result-advice {
			color: #fff;
			font-size: 36px;
		}
		.result-notes {
			color: #fff;
			font-size: 14px;
		}
		.halving-line {
			/*margin: 115px auto 56px;*/
			margin: 55px auto 36px;
			color: #fff;
			background-color: #fff;
			height: 1px;
			line-height: 1px;
			font-size: 0;
			border: 0;
			width: 1160px;
			display: block;
			text-align: center;
		}
		.down-part {
			width: 700px;
			margin: 0 auto;
			font-size: 16px;
			color: #fff;
			text-align: center;
		}
		.down-part > a {
			width: 180px;
			height: 47px;
			line-height: 47px;
		}
		.hospital-link{
		 	border: 1px solid #fff;
		 }
		.yjx-link {
			background-color: #13b636;
			border: 1px solid #13b636;
		}
		a {
			color: #fff;
			text-decoration: none;
		}
		.yjx-link-explain {
			/*margin-top: 73px;*/
			width: 700px;
			float: right;
			font-size: 14px;
			color: #a9a9a9;
			box-sizing: border-box;
			padding-top: 8px;
			padding-left: 550px;
		}
	</style>
</head>

<body>
	<div class="up-part">
			<div class="circle">
				<p class="circle-title">矫正视力</p><br>
				<p class="result-num">{$degree}</p><br>
				<p class="circle-tips">结果仅供参考</p>
			</div>
			<if condition="$degree lt 0.8">
			<div class="up-part-right">
				<p class="result-msg">您所配戴眼镜度数偏低</p>
				<p class="result-advice" style="margin-top: 3px;">建议更换眼镜</p>
				<p class="result-notes" style="margin-top: 11px;">注：眼镜清晰度不够，达不到标准视力，将影响眼睛的调节，容易产生疲惫感。</p>
			</div>
			<div style="clear: both;"></div>
			<else/>
				<div class="up-part-right">
					<p class="result-msg">您所佩戴的眼镜度数合适</p>
					<p class="result-advice" style="margin-top: 3px;">无须更换眼镜</p>
				</div>
				<div style="clear: both;"></div>
			</if>
		
		
	</div>
	<hr class="halving-line"></hr>	
	<div class="down-part">
		<p class="down-part-title" style="margin-bottom: 30px;">您可以通过以下途径进行验光</p>
		<a href="#" class="hospital-link" style="float: left;"> 前往医院进行验光</a>
		<a class="yjx-link" href="#" style="float: right;">预约眼镜侠上门验光</a>
		<p class="yjx-link-explain">*目前仅提供广州城区</p>
		<div style="clear: both;"></div>
	</div>

</body>
</html>