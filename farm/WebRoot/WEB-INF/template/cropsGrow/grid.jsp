<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String wsBasePath = "ws://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.setAttribute("farmUsername", "userA");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/green/easyui.css?t564">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/farm/farm.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/farm/imgPosition.css?t=0901">
    
    <script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/plugins/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/plugins/jquery.draggable.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/locale/easyui-lang-zh_CN.js"></script>
    
    <script type="text/javascript" src="<%=basePath%>ext/farm/helper.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/farm/imgPosition.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/farm/sockjs.js"></script>
    <style type="text/css">
    body{
    margin: 0px;
            background-color: transparent;
			border:none;
			width:100%;
			background-repeat:repeat;
			background-image: url(/farm/images/树.jpg);
			background-size: 300px 165px;
    }
    .bigout{
    position:relative;
    background-image: url(/farm/images/nongchan2.png);
    border:solid 1px #b3e3fa;
    border-radius:5%;
    background-repeat:no-repeat;
    margin:auto;
    }
    .out{
    width:700px;
    height:150px;
        background-image: url(/farm/images/lab.png);
        background-size: 663px 120px;
    }
    .iner{
    width:700px;
    }
    .fl{
    float:left;
    }
    .outa{
    display: inline-block;
    margin-top:30px;
    width:100px;
    height:50px;
    float:left;
    }
    .show{
    width:500px;
    height:120px;
    float:left;
    overflow: hidden;
    position: relative;
    background-color: #b3e3fa;
    opacity: 0.9;
    }
    li{
    width:100px;
    height:150px;
    float: left;
    display: inline-block;
    }
    ul{
    margin:0;
    padding:0;
    }
    .show span{
    display: block;
    width:25px;
    height:25px;
    margin-left: 35px;
    margin-top:5px;
    background-color: blue;
    color:white;
    border: solid 1px red;
    border-radius: 30px;
    text-align: center;
    }
    </style>
</head>

<body>
<div class="bigout" id="bigout">
</div>
<c:set var="user" value='<%=session.getAttribute("user")%>'/>
<span id="username" style="display:none;"><c:out value="${user.userName}"></c:out></span>
<div id="bagDialog" title="背包" class="easyui-dialog" style="position:relative;width:715px;height:190px;" closed="true" buttons="#positionDialogButtons">
<div class="out" >
<div class="iner">
<a class="outa" href="javascript:void(0)" onclick="turn(1)"><img src="/farm/images/左.png" style="width:100px;height:50px;"> </a>
<div class="show" >
<div class="turn">
<ul id="ulturn" style="position: absolute;">
</ul>
</div>
</div>
<a class="outa" href="javascript:void(0)" onclick="turn(2)"><img src="/farm/images/右.png" style="width:100px;height:50px;"></a>
</div>
<a href="javascript:void(0)" onclick="closeit()" class="easyui-linkbutton" style="margin-top:30px;margin-left:30px;">取消</a>
</div>
<audio id="sndWorm1" src="<%=basePath%>sounds/BB.mp3"></audio>
<audio id="sndWorm2" src="<%=basePath%>sounds/BZ.mp3"></audio>
<audio id="sndWorm3" src="<%=basePath%>sounds/CC.mp3"></audio>
<audio id="sndWorm4" src="<%=basePath%>sounds/SC.mp3"></audio>
<audio id="sndWorm5" src="<%=basePath%>sounds/SCh.mp3"></audio>
<audio id="sndWorm6" src="<%=basePath%>sounds/SH.mp3"></audio>
<audio id="sndWorm7" src="<%=basePath%>sounds/CF.mp3"></audio>
 </div>
<script type="text/javascript">
var size;
var turnsize=0;
var left=0;
    chushihua();
    myplant();
    function myplant(){
    	var userName=$("#username").html();//获得当前用户名
    	var crop = $.ajax({
			url : "<%=basePath%>cropsGrow/getcrops",
			type : "post",
			async : false,
			data : {userName:userName}
		});//得到用户作物
		var text = crop.responseText;
		var cropjson = JSON.parse(text);
		//console.log(cropjson);
		for (var i = 0; i < cropjson.length; i++) {
			var Crop=cropjson[i];
			landchushihua(Crop);
		}
    }
    
    function landchushihua(Crop){//初始化单块土地
    	var outH = $(window).height();
		var outW = outH * 1.7;
    	var flw=outW*0.09/200;
		var flh=outW*0.09*1.46/300;
        var div11a=$("#"+Crop.land+" a");//插入作物到土地中
    	
    	var cropxy = $.ajax({
			url : "<%=basePath%>cropsGrow/getcropxy",
			type : "post",
			async : false,
			data : {seedid:Crop.seedid,seedstate:Crop.seedstate}
		});//得到作物xy位置信息
		var xytext = cropxy.responseText;
		var cropxyjson = JSON.parse(xytext);
		//console.log(cropxyjson);
		
		var seedmation = $.ajax({
			url : "<%=basePath%>cropsGrow/findseed",
			type : "post",
			async : false,
			data : {id:Crop.seedid}
		}).responseText;//得到种子信息
		var seedjson = JSON.parse(seedmation);
		
    	if(Crop.seedstate==0){//将作物添加到土地中
    	div11a.append("<img src='/farm/images/crops/basic/0.png'"+
    			
    			" style='position:absolute;width:"+cropxyjson.width*flw+"px;height:"+cropxyjson.height*flh+"px;top:"+cropxyjson.offsetY*flh+"px;left:"+cropxyjson.offsetX*flw+"px;'/>");
    	//" title='名称："+seedjson.seedName+"\r\n状态:"+cropxyjson.growthName+"阶段\r\n产量："+Crop.seedget+"个\r\n时间："+new Date(Crop.nexttime)+"' "+
    	div11a.attr("title","名称："+seedjson.seedName+"\r\n状态:"+cropxyjson.growthName+"阶段\r\n产量："+Crop.seedget+"个\r\n时间："+new Date(Crop.nexttime));
    	div11a.attr("onclick"," ");
    	div11a.css("cursor","url(<%=basePath%>images/shizhong.cur),default");
    	}else if(Crop.seedstate==6){
    	div11a.append("<img src='/farm/images/crops/basic/9.png' "+
    			"style='position:absolute;width:"+cropxyjson.width*flw+"px;height:"+cropxyjson.height*flh+"px;top:"+cropxyjson.offsetY*flh+"px;left:"+cropxyjson.offsetX*flw+"px;'/>");
    	div11a.attr("onclick","CleanLand('"+Crop.land+"')");
    	div11a.attr("title","枯草");
    	div11a.css("cursor","url(<%=basePath%>images/changzi.cur),default");
    	}else{
    	div11a.append("<img src='/farm/images/crops/"+Crop.seedid+"/"+Crop.seedstate+".png'"+
    			" style='position:absolute;width:"+cropxyjson.width*flw+"px;height:"+cropxyjson.height*flh+"px;top:"+cropxyjson.offsetY*flh+"px;left:"+cropxyjson.offsetX*flw+"px;'/>");
    			//" title='名称："+seedjson.seedName+"\r\n状态:"+cropxyjson.growthName+"阶段\r\n产量："+Crop.seedget+"个\r\n时间："+new Date(Crop.nexttime)+"' "+
    	div11a.attr("title","名称："+seedjson.seedName+"\r\n状态:"+cropxyjson.growthName+"阶段\r\n产量："+Crop.seedget+"个\r\n时间："+new Date(Crop.nexttime));
    	if(Crop.seedstate==5){
    		div11a.attr("onclick","Harvest('"+Crop.land+"')");
    		div11a.css("cursor","url(<%=basePath%>images/souhuo.cur),default");
    	}else{
    		div11a.attr("onclick"," ");
    		console.log("正在成长");
    		div11a.css("cursor","url(<%=basePath%>images/shizhong.cur),default");
    	}
    	} 
    	if(Crop.isbug==1){//是否有虫子
    		div11a.append("<img id='abug' src='/farm/images/虫子.png' "+
        			"style='position:absolute;width:"+outH * 1.7*0.088*0.375+"px;margin-top:"+outW*0.088*1.56/1.8+"px;z-index:1;'/>");
    		div11a.attr("onclick","KillWorm('"+Crop.land+"')");
    		div11a.css("cursor","url(<%=basePath%>images/shachong.cur),default");
    		var sndWorm = $("#sndWorm4")[0];
        	sndWorm.play();
    		}
    }
    function KillWorm(land){
    	console.log("杀虫--------");
		var killbug = $.ajax({
			url : "<%=basePath%>cropsGrow/killbug",
			type : "post",
			async : false,
			data : {land:land}
		}).responseText;
		var result = JSON.parse(killbug);
		if(result.code==1){
			var sndWorm = $("#sndWorm5")[0];
	    	sndWorm.play();
			$.messager.show({
	            title: "消息",
	            msg: result.msg
	        });
			window.parent.frames['menu'].location.reload();
			$("#"+land+" img").eq(1).remove();
			$("#"+land+" a").attr("onclick"," ");
			$("#"+land+" a").css("cursor","url(<%=basePath%>images/shizhong.cur),default");
			}else{
			$.messager.show({
	            title: "消息",
	            msg: result.msg
	        });
		}
    }
    function CleanLand(land){
    	console.log("除草--------");
    	var clean = $.ajax({
			url : "<%=basePath%>cropsGrow/cleanland",
			type : "post",
			async : false,
			data : {land:land}
		}).responseText;//除草
		var result = JSON.parse(clean);
		var sndWorm = $("#sndWorm3")[0];
    	sndWorm.play();
		$.messager.show({
            title: "消息",
            msg: result.msg
        });
		window.parent.frames['menu'].location.reload();
		
		var i=parseInt(land.charAt(0));
		var j=parseInt(land.charAt(4));
		$("#"+land+" a").html("");
		$("#"+land+" a").attr("title","");
    	$("#"+land+" a").attr("onclick","openbag("+i+","+j+")");
    	$("#"+land+" a").css("cursor","url(<%=basePath%>images/bozhong.cur),default");
		if(result.code==0){
			var crop = $.ajax({
				url : "<%=basePath%>cropsGrow/getacrop",
				type : "post",
				async : false,
				data : {land:land}
			}).responseText;//得到用户作物
			var Crop = JSON.parse(crop);
			landchushihua(Crop);
		}
    }
    function Harvest(land){
    	console.log("收获--------");
    	var harvest = $.ajax({
			url : "<%=basePath%>cropsGrow/harvest",
			type : "post",
			async : false,
			data : {land:land}
		}).responseText;//收获
		var result = JSON.parse(harvest);
		window.parent.frames['menu'].location.reload();
		var sndWorm = $("#sndWorm6")[0];
    	sndWorm.play();
		$.messager.show({
            title: "消息",
            msg: result.msg
        });
		$("#"+land+" a").html("");
		$("#"+land+" a").attr("title","");
    	$("#"+land+" a").attr("onclick","");
    	$("#"+land+" a").css("cursor","url(<%=basePath%>images/changzi.cur),default");
		var crop = $.ajax({
			url : "<%=basePath%>cropsGrow/getacrop",
			type : "post",
			async : false,
			data : {land:land}
		}).responseText;//得到用户作物
		var Crop = JSON.parse(crop);
		landchushihua(Crop);
    }
    
    function plant(seedid,i,j){//播种
    	
		var plantIt = $.ajax({
			url : "<%=basePath%>cropsGrow/seedplant",
			type : "post",
			async : false,
			data : {seedid:seedid,landi:i,landj:j}
		}).responseText;//种植
		var result = JSON.parse(plantIt);
		if(result.code==1){
			var sndWorm = $("#sndWorm2")[0];
	    	sndWorm.play();
		$.messager.show({
            title: "消息",
            msg: result.msg
        });
		var land=i+"img"+j;
		var crop = $.ajax({
			url : "<%=basePath%>cropsGrow/getacrop",
			type : "post",
			async : false,
			data : {land:land}
		}).responseText;//得到用户作物
		var Crop=JSON.parse(crop);
		landchushihua(Crop);
		}
		else if(result.code==0){
			var sndWorm = $("#sndWorm7")[0];
	    	sndWorm.play();
				$.messager.show({
	                title: "消息",
	                msg: result.msg
	            });
		}else{
			var sndWorm = $("#sndWorm7")[0];
	    	sndWorm.play();
		$.messager.show({
            title: "消息",
            msg: result.msg
        });
	}
		closeit();
}
	function chushihua() {
		var outH = $(window).height();
		var outW = outH * 1.7;
		var outww = outW+"px";
		var outhh = outH + "px";
		$("#bigout").css({
			"height" : outhh,
			"width" : outww
		});//种植背景适应
		$("#bigout").css("background-size", outww + " " + outhh);
		var flw=outW*0.088+"px";
		var flh=outW*0.088*1.46+"px";
		var flt=outH*0.28;
		var fll=outW*0.046;
		for(var i=1;i<=4;i++){//循环生成土地
			for(var j=1;j<=5;j++){
				$("#bigout").append("<div class="+i+"img"+j+" id="+i+"img"+j+"><a id='a"+i+"' href='javascript:void(0)' onclick='openbag("+i+","+j+")'></a> </div>");
				$("#"+i+"img"+j).css({"background-image":" url(/farm/images/"+i+"土地.png)","position":"absolute",
					"background-size":flw+" "+flh,"width":flw,"height":flh,
					"top":flt-(j+i-2)*outW*0.088*1.56*0.41+(j-1)*outW*0.088*1.46+"px",
					"left":fll+(i+j-2)*outW*0.088+(j-1)*40+"px"});
				$("#"+i+"img"+j+" a").css({"display":"inline-block","width":flw,"height":flh});
				$("#"+i+"img"+j+" a").css("cursor","url(<%=basePath%>images/bozhong.cur),default");
			}
		}
		var username=$("#username").html();//获得当前用户
		if(username!=""){
		      initWebSocket();
		}
	}
	function openbag(soiltypenumi,soiltypenumj){
		var username=$("#username").html();//获得当前用户
		if(username!=""){
			var sndWorm = $("#sndWorm1")[0];
	    	sndWorm.play();
			var htmlObj = $.ajax({
				url : "<%=basePath%>seedBuy/getBag",
				type : "post",
				async : false,
				data : {name:username}
			});//得到用户背包
			var text = htmlObj.responseText;
			var json = JSON.parse(text);
			$("#ulturn").html("");
			for (var i = 0; i < json.length; i++) {
				var pic=json[i].seedId;
				var num=json[i].seedNumber;
				var seedmation = $.ajax({
					url : "<%=basePath%>cropsGrow/findseed",
					type : "post",
					async : false,
					data : {id:pic}
				}).responseText;//得到种子信息
				var seedjson = JSON.parse(seedmation);
				//console.log(seedjson);
				
				
				var soil = $.ajax({
					url : "<%=basePath%>soil/soilData",
					type : "post",
					async : false,
					data : {num:seedjson.soil}
				}).responseText;//得到土地信息
				var so = JSON.parse(soil);
				//插入植物信息
				$("#ulturn").append("<li><span>"+num+"</span><a href='javascript:void(0)' onclick='plant("+seedjson.seedId+","+soiltypenumi+","+soiltypenumj+")'>"+
						"<img src='/farm/images/crops/"+pic+"/5.png' "+
						" title='"+seedjson.seedName+ "\r\n单季产量："+seedjson.getNum+"个果实\r\n果实单价："+
						seedjson.salePrice+"金币\r\n季数："+seedjson.season+"季作物\r\n土地要求："+so.name+
						"' style='width:50px;margin-left: 25px;margin-top:10px;'></a> </li>");
			}
			var ulwidth=json.length*100;
			$("#ulturn").css("width",ulwidth+"px");
			size=Math.ceil(ulwidth/500);
			size=size-turnsize;
			$("#ulturn").css("margin-left",left+"px");
			//剩余页数
		$("#bagDialog").dialog("open").dialog('setTitle', '背包');//显示背包
		}else{
			var sndWorm = $("#sndWorm7")[0];
	    	sndWorm.play();
			$.messager.show({
                title: "消息",
                msg: "未选择用户"
            });
		}
	}
	
	var websocket = null; 
    function initWebSocket(){	    	     
	    if ('WebSocket' in window) {  
	        //Websocket的连接  
	        websocket = new WebSocket("<%=wsBasePath%>f/action");//WebSocket对应的地址  
	    }  
	    else if ('MozWebSocket' in window) {  
	        //Websocket的连接  
	        websocket = new MozWebSocket("<%=wsBasePath%>f/action");//SockJS对应的地址  
	    }  
	    else {  
	        //SockJS的连接  
	        websocket = new SockJS("<%=wsBasePath%>f/action");//SockJS对应的地址    
	    }  
	    websocket.onopen = onOpen;  
	    websocket.onmessage = onMessage;  
	    websocket.onerror = onError;  
	    websocket.onclose = onClose;
    }
  
    function onOpen(evt) {  
        console.log("连接打开：",evt);  
    }  
    function onMessage(evt) {
    	var land=evt.data;
    	var crop = $.ajax({
			url : "<%=basePath%>cropsGrow/getacrop",
			type : "post",
			async : false,
			data : {land:land}
		}).responseText;//得到用户作物
		var Crop=JSON.parse(crop);
		$("#"+land+" a").html("");
		$("#"+land+" a").attr("title","");
    	$("#"+land+" a").attr("onclick","");
		landchushihua(Crop);
    }  
    function onError(evt) {  
    	console.log("出现错误：",evt);
    }  
    function onClose(evt) {  
    	console.log("连接关闭：",evt);
    }  
	
	function turn(direction){
		var mleft=$("#ulturn").css("margin-left");
		if(direction==2&&size>1){
			left=left-500;
			//console.log(left);
			$("#ulturn").css("margin-left",left+"px");
			console.log($("#ulturn").css("margin-left"));
			size=size-1;
			turnsize=turnsize+1;
		}
		if(direction==1&&turnsize>0){
			left=left+500;
			//console.log(left);
			$("#ulturn").css("margin-left",left+"px");
			console.log($("#ulturn").css("margin-left"));
			size=size+1;
			turnsize=turnsize-1;
		}
	}
	function closeit(){
		$("#bagDialog").dialog("close");
	}
	function changemouse(str,i){
		if(i==1){
			console.log(i);
			console.log(str);
			$("#"+str).css("cursor","url(/farm/images/bozhong.cur),default");
		}
	}
</script>
</body>
</html>