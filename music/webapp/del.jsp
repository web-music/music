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
	System.out.println("删除用户数据库连接成功");
	
   
    
    String name=request.getParameter("delname");
  	name = new String(name.getBytes("iso8859-1"),"gb2312");
   	
   
    
    Statement statement=dbConn.createStatement();
    
    String sql = "select * from dbo.Muser";
    
    ResultSet resultSet=statement.executeQuery(sql);//sql查询
    
	String sql1="delete from Muser where username = '"+name+"'"; 
	//String sql1="insert into Muser values("+"'"+name+"','123','"+password+"','"+role+"','111','999');";
	
	Statement stmt=dbConn.createStatement();//创建一个Statement对象
    stmt.executeUpdate(sql1);//执行sql语句
    System.out.println("用户删除成功");
    
    resultSet.close();
    statement.close();
    dbConn.close();
%>
用户删除成功！http://localhost:8080/Music/index.jsp
</body>
</html>