<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<html>
<head>
    <title>ע�����û�</title>
</head>
<body>
<%
    String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String dbURL = "jdbc:sqlserver://localhost:1433;DatabaseName=music";//jxsk�����ݿ���
	String userName="SQL_User";//�û���
	String userPwd="123456";//����
	Connection dbConn = null;
	
    Class.forName(driverName);
	System.out.println("���������ɹ�");
	dbConn = DriverManager.getConnection(dbURL,userName,userPwd);
	System.out.println("�޸��������ݿ����ӳɹ�");
	
   
    
    String password1=request.getParameter("old_password");
  	password1 = new String(password1.getBytes("iso8859-1"),"gb2312");
   	String password2=request.getParameter("new_password");
  	password2 = new String(password2.getBytes("iso8859-1"),"gb2312");
   
    
    Statement statement=dbConn.createStatement();
    
    String sql = "select * from dbo.Muser";
    
    ResultSet resultSet=statement.executeQuery(sql);//sql��ѯ
    
	String sql1="update Muser set password = '"+password2+"' where password = '"+password1+"'"; 
	//String sql1="insert into Muser values("+"'"+name+"','123','"+password+"','"+role+"','111','999');";
	
	Statement stmt=dbConn.createStatement();//����һ��Statement����
    stmt.executeUpdate(sql1);//ִ��sql���
    System.out.println("�����޸ĳɹ�");
    
    resultSet.close();
    statement.close();
    dbConn.close();
%>
�����޸ĳɹ�����������http://localhost:8080/Music/index.jsp���ɵ�¼��
</body>
</html>