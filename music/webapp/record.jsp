<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/shouye.css"/>
    <title>播放记录</title>
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


<form method="post" id="form2" name="form2" action="">
    
    
    <div class="songtype">
      
      <h1>播放记录</h1>
		<table border="1" cellspacing="0" align="center">
		
      <tr align="center">
          <td colspan="2">名字</td>
          <td colspan="2">歌手</td>
          <td colspan="2">时间</td>
      </tr>
      
      <%
          
		String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String dbURL = "jdbc:sqlserver://localhost:1433;DatabaseName=music";//jxsk是数据库名!!!!!!!!记得更名！！！
		String userName="SQL_User";//用户名
		String userPwd="123456";//密码
		Connection dbConn = null;
	
		Class.forName(driverName);
		System.out.println("加载驱动成功");
		dbConn = DriverManager.getConnection(dbURL,userName,userPwd);
		System.out.println("连接成功");
		
		Statement statement=dbConn.createStatement();
        String sql="select * from record";//record是biao名!!!!!!!!记得更名！！
          
        ResultSet resultSet=statement.executeQuery(sql);
	      while(resultSet.next()) {
	              String name=resultSet.getString("sname");
	              String sing=resultSet.getString("singer");
	              String ti=resultSet.getString("time");
	               //System.out.println(name + " " + password + " " + role);//查
	      %>
	      <tr align="center">
	          <td colspan="2"><%=name%></td>
	          <td colspan="2"><%=sing%></td>
	          <td colspan="2"><%=ti%></td>
	      </tr>
	      <%
	          }
	      %>
      
  </table>
    </div>
</form>



        
        
        
    
    
    
    
    
    
    
    
    

					
					





</body>
</html>
