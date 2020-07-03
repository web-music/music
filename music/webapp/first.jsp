<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8" %>
<html>
  <head>
    <title>登录界面</title>
  </head>
  <body>
    <form method="post" id="form1" name="form1" onsubmit="return check()" action="check.jsp">
      <script language="JavaScript">
        function check() {
          if(document.form1.name.value==""){
            alert("账号不能为空");
          }
          else if(document.form1.password.value==""){
            alert("密码不能为空");
          }
        }
      </script>
      <table border="0" cellspacing="0" align="center">
        <tr>
          <td>选择身份</td>
          <td>
            <input name="role" type="radio" value="browser" checked="checked">浏览者
            <input name="role" type="radio" value="operator">操作员
            <input name="role" type="radio" value="administrator">管理员
          </td>
        </tr>
        <tr>
          <td>账号</td>
          <td><input name="name" type="text" size="20"></td>
        </tr>
        <tr>
          <td>密码</td>
          <td><input name="password" type="password" size="20"></td>
        </tr>
        <tr>
          <td colspan="2" align="center">
            <input name="submit" type="submit" value="登录">
            <input name="reset" type="reset" value="重置">
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
