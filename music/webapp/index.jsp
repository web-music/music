<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
	<link rel="stylesheet" type="text/css" href="css/shouye.css"/>
	<script src="script.js" charset="utf-8"></script>

  </head>
  

  
  <body>
  
  	<div class="guard"> 
  		
                       <img class="sousuo" src="images/format.ico">
        
                       <a class="one1" href="index.jsp">首页</a>
                       <a class="one1" href="index.jsp">发现音乐</a>
                       <a class="one1" href="Mymusic.jsp">我的音乐</a>
                       <a class="one1" href="index.jsp">推荐</a>
                       <a class="one1" href="index.jsp">排行榜</a>
                       <a class="one1" href="list.jsp">歌单</a>
                       <a class="one1" href="index.jsp">主播电台</a>
                       <a class="one1" href="index.jsp">歌手</a>
                       
                       <input class="input" type="text" placeholder="查找音乐"> 
                       
                       <input id="search" type="button" value="搜索">
                      
                      <a class="user" href="newuser.jsp">注册/</a>
                      <a class="user" href="login.jsp">登录</a>
                      
        
 	</div>
 	<section>
 	<div class="songtype">
 	
 	<h1>精彩推荐</h1>
 	<a class = "songtype" href="index.jsp">最近</a>
 	<a  id="neidi"  class="3a" onClick="myneidi()">内地</a>
 	<a  id="gangtai" class="3a" onClick="mygangtai()">港台</a>
 	<a  id="oumei" class="3a" onClick="myoumei()">欧美</a>
 	<a class = "songtype" href="index.jsp">韩国</a>
 	<a class = "songtype" href="index.jsp">日本</a>
 	<a class = "songtype" href="index.jsp">其他</a>
 	
 	
 	</div>
 	
 	
    
	
	<div id="myneidi">
	  <h1>歌曲推送</h1>
	  
	  <div class="imgBox">
            <!-- alt：图片路径失败时替换显示内容 -->
            
            <img class="img-slide img" src="images/zjl1.jpg" alt="img1">
            
            <img class="img-slide img" src="images/zjl2.jpg" alt="img2">
            <img class="img-slide img" src="images/zjl3.jpg" alt="img3">
            <img class="img-slide img" src="images/zjl4.jpg" alt="img4">
            <img class="img-slide img" src="images/zjl5.jpg" alt="img5">
        </div>

	</div>
	
	
	<div id="mygangtai">
	  
	    <h1>以下信息根据您的兴趣推荐</h1>
 	<div class="imgBox2">
            <!-- alt：图片路径失败时替换显示内容 -->
            
            <img class="img-slide2 img" src="images/cyx1.jpg" alt="img1">
            <img class="img-slide2 img" src="images/cyx2.jpg" alt="img2">
            <img class="img-slide2 img" src="images/cyx3.jpg" alt="img3">
            <img class="img-slide2 img" src="images/dzq1.jpg" alt="img4">
            <img class="img-slide2 img" src="images/dzq2.jpg" alt="img5">
       </div>
	  
	  </div>
	 
	<div id="myoumei">
	  
	    <h1>猜你喜欢</h1>
 	<div class="imgBox3">
            <!-- alt：图片路径失败时替换显示内容 -->
            
            <img class="img-slide3 img" src="images/cyx1.jpg" alt="img1">
            <img class="img-slide3 img" src="images/cyx2.jpg" alt="img2">
            <img class="img-slide3 img" src="images/cyx3.jpg" alt="img3">
            <img class="img-slide3 img" src="images/dzq1.jpg" alt="img4">
            <img class="img-slide3 img" src="images/dzq2.jpg" alt="img5">
       </div>
	  
	  </div>
  </section>
  
  
  
  
  
  
  
  
  
  
   <script type="text/javascript">
        // index：索引， len：长度
        var index = 0, len;
        var index2 = 0, len2;
        var index3 = 0, len3;
        // 类似获取一个元素数组
        var imgBox = document.getElementsByClassName("img-slide");
        var imgBox2 = document.getElementsByClassName("img-slide2");
        var imgBox3 = document.getElementsByClassName("img-slide3");
        len = imgBox.length;
        len2 = imgBox2.length;
        len3 = imgBox3.length;
        imgBox[index].style.display = 'block';
        imgBox2[index2].style.display = 'block';
        imgBox3[index3].style.display = 'block';
        // 逻辑控制函数
        function slideShow() {
            index ++;
            // 防止数组溢出
            if(index >= len) index = 0;
            // 遍历每一个元素
            for(var i=0; i<len; i++) {
                imgBox[i].style.display = 'none';
            }
            // 每次只有一张图片显示
            imgBox[index].style.display = 'block';
        }
        
        
        function slideShow2() {
            index2 ++;
            // 防止数组溢出
            if(index2 >= len2) index2 = 0;
            // 遍历每一个元素
            for(var i=0; i<len2; i++) {
                imgBox2[i].style.display = 'none';
            }
            // 每次只有一张图片显示
            imgBox2[index2].style.display = 'block';
        }
        
        function slideShow3() {
            index3 ++;
            // 防止数组溢出
            if(index3 >= len3) index3 = 0;
            // 遍历每一个元素
            for(var i=0; i<len3; i++) {
                imgBox3[i].style.display = 'none';
            }
            // 每次只有一张图片显示
            imgBox3[index3].style.display = 'block';
        }
        // 定时器，间隔3s切换图片
        setInterval(slideShow, 2000);
        setInterval(slideShow2, 2000);
        setInterval(slideShow3, 2000);
    </script>
  

   
    
  </body>
  
  
</html>
