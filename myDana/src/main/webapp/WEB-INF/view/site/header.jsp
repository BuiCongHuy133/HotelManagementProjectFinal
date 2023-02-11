<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body id="home">
<nav class="navbar  navbar-default" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home/"><img src="${pageContext.request.contextPath}/resources/images/logo.png"  alt="holiday crown"></a>
        </div>

        <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">

            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/home/">Home </a></li>
                <li><a href="${pageContext.request.contextPath}/rooms/" methods="get" >Rooms</a></li>
                <li><a href="${pageContext.request.contextPath}/services/">Services</a></li>
                <li><a href="${pageContext.request.contextPath}/news/">News</a></li>
                <li><a href="${pageContext.request.contextPath}/contact/">Contact</a></li>
                <li><a href="${pageContext.request.contextPath}/information/">About Us</a></li>

                <c:if test="${ empty sessionScope.username}">

                <li><a href="${pageContext.request.contextPath}/login/">Login</a></li>
                </c:if>

                <li><a href="${pageContext.request.contextPath}/booking/searchBookingIn">Search Booking</a></li>


                <c:if test="${ not empty sessionScope.username}">
                    <li><a href="${pageContext.request.contextPath}/booking/userBooking?id=${sessionScope.id}">${sessionScope.username} Booking</a></li>

                    <li>
                        <form class="special-form"  action="${pageContext.request.contextPath}/j_spring_security_logout?${_csrf.parameterName}=${_csrf.token}" method="post" hidden="hidden" name="logoutForm"">
                            <input type="submit" value="Logout" />
                        </form>
                        <a class="a-special" href="javascript:document.logoutForm.submit()">Logout</a>
                    </li>
                </c:if>
            </ul>

        </div><!-- Wnavbar-collapse -->
    </div><!-- container-fluid -->
</nav>