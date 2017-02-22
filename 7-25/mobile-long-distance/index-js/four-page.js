
// four-page.js
function check() {
	var data1 = $("#selectId_1 option:selected").val();
	var data2 = $("#selectId_2 option:selected").val();
	var data3 = $("#selectId_3 option:selected").val();
	var data4 = $("#selectId_4 option:selected").val();
	var data5 = $("#selectId_5 option:selected").val();
	var data6 = $("#selectId_6 option:selected").val();
	var data7 = $("#selectId_7 option:selected").val();
	if (data1==""){
		alert("请填写左眼度数")
		return false;
	}
	if (data2=="") {
		alert("请填写右眼度数")
		return false;
	}
	if (data3 =="") {
		alert("请填写瞳距")
		return false;
	}
	if(data4 =='' && data6 !=''){
		alert("请填写左眼散光度数")
		return false;
	}
	if(data4 !='' && data6 ==''){
		alert("请填写左眼散光轴位")
		return false;
	}
	if(data5 =='' && data7 !=''){
		alert("请填写右眼散光度数")
		return false;
	}
	if(data5 !='' && data7 ==''){
		alert("请填写右眼散光轴位")
		return false;
	}
	return true;
}

// 增加近视度数js函数
function selectListSPH(){
    var i,p;
    var el = $("#selectId_1").html();
    var bl = $("#selectId_2").html();
    el += '<option value="">左眼度数</option><option value="0.00">平光(0.00)</option>';
    bl += '<option value="">右眼度数</option><option value="0.00">平光(0.00)</option>';
    for(i=25;i <= 1500;i+=25){
        p = -i/100;
        el += '<option value="'+ p.toFixed(2) +'">近视'+i+'度('+ p.toFixed(2) +')</option>'

    }
    for(i=25;i <= 1500;i+=25){
        p = -i/100;
        bl += '<option value="'+ p.toFixed(2) +'">近视'+i+'度('+ p.toFixed(2) +')</option>'

    }
    $("#selectId_1").append(el);
    $("#selectId_2").append(bl);
}

// 增加瞳距js函数
function selectListPD(){
    var i,p;
    var el = $("#selectId_3").html();
    el += '<option value="">瞳距</option>';
    for(i=50;i <= 80;i += 1){
        el += '<option value="'+ i +'">'+ i +'</option>'

    }
    $("#selectId_3").append(el);
}

// 增加散光度数js函数
function selectListCYH(){
    var i,p;
    var el = $("#selectId_4").html();
    var bl = $("#selectId_5").html();
    el += '<option value="">左眼散光</option>';
    for(i=25;i <= 400;i+=25){
        p = -i/100;
        el += '<option value="'+ p.toFixed(2) +'">左眼散光'+i+'度('+ p.toFixed(2) +')</option>'

    }

    bl += '<option value="">右眼散光</option>';
    for(i=25;i <= 400;i+=25){
        p = -i/100;
        bl += '<option value="'+ p.toFixed(2) +'">右眼散光'+i+'度('+ p.toFixed(2) +')</option>'

    }
    $("#selectId_4").append(el);
    $("#selectId_5").append(bl);
}

// 增加散光方向js函数
function selectListAIXS(){
    var i,p;
    var el = $("#selectId_6").html();
    var bl = $("#selectId_7").html();
    el += '<option value="">左眼轴位</option>';
    for(i=0;i <= 180;i+=1){
        el += '<option value="'+ i +'">'+ i +'</option>'

    }

    bl += '<option value="">右眼轴位</option>';
    for(i=0;i <= 180;i+=1){
        bl += '<option value="'+ i +'">'+i+'</option>'

    }
    $("#selectId_6").append(el);
    $("#selectId_7").append(bl);
}

//轴位隐藏函数
$(document).ready(function () {
    $("#selectId_5").change(function () {
    var data1 = $("#selectId_4 option:selected").val();
    var data2 = $("#selectId_5 option:selected").val();
    // $("#containerId").css("height","350px");
    $("#selectIdhide").show();
    $("#selectId_6").show();
    $("#selectId_7").show();
    if(data1=='' && data2==''){
        $("#selectIdhide").hide();
        $("#selectId_6").hide();
        $("#selectId_7").hide();
        // $("#containerId").css("height","285px");
        }  
    });
    $("#selectId_4").change(function () {
    var data1 = $("#selectId_4 option:selected").val();
    var data2 = $("#selectId_5 option:selected").val();
    // $("#containerId").css("height","350px");
    $("#selectIdhide").show();
    $("#selectId_6").show();
    $("#selectId_7").show();
    if(data1=='' && data2==''){
        $("#selectIdhide").hide();
        $("#selectId_6").hide();
        $("#selectId_7").hide();
        // $("#containerId").css("height","285px");
        }  
    });
})

window.onload=function(){ 
  selectListSPH();
  selectListPD();
  selectListCYH();
  selectListAIXS();
  $("#selectIdhide").hide();
  $("#selectId_6").hide();
  $("#selectId_7").hide();

}