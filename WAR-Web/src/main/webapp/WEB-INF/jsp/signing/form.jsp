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
    $("#licenseType").kendoDropDownList();
  });
 
</script>
</head>
<body>
  <jsp:include page="../include/header.jsp"></jsp:include>
  Welcome <i>${signForm.username}</i>, You are about to sign your content from website <a href="${signForm.refererUrl}">${signForm.refererUrl}</a>.
  <div id="panel" class="k-content" style="width:650px">
    <form:form modelAttribute="signForm" action="${pageContext.request.contextPath}/main/sign/verify">
      <h2>Please enter your password and select your license type</h2>
      <table>
        <tr>
          <td align="right">Username:</td>
          <td><form:input path="username" readonly="true" /> <form:errors path="username" />
          </td>
        </tr>
        <tr>
          <td align="right">Password:</td>
          <td><form:password path="password" /> <form:errors path="password" />
          </td>
        </tr>
        <tr>
          <td align="right">Category:</td>
          <td>
            &nbsp;
          </td>
        <tr>
        <tr>
          <td align="right">License Type:</td>
          <td>
            <form:select path="licenseType" cssStyle="width:350px">
              <form:options items="${licenseTypes}" itemLabel="description" />  
            </form:select>
          </td>
        <tr>
          <td>&nbsp;</td>
          <td><input type="submit" value="Sign" class="k-button" />
          </td>
        </tr>
      </table>
    </form:form>
  </div>
  <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>