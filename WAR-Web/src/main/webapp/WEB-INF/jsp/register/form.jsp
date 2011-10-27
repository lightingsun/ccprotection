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
    <h1>Step 1 of 5</h1>
    <form:form modelAttribute="endUserForm" action="${pageContext.request.contextPath}/main/register/confirm">
      <h2>Please enter your information</h2>
      <form:hidden path="refererUrl"/>
      <table>
        <tr>
          <td align="right">Username:</td>
          <td><form:input path="username" /> <form:errors path="username" /></td>
        </tr>
        <tr>
          <td align="right">Password:</td>
          <td><form:password path="password" /> <form:errors path="password" /></td>
        </tr>
        <tr>
          <td align="right">Confirm Password:</td>
          <td><form:password path="confirmPassword" /> <form:errors path="confirmPassword" /></td>
        </tr>
        <tr>
          <td align="right">Email:</td>
          <td><form:input path="email" /> <form:errors path="email" /></td>
        </tr>
        <tr>
          <td align="right">Confirm Email:</td>
          <td><form:input path="confirmEmail" /> <form:errors path="confirmEmail" /></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><input type="submit" value="Next" class="k-button" /></td>
        </tr>
      </table>
      <h2>Please enter your Personal information</h2>
      <table>
        <tr>
          <td align="right">Facebook Account Id:</td>
          <td><form:input path="personalInformation.facebookAccount" /><form:errors path="personalInformation.facebookAccount" /></td>
        </tr>
      </table>
    </form:form>
  </div>
  <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>