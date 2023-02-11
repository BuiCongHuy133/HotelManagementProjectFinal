<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../head.jsp"/>
<%--    room_detail--%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/room_details.css">
<%-- room_detail_icon--%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/icon_style.css">
<jsp:include page="../header.jsp"/>
<div class="container">
    <div class="title-wrap text-center">
        <h1 style="margin-top: 30px"><c:out value="${roomCate.name}"/></h1>
        <div class="h-decor "></div>
    </div>
    <div class="slider-gallery">
        <ul class="slider-room-gallery-main list-unstyled js-slider-gallery-room-main slick-initialized slick-slider">


            <div aria-live="polite" class="slick-list draggable" tabindex="0">
                <%--                style="margin: auto; border:1px solid black;width:auto;height: 500px;"--%>
            </div>
            <div class="row row-for-single-room">
                <div class="col-lg-8">
                    <div class="slider-gallery">
                        <div class="slider-room-gallery-thumbs list-unstyled js-slider-gallery-room-thumbs slick-initialized slick-slider">
                            <div class="main-slider">
                                <img class="img-feature" alt=""
                                     src="${pageContext.request.contextPath}/resources/images/rooms/${roomCate.img}.jpg ">
                                <div>
                                    <button type="button" data-role="none" class="slick-prev" aria-label="previous"
                                            style="display: block;">Previous<span class="icon-wrap"></span></button>
                                </div>
                                <div>
                                    <button type="button" data-role="none" class="slick-next" aria-label="next"
                                            style="display: block;">Next<span class="icon-wrap"></span></button>
                                </div>
                            </div>
                        </div>
                        <div class="slick-slide-item">
                            <div class="list-image">
                                <div><img class="img-feature" alt=""
                                          src="${pageContext.request.contextPath}/resources/images/rooms/${roomCate.img}.jpg ">
                                </div>
                                <form:forEach var="f" items="${files}">
                                    <div class="active"><img src="${f.url}" alt=""></div>
                                </form:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="info-grid">
                        <div class="row align-items-center">
                            <div class="col-6 col-sm">
                                <div class="info-grid-label">Room size</div>
                                <div class="info-grid-text">85.8 m<sup>2</sup></div>
                            </div>
                            <div class="col-6 col-sm">
                                <div class="info-grid-label">Sleeps</div>
                                <div class="info-grid-text">${roomCate.numberOfpp} Guests</div>
                            </div>
                            <div class="col-6 col-sm">
                                <div class="info-grid-label">Bed types</div>
                                <div class="info-grid-text">One King Bed</div>
                            </div>
                            <div class="col-6 col-sm">
                                <div class="info-grid-label">Price</div>
                                <div class="info-grid-text">$${roomCate.price}</div>
                            </div>
                        </div>
                    </div>
                    <div class="mt-3 mt-md-7"></div>
                    <h2>Room Details</h2>
                    <p><c:out value="${roomCate.description}"/>
                    </p>
                    <p><c:out value="${roomCate.description2}"/></p>
                    <div class="mt-3 mt-md-5"></div>
                    <h2>Room Features</h2>
                    <div class="row">
                        <div class="col-md-4">
                            <ul class="marker-list">
                                <li>Breakfast : <span>FREE</span></li>
                                <li>Safe: <span>YES</span></li>
                                <li>Lift: <span>NO</span></li>
                                <li>TV: <span>YES</span></li>
                                <li>View: <span>Bac My An beach</span></li>
                            </ul>
                        </div>
                        <div class="col-md-8 mt-4 mt-md-0">
                            <div class="d-flex justify-content-between flex-wrap">
                                <div class="icn-text-sm">
                                    <div class="icn-text-circle"><i class="icon-wifi"></i></div>
                                    <div>Free WiFi :
                                        <br><span>YES</span></div>
                                </div>
                                <div class="icn-text-sm">
                                    <div class="icn-text-circle"><i class="icon-hair-dryer"></i></div>
                                    <div>Hair dryer:
                                        <br><span>YES</span></div>
                                </div>
                                <div class="icn-text-sm">
                                    <div class="icn-text-circle"><i class="icon-air-conditioner"></i></div>
                                    <div>Air conditioner:
                                        <br><span>YES</span></div>
                                </div>
                                <div class="icn-text-sm">
                                    <div class="icn-text-circle"><i class="icon-cocktail"></i></div>
                                    <div>Minibar:
                                        <br><span>YES</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mt-5 mt-lg-0">
                    <div class="row">
                        <div class="col-sm col-lg-12">
                            <div class="info-box-color">
                                <ul class="marker-list">
                                    <li>Check in: 02:00 PM</li>
                                    <li>Check out: 11:00 AM</li>
                                    <li>Transfer Service</li>
                                    <li>Facilities for the Disabled</li>
                                    <li>In-Room Dining</li>
                                </ul>
                                <div class="text-center mt-2">
                                    <div class="info-box-price"><span></span></div>
                                    <div class="mt-2">
                                        <a href="${pageContext.request.contextPath}/booking/form?roomCateId=<c:out value='${roomCate.id}'/>"
                                           class="btn btn-primary btn-white btn-block">BOOK NOW</a>
                                    </div>
                                    <p class="p-sm mt-2">Best Choice - Low Price Guarantee</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm col-lg-12 mt-3 mt-sm-0 mt-lg-3">
                            <div class="info-box-grey">
                                <div id="smart_direct_reservations-2" class="widget_smart_direct_reservations">
                                    <ul class="icn-list">
                                        <li><i class="icon-telephone"></i>
                                            84-090-3515-451 / 84-976-6232-173
                                        </li>
                                        <li><i class="icon-closed-envelope"></i>
                                            buiconghuy133@gmail.com
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ul>
    </div>
</div>

<jsp:include page="../footer.jsp"/>
<jsp:include page="../foot.jsp"/>
