<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<title>View Signature Detail</title>
<script type="text/javascript">

  $(document).ready(function() {
    
  });
</script>
</head>
<body>
  Content in <a href="${signature.refererUrl}">${signature.refererUrl}</a> are belong to ${signature.endUser.username}.<br>
  The content is protected by ${signature.licenseType}.<br>
  If you want to use this content please contact <a href="mailto:${signature.endUser.email}">${signature.endUser.email}</a>
</body>
</html>