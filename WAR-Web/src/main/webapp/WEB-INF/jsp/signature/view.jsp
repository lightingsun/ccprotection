<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:choose>
  <c:when test="${not empty signature}">
    document.write('<div style="font-family:Arial,Helvetica,sans-serif;font-size:11px;width:500px;border-width:1px;border-color:#ccc;border-style:solid;border-radius:5px;">');
    document.write('<table>');
    document.write('<tr><td rowspan="2">');
    document.write('<a href="http://localhost:8080/WAR-Web/main/sign/${signature.endUser.username}">');
    document.write('<img src="http://localhost:8080/WAR-Web/images/verified.png" border="0" style="vertical-align:text-top" title="click to check for validity or request license from owner"/>');
    document.write('</a>');
    document.write('</td></tr>');
    document.write('<tr><td>');
    <c:if test="${signature.licenseType eq 'CopyRight'}">
      document.write('This content is copyrighted by <strong>${signature.endUser.displayName}.</strong><br>');
      document.write('&copy; <fmt:formatDate pattern="yyyy-MM-dd" value="${signature.signedDate}"/> All right reserved.');
    </c:if>
    <c:if test="${signature.licenseType eq 'CcNc'}">
      document.write('This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/3.0/">Creative Commons Attribution-NonCommercial 3.0 Unported License</a>.');
    </c:if>
    document.write('<br>');
    document.write('<img src="http://localhost:8080/WAR-Web/main/signature/${signature.endUser.username}/image" height="50px" width="350px"/>');
    document.write('</td></tr>');
    document.write('<tr><td colspan="2">Global verify by <a href="https://piecess.com">piecess.com</a></td></tr>');
    document.write('</table>');
    document.write('</div>');    
  </c:when>
  <c:otherwise>
  	document.write('<div style="font-family:Arial,Helvetica,sans-serif;font-size:11px;width:500px;border-width:1px;border-color:#ccc;border-style:solid;border-radius:5px;">');
    document.write('<table>');
    document.write('<tr><td rowspan="2">');
    document.write('<a href="http://localhost:8080/WAR-Web/main/sign/${signature.endUser.username}">');
    document.write('<img src="http://localhost:8080/WAR-Web/images/unverified.png" border="0" style="vertical-align:text-top" title="click to check for validity or request license from owner"/>');
    document.write('</a>');
    document.write('</td></tr>');
    document.write('<tr><td>');
    document.write('Content in this page is not belong to <i>${username}</i>.<br>');
    document.write('If you are <i>${username}</i> and you are the owner, please <a href="http://localhost:8080/WAR-Web/main/sign/${username}">click here</a>');
    document.write('</td></tr>');
    document.write('</table>');
    document.write('</div>');
  </c:otherwise>
</c:choose>