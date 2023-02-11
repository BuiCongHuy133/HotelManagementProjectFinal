<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../head.jsp"/>
<jsp:include page="../header.jsp"/>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col py-3">
            <form:form modelAttribute="booking" action="saveBooking" method="get" cssStyle="padding: 20px">
                <div class="row mb-3">
                    <label for="inputId" class="col-sm-2 col-form-label">ID</label>
                    <div class="col-sm-10">
                        <form:input readonly="true" type="text" id="inputId" path="id"/>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputName" class="col-sm-2 col-form-label">Full Name</label>
                    <div class="col-sm-10">
                        <form:input type="text" id="inputName" path="guest.full_name"/>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <form:input type="text" id="inputEmail" path="guest.email"/>
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="inputPhoneNumber" class="col-sm-2 col-form-label">Phone Number</label>
                    <div class="col-sm-10">
                        <form:input type="text" id="inputPhoneNumber" path="guest.phone_number"/>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputCheckIn" class="col-sm-2 col-form-label">Check-in Day</label>
                    <div class="col-sm-10">
                        <form:input type="date" id="inputCheckIn" path="booking.date_check_in"/>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputCheckOut" class="col-sm-2 col-form-label">Check-out Day</label>
                    <div class="col-sm-10">
                        <form:input type="date" id="inputCheckOut" path="booking.date_check_out"/>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputPayment" class="col-sm-2 col-form-label">Payment</label>
                    <div class="col-sm-10">
                        <form:select class="form-control" id="inputPayment" path="payment.type_payment">
                            <form:option value="0" label="--- Select ---"/>
                            <form:options items="${paymentList}"/>
                        </form:select>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Save</button>
            </form:form>
        </div>
    </div>
</div>
<jsp:include page="../footer.jsp"/>