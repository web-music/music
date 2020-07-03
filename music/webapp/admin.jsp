<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/shouye.css"/>
    <title>管理员界面</title>
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


<form method="post" id="form2" name="form2" action="add.jsp">
    <script language="JavaScript">
        function check() {
            if(document.form2.admin_name.value==""){
                alert("账号不能为空");
                return false;
            }
            else return true;
        }
    </script>
     
    
    <div class="songtype">
      
      <h1>用户管理</h1>
		<table border="1" cellspacing="0" align="center">
      <tr align="center">
          <td colspan="2">角色</td>
          <td colspan="2">账号</td>
          <td colspan="2">密码</td>
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
        String sql="select * from Muser";
          
        ResultSet resultSet=statement.executeQuery(sql);
        while(resultSet.next()) {
              String name=resultSet.getString("username");
              String password=resultSet.getString("password");
              String role=resultSet.getString("role");
               System.out.println(name + " " + password + " " + role);//查
      %>
      <tr align="center">
          <td colspan="2"><%=role%></td>
          <td colspan="2"><%=name%></td>
          <td colspan="2"><%=password%></td>
      </tr>
      <%
          }
      %>
      <tr align="center">
          <td>请选择角色</td>
          <td>
              <select name="admin_role" size="1">
                  <option value="administrator">administrator</option>
                  <option value="operator">operator</option>
                  <option value="browser">browser</option>
              </select>
          </td>
          <td>账号</td>
          <td><input name="admin_name" type="text" size="20"></td>
          <td>密码</td>
          <td><input name="admin_password" type="password" size="20"></td>
      </tr>
      <tr align="center">
          <script language="JavaScript">
              function submitfrom(path){
                  if(check()){
                      $('form2').action=path;
                      $('form2').submit();
                  }
              }
          </script>
          <td colspan="2"><button type="submit" onclick="submitfrom('add.jsp')">添加用户</button> </td>
           <!--注释：这两行效果一样
          <td colspan="2"><button type="submit" onclick="submitfrom('update.jsp')">修改用户</button> </td>
          <td colspan="2"><button type="submit" onclick="submitfrom('del.jsp')">删除用户</button> </td>
      	-->
      </tr>
  </table>
    </div>
</form>



    <form method="post" id="form3" name="form3" action="update.jsp">
        <script language="JavaScript">
            function check2() {
                if(document.form3.old_password.value==""){
                    alert("请输入旧密码");
                    return false;
                }
                else if(document.form3.new_password.value==""){
                    alert("请输入新密码");
                    return false;
                }
                else if(document.form3.old_password.value==document.form3.new_password.value){
                    alert("两次输入的密码不能一样");
                    return false;
                }
                else return true;
            }
        </script>
        
        
        
        
    <table border="1" cellspacing="0" align="center">
        <tr align="center">
            <script language="JavaScript">
                function submit2from(path){
                    if(check2()){
                        $('form3').action=path;
                        $('form3').submit();
                    }
                }
            </script>
            <%
                String uname=session.getAttribute("username").toString();
            %>
            <td>账号</td>
            <td><%=uname%></td>
            <td>旧密码</td>
            <td><input name="old_password" type="password" size="20"></td>
            <td>新密码</td>
            <td><input name="new_password" type="password" size="20"></td>
        </tr>
        <tr align="center">
            <td colspan="6"><button type="submit" onclick="submit2from('selfinfochange.jsp')">修改密码</button> </td>
        </tr>
    </table>
    
    
    
    
    
    
    
    
    
</form>

					<form method="post" id="form4" name="form4" action="del.jsp" align="center">
					<tr align="center">
						<input name="delname"size="20">
						<button type="submit">删除用户</button>
					</tr>
				</form>
					





</body>
</html>
