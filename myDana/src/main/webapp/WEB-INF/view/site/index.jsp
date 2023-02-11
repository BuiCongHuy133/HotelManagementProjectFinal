<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="head.jsp"/>
<jsp:include page="header.jsp"/>
<!-- banner -->
<div class="banner">
    <img src="${pageContext.request.contextPath}/resources/images/banner/banner1.jpg" class="img-responsive"
         alt="slide">
    <div class="welcome-message">
        <div class="wrap-info">
            <div class="information">
                <h1 class="animated fadeInDown">MY DANA HOTEL MANAGEMENT</h1>
                <p class="animated fadeInUp">Most luxurious hotel of asia with the royal treatments and excellent
                    customer service.</p>
            </div>
            <a href="#information" class="arrow-nav scroll wowload fadeInDownBig"><i class="fa fa-angle-down"></i></a>
        </div>
    </div>
</div>
<jsp:include page="searchAvaiRoom.jsp"/>

<%-- slide--%>
<div class="container">
    <div class="h1">
        <h1 class="h2-services">ROOMS</h1>
    </div>
    <p style="text-align: center">All 100 rooms & suites have polished timber floors, natural fabrics, comfortable cane
        furniture, plantation style shutters and ceiling fans. Each room also has its own balcony or spacious terrace
        providing complete privacy and with a superb view of the ocean, the tropical garden or the freshwater swimming
        lagoon pool.
    </p>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div id="news-slider" class="owl-carousel">
                <c:forEach var="r" items="${roomCate}">
                    <div class="post-slide">
                        <div class="post-img">
                            <img src="${pageContext.request.contextPath}/resources/images/rooms/${r.img}.jpg" alt="">
                            <a href="${pageContext.request.contextPath}/rooms/room_details?roomCate=${r.id}"
                               class="over-layer"><i class="fa fa-link"></i></a>
                        </div>
                        <div class="post-content">
                            <h3 class="post-title">
                                <a href="${pageContext.request.contextPath}/rooms/room_details?roomCate=${r.id}">${r.name}</a>
                            </h3>
                            <p class="post-description">${r.description}</p>
                            <a href="${pageContext.request.contextPath}/rooms/room_details?roomCate=${r.id}"
                               class="read-more">Know More</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<%-- end slide--%>
<!-- reservation-information -->
<div id="information" class="spacer reserve-info ">
    <div class="container">
        <div class="row">
            <div class="col-sm-7 col-md-8">
                <div class="embed-responsive embed-responsive-16by9 wowload fadeInLeft">
                    <iframe class="embed-responsive-item" src="//player.vimeo.com/video/793815385?h=485930d7bf"
                            width="100%" height="400" frameborder="0" webkitallowfullscreen mozallowfullscreen
                            allowfullscreen></iframe>
                </div>
            </div>
            <div class="col-sm-5 col-md-4">
                <h3>Contact Us</h3>
                <form:form modelAttribute="contact" action="saveContact" method="post" role="form"
                           class="wowload fadeInRight">
                    <div class="form-group">
                        <form:input type="text" path="name" class="form-control" placeholder="Name"/>
                    </div>
                    <div class="form-group">
                        <form:input type="email" path="email" class="form-control" placeholder="Email"/>
                    </div>
                    <div class="form-group">
                        <form:input type="number" path="phone_number" class="form-control" placeholder="Phone"/>
                    </div>
                    <div class="form-group">
                        <form:input type="text" path="address" class="form-control" placeholder="Address(Optional)"/>
                    </div>
                    <div class="form-group">
                        <form:textarea class="form-control" path="description" placeholder="Message" rows="4"></form:textarea>
                    </div>
                    <form:button class="btn btn-default" value="submit">Submit</form:button>
                </form:form>
                <c:if test="${not empty msg}">
                    <h6 style="color: red; margin-top: 20px">${msg}</h6>
                </c:if>
            </div>
        </div>
    </div>
</div>
<!-- reservation-information -->

<jsp:include page="footer.jsp"/>
<jsp:include page="foot.jsp"/>
