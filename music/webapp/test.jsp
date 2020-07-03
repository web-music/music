<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>

<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>

<head>
  <meta charset="utf-8">
   <title>登录界面</title>
  <title>播放器练习</title>
  <link rel="stylesheet" type="text/css" href="css/vdio.css">
  <script type="text/javascript" src="js/vdio2.js"></script>
</head>


 
  
  <style>
   .guard {
	padding:10px;
    line-height:60px; 
	height:60px;
    align-items:center;
    background-color:#242424;
    width:100%;
    margin-left:auto;
    margin-right:auto;
    text-align:center
	}
	
	#body{
	
	background-color:#EEEEEE;
	}
	
	.one1{
	text-decoration: none;
    padding:                    15px;
    color:                      white;
    cursor:                     pointer;//光标形状
    
	}
	
	
	.sousuo{
    margin-left:0px;
    line-height: 60px;
    font-size: 30px;
    cursor:pointer;
    width:30px;
    padding: 2px;
  	
	}
	
	.user{
	text-decoration: none;
    
    color:#EEEEEE;
	}
	
	.songtype{
	text-decoration: none;
	padding:10px;
	
	font-size:18px;
	margin: 0 auto; 
	text-align:center;
	font-weight:blod;
	position：absolute;
	top:30%; 
	left:40%;   
	}
	.input{
	width: 260px;

        border: 1px solid #e2e2e2;

        height: 30px;

        
		border-radius:20px 20px 20px 20px;
      

        background-repeat: no-repeat;

        background-size: 25px;

        background-position:5px center;

       	padding:0 0 0 20px;
	}
	
	#search{
		width: 100px;
		height:28px;
		padding:0 0 0 0px;
		border: 1px solid #5BC5B0;
		border-radius:20px 20px 20px 20px;
		background: transparent;
		color: white;
		margin:5px;
	}
#search2{
		width: 100px;
		height:28px;
		padding:0 0 0 0px;
		border: 1px solid gray;
		border-radius:20px 20px 20px 20px;
		background: transparent;
		color: black;
		margin:5px;
	}

section {
  width: 920px;
  height: 350px;
  margin: auto;
  position: relative;
  top: 3%;
  text-align: center;
  
}

  
  </style>
  
  
  
  
  
  
  
  
  
  
  
  
  
  <body>
  
    <form method="post" id="form1" name="form1" onsubmit="return check()" action="check.jsp">
      
      
      <div class="guard"> 
  		
                       <img class="sousuo" src="images/format.ico">
        
                       <a class="one1" href="index.jsp">首页</a>
                       <a class="one1" href="index.jsp">发现音乐</a>
                       <a class="one1" href="index.jsp">我的音乐</a>
                       <a class="one1" href="index.jsp">推荐</a>
                       <a class="one1" href="index.jsp">排行榜</a>
                       <a class="one1" href="index.jsp">歌单</a>
                       <a class="one1" href="index.jsp">主播电台</a>
                       <a class="one1" href="index.jsp">歌手</a>
                       
                       <input class="input" type="text" placeholder="查找音乐"> 
                       
                       <input id="search" type="button" value="搜索">
                      
                      <a class="user" href="index.jsp">注册/</a>
                      <a class="user" href="login.jsp">登录</a>
                      
        
 	</div>
<body>
<div class="bo">
  <div id="container">
    <div id="player">
      <audio src="songs/g.mp3" controls   id="aud"></audio>
      <div id="buttons">
        <button id="btpre">上一首</button>
        <button id="next">下一首</button>
        <button id="reco">记录</button>
      </div>
      <div id="list">
        <ul>
          <li class="play">那女孩对我说</li>
          <li>月牙湾</li>
		  <li>太阳</li>
			<li>夏天的风</li>
			<li>夏天的风</li>
			<li>夏天的风</li>
			<li>夏天的风</li>
			<li>夏天的风</li>
			<li>夏天的风</li>
			<li>夏天的风</li>
			<li>夏天的风</li>
			<li>夏天的风</li>
			<li>夏天的风</li>
			<li>夏天的风</li>
			<li>夏天的风</li>
        </ul>
      </div>
    </div>
	</div>
 </div>


</body>

</html>

