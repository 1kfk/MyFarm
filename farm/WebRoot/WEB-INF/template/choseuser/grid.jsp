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
    p{
    margin:0;
    color:white;
    padding-top: 10px;
    padding-bottom: 10px;
    }
    .choseuserbig{
    width:400px;
    height:240px;
    border: 5px solid #00a400;
    border-radius:5px;
    background-color: #00a400;
    margin:100px auto;
    }
    .innertop{
    color:white;
    font-weight: bold;
    font-size: 20px;
    height:40px;
    }
    .choseuserbig img{
    float:left;
    margin-left: 5px;
    margin-top: 5px;
    }
    .icon{
    float:left;
    height:30px;
    margin-top:4px;
    }
    .innerbotn{
    width:398px;
    height:200px;
    background-color: #095e09;
    }
    .inbox{
    width:350px;
    height:100px;
    margin-left: 20px;
    border-bottom: 1px solid yellow;
    }
    .userdata{
    font-size:15px;
    display:inline;
    }
    </style>   
</head>
<body>
    <div class="choseuserbig">
    <div class="innertop">
    <img src="/farm/images/用户.png" width="30px"><div class="icon">用户选择</div>
    </div>
      <div class="innerbotn">
         <div class="inbox">
         <p>当前用户:</p>
          <input id="userChose" class="easyui-combobox" style="width:100%;"
           data-options="editable:false,
                                    valueField:'id',
                                    textField:'easyName',
                                    panelHeight:'auto',
                                    url:'<%=basePath%>user/chosedata'">
         </div>
         <div style="float:left;width:300px;padding-left:15px;"><p>请在下拉框中选择用户昵称，并点击“确认”按钮设定当前用户信息。</p></div>
         <a href="<%=basePath%>menu.jsp" class="easyui-linkbutton" style="float:right;margin-top:15px;margin-right:15px;" target="menu" onclick="userup()">确认</a>
      </div>
    </div>
<script>
$("body").css("height",$(window).height());
    $('#userChose').combobox({
    	formatter: function(row){
    		var headPic=row.headPic;
    		if (row.headPic == null||row.headPic=="") 
    			var headPic = "people.png";
            return '<img id="headimg" style="vertical-align:middle;" src="/farm/images/head/' + headPic + '" height="30px"> '+row.easyName+' | 经验 : '+row.experience+' | 金币 : '+row.money+' | 积分 : '+row.points;
    	}
    });
    function userup(){
    	var id=$("#userChose").combobox("getValue");
    	var result=$.ajax({
			url : "<%=basePath%>user/updatamenu",
			type : "post",
			async : false,
			data : {id:id}
		});
    	console.log(result);
    	var text = result.responseText;
		var json = JSON.parse(text);
		$.messager.show({
            title: "结果",
            msg: json.msg
        });
		initWebSocket();
    }
    
  
</script>
</body>
</html>