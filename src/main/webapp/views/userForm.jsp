<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>User Registration Form</title>
  <link href="<c:url value='/css/bootstrap.css' />" rel="stylesheet"/>
  <link href="<c:url value='/css/users.css' />" rel="stylesheet"/>
</head>

<body>

<div class="generic-container">
  <div class="well lead">Добавление нового пользователя</div>
  <form:form method="POST" modelAttribute="user" class="form-horizontal" action="saveUser">
    <form:input type="hidden" path="id" id="id"/>

    <div class="row">
      <div class="form-group col-md-12">
        <label class="col-md-3 control-lable" for="name">Имя</label>
        <div class="col-md-7">
          <form:input type="text" path="name" id="name" class="form-control input-sm"/>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="form-group col-md-12">
        <label class="col-md-3 control-lable" for="age">Возраст</label>
        <div class="col-md-7">
          <form:input type="text" path="age" id="age" class="form-control input-sm" />
        </div>
      </div>
    </div>

    <div class="row">
      <div class="form-group col-md-12">
        <label class="col-md-3 control-lable" for="isAdmin">Администратор</label>
        <div class="col-md-1">
          <label class="col-md-1 control-lable" for="isAdmin">Да</label>
          <form:radiobutton onclick="true" value="true" path="isAdmin" id="isAdmin"  class="form-control input-sm" />
        </div>

        <div class="col-md-1">
          <label class="col-md-1 control-lable" for="isAdmin">Нет</label>
          <form:radiobutton onclick="false" value="false" path="isAdmin" id="isAdmin" class="form-control input-sm" />
        </div>
      </div>
    </div>

    <c:if test="${edit}">
    <div class="row">
      <div class="form-group col-md-12">
        <label class="col-md-3 control-lable" for="createdDate">Дата создания</label>
        <div class="col-md-7">

              <form:input type="text" path="createdDate" id="createdDate" class="form-control input-sm" disabled="true"/>

        </div>
      </div>
    </div>
    </c:if>

    <div class="row">
      <div class="form-actions floatRight">
        <c:choose>
          <c:when test="${edit}">
            <input type="submit" value="Обновить" class="btn btn-primary btn-sm"/>  <a href="<c:url value='/Users/' />" class="btn-danger custom-width">Отменить</a>
          </c:when>
          <c:otherwise>
            <input type="submit" value="Добавить" class="btn btn-primary btn-sm"/>  <a href="<c:url value='/Users/' />" class="btn-danger custom-width">Отменить</a>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </form:form>
</div>
</body>
</html>