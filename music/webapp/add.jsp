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
	String dbURL = "jdbc:sqlserver://localhost:1433;DatabaseName=music";//music�����ݿ���
	String userName="SQL_User";//�û���
	String userPwd="123456";//����
	Connection dbConn = null;
	
    Class.forName(driverName);
	System.out.println("���������ɹ�");
	dbConn = DriverManager.getConnection(dbURL,userName,userPwd);
	System.out.println("����û����ݿ����ӳɹ�");
	
   
    String name=request.getParameter("admin_name");
    name = new String(name.getBytes("iso8859-1"),"gb2312");
    String password=request.getParameter("admin_password");
  	password = new String(password.getBytes("iso8859-1"),"gb2312");
   	String role=request.getParameter("admin_role");
    role = new String(role.getBytes("iso8859-1"),"gb2312");
    
    
    Statement statement=dbConn.createStatement();
    
    String sql = "select * from dbo.Muser";
    
    ResultSet resultSet=statement.executeQuery(sql);//sql��ѯ
    
	//String sql1="insert into Muser values(name,'0',password,'browser','333','555')"; 
	String sql1="insert into Muser values("+"'"+name+"','123','"+password+"','"+role+"','111','999');";
	
	Statement stmt=dbConn.createStatement();//����һ��Statement����
    stmt.executeUpdate(sql1);//ִ��sql���
    System.out.println("���뵽���ݿ�ɹ�");
    
    resultSet.close();
    statement.close();
    dbConn.close();
%>
ע��ɹ�����������http://localhost:8080/Music/index.jsp���ɵ�¼��
</body>
</html>