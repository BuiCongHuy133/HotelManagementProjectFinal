<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../head.jsp"/>
<jsp:include page="../header.jsp"/>
<!-- banner -->
<div class="banner">
    <img src="${pageContext.request.contextPath}/resources/images/banner/banner3.jpg" class="img-responsive" alt="slide">
    <div class="welcome-message">
        <div class="wrap-info">
            <div class="information">
                <h1  class="animated fadeInDown">Services</h1>
                <p class="animated fadeInUp"></p>
            </div>
            <a href="#information" class="arrow-nav scroll wowload fadeInDownBig"><i class="fa fa-angle-down"></i></a>
        </div>
    </div>
</div>
<!-- banner-->
<div class="container">

    <h1 style="text-align: center ;font-weight: bold;color:#005cbf; font-size: 50px; margin-top: 80px;margin-bottom: 50px";>Services</h1>

    <div class="row">

    <c:forEach var="s" items="${services}">
        <div class="col-sm-4 wowload fadeInUp">
            <a href="${pageContext.request.contextPath}/resources/images/services/${s.img}.jpg" title="${s.name}" class="gallery-image" data-gallery>
            <img src="${pageContext.request.contextPath}/resources/images/services/${s.img}.jpg" class="img-responsive"></a>
            <h2 class="h2-services">${s.name}</h2>
            <p class="p">${s.description}</p>
        </div>
    </c:forEach>
    </div>

</div>
<jsp:include page="../footer.jsp"/>
<jsp:include page="../foot.jsp"/>