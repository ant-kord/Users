<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Список пользователей</title>
  <link href="<c:url value='/css/bootstrap.css' />" rel="stylesheet"/>
  <link href="<c:url value='/css/users.css' />" rel="stylesheet"/>
</head>

<body>

<div class="generic-container">

  <form method="post" class="form-horizontal" action="search">
    <div class="row">
      <div class="col-md-4">
      <label class="col-md-4 control-lable" for="searchName">Поиск пользователей по имени</label>
        <input type="text" name="searchName" id="searchName"/>
        <input class="btn btn-success" type="submit" value="Поиск"/>
      </div>
    </div>
  </form>

  <div class="row">
    <div class="col-md-4">
      <label class="col-md-4 control-lable">Выводить по
      <ul class="pagination">
        <c:if test="${pageLimit == 5}">
          <li class="active">
            <a href="<c:url value="/Users/?resultPage=5"/>${pageUrl}">5</a>
          </li>
          <li>
            <a href="<c:url value="/Users/?resultPage=10"/>${pageUrl}">10</a>
          </li>
        </c:if>
        <c:if test="${pageLimit == 10}">
          <li>
            <a href="<c:url value="/Users/?resultPage=5"/>${pageUrl}">5</a>
          </li>
          <li class="active">
            <a href="<c:url value="/Users/?resultPage=10"/>${pageUrl}">10</a>
          </li>
        </c:if>
      </ul>
      </label>
    </div>
    <span class="well floatRight">
		<a href="<c:url value="/Users/" />">Список пользователей</a>
    </span>
   </div>

  <div class="well">
    <a href="createUser">Добавить нового пользователя</a>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading"><span class="lead">Список пользователей</span></div>
    <table class="table table-hover">
      <thead>
      <tr>
        <th>Имя</th>
        <th>Возраст</th>
        <th>Админ</th>
        <th>Дата создания</th>
        <th width="100"></th>
        <th width="100"></th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${listUser}" var="user">
          <td>${user.name}</td>
          <td>${user.age}</td>
          <c:if test="${user.isAdmin == true}">
            <td>Да</td>
          </c:if>
          <c:if test="${user.isAdmin == false}">
            <td>Нет</td>
          </c:if>
          <td>${user.createdDate}</td>
          <td><a href="edit?id=<c:out value='${user.id}'/>" class="btn btn-success custom-width">edit</a></td>
          <td><a href="delete?id=<c:out value='${user.id}'/>" class="btn btn-danger custom-width">delete</a></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>

  <div class="text-center">
    <ul class="pagination">
      <c:forEach begin="${startpage}" end="${endpage}" var="p">
        <c:url var="pageUrl" value="/Users/?page=${p}" />
        <c:if test="${p == currentPage}">
          <li class="active"><a>${p}</a></li>
        </c:if>
        <c:if test="${ p != currentPage}">
          <li><a href="${pageUrl}">${p}</a></li>
        </c:if>
      </c:forEach>
    </ul>
  </div>
</div>
</body>
</html>