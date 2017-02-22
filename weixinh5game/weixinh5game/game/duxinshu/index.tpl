<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="format-detection" content="telephone=no">
<title>读心小博士</title>
    <script>
        (function (W) {
            var isdspeed = {
                init: function (opts) {
                    this.url = opts.isdspeedUrl;
                    this.initAt = new Date();
                    this.reset();
                    delete this['init'];
                },
                hit: function (id, relativeToInitTime) {
                    this.stopAt = new Date();
                    var duration = relativeToInitTime ? (this.stopAt - this.initAt) : (this.stopAt - this.startAt);
                    this.save(id, duration);
                    this.reset();
                    return this;
                },
                save: function (id, value) {
                    this.data[id] = value;
                },
                reset: function () {
                    this.startAt = new Date();
                    this.stopAt = new Date();
                },
                data: {},
                report: function () {
                    if (!this.url) {
                        return;
                    }
                    var dataStr = [];
                    for (var c in this.data) {
                        dataStr.push(c + "=" + this.data[c]);
                    };
                    (new Image()).src = this.url + '&' + dataStr.join('&');
                }
            };
            W["ISDSpeed"] = isdspeed;
        })(window);
        ISDSpeed.init({
            isdspeedUrl: 'http://www.wenzhangku.com/weixin/duxinshu/'
        });
    </script>
    <style>
    * {
        -webkit-box-sizing:border-box;
        -moz-box-sizing:border-box;
        box-sizing:border-box
    }
    body, html {
        height:100%
    }
    body, ul, li, h1, h2, h3, img, p, div {
        padding:0;
        margin:0;
        border:0;
        list-style:none
    }
    i {
        font-style:normal
    }
    body {
        overflow:hidden;
        font-size:14px;
        background-color:#f2f2f2
    }
    .ivalign {
        position:relative;
        top:50%;
        -webkit-transform:translateY(-50%);
        -ms-transform:translateY(-50%);
        transform:translateY(-50%)
    }
    .hide {
        display:none
    }
    .btn {
        display:inline-block;
        padding:10px 20px;
        color:#fff;
        font-size:18px;
        text-align:center;
        background-color:#00a4f1;
        border:1px solid #42cdf5;
        text-decoration:none;
        border-radius:20px;
        -webkit-border-radius:20px;
        box-shadow:0 -2px rgba(66, 205, 245, .35) inset, 0 -1px rgba(66, 205, 245, .15) inset, 0 1px 1px rgba(66, 205, 245, .12), 0 -1px 1px rgba(255, 255, 255, .8) inset;
        -webkit-box-shadow:0 -2px rgba(66, 205, 245, .35) inset, 0 -1px rgba(66, 205, 245, .15) inset, 0 1px 1px rgba(66, 205, 245, .12), 0 -1px 1px rgba(255, 255, 255, .8) inset
    }
    .btn-block {
        display:block;
        padding-left:0;
        padding-right:0;
        margin-left:30px;
        margin-right:30px
    }
    .btn-style1 {
        background-color:#71b408;
        border-color:#a9cc72;
        box-shadow:0 -2px rgba(169, 204, 114, .35) inset, 0 -1px rgba(169, 204, 114, .15) inset, 0 1px 1px rgba(169, 204, 114, .12), 0 -1px 1px rgba(169, 204, 114, .8) inset;
        -webkit-box-shadow:0 -2px rgba(169, 204, 114, .35) inset, 0 -1px rgba(169, 204, 114, .15) inset, 0 1px 1px rgba(169, 204, 114, .12), 0 -1px 1px rgba(169, 204, 114, .8) inset
    }
    .btn-style2 {
        background-color:#6706d0;
        border-color:#6706d0;
        box-shadow:none;
        -webkit-box-shadow:none;
        border-radius:6px;
        -webkit-border-radius:6px;
        padding-top:6px;
        padding-bottom:6px
    }
    .spr {
        display:inline-block;
        background-image:url(./images/spr.png);
        background-repeat:no-repeat;
        background-size:125px
    }
    .spr-logo {
        width:121px;
        height:34px;
        background-position:0 -92px
    }
    .spr-spirit {
        width:50px;
        height:50px;
        background-position:0 0
    }
    .spr-bubble {
        width:109px;
        height:33px;
        background-position:0 -54px
    }
    .spr-shadow {
        width:39px;
        height:7px;
        background-position:-60px 0
    }
    .spr-arr {
        width:39px;
        height:20px;
        background-position:-60px -12px
    }
    .spr-arr2 {
        width:42px;
        height:85px;
        background-position:0 -137px
    }
    .spr-card1, .spr-card2, .spr-card3, .spr-card4 {
        display:inline-block;
        background-image:url(./images/poker1.jpg);
        background-repeat:no-repeat;
        background-size:475px
    }
    .spr-card3, .spr-card4 {
        background-image:url(./images/poker2.jpg)
    }
    .poker, .spr-card1, .spr-card2, .spr-card3, .spr-card4 {
        width:229px;
        height:211px
    }
    .spr-card1 {
        background-position:0 0
    }
    .spr-card2 {
        background-position:-240px 0
    }
    .spr-card3 {
        background-position:0 0
    }
    .spr-card4 {
        background-position:-240px 0
    }
    .wrapper, .wrapper1 {
        position:absolute;
        z-index:1;
        width:100%;
        height:100%;
        top:0;
        left:0;
        bottom:0;
        right:0;
        overflow:hidden;
        -ms-touch-action:none;
        -webkit-touch-callout:none;
        -webkit-user-select:none;
        -moz-user-select:none;
        -ms-user-select:none;
        user-select:none;
        -webkit-tap-highlight-color:rgba(0, 0, 0, 0);
        -webkit-text-size-adjust:none;
        -moz-text-size-adjust:none;
        -ms-text-size-adjust:none;
        -o-text-size-adjust:none;
        text-size-adjust:none
    }
    .deck {
        position:relative;
        z-index:10;
        width:100%;
        height:100%
    }
    .cover {
        position:absolute;
        z-index:100;
        top:0;
        left:0;
        width:100%;
        height:100%;
        background-color:#f2f2f2
    }
    .cover_ft {
        position:absolute;
        left:0;
        bottom:0;
        width:100%;
        height:65px;
        background-color:#fff;
        text-align:center
    }
    .cover_ft .spr-logo {
        margin-top:15px
    }
    .ani-hide {
        display:none
    }
    .card {
        position:absolute;
        width:100%;
        height:100%;
        overflow:hidden;
        z-index:10;
        text-align:center;
        -webkit-transform:translateZ(0);
        -moz-transform:translateZ(0);
        -ms-transform:translateZ(0);
        -o-transform:translateZ(0);
        transform:translateZ(0)
    }
    .card-bd {
        margin-left:auto;
        margin-right:auto;
        max-width:320px
    }
    .card img {
        max-width:100%
    }
    .card2, .card3, .card7 {
        background-color:#7805d0
    }
    .card4 {
        background-color:#7aad20
    }
    .card5 {
        background-color:#e46339
    }
    .card6 {
        background-color:#06baae
    }
    .card8 {
        background-color:#6706d1
    }
    .wrapper1 {
        overflow:auto
    }
    .wrapper1 .card {
        position:relative
    }
    .loader {
        height:105px;
        width:105px;
        margin:0 auto;
        text-align:center;
        position:relative
    }
    .loader-tip {
        margin-top:12px;
        color:#755d3d;
        font-weight:700
    }
    .spr-spirit {
        position:relative;
        z-index:2
    }
    .spr-shadow {
        position:absolute;
        z-index:1;
        top:48px;
        left:32px
    }
    .loader-progress {
        display:inline-block;
        padding:2px 8px;
        margin-top:5px;
        border-radius:12px;
        background-color:#97783a;
        font-size:18px;
        color:#fff;
        min-width:52px
    }
    .bubble {
        opacity:0;
        position:absolute;
        top:294px;
        left:178px
    }
    .highAndroid .bubble, .highIPhone .bubble {
        -webkit-transition:all .2s ease-out;
        transition:all .2s ease-out
    }
    .bubble_on {
        opacity:1
    }
    .arr {
        position:absolute;
        top:428px;
        left:50%;
        margin-left:-33px;
        z-index:12;
        width:70px;
        height:45px;
        text-align:center;
        font-size:14px;
        color:#fff
    }
    .arr .spr-arr {
        display:block;
        margin-top:7px;
        margin-left:auto;
        margin-right:auto
    }
    .poker {
        position:absolute;
        top:170px;
        left:50%;
        margin-left:-114px
    }
    .poker3, .poker4 {
        display:none
    }
    .poker_toggle .poker3, .poker_toggle .poker4 {
        display:block
    }
    .poker_toggle .poker1, .poker_toggle .poker2 {
        display:none
    }
    .sns-acts {
        position:absolute;
        z-index:2;
        top:280px;
        left:0;
        width:100%;
        text-align:center
    }
    .sns-acts .btn {
        margin-bottom:10px
    }
    .btn_share {
        display:none
    }
    .env_wx .btn_share {
        display:block
    }
    .env_wx .btn_copy {
        display:none
    }
    .sns-tip {
        font-size:12px;
        color:#d8a5ff;
        text-align:center;
        padding-top:20px
    }
    .tip {
        position:fixed;
        z-index:200;
        top:0;
        left:0;
        width:100%;
        height:100%
    }
    .tip_bg {
        position:absolute;
        z-index:1;
        top:0;
        left:0;
        width:100%;
        height:100%;
        background-color:rgba(0, 0, 0, .5)
    }
    .tip_bd {
        margin:0 15px;
        padding:20px;
        background-color:#fff;
        color:#333;
        font-size:18px;
        position:relative;
        z-index:2;
        border-radius:6px;
        -webkit-border-radius:6px
    }
    .tip_acts {
        margin-top:12px;
        text-align:center
    }
    .tip_txterr {
        display:none
    }
    .tip_err .tip_txterr {
        display:block
    }
    .tip_err .tip_txtok {
        display:none
    }
    .c_txt1 {
        color:#d34bff
    }
    .sharetip {
        position:fixed;
        z-index:200;
        top:0;
        left:0;
        width:100%;
        height:100%;
        text-align:right;
        background-color:rgba(0, 0, 0, .85)
    }
    .sharetip .spr-arr2 {
        margin-right:15px;
        margin-top:35px
    }
    .sharetip_txt {
        font-size:24px;
        padding-right:15px;
        color:#fff
    }
    .sharetip_txt1 {
        padding-bottom:10px;
        padding-top:15px
    }
    .toptip {
        position:absolute;
        z-index:201;
        top:0;
        left:0;
        width:100%;
        height:36px;
        line-height:36px;
        font-size:16px;
        text-align:center;
        color:#333;
        background-color:#fff;
        -webkit-transition:all .2s ease-out;
        transition:all .2s ease-out
    }
    .ani-slideup {
        -webkit-transform:translateY(-100%);
        transform:translateY(-100%);
        opacity:0
    }
    .toptip_txt2 {
        display:none
    }
    .card8_active .toptip_txt2 {
        display:inline
    }
    .card8_active .toptip_txt1 {
        display:none
    }
    @media only screen and (max-device-width:321px) {
        .card-bd {
            -webkit-transform:translateY(-47%);
            -ms-transform:translateY(-47%);
            transform:translateY(-47%)
        }
        .arr {
            top:415px
        }
    }
    @-webkit-keyframes ani-arr {
        0%, 30% {
            opacity:0;
            -webkit-transform:translate(0, 5px)
        }
        60% {
            opacity:1;
            -webkit-transform:translate(0, 0)
        }
        100% {
            opacity:0;
            -webkit-transform:translate(0, -7px)
        }
    }
    @keyframes ani-arr {
        0%, 30% {
            opacity:0;
            transform:translate(0, 5px)
        }
        60% {
            opacity:1;
            transform:translate(0, 0)
        }
        100% {
            opacity:0;
            transform:translate(0, -7px)
        }
    }
    .bgtext {
        text-align:center;
        margin-top: 8px;
    }
</style>
    <script>ISDSpeed.hit(1,true);</script>
</head>
<body>
    <div id="wrapper" class="wrapper">
        <ul id="deck" class="deck">
            <li class="card"></li>
            <li class="card"></li>
            <li class="card"></li>
        </ul>
    </div>
    <div id="deck0" class="cover">
        <div id="loader" class="loader ivalign">
            <i class="spr spr-spirit"></i>
            <i class="spr spr-shadow"></i>
            <div class="loader-tip">读心术准备中</div>
            <div id="progress" class="loader-progress">0%</div>
        </div>
        <div class="cover_ft">
            <div class="spr spr-logo"></div>
        </div>
    </div>
    <div id="tip" class="tip hide">
        <div class="tip_bg"></div>
        <div class="tip_bd ivalign">
            <div id="tipTxt" class="tip_txt">复制链接成功,快发给朋友们吧！</div>
            <div class="tip_acts">
                <a id="btnCloseTip" class="btn btn-block btn-style2">知道了</a>
            </div>
        </div>
    </div>
    <div id="shareTip" class="sharetip hide">
        <div class="spr spr-arr2"></div>
        <div class="sharetip_txt sharetip_txt1">            点击上面按钮        </div>
        <div class="sharetip_txt">            再<span class="c_txt1">分享到朋友圈</span>
        </div>
    </div>
    <div id="topTip" class="toptip ani-slideup">
        <span class="toptip_txt1">只能往下翻哦！</span>
        <span class="toptip_txt2">最后一页了哦！</span></div>
    <script id="tplC2" type="text/js-tpl">
        <div class="card-bd ivalign">
            <img src="./images/2.jpg" alt="全民怪兽"/>
            <div id="bubble" class="bubble">
                <i class="spr spr-bubble"></i>
            </div>
            <div class="arr">开始读心<div class="spr spr-arr"></div></div>
        </div>
    </script>
    <script id="tplC3" type="text/js-tpl">
        <div class="card-bd ivalign">
            <img src="./images/3.jpg" alt="全民怪兽"/>
            <div id="poker1" class="poker poker1">
                <i class="spr spr-card1"></i>
            </div>
            <div id="poker3" class="poker poker3">
                <i class="spr spr-card3"></i>
            </div>
            <div class="arr">继续<div class="spr spr-arr"></div></div>
        </div>
    </script>
    <script id="tplC4" type="text/js-tpl">
        <div class="card-bd ivalign">
            <img src="./images/4.jpg" alt="全民怪兽"/>
            <div class="arr">继续<div class="spr spr-arr"></div></div>
        </div>
    </script>
    <script id="tplC5" type="text/js-tpl">
        <div class="card-bd ivalign">
            <img src="./images/5.jpg" alt="全民怪兽"/>
            <div class="arr">继续<div class="spr spr-arr"></div></div>
        </div>
    </script>
    <script id="tplC6" type="text/js-tpl">
        <div class="card-bd ivalign">
            <img src="./images/6.jpg" alt="全民怪兽"/>
            <div class="arr">继续<div class="spr spr-arr"></div></div>
        </div>
    </script>
    <script id="tplC7" type="text/js-tpl">
        <div class="card-bd ivalign">
            <img src="./images/7.jpg" alt="全民怪兽"/>
            <div id="poker2" class="poker poker2">
                <i class="spr-card2"></i>
            </div>
            <div id="poker4" class="poker poker4">
                <i class="spr-card4"></i>
            </div>
            <div class="arr">继续<div class="spr spr-arr"></div></div>
        </div>
    </script>
    <script id="tplC8" type="text/js-tpl">
        <div class="card-bd ivalign">
            <img src="./images/8.jpg" alt="全民怪兽"/>
            <div id="snsActions" class="sns-acts">
                <a id="btnShare" class="btn btn-block btn_share">考考朋友</a>
                <a id="btnRetry" class="btn btn-block btn-style1" href="{:U('DuXinShu/index')}">不服再战</a>
				<!--<a id="btnCopy"href="http://mp.weixin.qq.com/s?__biz=MzA5NTMzMTgxMg==&mid=200040545&idx=1&sn=429ecbe3ae11cb5c7ad65a35a9a60be7#rd">关注我们</a>-->
                <div class="sns-tip">微信搜索【眼镜侠】，关注我们，66元配眼镜<br>
                公众号回复“读心术”，马上为你解密哦</div>
            </div>
        </div>
  </script>
    <script>ISDSpeed.hit(0);</script>
  <load href="__PUBLIC__/DuXinShu/js/duxinshu.js" />
    <script>
        document.addEventListener('DOMContentLoaded',function(e){
            heroApp.init({
                imgPrefix:'./images/',
                okTip:'复制链接成功,快发给朋友们吧！',
                errTip:'浏览器不支持自动复制！长按下面链接可以手工复制哦！<br/><br/><a href="$">小黄鸭</a>'
            });
        });
        ISDSpeed.hit(2);window.addEventListener('load',function(){ISDSpeed.hit(3,true).report();});
    </script>

<div class="bgtext">
    <a style="color: black; text-decoration: none; " href="http://mp.weixin.qq.com/mp/getmasssendmsg?__biz=MzAwNzY3MzUyMA==#wechat_webview_type=1&wechat_redirect">微信搜索【眼镜侠】，关注我们，66元配眼镜</a>
</div>
</body>
</html>