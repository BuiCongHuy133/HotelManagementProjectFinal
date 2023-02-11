<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../head.jsp"/>
<jsp:include page="../header.jsp"/>
<div class="container">

  <h1 class="title" style="text-align: center ;font-weight: bold;color:#005cbf; font-size: 50px; margin-top: 80px;margin-bottom: 50px">Contact</h1>


  <!-- form -->
  <div class="contact">



    <div class="row">

      <div class="col-sm-12">
        <div class="map">
          <iframe src="${destination.google_map}" width="100%" height="300" frameborder="0"></iframe>
        </div>


        <div class="col-sm-6 col-sm-offset-3">
          <div class="spacer">

            <h4>Write to us</h4>
            <form:form modelAttribute="contact" action="saveContact"  role="form">
              <div class="form-group">
                <form:input type="text" path="name" class="form-control" id="name" placeholder="Name"/>
              </div>
              <div class="form-group">
                <form:input type="email" path="email" class="form-control" id="email" placeholder="Enter email"/>
              </div>
              <div class="form-group">
                <form:input type="number" path="phone_number" class="form-control" id="phone" placeholder="Phone"/>
              </div>
              <div class="form-group">
                <form:input type="text" path="address" class="form-control" id="address" placeholder="Address (Optional) "/>
              </div>
              <div class="form-group">
                <form:textarea type="text" path="description" class="form-control"  placeholder="Message" rows="4"/>
              </div>

              <form:button type="submit" value="Submit" class="btn btn-default">Send</form:button>
            </form:form>
          </div>


        </div>





      </div>
    </div>
  </div>
  <!-- form -->

</div>
<jsp:include page="../footer.jsp"/>
<jsp:include page="../foot.jsp"/>