<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../head.jsp"/>
<jsp:include page="../header.jsp"/>
<form:form action="searchBooking" method="get">
    <div class="container-user">
        <div class="input-group">
            <input type="text" name="searchKey" class="form-control" placeholder="Enter Your Booking ID to search">
            <span class="input-group-btn">
            <button class="btn btn-default" type="submit">Search</button>
        </span>
        </div>
    </div>
</form:form>
<br>
<c:if test="${msg != null}">
    <h4 style="color: red; margin: auto 15px auto 15px">${msg}</h4>
</c:if>
<section id="cart_items">
    <div class="container">
        <div class="table-responsive cart_info">
            <table class="table table-condensed">
                <thead>
                <tr class="cart_menu">
                    <td class="image">Your Booking ID</td>
                    <td class="image">Reservation Name</td>
                    <td class="image">Your Room Type</td>
                    <td class="price">Total Price</td>
                    <td class="price">Phone Number</td>
                    <td class="price">Guest</td>
                    <td class="total">Date Check In (Expected)</td>
                    <td class="total">Date Check Out (Expected)</td>
                    <td class="total">Payment</td>
                    <td class="total">Cancel Booking</td>
                    <td></td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <c:forEach var="bl" items="${booking.bookingDetailList}">
                        <td class="cart_product">
                            <p><c:out value="${bl.booking.externalID}"/></p>
                        </td>
                        <td class="cart_product">
                            <p><c:out value="${bl.guest.full_name}"/></p>
                        </td>
                        <td class="cart_description">
                            <p><c:out value="${bl.roomCategory.name}"/></p>
                        </td>
                        <td class="cart_price">
                            <p>$<c:out value="${bl.roomCategory.price}"/></p>
                        </td>
                        <td class="cart_price">
                            <p><c:out value="${bl.guest.phone_number}"/></p>
                        </td>
                        <td class="cart_price">
                            <p><c:out value="${bl.guest.numberOfPeople}"/></p>
                        </td>
                        <td class="cart_price">
                            <p>${booking.date_check_in}</p>
                        </td>
                        <td class="cart_price">
                            <p>${booking.date_check_out}</p>
                        </td>
                        <td class="cart_total">
                            <c:if test="${booking.payment_booking == null}">
                                <a href="${pageContext.request.contextPath}/booking/payment?bookingID=${booking.id}&amount=${bl.roomCategory.price}"
                                   class="cart_total_price" style="color:red; font-size: 10px">No Payment (Click to
                                    pay)</a>
                            </c:if>
                            <c:if test="${booking.payment_booking != null}">
                                <a class="cart_total_price" style="color:blue ; font-size: 10px"> Payment Success</a>
                            </c:if>
                        </td>
                        <td class="cart_delete" style="text-align: center">
                            <button type="button" class="cart_quantity_delete" data-toggle="modal" data-target="#exampleModal">
                                <i class="fa fa-times"></i>
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Are you sure?</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Are you sure you want to cancel your reservation? You can only cancel before 24 hours. If you have paid, you will only get 80% of the amount paid
                                                        <br><br> <h3 style="color:red"> Contact : 84-090-3515-451 / 84-976-6232-173 </h3>
                                                       <h3 style="color:red"> Email : buiconghuy133@gmail.com <h2>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/booking/cancelBooking?date_check_in=${booking.date_check_in}&bookingID=${bl.id}">Cancel</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </td>


                    </c:forEach>
                </tr>

                </tbody>
            </table>
        </div>
    </div>
</section>
<!--/#cart_items-->

<jsp:include page="../foot.jsp"/>