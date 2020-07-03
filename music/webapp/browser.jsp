<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<html>
<head>
    <title>浏览者界面</title>
</head>
<body>
<form method="post" id="form6" name="form6" action="" onsubmit="return check()">
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
        String sql="select * from songs ";
            ResultSet resultSet=statement.executeQuery(sql);
            while(resultSet.next()) {
                String ID=resultSet.getString("sname");
                String creator=resultSet.getString("singer");
                
                String description=resultSet.getString("time");
                String filename=resultSet.getString("address");
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
            <%--<td colspan="6"><button type="submit" onclick="form6.action='download.jsp';form6.submit()">下载文件</button></td>--%>
        <%--</tr>--%>
    </table>
</form>
<form method="post" id="form7" name="form7" action="update.jsp">
    <script language="JavaScript">
        function check4() {
            if(document.form7.old_password.value==""){
                alert("请输入旧密码");
                return false;
            }
            else if(document.form7.new_password.value==""){
                alert("请输入新密码");
                return false;
            }
            else if(document.form7.old_password.value==document.form7.new_password.value){
                alert("两次输入的密码不能一样");
                return false;
            }
            else return true;
        }
    </script>
    <table border="1" cellspacing="0" align="center">
        <tr align="center">
            <script language="JavaScript">
                function submit4from(path){
                    if(check4()){
                        $('form7').action=path;
                        $('form7').submit();
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
            <td colspan="6"><button type="submit" onclick="submit4from('selfinfochange.jsp')">修改密码</button> </td>
        </tr>
    </table>
</form>
</body>
</html>