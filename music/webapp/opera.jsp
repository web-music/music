<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/shouye.css"/>
    <title>����Ա����</title>
</head>
<body>

<div class="guard"> 
  		
                       <img class="sousuo" src="images/format.ico">
        
                       <a class="one1" href="index.jsp">��ҳ</a>
                       <a class="one1" href="index.jsp">��������</a>
                       <a class="one1" href="Mymusic.jsp">�ҵ�����</a>
                       <a class="one1" href="index.jsp">�Ƽ�</a>
                       <a class="one1" href="index.jsp">���а�</a>
                       <a class="one1" href="list.jsp">�赥</a>
                       <a class="one1" href="index.jsp">������̨</a>
                       <a class="one1" href="index.jsp">����</a>
                       
                       <input class="input" type="text" placeholder="��������"> 
                       
                       <input id="search" type="button" value="����">
                      
                      <a class="user" href="newuser.jsp">ע��/</a>
                      <a class="user" href="login.jsp">��¼</a>
                      
        
 	</div>



<form method="post" id="form4" name="form4" action="download.jsp">
<div class="songtype">
      
      <h1>��������
      </h1>
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
        <%--<td colspan="6"><button type="submit" onsubmit="download()">�����ļ�</button></td>--%>
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
            <td>�ϴ��ļ�</td>
            <td><input type="file" name="file"></td>
            <td><input type="submit" value="�ύ">
        </tr>
    </table>
</form>






<form method="post" id="form5" name="form5" action="update.jsp">
    <script language="JavaScript">
        function check3() {
            if(document.form5.old_password.value==""){
                alert("�����������");
                return false;
            }
            else if(document.form5.new_password.value==""){
                alert("������������");
                return false;
            }
            else if(document.form5.old_password.value==document.form5.new_password.value){
                alert("������������벻��һ��");
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
            <td>�˺�</td>
            <td><%=uname%></td>
            <td>������</td>
            <td><input name="old_password" type="password" size="20"></td>
            <td>������</td>
            <td><input name="new_password" type="password" size="20"></td>
        </tr>
        <tr align="center">
            <td colspan="6"><button type="submit" onclick="submit3from('selfinfochange.jsp')">�޸�����</button> </td>
        </tr>
    </table>
</form>
</body>
</html>