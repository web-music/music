<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
		

<html>
<head>


<title>我的音乐</title>
<link rel="stylesheet" type="text/css" href="css/audio.css">
<link rel="stylesheet" type="text/css" href="css/vdio.css">
<script type="text/javascript" src="js/vdio2.js"></script>
<script src="script.js" charset="utf-8"></script>


</head>

<style>
.guard {
	padding: 10px;
	line-height: 60px;
	height: 60px;
	align-items: center;
	background-color: #242424;
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	text-align: center
}

#body {
	background-color: #EEEEEE;
}

.one1 {
	text-decoration: none;
	padding: 15px;
	color: white;
	cursor: pointer;
	//
	光标形状
}

.sousuo {
	margin-left: 0px;
	line-height: 60px;
	font-size: 30px;
	cursor: pointer;
	width: 30px;
	padding: 2px;
}

.user {
	text-decoration: none;
	color: #EEEEEE;
}

.songtype {
	text-decoration: none;
	padding: 10px;
	margin: 15px;
	font-size: 18px;
	margin: 0 auto;
	text-align: center;
	font-weight: blod;
}

.input {
	width: 260px;
	border: 1px solid #e2e2e2;
	height: 30px;
	border-radius: 20px 20px 20px 20px;
	background-repeat: no-repeat;
	background-size: 25px;
	background-position: 5px center;
	padding: 0 0 0 20px;
}

#search {
	width: 100px;
	height: 28px;
	padding: 0 0 0 0px;
	border: 1px solid #5BC5B0;;
	border-radius: 20px 20px 20px 20px;
	background: transparent;
	color: white;
}

#youbian1 { /*我的音乐页面右边第一个标签*/
	display: none;
	width:900px;
}

#youbian2 {
	display: none;
	width:900px;
	height:600px;
	padding:15px;
	position:absolute;
	top:12%;
	left:17%;
}
.song{
	padding:8px;
	margin:auto;
	text-align:center;
	

}
section {
	width: 920px;
	height: 350px;
	margin: auto;
	position: relative;
	top: 3%;
	text-align: center;
}

p {
	text-align: center;
	font-size: 25px;
	color: cadetblue;
	font-family: fantasy;
}
.table{
	margin: auto;
	width:800px;
	padding:15px;
	height:600px;
}

.td{
	padding:10px;
	text-align:center;
	margin:auto;
	width:150px;
	height:80px;
}

.list{
	position:absolute;
	left:13%;
	top:15%;
}
</style>

<body >




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


	<div style="position:absolute;top:100px;left:15px;width:13%;height:600px;">
		<div>
			<div id="zuobian1" style="position:absolute;left:100px;top:200px">
				<a id="wodeyinyue" onClick="yinyue()"><h3>我的音乐</h3></a>
			</div>
			<div id="zuobian2" style="position:absolute;left:100px;top:230px">
				<a id="gedan" onClick="gedan()"><h3>播放历史</h3></a>
			</div>
		</div>
	</div>


	<div style="position:absolute;top:100px;left:20%;;height:600px;">
		
			<div id="youbian1" style="text-align:center;">
			<div class="table">
				<h1>我的音乐</h1>
				<h3>歌曲列表</h3>
			<table class="list" cellspacing="0" align="center">
      	 	 	<tr align="center">
      	 	 	
      	 	 	


            	<td class="td">歌名</td>
            	<td class="td">歌手</td>
            	<td class="td">时长</td>
            	
            	
          		 
       			</tr>
        
        

        
				
<% String driverName2 = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String dbURL2 = "jdbc:sqlserver://localhost:1433;DatabaseName=music";//jxsk是数据库名
	String userName2="SQL_User";//用户名
	String userPwd2="123456";//密码
	Connection dbConn2 = null;
	Class.forName(driverName2);
	System.out.println("加载驱动成功");
	dbConn2 = DriverManager.getConnection(dbURL2,userName2,userPwd2);//连接数据库
	System.out.println("连接成功");
    Statement statement2=dbConn2.createStatement();
    String sql2 = "select * from dbo.songs ";//查询歌曲信息表的内容
    
    ResultSet resultSet2=statement2.executeQuery(sql2);//sql查询
	while(resultSet2.next()){
		String sname=resultSet2.getString("sname");
		String singer=resultSet2.getString("singer");
             
        String time=resultSet2.getString("time");
		String address=resultSet2.getString("address");
%>

		 <tr align="center">
            <td class="td"><%=sname%></td>
            <td class="td"><%=singer%></td>
            <td class="td"><%=time%></td>
            
   			
        </tr>
<% 	}
	resultSet2.close();
    statement2.close();
    dbConn2.close();
%>
	</table>
</div>	
   
      
		</div>
    </div>   
		
				
	</div>



		<div id="youbian2" style="text-align:center;">
		<div class="song">
		<h1>播放历史</h1>
		<table class="list" cellspacing="0" align="center">
      	 	 	<tr align="center">
      	 	 	
      	 	 	


            	<td class="td">歌名</td>
            	<td class="td">歌手</td>
            	<td class="td">时长</td>
            	<td class="td">地址</td>
            	
          		 
       			</tr>
        
        

        
				
<% String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String dbURL = "jdbc:sqlserver://localhost:1433;DatabaseName=music";//jxsk是数据库名
	String userName="SQL_User";//用户名
	String userPwd="123456";//密码
	Connection dbConn = null;
	Class.forName(driverName);
	System.out.println("加载驱动成功");
	dbConn = DriverManager.getConnection(dbURL,userName,userPwd);//连接数据库
	System.out.println("连接成功");
    Statement statement=dbConn.createStatement();
    String sql = "select * from dbo.songs ";//查询歌曲信息表的内容
    
    ResultSet resultSet=statement.executeQuery(sql);//sql查询
	while(resultSet.next()){
		String sname=resultSet.getString("sname");
		String singer=resultSet.getString("singer");
             
        String time=resultSet.getString("time");
		String address=resultSet.getString("address");
%>

		 <tr align="center">
            <td class="td"><%=sname%></td>
            <td class="td"><%=singer%></td>
            <td class="td"><%=time%></td>
            <td class="td"><%=address%></td>
   			
        </tr>
<% 	}
	resultSet.close();
    statement.close();
    dbConn.close();
%>
	</table>
</div>	


			</div>



		
	




	
	
	
	
	
	 

	 
	 
	 
	 
	 
	 
	 
	 
	 

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<script type="text/javascript">	
			
			window.onload = function(){
				document.getElementById("wodeyinyue").onclick = function(){//切换标签
					document.getElementById("youbian2").style.display = "none";
					document.getElementById("youbian1").style.display = "block";
				}
				document.getElementById("gedan").onclick = function(){
					document.getElementById("youbian1").style.display = "none";
					document.getElementById("youbian2").style.display = "block";
				}
			 }
	 	
	</script>
	
	
	
	
	
	
	
	<script src="/demos/googlegg.js"></script>
				<div class="audio-box">
					<div class="audio-container">
						<div class="audio-view">
							<div class="audio-cover" ></div>
							<div class="audio-body">
								<h3 class="audio-title">未知歌曲</h3>
								<div class="audio-backs">
									<div class="audio-this-time">00:00</div>
									<div class="audio-count-time">00:00</div>
									<div class="audio-setbacks">
										<i class="audio-this-setbacks">
											<span class="audio-backs-btn"></span>
										</i>
										<span class="audio-cache-setbacks">
										</span>
									</div>
								</div>
							</div>
							<div class="audio-btn">
								<div class="audio-select">
									<div class="audio-prev"></div>
									<div class="audio-play" ></div>
									
									<div class="audio-next"></div>
									<div class="audio-menu"></div>
									<div class="audio-volume"></div>
								</div>
								<div class="audio-set-volume">
									<div class="volume-box">
										<i><span></span></i>
									</div>
								</div>
								<div class="audio-list">
									<div class="audio-list-head">
										<p>歌单</p>
										<span class="menu-close">关闭</span>
									</div>
									<ul class="audio-inline">
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
</body>























<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/audio.js"></script>
<script type="text/javascript">
			$(function(){
			
				var song = [
					{
						'cover' : 'https://p1.music.126.net/h_1u3v9vTCRWN_ZJlVdQkQ==/18523472395121303.jpg?param=120y120',
						'src' : 'http://link.hhtjim.com/163/490595927.mp3',
						'title' : '不用去猜——Jony J'
					},
					{
						'cover' : 'https://p2.music.126.net/IYCE_y6PqPh5IuD11-pOAA==/109951163948155766.jpg?param=120y120',
						'src' : 'http://link.hhtjim.com/163/1355896807.mp3',
						'title' : '风的颜色——NINEONE#'
					},
					{
						'cover' : 'https://p1.music.126.net/rFUKVdOjqxgwAT6Zi6qv7A==/109951164906689206.jpg?param=120y120',
						'src' : 'http://link.hhtjim.com/163/1436709403.mp3',
						'title' : '夏天的风'
					},
					{
						'cover' : 'https://p2.music.126.net/OWnuOmJ7v-h5PMT5BsPGLQ==/18891808788668489.jpg?param=120y120',
						'src' : 'http://link.hhtjim.com/163/479422898.mp3',
						'title' : '鱼仔——卢广仲'
					},
					{
						'cover' : 'https://p1.music.126.net/wSMfGvFzOAYRU_yVIfquAA==/2946691248081599.jpg?param=120y120',
						'src' : 'http://link.hhtjim.com/163/441491828.mp3',
						'title' : '水星记——郭项'
					}
				];
			
				var audioFn = audioPlay({
					song : song,
					autoPlay : true  //是否立即播放第一首，autoPlay为true且song为空，会alert文本提示并退出
				});
			
				/* 向歌单中添加新曲目，第二个参数true为新增后立即播放该曲目，false则不播放 */
				audioFn.newSong({
					'cover' : 'images/cover5.jpg',
					'src' : 'songs/f.mp3',
					'title' : 'B.A.A.B'
				},false);
			
				/* 暂停播放 */
				audioFn.stopAudio();
			
				/* 开启播放 */
				audioFn.playAudio();
			
				/* 选择歌单中索引为3的曲目(索引是从0开始的)，第二个参数true立即播放该曲目，false则不播放 */
				audioFn.selectMenu(3,true);
			
				/* 查看歌单中的曲目 */
				console.log(audioFn.song);
			
				/* 当前播放曲目的对象 */
				console.log(audioFn.audio);
			});
			

</script>



			
			
		

</html>
