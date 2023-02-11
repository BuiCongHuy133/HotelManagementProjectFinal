<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../head.jsp"/>
<jsp:include page="../header.jsp"/>
<!-- banner -->
<div class="banner">
    <img src="${pageContext.request.contextPath}/resources/images/banner/banner1.jpg" class="img-responsive"
         alt="slide">
    <div class="welcome-message">
        <div class="wrap-info">
            <div class="information">
                <h1 class="animated fadeInDown">Meeting and Event</h1>
                <p class="animated fadeInUp"></p>
            </div>
            <a href="#information" class="arrow-nav scroll wowload fadeInDownBig"><i class="fa fa-angle-down"></i></a>
        </div>
    </div>
</div>
<!-- banner-->
<body>

<div class="container">
    <div class="h1">
        <h1 class="h2-services"
            style="text-align: center ;font-weight: bold;color:#005cbf; font-size: 20px; margin-top: 80px;">AN IDEAL
            VENUE FOR CONFERENCE AND INCENTIVE PLANNERS</h1>
    </div>
    <p style="text-align: center">A well-appointed International Convention Palace with ballrooms can accommodate up to
        1,000 people in style, with another ten function rooms for 50 to 300 people each. A variety of cultural-themed
        parties on the beach or around the lagoon, in the ballrooms or outside the resort, with the surprising arrivals
        of VIPs from Helicopter landing on the resort’s own Helipad, plus exciting team building activities and water
        sports, two 18-hole golf courses nearby, as well as health and beauty service make the Furama Danang the ideal
        venue for MICE groups for conference and incentive planners.
    </p>

    <c:forEach var="n" items="${news}">
        <div class="col-sm-6 wowload fadeInUp">
            <div class="rooms">
                <img src="${pageContext.request.contextPath}/resources/images/news/${n.img}.jpg"
                     class="img-responsive-rooms">
                <div class="info">
                    <h3>${n.title}</h3>
                    <p> ${n.description}</p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</body>
<jsp:include page="../footer.jsp"/>
<jsp:include page="../foot.jsp"/>
