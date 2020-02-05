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
            background-size:100% 100%;
            background-repeat:no-repeat;
            background-color: transparent;
			border:none;
			width:100%;
    background-image: url(/farm/images/233384.jpg);
    }
    .bigout{
    height:100%;
    }
    .acheng{
    display:inline-block;
    width:70px;
    height:25px;
    line-height:25px;
    text-decoration:none;
    color:white;
    background-color: #28a2d9;
    }

    .datagrid{
    margin:0 auto;
    }
    </style>   
</head>
<body>
<div class="bigout">
<div id="controlBox" style="position: absolute;z-index:1;margin-left:20%">
    <span style="color:white">种子名称:</span>
    <input id="seedSearch"  panelHeight="auto" type="text">
    <a href="#" class="easyui-linkbutton c1" iconCls="icon-search" onclick="doSearch()">查询</a>
    <a href="#" class="easyui-linkbutton c2" iconCls="icon-add" onclick="newRecord()">添加</a>
    <a href="#" class="easyui-linkbutton c2" iconCls="icon-edit" onclick="editRecord()">编辑</a>
    <a href="#" class="easyui-linkbutton c5" iconCls="icon-cancel" onclick="destoryRecord()">删除</a>
</div>
<div style="margin:0 auto;">
<table id="grid" style="position: absolute;z-index:0"></table>
</div>
<div id="formContainer" class="easyui-dialog" style="width:800px;height:360px;padding:10px 10px" closed="true" buttons="#formButtons">
    <form id="formEditor" method="POST" novalidate>
        <table class='tbledit' style="float:left">
            <tr style="diaplay:none">
                <td>ID：</td>
                <td><input name="id" required="true" class="w200" value="0" readonly="readonly"></td>
            </tr>
            <tr>
                <td>种子ID：</td>
                <td><input name="seedId" required="true" class="easyui-numberbox w1024"></td>
            </tr>
            <tr>
                <td>X季作物：</td>
                <td><input name="season" required="true" class="easyui-numberbox w1024">季作物</td>
            </tr>
            <tr>
                <td>种子名称：</td>
                <td><input name="seedName" required="true" class="easyui-validatebox w50"></td>
            </tr>
            <tr>
                <td>种子等级</td>
                <td><input name="seedGrade" required="true" class="easyui-numberbox w50">级作物</td>
            </tr>
            <tr>
                <td>种子类型</td>
                <td><input name="seedType" required="true" class="easyui-combobox" panelHeight="auto"
                           data-options="editable:false,
                                    valueField:'num',
                                    textField:'name',
                                    url:'<%=basePath%>seedType/chosedata'"></td>
            </tr>
            <tr>
                <td>可获经验</td>
                <td><input name="experience" required="true" class="easyui-numberbox w50"></td>
            </tr>
            <tr>
                <td>每季成熟所需时间</td>
                <td><input name="matureTime" required="true" class="easyui-numberbox w50">秒</td>
            </tr>
            </table>
            <table style="float:right">
            <tr>
                <td>每季成熟可收获数</td>
                <td><input name="getNum" required="true" class="easyui-numberbox w50"></td>
            </tr>
            <tr>
                <td>种子采购价</td>
                <td><input name="buyPrice" required="true" class="easyui-numberbox w50">金币</td>
            </tr>
            <tr>
                <td>每个果实出售价</td>
                <td><input name="salePrice" required="true" class="easyui-numberbox w50">金币</td>
            </tr>
            <tr>
                <td>土地需求</td>
                <td><input name="soil" required="true" class="easyui-combobox" panelHeight="auto"
                           data-options="editable:false,
                                    valueField:'num',
                                    textField:'name',
                                    url:'<%=basePath%>soil/chosedata'"></td>
            </tr>
            <tr>
                <td>成熟可获积分</td>
                <td><input name="points" required="true" class="easyui-numberbox w50"></td>
            </tr>
            <tr>
                <td>提示信息</td>
                <td><input name="tip" required="true" class="easyui-textbox" data-options="width:146,height:85,multiline:true"></td>
            </tr>
        </table>
    </form>
</div>
<div id="formButtons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveRecord()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#formContainer').dialog('close')">取消</a>
</div>
<div id="w1" style="width: 920px;height:400px;" class="easyui-window" closed="true" title="成长阶段" data-options="iconCls:'icon-save',collapsible:false,maximizable:false,minimizable:false,tools:'#tt'" style="width:500px;height:200px;padding:10px;">
<div id="GrowthEdit" style="margin-left:30px">
    <a href="#" class="easyui-linkbutton c2" iconCls="icon-add" onclick="newGrowth()">添加</a>
    <a href="#" class="easyui-linkbutton c2" iconCls="icon-edit" onclick="editGrowth()">编辑</a>
    <a href="#" class="easyui-linkbutton c5" iconCls="icon-cancel" onclick="destoryGrowth()">删除</a>
</div>
		<div style="margin:0 auto;">
<table id="growgrid" style="position: absolute;z-index:0"></table>
</div>
<div id="growthContainer" class="easyui-dialog" style="width:800px;height:300px;padding:10px 10px" closed="true" buttons="#growthButtons">
    <form id="growthEditor" method="POST" novalidate>
        <table class='tbleditgrowth' style="float:left">
            <tr>
                <td>ID：</td>
                <td><input name="id" required="true" class="w200" value="0" readonly="readonly"></td>
            </tr>
            <tr>
                <td>种子ID：</td>
                <td><input id="growthSeedId" name="seedId" required="true" readonly="readonly" class=" w1024"></td>
            </tr>
            <tr>
                <td>生长阶段：</td>
                <td><input id="growthNum" name="growthNum" required="true" class="easyui-numberbox w1024"></td>
            </tr>
            <tr>
                <td>生长阶段标题</td>
                <td><input name="growthName" required="true" class="easyui-validatebox w50"></td>
            </tr>
            <tr>
                <td>阶段生长时间</td>
                <td><input name="growthTime" required="true" class="easyui-numberbox w50">秒</td>
            </tr>
            <tr>
                <td>生虫概率</td>
                <td><input name="bug" required="true" class="w50"></td>
            </tr>
            </table>
            <table class="growthTab" style="float:right">
            <tr>
                <td>宽度</td>
                <td><input id="growthWidth" name="width" required="true" class="easyui-numberbox w50">px</td>
            </tr>
            <tr>
                <td>高度</td>
                <td><input id="growthHeight" name="height" required="true" class="easyui-numberbox w50">px</td>
            </tr>
            <tr>
                <td>offsetX</td>
                <td><input id="offsetX" name="offsetX" required="true" class="easyui-numberbox w50">px</td>
            </tr>
            <tr>
                <td>offsetY</td>
                <td><input id="offsetY" name="offsetY" required="true" class="easyui-numberbox w50">px</td>
            </tr>
            <tr>
                <td>作物状态</td>
                <td><input name="state" required="true" class="easyui-combobox" panelHeight="auto"
                           data-options="editable:false,
                                    valueField:'num',
                                    textField:'name',
                                    url:'<%=basePath%>cropState/chosedata'"></td>
            </tr>
            <tr>
            <td></td>
            <td><input type="button" value="图片位置" onclick="picMove()"></td>
            </tr>
        </table>
    </form>
</div>
<div id="growthButtons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveGrowth()">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#growthContainer').dialog('close')">取消</a>
</div>
    <div id="positionDialog" class="easyui-dialog" style=" position:relative;width:236px;height:402px;background: url(/farm/images/positioning.png) no-repeat center;" closed="true" buttons="#positionDialogButtons">
    <div style="overflow:hidden;margin-left:10px;margin-top:10px; position:relative;width:202px;height:300px;" id="tools-imagePositioner-display" class="tools-imagePositioner-display">
           <img style="position:absolute; width:62px;height:75px;border:1px solid red;" class="easyui-draggable easyui-resizable" data-options="onDrag:imagePositioneronDrag,onResize:imageResize"  src="">
           </div>
    </div>
    <div id="positionDialogButtons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="gainPostion()">确定</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#positionDialog').dialog('close')">取消</a>
    </div>
</div>
</div>
    <script>
    $("body").css("height",$(window).height());
    
    var grid;
    $(document).ready(function () {
        grid = $('#grid').edatagrid({
            title: '种子清单',
            width: 1350,
            height: 500,
            method:'post',
            url: '<%=basePath%>seedList/gridData',
            border: false,                 
            remoteSort: true,
            nowrap: false,
            singleSelect: true,
            fitColumns: true,
            pagination: true,
            striped: true,
            autoSave: true,
            idField: "id",            
            columns: [[
                {field: 'id', title: 'ID', width: 50, sortable: true,align:'center',halign:'center'},
                {field: 'seedId', title: '种子ID', width: 70,sortable: true,align:'center',halign:'center'},
                {field: 'seedName', title: '种子名称', width: 75,sortable: true,align:'center',halign:'center'},
                {field: 'season', title: 'X季作物', width: 75, sortable: true,align:'center',halign:'center',
                	formatter:function(value,row,index){
                		return value+"季作物";
                	}},
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
                {field: 'experience', title: '可得经验', width: 75, sortable: true,align:'center',halign:'center'},
                {field: 'matureTime', title: '成熟所需时间', width: 120, sortable: true,align:'center',halign:'center',
                	formatter:function(value,row,index){
                		return value+"秒";
                	}},
                {field: 'getNum', title: '收获数量', width: 75, sortable: true,align:'center',halign:'center'},
                {field: 'buyPrice', title: '种子购买价', width: 100, sortable: true,align:'center',halign:'center',
                	formatter:function(value,row,index){
                		return value+"金币";
                	}},
                {field: 'salePrice', title: '果实价格', width: 75, sortable: true,align:'center',halign:'center',
                		formatter:function(value,row,index){
                    		return value+"金币";
                    	}},
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
                		return value+"积分";
                	}},
                {field: 'tip', title: '小提示', width: 200, sortable: true,align:'center',halign:'center'},
                {field:'opt',title:'操作',width:100,align:'center',align:'center',halign:'center',  
                    formatter:function(value,row){  
                    	//var bt='<input type="button" style="width:70px;height:20px;color:black;background-color:white;" onclick="openwindow1('+row.seedId+')" value="成长阶段"'
                    	var bt='<a href="#" class="acheng" onclick="openwindow1('+row.seedId+')">成长阶段</a>';
                        return bt;  
                    }  
                }
            ]]
        });
        grid.edatagrid("getPager").pagination({
        	pageSize:5,//每页显示的记录条数，默认为10  
            pageList: [3,5,7,10],//可以设置每页记录条数的列表  
            beforePageText: '第',//页数文本框前显示的汉字  
            afterPageText: '页    共 {pages} 页',
            displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        });
        $('#grid').datagrid('resize', {
                height: $(window).height() - 36,
        width:$(window).width() - 50
            });
    });    
    function openwindow1(id){
    	$("#w1").window('open');
            $('#growgrid').edatagrid({
                title: '成长阶段',
                width: 900,
                height: 300,
                method:'post',
                url: '<%=basePath%>seedGrowth/gridData/'+id,
                border: false,                 
                remoteSort: true,
                nowrap: false,
                singleSelect: true,
                fitColumns: true,
                pagination: false,
                striped: true,
                autoSave: true,
                idField: "id",            
                columns: [[
                    {field: 'id', title: 'ID', width: 30, sortable: true,align:'center',halign:'center'},
                    {field: 'seedId', title: '种子ID', width: 70,sortable: true,align:'center',halign:'center'},
                    {field: 'growthNum', title: '生长阶段', width: 75,sortable: true,align:'center',halign:'center'},
                    {field: 'growthName', title: '生长阶段标题', width: 100, sortable: true,align:'center',halign:'center',},
                    {field: 'growthTime', title: '阶段生长时间', width: 100, sortable: true,align:'center',halign:'center',
                    	formatter:function(value,row,index){
                    		return value+"秒";
                    	}},
                    {field: 'bug', title: '生虫概率', width: 75, sortable: true,align:'center',halign:'center',},
                    {field: 'width', title: '宽度', width: 60, sortable: true,align:'center',halign:'center'},
                    {field: 'height', title: '高度', width: 60, sortable: true,align:'center',halign:'center',},
                    {field: 'offsetX', title: 'offsetX', width: 75, sortable: true,align:'center',halign:'center'},
                    {field: 'offsetY', title: 'offsetY', width: 75, sortable: true,align:'center',halign:'center'},
                    {field: 'state', title: '作物状态', width: 75, sortable: true,align:'center',halign:'center',
                    	formatter:function(value,row,index){
                    		var htmlObj = $.ajax({
                    			url : "<%=basePath%>cropState/stateData",
                    			type : "post",
                    			async : false,
                    			data : {num:value}
                    		});
                    		var text = htmlObj.responseText;
                    		var json = JSON.parse(text);
                    		return json.name;
                    	}},
                ]]
            });
}
    function doSearch() {
        grid.datagrid("load", {
            seedName: $('#seedSearch').val()
        });
    }
    function newRecord(){
    	$('#formContainer').dialog('open').dialog('center').dialog('setTitle','添加数据');
    	$('#formEditor').form('clear');
    	$('#formEditor').find("input[name='id']").val(0);
    }
    function editRecord() {
        var row = grid.datagrid('getSelected');
        if (row) {
            $('#formContainer').dialog('open').dialog('setTitle', '编辑数据');
            $('#formEditor').form('load', row);
        } else {
            alert("请先选择一行数据，然后再尝试点击操作按钮！");
        }
    }
    function saveRecord() {
        $('#formEditor').form('submit', {
            url: '<%=basePath%>seedList/save',
            onSubmit: function (param) {
                return $(this).form('validate');
            },
            success: function (result) {
                var result = eval('(' + result + ')');
                if (result.code == 0) {
                    $('#formContainer').dialog('close');
                    grid.datagrid('reload');
                }
                $.messager.show({
                    title: "消息",
                    msg: result.msg
                });
            }
        });
    }
    function destoryRecord(){
    	var row = $('#grid').datagrid('getSelected');
    	if (row){
    		$.messager.confirm('确认','是否删除选中记录',function(r){
    			if (r){
    				$.post('<%=basePath%>seedList/delete',
    						{id:row.id},
    						function(result){
    							if (result.code == 0) {
    			                    grid.datagrid('reload');
    			                }
    			                $.messager.show({
    			                    title: "消息",
    			                    msg: result.msg
    			                });
    				},
    				'json');
    			}
    		});
    	}
    	else{
    		$.messager.alert('提示','没有选中数据','info');
    	}
    }
    
    function newGrowth(){
    	var row= $('#grid').datagrid('getSelected');
    	$('#growthEditor').form('clear');
    	$('#growthEditor').find("input[name='id']").val(0);
    	$('#growthSeedId').val(row.seedId);
    	$('#growthContainer').dialog('open').dialog('center').dialog('setTitle','添加成长数据');
    }
    function editGrowth() {
        var row = $('#growgrid').datagrid('getSelected');
        if (row) {
            $('#growthContainer').dialog('open').dialog('setTitle', '编辑成长数据');
            $('#growthEditor').form('load', row);
        } else {
            alert("请先选择一行数据，然后再尝试点击操作按钮！");
        }
    }
    function saveGrowth() {
        $('#growthEditor').form('submit', {
            url: '<%=basePath%>seedGrowth/save',
            onSubmit: function (param) {
                return $(this).form('validate');
            },
            success: function (result) {
                var result = eval('(' + result + ')');
                if (result.code == 0) {
                    $('#growthContainer').dialog('close');
                    $('#growgrid').datagrid('reload');
                }
                $.messager.show({
                    title: "消息",
                    msg: result.msg
                });
            }
        });
    }
    function destoryGrowth(){
    	var row = $('#growgrid').datagrid('getSelected');
    	if (row){
    		$.messager.confirm('确认','是否删除选中记录',function(r){
    			if (r){
    				$.post('<%=basePath%>seedGrowth/delete',
    						{id:row.id},
    						function(result){
    							if (result.code == 0) {
    								$('#growgrid').datagrid('reload');
    			                }
    			                $.messager.show({
    			                    title: "消息",
    			                    msg: result.msg
    			                });
    				},
    				'json');
    			}
    		});
    	}
    	else{
    		$.messager.alert('提示','没有选中数据','info');
    	}
    }
    function picMove(){
    	var img=$("#positionDialog img");
    	var dialog=$("#positionDialog");
    	var width=$("#growthWidth").val();
    	var height=$("#growthHeight").val();
    	var offsetX=$("#offsetX").val();
    	var offsetY=$("#offsetY").val();
    	var seedId=$("#growthSeedId").val();
    	var growthNum=$("#growthNum").val();
    	var imgUrl;
    	if (growthNum==0) {
    		imgUrl="/farm/images/crops/basic/0.png";
		}else if(growthNum==6){
			imgUrl="/farm/images/crops/basic/9.png";
		}else{
			imgUrl="/farm/images/crops/"+seedId+"/"+growthNum+".png";
		}
    	img.prop("src",imgUrl);
    	//if (offsetX>dialog.width()-width) {
		//	offsetX=dialog.width()-width;
		//}
    	//if(offsetY>dialog.height()-height){
    	//	offsetY=dialog.height()-height
    	//}
    	img.css({"width":width+"px","height":height+"px","top":offsetY+"px","left":offsetX+"px"});
    	dialog.dialog("open").dialog('setTitle', '编辑图片位置');
    }
    function imagePositioneronDrag(e){
		//var d = e.data;
		//if (d.left < 0){d.left = 0}
		//if (d.top < 0){d.top = 0}
		//if (d.left + $(d.target).outerWidth() > $(d.parent).width()){
		//	d.left = $(d.parent).width() - $(d.target).outerWidth();
		//}
		//if (d.top + $(d.target).outerHeight() > $(d.parent).height()-10){
		//	d.top = $(d.parent).height() - $(d.target).outerHeight()-10;
		//}
    }
    function imageResize(e){
    	var d = e.data;
    	var dialog=$("#positionDialog");
    	$('#positionDialog img').resizable({
    		maxWidth:dialog.width()-d.left,
    		maxHeight:dialog.height()-d.top
        });
    }
    function mageResize(e){
    	var d = e.data;
    	var fx="n,e,s,w";
    	var dialog=$("#positionDialog");
    	if(d.left<=10){
    		fx=fx.replace(",w","");
    	}
    	if(d.top<=10){
    		fx=fx.replace("n,","");
    	}
    	if((d.left+d.width+10)>=dialog.width()){
    		fx=fx.replace("e,","");
    	}
    	if((d.left+d.height+10)>=dialog.height()){
    		fx=fx.replace("s,","");
    	}
    	console.log(fx);
    	$('#positionDialog img').resizable({
    		maxWidth:dialog.width()-20,
    		maxHeight:dialog.height()-20,
    		handles:fx
        });
    }
    function gainPostion(){
    	var img=$("#positionDialog img");
    	var width=img.css("width");
    	var height=img.css("height");
    	var top=img.css("top");
    	var left=img.css("left");
    	width=width.replace("px","");
    	var wnum=parseInt(width);
    	height=height.replace("px","");
    	var hnum=parseInt(height);
    	top=top.replace("px","");
    	var tnum=parseInt(top);
    	left=left.replace("px","");
    	var lnum=parseInt(left);
    	$("#growthWidth").numberbox('setValue',wnum);
    	$("#growthHeight").numberbox('setValue',hnum);
    	$("#offsetX").numberbox('setValue',lnum);
    	$("#offsetY").numberbox('setValue',tnum);
    	$("#positionDialog").dialog("close");
    }
</script>
</body>
</html>