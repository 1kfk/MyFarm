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
    .fr{
    display:inline-block;
    float:right;
    margin-top: 3px;
    }
    .outbig{
    position:relative;
    margin:20px auto;
    border: 5px solid #03a7e4;
    border-radius:5px;
    background-color: #00cb00;
    display:block;
    }
    .datagrid{
    margin:0px auto;
    }
    .ashang{
    display:inline-block;
    width:70px;
    height:25px;
    line-height:25px;
    text-decoration:none;
    color:white;
    }
    .ashang1{
    background-color: #28a2d9;
    }
    .ashang2{
    background-color: #046ab0;
    }
    .datagrid-td-rownumber{
    height:51px;
    }
    .upto{
    width:380px;
    height:75px; 
    position:absolute;
    border: 5px solid #00cb00;
    border-radius:5px;
    background-color: #008800;
    z-index: 9;
    left:350px;
    top:175px;
    color:white;
    display:none;
    }
    .but{
    width:380px;
    height:50px; 
    margin-top:10px;
    border-top: 1px solid black;
    }
    </style>   
</head>
<body>
<div id="userContainer" class="outbig" style="width:1015px;height:430px;" >
<div class="upto" id="uptoid">

<form id="fileform" method="post" enctype="multipart/form-data">
文件上传：<input id="filePathName" name="filePathName" class="easyui-filebox" data-options="prompt:'Choose another file...',buttonText: '选择文件'" style="width:300px;">
</form>
<div class="but">
<a id="btn" href="#" class="easyui-linkbutton fr" data-options="iconCls:'icon-cancel'" onclick='javascript:$("#uptoid").css("display","none");'>关闭窗口</a>
<a id="btn" href="#" class="easyui-linkbutton fr" data-options="iconCls:'icon-ok'" onclick="submitfile()">开始上传</a>
</div>

</div>
<div id="controlBox" >
    <span style="color:white">用户名</span>
    <input id="userSearch"  panelHeight="auto" type="text">
    <a href="#" class="easyui-linkbutton c1" iconCls="icon-search" onclick="doSearch()">查询</a>
    <a href="#" class="easyui-linkbutton c2" iconCls="icon-add" onclick="javascript:grid.edatagrid('addRow')">添加</a>
    <a href="#" class="easyui-linkbutton c2" iconCls="icon-remove" onclick="javascript:grid.edatagrid('cancelRow')">取消</a>
    <a href="#" class="easyui-linkbutton c5" iconCls="icon-cancel" onclick="javascript:grid.edatagrid('destroyRow')">删除</a>
</div>
<table id="grid" style="position: absolute;z-index:0"></table>
<a href="javascript:void(0)" class="easyui-linkbutton fr"  onclick="closewindow()">关闭窗口</a>
</div>
<script>
$("body").css("height",$(window).height());

var index;
var idname;
$(document).ready(function () {
    grid = $('#grid').edatagrid({
        title: '用户列表',
        width: 1000,
        height: 350,
        method:'post',
        url: '<%=basePath%>user/datagrid',
        saveUrl: '<%=basePath%>user/save',
        updateUrl: '<%=basePath%>user/save',
        destroyUrl: '<%=basePath%>user/delete',
        border: true,                 
        remoteSort: true,
        nowrap: true,
        rownumbers:true,
        singleSelect: true,
        fitColumns: true,
        pagination: true,
        striped: true,
        autoSave: true,
        idField: "id",            
        columns: [[
            {field: 'id', title: 'ID', width: 50, sortable: true,align:'center',halign:'center'},
            {field: 'headPic', title: '头像', width: 70,sortable: true,align:'center',halign:'center',
            	formatter: function (value, row) {
                    if (value == null||value=="") value = "people.png";
                    return '<img id="headimg" src="/farm/images/head/' + value + '" height="50px">';
                }
                },
            {field: 'userName', title: '用户名', width: 75,sortable: true,align:'center',halign:'center',
            	editor: {
                    type: 'validatebox',
                    options: {
                        validType: 'length[1,20]',
                        invalidMessage: '有效长度1-5',
                        required: true
                    }
                }},
            {field: 'easyName', title: '昵称', width: 75, sortable: true,align:'center',halign:'center',
            	editor: {
                    type: 'validatebox',
                    options: {
                        validType: 'length[1,20]',
                        invalidMessage: '有效长度1-5',
                        required: true
                    }
                }},
            {field: 'experience', title: '经验值', width: 75, sortable: true,align:'center',halign:'center',
                	formatter: function (value, row) {
                        if (value == null||value=="") value = "people.png";
                        return '<img src="/farm/images/经验.png" style="vertical-align:middle;"  height="30px">'+value;
                    },
            	editor: {type: 'numberbox', options: {precision: 0, required: true}}},
            {field: 'points', title: '积分', width: 75, sortable: true,align:'center',halign:'center',
            		formatter: function (value, row) {
                        if (value == null||value=="") value = "people.png";
                        return '<img src="/farm/images/积分.png" style="vertical-align:middle;" height="30px">'+value;
                    },
            	editor: {type: 'numberbox', options: {precision: 0, required: true}}},
            {field: 'money', title: '金币', width: 75, sortable: true,align:'center',halign:'center',
            		formatter: function (value, row) {
                        if (value == null||value=="") value = "people.png";
                        return '<img src="/farm/images/金币.png" style="vertical-align:middle;" height="30px">'+value;
                    },
            	editor: {type: 'numberbox', options: {precision: 0, required: true}}},
            {field:'opt',title:'操作',width:100,align:'center',align:'center',halign:'center',  
                formatter:function(value,row){  
                	var bt='<a href="#" class="ashang ashang1" onclick="fileup('+row.id+')">上传头像</a>'+
                	'<a href="#" class="ashang ashang2" onclick="save()">保存数据</a>';
                    return bt;  
                }  
            }
        ]],
	    destroyMsg: {
	        norecord: {
	            title: '警告',
	            msg: '首先需要选中记录，然后在点击删除按钮'
	        },
	        confirm: {
	            title: '确认',
	            msg: '是否删除选中记录?'
	        }
	    },
	    onSuccess: function (index, result) {
	    	$('#grid').datagrid('reload');
	    	$.messager.show({
                title: "消息",
                msg: result.msg
            });
	    },
	    onDestroy: function (index, result) {
	    	$('#grid').datagrid('reload');
	    	$.messager.show({
                title: "消息",
                msg: result.msg
            });
	    }
    }
    );
    
    grid.edatagrid("getPager").pagination({
    	pageSize: 2,//每页显示的记录条数，默认为10  
        pageList: [1, 2, 3],//可以设置每页记录条数的列表  
        beforePageText: '第',//页数文本框前显示的汉字  
        afterPageText: '页    共 {pages} 页',
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
    });
});    
function save(){
	$('#grid').edatagrid("saveRow");
}
function fileup(id){
	$("#uptoid").css("display","block");
    index = $("#grid").datagrid('getRowIndex', id);
    idname=id;
}
function submitfile(){
	$('#fileform').form('submit', {
        url: '<%=basePath%>file/saveHeadImg',
        type: 'post',    
        onSubmit: function (param) {
            return $(this).form('validate');
        },
        success: function (result) {
            var result = eval('(' + result + ')');
            
            	$("#uptoid").css("display","none");
            	console.log(result.msg);
            	
            	if(result.code==0){
            		
            		//var text = htmlObj.responseText;
            		//var json = JSON.parse(text);
            		$("#grid").edatagrid("updateRow",{
						index:index, //行索引
						row:{
							headPic:result.msg//行中的某个字段
						}
					});
            		$.ajax({
            			url : "<%=basePath%>user/updataPic",
            			type : "post",
            			async : false,
            			data : {id:idname,pic:result.msg}
            		});
            $.messager.show({
                title: "消息",
                msg: "上传成功"
            });
            $("#grid").datagrid("reload");
            }
            	else{
            		$.messager.show({
                        title: "消息",
                        msg: "上传失败"
                    });
        }
        }
    });
}
function closewindow(){
	$("#userContainer").css("display","none");
}
function doSearch(){
	$("#grid").datagrid("load", {
        userName: $('#userSearch').val()
    });
}
</script>
</body>
</html>