<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>${title}</title>
  <link href="<c:url value='/css/bootstrap.css' />" rel="stylesheet"/>
  <link href="<c:url value='/css/users.css' />" rel="stylesheet"/>
</head>
<body>
<div class="generic-container">
  <div class="alert alert-warning">
    ${error}
  </div>
	
	<span class="well floatRight">
		<a href="<c:url value='/Users/' />">Список пользователей</a>
	</span>
</div>
</body>

</html>