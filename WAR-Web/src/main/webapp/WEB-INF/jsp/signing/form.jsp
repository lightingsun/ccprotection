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
  Welcome
  <i>${endUserForm.username}</i>, You are new user of www.piecess.com. Please follow the step to register.
  <br> Step 1 of 5.
  <br> Please enter your information
  <form:form modelAttribute="signForm" action="${pageContext.request.contextPath}/main/sign/verify">
    <form:hidden path="refererUrl" />
    <table>
      <tr>
        <td>Username:</td>
        <td><form:input path="username" readonly="true" /> <form:errors path="username" />
        </td>
      </tr>
      <tr>
        <td>Password:</td>
        <td><form:password path="password" /> <form:errors path="password" />
        </td>
      </tr>
      <tr>
        <td>Category:</td>
        <td>
          &nbsp;
        </td>
      <tr>
      <tr>
        <td>License Type:</td>
        <td>
          <form:select path="licenseType">
            <form:options items="${licenseTypes}" itemLabel="description" />  
          </form:select>
        </td>
      <tr>
        <td>&nbsp;</td>
        <td><input type="submit" value="Next" />
        </td>
      </tr>
    </table>
  </form:form>
</body>
</html>