<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<title>Signing</title>
<script type="text/javascript">
  $(document).ready(function() {

  });
</script>
</head>
<body>
  <jsp:include page="../include/header.jsp"></jsp:include>
  <div id="panel" class="k-content" style="width:450px; height:300px">
    <h2>You finished sign your content.</h2>
    <div>You can go back to your content and visit your website <a href="${signForm.refererUrl}">here</a></div>
    <div></div>
  </div>
</body>
</html>