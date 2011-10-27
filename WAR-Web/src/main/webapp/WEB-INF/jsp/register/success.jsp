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
  <div id="panel" class="k-content" style="width:650px">
    <h1>Step 5 of 5</h1>
    <h2>Congratulation <i>${endUserForm.username}</i>, you are ready! Please read the instruction below.</h2>
    <table>
      <tr>
        <td colspan="2"><strong>Your information</strong></td>
      </tr>
      <tr>
        <td>Username</td>
        <td>${endUserForm.username}</td>
      </tr>
      <tr>
        <td>Email</td>
        <td>${endUserForm.email}</td>
      </tr>
      <tr>
        <td colspan="2"><strong>Your signature image</strong></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td colspan="2"><img src="http://localhost:8080/WAR-Web/main/signature/${endUserForm.username}/image" /></td>
      </tr>
      <tr>
        <td colspan="2"><strong>Your signature code</strong></td>
      </tr>
      <tr>
        <td colspan="2">
          <textarea rows="2" cols="80" readonly="readonly">${signatureCode}</textarea>
        </td>
      </tr>
      <c:if test="${not empty endUserForm.refererUrl}">
      <tr>
        <td>&nbsp;</td>
        <td><a href="${endUserForm.refererUrl}">Go to website and sign your content</a></td>
      </tr>
      </c:if>
    </table>
  </div>
  <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>