<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<html>
<head>
    <title>����߽���</title>
</head>
<body>
<form method="post" id="form6" name="form6" action="" onsubmit="return check()">
    <table border="1" cellspacing="0" align="center">
        <tr align="center">
            <td>����</td>
            <td>������</td>
            <td>����ʱ��</td>
            <td>����</td>
            <td>�ļ���</td>
        </tr>
        <%
        String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String dbURL = "jdbc:sqlserver://localhost:1433;DatabaseName=music";//jxsk�����ݿ���!!!!!!!!�ǵø���������
		String userName="SQL_User";//�û���
		String userPwd="123456";//����
		Connection dbConn = null;
	
		Class.forName(driverName);
		System.out.println("���������ɹ�");
		dbConn = DriverManager.getConnection(dbURL,userName,userPwd);
		System.out.println("���ӳɹ�");
		
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
            <%--<td colspan="6"><button type="submit" onclick="form6.action='download.jsp';form6.submit()">�����ļ�</button></td>--%>
        <%--</tr>--%>
    </table>
</form>
<form method="post" id="form7" name="form7" action="update.jsp">
    <script language="JavaScript">
        function check4() {
            if(document.form7.old_password.value==""){
                alert("�����������");
                return false;
            }
            else if(document.form7.new_password.value==""){
                alert("������������");
                return false;
            }
            else if(document.form7.old_password.value==document.form7.new_password.value){
                alert("������������벻��һ��");
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
            <td>�˺�</td>
            <td><%=uname%></td>
            <td>������</td>
            <td><input name="old_password" type="password" size="20"></td>
            <td>������</td>
            <td><input name="new_password" type="password" size="20"></td>
        </tr>
        <tr align="center">
            <td colspan="6"><button type="submit" onclick="submit4from('selfinfochange.jsp')">�޸�����</button> </td>
        </tr>
    </table>
</form>
</body>
</html>