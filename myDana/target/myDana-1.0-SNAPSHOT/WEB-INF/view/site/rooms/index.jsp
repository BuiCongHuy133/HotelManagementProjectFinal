<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../head.jsp"/>
<jsp:include page="../header.jsp"/>
<!-- banner -->
<div class="banner">
    <img src="${pageContext.request.contextPath}/resources/images/banner/banner2.jpg" class="img-responsive"
         alt="slide">
    <div class="welcome-message">
        <div class="wrap-info">
            <div class="information">
                <h1 class="animated fadeInDown">Rooms and Booking</h1>
                <p class="animated fadeInUp"></p>
            </div>
            <a href="#information" class="arrow-nav scroll wowload fadeInDownBig"><i class="fa fa-angle-down"></i></a>
        </div>
    </div>
</div>
<!-- banner-->
<div class="container">

    <h2 style="text-align: center ;font-weight: bold;color:#005cbf; font-size: 50px; margin-top: 50px">Rooms</h2>
    <!-- form -->
    <c:if test="${not empty rooms}">
        <div class="row">
            <c:forEach var="r" items="${rooms}">
                <div class="col-sm-6 wowload fadeInUp">
                    <div class="rooms">
                        <img src="${pageContext.request.contextPath}/resources/images/rooms/${r.img}.jpg"
                             class="img-responsive-rooms">
                        <div class="info">
                            <h3>${r.name}</h3>
                            <p> ${r.description}</p>
                            <c:choose>
                                <c:when test="${r.roomStatus.value == 'Available' && r.quantity > 1}">

                                    <h2 style="color: green"> Room Available : ${r.quantity}</h2>
                                    <a href="${pageContext.request.contextPath}/rooms/room_details?roomCate=${r.id}"
                                       class="btn btn-default">Check Details</a>
                                </c:when>
                                <c:otherwise>
                                    <h2 style="color: red"> Unavailable </h2>
                                    <a href="" class="btn btn-danger">Unvailable</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
    <c:if test="${empty rooms}">
        <h2 style="color:red">${msg}</h2>
    </c:if>
</div>
<jsp:include page="../footer.jsp"/>
<jsp:include page="../foot.jsp"/>