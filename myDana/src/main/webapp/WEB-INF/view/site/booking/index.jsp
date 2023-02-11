<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../head.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/booking.css">
<body>
<div class="container">
    <form:form modelAttribute="bookingRegistration" action="saveBooking" method="post" onclick="">
        <!-- General -->
        <div class="form-group">
            <h2 class="heading">Booking & contact</h2>
            <form:input type="hidden" path="userID" value="${sessionScope.id}"/>
            <div class="controls">
                <form:input type="text" path="guest.full_name" id="name" class="floatLabel"
                            value="${sessionScope.username}" required="required"/>
                <label for="name"> Name</label>
            </div>
            <div class="controls">
                <form:input type="text" id="email" class="floatLabel" path="guest.email" value="${sessionScope.email}"
                            required="required"/>
                <label for="email">Email</label>
            </div>
            <div class="controls">
                <form:input type="tel" id="phone" class="floatLabel" path="guest.phone_number"
                            value="${sessionScope.phone_number}" required="required"/>
                <label for="phone">Phone</label>
            </div>
            <div class="controls">
                <form:input type="text" id="address" class="floatLabel" path="guest.address" required="required"/>
                <label for="address"> Address </label>
            </div>
            <div class="controls">
                <form:input type="text" id="address2" class="floatLabel" path="guest.address2"/>
                <label for="address2"> Address 2 (Extra,Optional)</label>
            </div>
            <div class="controls">
                <form:input type="number" id="postcode" class="floatLabel" path="guest.postcode"/>
                <label for="postcode"> Post Code (Optional)</label>
            </div>
            <div class="grid">
                <div class="col-1-3 col-1-3-sm">
                    <label for="fruit"><i class="fa fa-male"></i>&nbsp;&nbsp;People</label>
                    <div class="controls">
                        <i class="fa fa-sort"></i>
                        <form:select path="guest.numberOfPeople" class="floatLabel">
                            <form:option value="0"
                                         selected="selected">------------------------Select----------------------</form:option>
                            <form:option value="1">1</form:option>
                            <form:option value="2">2</form:option>
                            <c:if test="${roomCate.numberOfpp >2}">
                                <form:option value="3">3</form:option>
                            </c:if>
                            <c:if test="${roomCate.numberOfpp >3}">
                                <form:option value="4">4</form:option>
                            </c:if>
                            <c:if test="${roomCate.numberOfpp >5}">
                                <form:option value="5">5</form:option>
                                <form:option value="6">6</form:option>
                            </c:if>
                        </form:select>
                    </div>
                </div>
            </div>
        </div>
        <!-- Details -->
        <div class="form-group">
            <h2 class="heading">Details</h2>
            <div class="grid">
                <div class="col-1-4 col-1-4-sm">
                    <div class="controls">
                        <form:input type="date" id="datePicker" class="floatLabel" path="booking.date_check_in"/>
                        <label for="datePicker" class="label-date"><i class="fa fa-calendar"></i>Arrive</label>
                    </div>
                </div>
                <div class="col-1-4 col-1-4-sm">
                    <div class="controls">
                        <form:input type="date" id="datePicker2" class="floatLabel" path="booking.date_check_out"/>
                        <label for="datePicker2" class="label-date"><i class="fa fa-calendar"></i>Depart</label>
                    </div>
                </div>
            </div>
            <h2 class="heading">Your rooms</h2>
            <div class="grid">
                <div class="controls-booking">
                    <form:input type="hidden" path="bookingDetail.roomCategory.id" value="${roomCate.id}"/>
                    <img class="img-booking"
                         src="${pageContext.request.contextPath}/resources/images/rooms/${roomCate.img}.jpg" alt="">
                    <div class="title" style="text-align: center">
                        <h3 class="h3">
                            <a href="#">${roomCate.name}</a>
                        </h3>
                        <p class="description-booking">${roomCate.description}</p>
                        <h3 class="h3">Total Price : $${roomCate.price}</h3>
                    </div>
                </div>
            </div>
            <div class="grid">
                <p class="info-text" style="font-size: 20px">Please describe your needs e.g. Extra beds, children's
                    cost</p>
                <br>
                <div class="controls">
                    <form:textarea path="guest.extrainformation" class="floatLabel" id="extrainformation"/>
                    <label for="extrainformation">Comments</label>
                </div>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary col-1-4" data-toggle="modal" data-target="#exampleModal">
                    Submit
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Are you sure to booking?</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                Please confirm your information before Submit. We will transfer you to payment page.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <form:button type="submit" value="Submit" class="btn btn-primary">Submit</form:button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.form-group -->
    </form:form>
</div>

<jsp:include page="../foot.jsp"/>
