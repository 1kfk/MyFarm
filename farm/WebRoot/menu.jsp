<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单</title>
<style>
        body {
            margin: 0px;           
        }
        .fr{
        float:right;
        }
        .bar{
        	background-image:url(images/lab.png);        	
            background-size:25% 60px;
            background-repeat:repeat-x;            
        }
        .shadow{
        	-moz-box-shadow:2px 2px 5px #333333;
        	-webkit-box-shadow:2px 2px 5px #333333;
        	box-shadow:2px 2px 5px #333333;
        }
        .icon{
        margin:2px 5px 5px 5px;
        width:50px;
        height:50px;
        overflow:hidden;
        display: inline-block;
        border: 2px solid red;
        background-color:#dee9f0;
        border-radius: 10px;
        }
        .lefthead{
        float:left;
        margin-left:50px;
        margin-top:5px;
        width:370px;
        height:50px;
        }
        .headpic{
        float:left;
        width:50px;
        height:50px;
        }
        .headp{
        float:right;
        width:300px;
        height:50px;
        }
        .headp p{
        margin:0;
        padding-left:20px;
        font-weight: bold;
        color:yellow;
        text-shadow:5px 2px 3px black;
        }
        .data{
        background-color: #2385c9;
        color:yellow;
        border:2px solid #2385c9;
        border-radius: 10px;
        box-shadow: 5px 5px 5px black;
        }
    </style>
</head>
<body class="bar">
<c:set var="user" value='<%=session.getAttribute("user")%>'/>
	<div  width="100%">
	<div class="lefthead">
	           <div class="headpic">
	           <img class="shadow" src="images/head/<c:out value='${user.headPic}' default='people.png'/>" height="50px">
	           </div>
	           <div class="headp">
	             <p><c:out value="${user.easyName}" default="未知用户"/></p>
	             <div class="data">
	                          金币：<span><c:out value="${user.money}" default="0"/></span>
	                          经验：<span><c:out value="${user.experience}" default="0"/></span>
	                          积分：<span><c:out value="${user.points}" default="0"/></span>
	             </div>
	           </div>
	</div>
		<a title="种子管理" class="icon fr" href="seedList/seed/grid" target="workspace" onclick="changerow1()"><img class="shadow" src="images/seedManager.png" width="50px"></a>
		<a title="用户管理" class="icon fr" href="user/user/grid" target="workspace" onclick="changerow1()"><img class="shadow" src="images/people.png" width="50px"></a>
		<a title="用户选择" class="icon fr" href="user/choseuser" target="workspace" onclick="changerow1()"><img class="shadow" src="images/datou1.jpg" height="50px"></a>
		<a title="种子仓库"  class="icon fr" href="seedBuy/grid" target="workspace" onclick="changerow2()"><img title="种子仓库" class="shadow" src="images/store.png" width="50px"></a>
		<a title="农田种植" class="icon fr" href="cropsGrow/grid" target="workspace" onclick="changerow1()"><img class="shadow" src="images/tudi.png" width="50px"></a>
	</div>
	<script type="text/javascript">
	var supframe=window.parent.document.getElementById("frameset");

	function changerow1(){
		if(supframe.rows!="60,*,50"){
		supframe.rows="60,*,50";
		}
	}
	function changerow2(){
		console.log(supframe);
		supframe.rows="60,*,0";
		if(supframe.rows!="60,*,0"){
			supframe.rows="60,*,0";
		};
	}
	</script>
</body>
</html>