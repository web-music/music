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
	String dbURL = "jdbc:sqlserver://localhost:1433;DatabaseName=music";//jxsk�����ݿ���
	String userName="SQL_User";//�û���
	String userPwd="123456";//����
	Connection dbConn = null;
	
    Class.forName(driverName);
	System.out.println("���������ɹ�");
	dbConn = DriverManager.getConnection(dbURL,userName,userPwd);//�������ݿ�
	System.out.println("���ӳɹ�");
	
   
    String uname=request.getParameter("name");//��ȡ�������ֵ
    String upassword=request.getParameter("password");
    String urole=request.getParameter("role");
    session.setAttribute("username",uname);
   
   
    Statement statement=dbConn.createStatement();
    
    String sql = "select * from dbo.Muser where username='"+uname+"' ";
    
    ResultSet resultSet=statement.executeQuery(sql);//sql��ѯ
    

      if(resultSet.next())//�ж���Ϣ
      {
        if(upassword.equals(resultSet.getObject("password"))){
            if(urole.equals(resultSet.getObject("role"))){
                out.println("<script language='JavaScript'>alert('��¼�ɹ�')</script>");
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
                out.println("<script language='JavaScript'>alert('�˺Ų����ڣ�����������')</script>");
                response.setHeader("refresh","0;url=login.jsp");
            }
        }
        else{
            out.println("<script language='JavaScript'>alert('�����������������')</script>");
            response.setHeader("refresh","0;url=login.jsp");//����ˢ�µ���������
        }
    }
    else{
        out.println("<script language='JavaScript'>alert('�˺Ų����ڣ�����������')</script>");
        
        response.setHeader("refresh","0;url=index.jsp");
    }
    resultSet.close();
    statement.close();
    dbConn.close();
%>
</body>
</html>