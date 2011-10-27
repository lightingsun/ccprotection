<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<title>View Signature Detail</title>
<script type="text/javascript">

  $(document).ready(function() {
    
  });
</script>
</head>
<body>
  <jsp:include page="../include/header.jsp"></jsp:include>
  <div id="panel" class="k-content" style="width:650px" align="center">
    <div>
      Content in <a href="${signature.refererUrl}">${signature.refererUrl}</a> are belong to ${signature.endUser.username} started from <fmt:formatDate dateStyle="long" value="${signature.signedDate}"/>.
    </div>
    <div>
      <c:choose>
        <c:when test="${signature.licenseType eq 'CopyRight'}">
          This content is copyrighted by <strong>${signature.endUser.displayName}.</strong><br>
          &copy; <fmt:formatDate pattern="yyyy-MM-dd" value="${signature.signedDate}"/> All right reserved.
        </c:when>
        <c:when test="${signature.licenseType eq 'CcNc'}">
          This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/3.0/">Creative Commons Attribution-NonCommercial 3.0 Unported License</a>.
        </c:when>
      </c:choose>
    </div>
    <div>
      If you want to use this content please contact <a href="mailto:${signature.endUser.email}">${signature.endUser.email}</a>
    </div>
  </div>
  <div id="panel" class="k-content" style="width:650px" align="center">
    <strong>More Action for content owner</strong><br>
    <input type="button" value="Re-sign" class="k-button" title="Sign this content again incase of you change the content but the signed date will be change" /><br>
    <input type="button" value="Change License Type" class="k-button" title="Change Licensing for content on this page but you cannot change to Copy Right" /><br>
    <input type="button" value="Show Snapshot" class="k-button" title="Show the snapshot of the content" /><br>
    <input type="button" value="Show that I am the owner" class="k-button" title="Go to enter password page to verify that you are the owner of content" />
  </div>
  <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>