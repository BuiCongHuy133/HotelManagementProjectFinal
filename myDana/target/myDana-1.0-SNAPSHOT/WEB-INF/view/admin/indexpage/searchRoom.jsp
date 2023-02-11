<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../head.jsp"/>
<jsp:include page="../header.jsp"/>
<body>

<div class="col py-3">
    <div>
      <form:form action="searchRoom" method="get">
        <div class="input-group">
          <div class="form-outline">
            <input name="searchKey" id="search-focus" type="search" id="form1" class="form-control" />
          </div>
          <button type="submit" class="btn btn-primary">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </form:form>
    </div>
  <c:if test="${not empty roomList}">

  <table class="table table-striped">
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Price/Day</th>
      <th>Category</th>
      <th>Description</th>
      <th>Status</th>
      <th></th>
    </tr>
    <c:forEach var="rooms" items="${roomList}" varStatus="index">
      <tr>
        <td>${rooms.id}</td>
        <td>
            <a href="requestUpdateRoom?id=${rooms.id}">${rooms.name}</a>
        </td>
        <td>${rooms.price}$</td>
        <td>${rooms.roomCategory.name}</td>
        <td>${rooms.description}</td>
        <td>${rooms.roomStatus.value}</td>
        <td>
          <a class="btn btn-danger" href="deleteRoom?id=${rooms.id}">Delete</a>
        </td>
      </tr>
    </c:forEach>

  </table>
  </c:if>
</div>

<jsp:include page="../footer.jsp"/>