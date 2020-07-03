<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<html>
<head>
    <title></title>
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
	dbConn = DriverManager.getConnection(dbURL,userName,userPwd);//连接数据库
	System.out.println("连接成功");
	
   
    String uname=request.getParameter("name");//获取输入的数值
    String upassword=request.getParameter("password");
    String urole=request.getParameter("role");
    session.setAttribute("username",uname);
   
   
    Statement statement=dbConn.createStatement();
    
    String sql = "select * from dbo.Muser where username='"+uname+"' ";
    
    ResultSet resultSet=statement.executeQuery(sql);//sql查询
    

      if(resultSet.next())//判断信息
      {
        if(upassword.equals(resultSet.getObject("password"))){
            if(urole.equals(resultSet.getObject("role"))){
                out.println("<script language='JavaScript'>alert('登录成功')</script>");
                if(urole.equals("administrator")){
                    response.setHeader("refresh","0;url=admin.jsp");
                }
                else if(urole.equals("operator")){
                    response.setHeader("refresh","0;url=opera.jsp");
                }
                else{
                    response.setHeader("refresh","0;url=browser.jsp");
                }
            }
            else{
                out.println("<script language='JavaScript'>alert('账号不存在，请重新输入')</script>");
                response.setHeader("refresh","0;url=login.jsp");
            }
        }
        else{
            out.println("<script language='JavaScript'>alert('密码错误，请重新输入')</script>");
            response.setHeader("refresh","0;url=login.jsp");//立即刷新到其他界面
        }
    }
    else{
        out.println("<script language='JavaScript'>alert('账号不存在，请重新输入')</script>");
        
        response.setHeader("refresh","0;url=index.jsp");
    }
    resultSet.close();
    statement.close();
    dbConn.close();
%>
</body>
</html>