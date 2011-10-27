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
		$("#signatureImageFile").kendoUpload({
			multiple : false
		});
	});
</script>
</head>
<body>
  <jsp:include page="../include/header.jsp"></jsp:include>
  Welcome <i>${endUserForm.username}</i>, You are new user of www.piecess.com. Please follow the step to register.<br>
  <div id="panel" class="k-content" style="width:650px">
    <h1>Step 3 of 5</h1>
    <h2>Your user has been created, please create your signature image:</h2>
    <div id="selectNewSignatureImage">
      <h3><a href="#">Import from file</a></h3>
      <div>
        <form:form modelAttribute="endUserForm" action="${pageContext.request.contextPath}/main/register/submitSignature" enctype="multipart/form-data">
          <form:hidden path="username"/>
          File to import: <form:input path="signatureImageFile" type="file"/>
          <input type="submit" value="Next" class="k-button" />
        </form:form>
      </div>
      <h3><a href="#">Select signature location from internet</a></h3>
      <div>
        <form:form modelAttribute="endUserForm" action="${pageContext.request.contextPath}/main/register/submitSignature" enctype="multipart/form-data">
          <form:hidden path="username"/>
          URL: <input type="text" name="signatureUrl" value="http://" style="width:400px"/>
          <input type="submit" value="Next" class="k-button" />
        </form:form>
      </div>
      <h3><a href="#">Create Your own</a></h3>
      <div>
        <form:form modelAttribute="endUserForm" action="${pageContext.request.contextPath}/main/register/submitSignature" enctype="multipart/form-data">
          <form:hidden path="username"/>
          Your name: <input type="text" name="signatureFullname" style="width:200px"/><br>
          Style:
          <select>
            <option>Test 1</option>
            <option>Test 2</option>
          </select>
          <input type="submit" value="Next" class="k-button" disabled="disabled" />
        </form:form>
      </div>
    </div>
  </div>
  <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>