<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/green/easyui.css?t=34355">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/farm/farm.css">
    <script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/plugins/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/farm/helper.js?346t"></script> 
    <style type="text/css">
     body{
    margin: 0px;
            background-color: transparent;
			border:none;
			width:100%;
    background-image: url(/farm/images/233384.jpg);
    }
    .icon-save {
    background: url('/farm/images/用户.png') no-repeat center center;
}
    .out{
    border-top: 3px solid red;
    width:100%;
    height:1000px;
        background-image: url(/farm/images/lab.png);
        background-size: 663px 120px;
    }
    .iner{
    width:700px;
    }
    .fl{
    float:left;
    }
    .out a{
    display: inline-block;
    margin-top:30px;
    width:100px;
    height:50px;
    float:left;
    }
    .show{
    width:500px;
    height:150px;
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
    
    .window{
    margin-top:-60px;
    }
    .window-shadow{
    margin-top:-60px;
    }
    .buy{
    position: absolute;
    width:936px;
    height:345px;
    background-image:url(/farm/images/lab.png);
    }
    .buy2{
    position: absolute;
    width:936px;
    height:345px;
    background-color: #008000;
    opacity: 0.9;
    }
    .panel-htop{
    position: absolute;
    }
    .oneseed{
    float:left;
    width:234px;
    height:345px;
    opacity: 1;
    }
    .seedtip{
    width:232px;
    height:307px;
    overflow: hidden;
    position: relative;
    opacity: 1;
    }
    .btn{
    width:232px;
    height:34px;
    }
    .clickbuy{
    color:black;
    width:120px;
    height:25px;
    line-height:25px;
    font-size:14px;
    background-color: white;
    margin-left: 60px;
    margin-top: 5px;
    display: inline-block;
    text-decoration: none;
    border: 1px solid white;
    border-radius: 10px;
    text-align: center;
    }
    p{
    width:150px;
    margin:25px 0 0 40px;
    padding:0;
    color:white;
    position: absolute;
    font-size:11px;
    z-index: 1;
    }
    
    </style>   
</head>
<body>
<c:set var="user" value='<%=session.getAttribute("user")%>'/>
<span id="username" style="display:none;"><c:out value="${user.userName}"></c:out></span>

<div id="w1" style=" margin-top:0px;padding:5px;width: 960px;height:430px;" class="easyui-window" closed="false" title="种子仓库" 
data-options="iconCls:'icon-save',collapsible:false,maximizable:false,minimizable:false,tools:'#tt'" >
<table id="grid" style="position:relative;margin-top: 5px;margin-left: 5px;"></table>
<div class="buy">
<div class="buy2">
<div class="oneseed">
<div class="seedtip">
<img id="img11" src="/farm/images/border.png" title="111" style="position:absolute;width:230px;height:307px; z-index:2;">
<p id="p1"></p>
<img id="img1"  src="/farm/images/crops/6/5.png" style="left:50px; position:absolute; width:130px;z-index: 0;">
</div>
<div class="btn">
<a id="a1"  href="javascript:void(0)" class="clickbuy" onclick="buy()">我要购买</a>
</div>
</div>

<div class="oneseed">
<div class="seedtip">
<img id="img12" src="/farm/images/border.png" style="position:absolute;width:230px;height:307px; z-index:2;">
<p id="p2"></p>
<img id="img2" src="/farm/images/crops/6/5.png" style="left:50px; position:absolute; width:130px;z-index: 0;">
</div>
<div class="btn">
<a id="a2" href="javascript:void(0)" class="clickbuy" onclick="buy()">我要购买</a>
</div>
</div>

<div class="oneseed">
<div class="seedtip">
<img id="img13" src="/farm/images/border.png" style="position:absolute;width:230px;height:307px; z-index:2;">
<p id="p3"></p>
<img id="img3" src="/farm/images/crops/32/5.png" style="left:50px; position:absolute; width:130px;z-index: 0;">
</div>
<div class="btn">
<a id="a3" href="javascript:void(0)" class="clickbuy" onclick="buy()">我要购买</a>
</div>
</div>

<div class="oneseed">
<div class="seedtip">
<img id="img14" src="/farm/images/border.png" style="position:absolute;width:230px;height:307px; z-index:2;">
<p id="p4"></p>
<img id="img4" src="/farm/images/crops/30/5.png" style="left:50px; position:absolute; width:130px;z-index: 0;">
</div>
<div class="btn">
<a id="a4" href="#" class="clickbuy" onclick="buy(5)">我要购买</a>
</div>
</div>

</div>
</div>
</div>


<div class="out" >
<!--<img src="/farm/images/lab.png" style="height:120px;width:100%;position: absolute;">-->
<div class="iner">
<a href="javascript:void(0)" onclick="turn(1)"><img src="/farm/images/左.png" style="width:100px;height:50px;"> </a>
<div class="show" >
<div class="turn">
<ul id="ulturn" style="position: absolute;">
</ul>
</div>
</div>
<a href="javascript:void(0)" onclick="turn(2)"><img src="/farm/images/右.png" style="width:100px;height:50px;"></a>
</div>
</div>
<script>
$("body").css("height",$(window).height());

var size;
var turnsize=0;
var left=0;
$(document).ready(function () {
	
	var id1=0;
	var id2=0;
	var widths=$("#w1").innerWidth()-10;
	var heights=$("#w1").innerHeight()-10;
    grid = $('#grid').edatagrid({
        width: widths,
        height: heights,
        method:'post',
        data:${data},
        border: false,  
        scrollbarSize:0,
        remoteSort: true,
        nowrap: false,
        singleSelect: true,
        fitColumns: true,
        pagination: true,
        striped: true,
        autoSave: true,
        idField: "id",            
        columns: [[
            {field: 'id', title: 'ID', width: 50, sortable: true,align:'center',halign:'center',hidden:true},
            {field: 'seedId', title: '种子ID', width: 70,sortable: true,align:'center',halign:'center',hidden:true},
            {field: 'seedName', title: '种子名称', width: 75,sortable: true,align:'center',halign:'center'},
            {field: 'season', title: 'X季作物', width: 75, sortable: true,align:'center',halign:'center',
            	formatter:function(value,row,index){
            		return value+"季作物";
            	},hidden:true},
            {field: 'seedGrade', title: '种子等级', width: 75, sortable: true,align:'center',halign:'center',
            		formatter:function(value,row,index){
                		return value+"级作物";
                	}},
            {field: 'seedType', title: '种子类型', width: 75, sortable: true,align:'center',halign:'center',
            	formatter:function(value,row,index){
            		var htmlObj = $.ajax({
            			url : "<%=basePath%>seedType/seedTypeData",
            			type : "post",
            			async : false,
            			data : {num:value}
            		});
            		var text = htmlObj.responseText;
            		var json = JSON.parse(text);
            		return json.name;
            	}},
            {field: 'experience', title: '可得经验', width: 75, sortable: true,align:'center',halign:'center',hidden:true},
            {field: 'matureTime', title: '成熟所需时间', width: 120, sortable: true,align:'center',halign:'center',
            	formatter:function(value,row,index){
            		return value+"秒";
            	},hidden:true},
            {field: 'getNum', title: '收获数量', width: 75, sortable: true,align:'center',halign:'center',hidden:true},
            {field: 'buyPrice', title: '种子购买价', width: 100, sortable: true,align:'center',halign:'center',
            	formatter:function(value,row,index){
            		return value+"金币";
            	},hidden:true},
            {field: 'salePrice', title: '果实价格', width: 75, sortable: true,align:'center',halign:'center',
            		formatter:function(value,row,index){
                		return value+"金币";
                	},hidden:true},
            {field: 'soil', title: '土地需求', width: 75, sortable: true,align:'center',halign:'center',
                		formatter:function(value,row,index){
                    		var htmlObj = $.ajax({
                    			url : "<%=basePath%>soil/soilData",
                    			type : "post",
                    			async : false,
                    			data : {num:value}
                    		});
                    		var text = htmlObj.responseText;
                    		var json = JSON.parse(text);
                    		return json.name;
                    	}},
            {field: 'points', title: '可获积分', width: 75, sortable: true,align:'center',halign:'center',
            	formatter:function(value,row,index){
            		id2=id2+1;
            		if((id2-id1)==4){
            			z(1);
            		}
            		return value+"积分";
            	},hidden:true},
            {field: 'tip', title: '小提示', width: 250, sortable: true,align:'center',halign:'center',hidden:true},
        ]]
    });
    grid.edatagrid("getPager").pagination({
    	pageSize: 4,//每页显示的记录条数，默认为10  
        pageList: [4],//可以设置每页记录条数的列表  
        beforePageText: '第',//页数文本框前显示的汉字  
        afterPageText: '页    共 {pages} 页',
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        onSelectPage:function(pageNumber, pageSize){
        	var rows=$("#grid").datagrid("getRows");
        	console.log(rows);//换页时重新载入当前行内容
        	console.log(pageNumber);
        	z(pageNumber);
        }
    });
    grid.datagrid('reload');
    seedbag();
});    
function chushihua(){
	
	var out=$(".out");//out自适应
	var topH=$(window).height() - 120;
	out.css("margin-top",topH);
	
	var inner=$(".iner");//iner自适应
	var helfW=inner.width()/2
	var leftW=$(window).width()/2-helfW;
	inner.css("margin-left",leftW);
	
	for (var i = 1; i < 5; i++) {
		var str="#img"+i;
		var img1=$(str);//种子图片排版
		var imgheight1=img1.height();
		img1.css("top",300-imgheight1);
	}
	
	
}
function z(pageNumber){
	chushihua(); 
	var rows=$("#grid").datagrid("getRows");
	var jsonrow=JSON.stringify(rows);
	var json=eval('(' + jsonrow + ')'); 
	console.log(json);
	var k;
	for (var i = 0; i <4; i++) {
		k=(pageNumber-1)*4+i;
		var J=json[k];
		$("#p"+(i+1)).html(J.tip);
		$("#img"+(i+1)).prop("src","/farm/images/crops/"+J.seedId+"/5.png");
		$("#a"+(i+1)).attr("onclick","buy("+k+")");
		
		var type = $.ajax({
			url : "<%=basePath%>seedType/seedTypeData",
			type : "post",
			async : false,
			data : {num:J.seedType}
		}).responseText;
		var soil = $.ajax({
			url : "<%=basePath%>soil/soilData",
			type : "post",
			async : false,
			data : {num:J.soil}
		}).responseText;
		var ty = JSON.parse(type);
		var so = JSON.parse(soil);
		$("#img1"+(i+1)).prop("title","名称："+J.seedName+"\r\n级别："+J.seedGrade+
				"\r\n价格："+J.buyPrice+"\r\n类别："+ty.name+"\r\n土地："+so.name+
				"\r\n可收获季："+J.season+"季\r\n成熟时间："+J.matureTime+"秒\r\n单季收获："+J.getNum+
				"个果实\r\n经验收获："+J.experience+"\r\n果实出售："+J.salePrice+"金币/个\r\n积分收获："+J.points);
	}
	//x();
}
function seedbag(){
	var username=$("#username").html();//获得当前用户
	if(username!=""){
		var htmlObj = $.ajax({
			url : "<%=basePath%>seedBuy/getBag",
			type : "post",
			async : false,
			data : {name:username}
		});
		var text = htmlObj.responseText;
		var json = JSON.parse(text);
		$("#ulturn").html("");
		for (var i = 0; i < json.length; i++) {
			var pic=json[i].seedId;
			var num=json[i].seedNumber;
			$("#ulturn").append("<li><span>"+num+"</span><img src='/farm/images/crops/"+pic+"/5.png' style='width:50px;margin-left: 25px;'> </li>");
		}
		var ulwidth=json.length*100;
		$("#ulturn").css("width",ulwidth+"px");
		size=Math.ceil(ulwidth/500);
		size=size-turnsize;
		$("#ulturn").css("margin-left",left+"px");
		//剩余页数
	}
	var imgsmall=$("li > img");//下方小图片
	imgsmall.css("margin-top","13px");
}
function buy(id){
	var username=$("#username").html();//获得当前用户
	var rows=$("#grid").datagrid("getRows");
	var jsonrow=JSON.stringify(rows);
	var json=eval('(' + jsonrow + ')'); 
	var seed=json[id].seedName;
	var seedid=json[id].seedId;
    $.messager.confirm('种子购买', '确认购买'+seed+'的种子么', function(r){
    	if (r){
    		var htmlObj = $.ajax({
    			url : "<%=basePath%>seedBuy/buyseed",
    			type : "post",
    			async : false,
    			data : {name:username,seed:seedid}
    		});
    		var text = htmlObj.responseText;
    		var json = JSON.parse(text);
    		$.messager.show({
                title: "结果",
                msg: json.msg
            });
    		if(json.code==0){
        		seedbag();
        		window.parent.frames['menu'].location.reload();
        	}
    	}
    });
}
function turn(direction){
	var mleft=$("#ulturn").css("margin-left");
	if(direction==2&&size>1){
		left=left-500;
		console.log(left);
		$("#ulturn").css("margin-left",left+"px");
		console.log($("#ulturn").css("margin-left"));
		size=size-1;
		turnsize=turnsize+1;
	}
	if(direction==1&&turnsize>0){
		left=left+500;
		console.log(left);
		$("#ulturn").css("margin-left",left+"px");
		console.log($("#ulturn").css("margin-left"));
		size=size+1;
		turnsize=turnsize-1;
	}
}

function x(){
	var row=$('#grid').datagrid('getSelected');
	var index=$('#grid').datagrid('getRowIndex',row);
	console.log(index);
}
</script>
</body>
</html>