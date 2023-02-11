
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../head.jsp"/>
<jsp:include page="../header.jsp"/>

<section id="cart_items">
    <div class="container">

        <div class="table-responsive cart_info">
            <table class="table table-condensed">
                <thead>
                <tr class="cart_menu">
                    <td class="image">Booking</td>
                    <td class="image">Your Room Type</td>
                    <td class="price">Total Price</td>
                    <td class="price">Date Check In (Expected)</td>
                    <td class="price">Date Check Out (Expected)</td>
                    <td class="price">Payment</td>
                    <td class="total">Detail</td>
                    <td class="total">Cancel Booking</td>
                    <td></td>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="b" items="${userBooking}" >
                    <c:forEach var="bl" items="${b.bookingDetailList}">
                        <tr>
                            <td class="cart_product">
                                <a href=""><img style="width: 80%" src="${pageContext.request.contextPath}/resources/images/rooms/${bl.roomCategory.img}.jpg"
                                                ></a>
                            </td>
                            <td class="cart_description">
                                <h4><a href="">${bl.roomCategory.name}</a></h4>
                                <p>Booking ID: ${b.externalID}</p>
                            </td>
                            <td class="cart_price">
                                <p>$${bl.roomCategory.price}</p>
                            </td>
                    </c:forEach>
                    <td class="cart_price">
                        <p>${b.date_check_in}</p>
                    </td>
                    <td class="cart_price">
                        <p>${b.date_check_out}</p>
                    </td>

                    <td class="cart_total">
                        <c:if test="${b.payment_booking == null}">
                            <a href="${pageContext.request.contextPath}/booking/payment?bookingID=${b.id}" class="cart_total_price" style="color:red; font-size: 10px">No Payment  (Click to pay)</a>
                        </c:if>
                        <c:if test="${b.payment_booking != null}">
                            <a class="cart_total_price" style="color:blue ; font-size: 10px"> Payment Success</a>
                        </c:if>
                    </td>
                            <td class="cart_total">
                                <h5><a href="${pageContext.request.contextPath}/booking/searchBooking?searchKey=${b.externalID}">More Detail</a></h5>
                            </td>
                            <td class="cart_delete">
                                <a class="cart_quantity_delete" href="${pageContext.request.contextPath}/booking/searchBooking?searchKey=${b.externalID}">Go Here</a>
                            </td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section>
<!--/#cart_items-->

<jsp:include page="../footer.jsp"/>
<jsp:include page="../foot.jsp"/>