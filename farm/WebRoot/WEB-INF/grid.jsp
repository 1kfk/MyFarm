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
    width:100%;
    height:2000px;
    margin:0;
    }
    .out{
    margin-top: 30px;
    border-top: 3px solid red;
    background-color: green;
    width:100%;
    height:200px;
    }
    .iner{
    width:600px;
    margin-left:25%;
    }
    fl{
    float:left;
    }
    a{
    display: inline-block;
    width:50px;
    height:150px;
    background-color: blue;
    float:left;
    }
    .show{
    width:500px;
    height:150px;
    float:left;
    }
    li{
    width:99px;
    height:150px;
    border-left: 1px solid red;
    float: left;
    display: inline-block;
    }
    </style>   
</head>
<body>
<div class="out">
<div class="iner">
<a></a>
<div class="show">
<div class="turn">
</div>
<ul>
<li></li>
<li></li>
<li></li>
<li></li>
<li></li>
</ul>
</div>
<a></a>
</div>
</div>
<script>

</script>
</body>
</html>