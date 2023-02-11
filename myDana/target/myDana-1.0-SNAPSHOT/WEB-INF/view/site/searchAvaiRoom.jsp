<%--search available room--%>

<div class="container">
    <form action="${pageContext.request.contextPath}/rooms/searchBooking" method="GET" class="form_book">
        <div class="row-book">
            <div class="col-md-3" >
                <label class="date">ARRIVAL DATE</label>
                <input class="book_n book-date" type="date" name="fromDate" id="datePicker" placeholder="ARRIVAL" >
            </div>
            <div class="col-md-3" >
                <label class="date">DEPARTURE DATE</label>
                <input class="book_n book-date" type="date" name="toDate" id="datePicker2" placeholder="DEPARTURE" >
            </div>
            <div class="col-md-3" style="margin-top:7px">
                <label class="date">TYPE OF ROOMS</label>
                <input class="book_n" type="text" maxlength="20" name="view" id="person"
                       placeholder="OCEAN,GARDEN,BEACH" style="text-transform:uppercase">
            </div>
            <div class="col-md-3" style="margin-top:7px">
                <input class="btn btn-success-book" type="submit" value="Book Now">
            </div>
        </div>
    </form>
</div>

