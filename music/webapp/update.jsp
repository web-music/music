<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<html>
<head>
    <title>注册新用户</title>
</head>
<body>
<%
    String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String dbURL = "jdbc:sqlserver://localhost:1433;DatabaseName=music";//jxsk是数据库名
	String userName="SQL_User";//用户名
	String userPwd="123456";//密码
	Connection dbConn = null;
	
    Class.forName(driverName);
	System.out.println("加载驱动成功");
	dbConn = DriverManager.getConnection(dbURL,userName,userPwd);
	System.out.println("修改密码数据库连接成功");
	
   
    
    String password1=request.getParameter("old_password");
  	password1 = new String(password1.getBytes("iso8859-1"),"gb2312");
   	String password2=request.getParameter("new_password");
  	password2 = new String(password2.getBytes("iso8859-1"),"gb2312");
   
    
    Statement statement=dbConn.createStatement();
    
    String sql = "select * from dbo.Muser";
    
    ResultSet resultSet=statement.executeQuery(sql);//sql查询
    
	String sql1="update Muser set password = '"+password2+"' where password = '"+password1+"'"; 
	//String sql1="insert into Muser values("+"'"+name+"','123','"+password+"','"+role+"','111','999');";
	
	Statement stmt=dbConn.createStatement();//创建一个Statement对象
    stmt.executeUpdate(sql1);//执行sql语句
    System.out.println("密码修改成功");
    
    resultSet.close();
    statement.close();
    dbConn.close();
%>
密码修改成功！重新输入http://localhost:8080/Music/index.jsp即可登录！
</body>
</html>