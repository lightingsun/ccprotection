<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<title>Signing</title>
<script type="text/javascript">
  $(document).ready(function() {

  });
</script>
</head>
<body>
  <table>
    <tr>
      <td colspan="2"><strong>You finished sign your content.</strong></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><a href="${signForm.refererUrl}">${signForm.refererUrl}</a></td>
    </tr>
  </table>
</body>
</html>