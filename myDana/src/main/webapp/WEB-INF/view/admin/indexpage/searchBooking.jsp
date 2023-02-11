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
    <c:if test="${not empty bookingList}">

        <table class="table table-striped">
            <tr>
                <th>ID</th>
                <th>Customer Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Address</th>
                <th>Room Type</th>
                <th>Status</th>
                <th></th>
            </tr>
            <c:forEach var="b" items="${bookingList}" varStatus="index">
                <tr>
                    <td>${b.id}</td>
                    <td>${b.guest.full_name}</td>
                    <td>${b.guest.email}</td>
                    <td>${b.guest.phone_number}</td>
                    <td>${b.guest.address}</td>
                    <td>${b.room.roomCategory.name}</td>
                    <td>${b.bookingStatus.value}</td>
                    <td>
                        <a class="btn btn-dark" href="requestUpdateBooking?id=${b.id}">Update</a>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </c:if>
</div>

<jsp:include page="../footer.jsp"/>