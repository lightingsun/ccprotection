<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<title>Register</title>
<script type="text/javascript">

  $(document).ready(function() {
    
  });
</script>
</head>
<body>
  Welcome <i>${endUserForm.username}</i>, You are new user of www.piecess.com. Please follow the step to register.<br>
  Step 2 of 5.<br>
  Please check your information below and confirm
  <form:form modelAttribute="endUserForm" action="${pageContext.request.contextPath}/main/register/save">
    <table>
      <tr>
        <td>Username</td>
        <td>${endUserForm.username}</td>
      </tr>
      <tr>
        <td>Password</td>
        <td>********************</td>
      </tr>
      <tr>
        <td>Email</td>
        <td>${endUserForm.email}</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><input type="submit" value="Save" /></td>
      </tr>
    </table>
  </form:form>
</body>
</html>