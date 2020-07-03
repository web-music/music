<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/shouye.css"/>
    <title>操作员界面</title>
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



<form method="post" id="form4" name="form4" action="download.jsp">
<div class="songtype">
      
      <h1>歌曲操作
      </h1>
    <table border="1" cellspacing="0" align="center">
        <tr align="center">
            <td>名称</td>
            <td>创建者</td>
            <td>创建时间</td>
            <td>描述</td>
            <td>文件名</td>
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
                String ID=resultSet.getString("username");
                String creator=resultSet.getString("unumber");
                
                String description=resultSet.getString("lis_history");
                String filename=resultSet.getString("favorite_song");
        %>
        <tr align="center">
            <td ><%=ID%></td>
            <td ><%=creator%></td>
            
            <td ><%=description%></td>
            <td ><a href="/DM_war_exploded/upload/<%=filename%>" download="<%=filename%>"><%=filename%></a></td>
            <%--<td><input name="download" type="checkbox" value=<%=filename%>></td>--%>
        </tr>
        <%
            }
            statement.close();
            resultSet.close();
            dbConn.close();
        %>
        <%--<tr align="center">--%>
        <%--<td colspan="6"><button type="submit" onsubmit="download()">下载文件</button></td>--%>
        <%--</tr>--%>

        <%--<script language="JavaScript">--%>
        <%--function download() {--%>
        <%--window.location.href("\\web\\upload\\");--%>
        <%--}--%>
        <%--</script>--%>
    </table>
    </div>
</form>
<form id="form8" name="form8" action="upload.jsp" enctype="multipart/form-data" method="post">
    <table border="1" cellspacing="0" align="center">
        <tr align="center">
            <td>上传文件</td>
            <td><input type="file" name="file"></td>
            <td><input type="submit" value="提交">
        </tr>
    </table>
</form>






<form method="post" id="form5" name="form5" action="update.jsp">
    <script language="JavaScript">
        function check3() {
            if(document.form5.old_password.value==""){
                alert("请输入旧密码");
                return false;
            }
            else if(document.form5.new_password.value==""){
                alert("请输入新密码");
                return false;
            }
            else if(document.form5.old_password.value==document.form5.new_password.value){
                alert("两次输入的密码不能一样");
                return false;
            }
            else return true;
        }
    </script>
    <table border="1" cellspacing="0" align="center">
        <tr align="center">
            <script language="JavaScript">
                function submit3from(path){
                    if(check3()){
                        $('form5').action=path;
                        $('form5').submit();
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
            <td colspan="6"><button type="submit" onclick="submit3from('selfinfochange.jsp')">修改密码</button> </td>
        </tr>
    </table>
</form>
</body>
</html>