<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<title>Register</title>
<script type="text/javascript">

  $(document).ready(function() {
    
  });
</script>
</head>
<body>
  <jsp:include page="../include/header.jsp"></jsp:include>
  Welcome <i>${endUserForm.username}</i>, You are new user of www.piecess.com. Please follow the step to register.<br>
  <div id="panel" class="k-content" style="width:650px">
    <h1>Step 2 of 5</h1>
    <form:form modelAttribute="endUserForm" action="${pageContext.request.contextPath}/main/register/save">
      <h2>Please check your information below and confirm</h2>
      <table>
        <tr>
          <td align="right"><strong>Username:</strong></td>
          <td>${endUserForm.username}</td>
        </tr>
        <tr>
          <td align="right"><strong>Password:</strong></td>
          <td>********************</td>
        </tr>
        <tr>
          <td align="right"><strong>Email:</strong></td>
          <td>${endUserForm.email}</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><input type="submit" value="Save" class="k-button" /></td>
        </tr>
      </table>
    </form:form>
  </div>
  <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>