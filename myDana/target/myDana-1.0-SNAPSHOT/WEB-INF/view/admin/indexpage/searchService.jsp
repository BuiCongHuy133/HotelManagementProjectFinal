<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../head.jsp"/>
<jsp:include page="../header.jsp"/>
<body>

<div class="col py-3">
    <div>
        <form:form action="searchService" method="get">
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
    <c:if test="${not empty serviceList}">

        <table class="table table-striped">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Description</th>
                <th>Image</th>
                <th></th>
            </tr>
            <c:forEach var="service" items="${serviceList}" varStatus="index">
                <tr>
                    <td>${service.id}</td>
                    <td>
                        <a href="requestUpdateService?id=${service.id}">${service.name}</a>
                    </td>
                    <td>${service.price}$</td>
                    <td>${service.description}</td>
                    <td>${service.img}</td>
                    <td>
                        <a class="btn btn-danger" href="deleteService?id=${service.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </c:if>
</div>

<jsp:include page="../footer.jsp"/>