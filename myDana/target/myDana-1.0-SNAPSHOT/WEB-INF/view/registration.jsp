<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html lang="en">
<head>
    <title>Registration </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login/css/style.css">
</head>
<body>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5">
                <div class="wrap">
                    <div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/login/images/bg-1.jpg);"></div>
                    <div class="login-wrap p-4 p-md-5">
                        <div class="d-flex" style="text-align: center">
                            <div class="w-100" >
                                <h3 class="mb-4">Registration</h3>
                            </div>
                        </div>
                        <form:form modelAttribute="user" action="saveUser" method="post" >
                            <div class="form-group mt-3">
                                <h6 class="form-control-msg" style="color:red" >${msg}</h6>
                                <form:input type="text" path="username" id="inputName" class="form-control" required="required" />
                                <label for="inputName" class="form-control-placeholder" >Username</label>
                            </div>
                            <div class="form-group">
                                <form:input type="password" path="password" id="inputPassword" class="form-control"  required="required" />
                                <label for="inputPassword" class="form-control-placeholder" >Password</label>
                                <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                            </div>
                            <div class="form-group mt-3">
                                <form:input type="number" path="phone_number" id="inputPhone" class="form-control" maxlength="13" required="required" />
                                <label for="inputPhone" class="form-control-placeholder" >Phone Number</label>
                            </div>
                            <div class="form-group mt-3">
                                <form:input type="text" path="address" id="inputAddress" class="form-control" required="required" />
                                <label for="inputAddress" class="form-control-placeholder" >Address</label>
                            </div>
                            <div class="form-group mt-3">
                                <form:input type="email" path="email" id="inputEmail" class="form-control" required="required" />
                                <label for="inputEmail" class="form-control-placeholder" >Email</label>
                            </div>
<%--                            <div class="form-group mt-3">--%>
<%--                                <form:input type="number" path="cardNumber" id="inputCard" class="form-control" required="required" />--%>
<%--                                <label for="inputCard" class="form-control-placeholder" >Credit Card Number</label>--%>
<%--                            </div>--%>
<%--                            <div class="form-group mt-3">--%>
<%--                                <form:input type="text" path="cardName" id="inputCard" class="form-control" required="required" />--%>
<%--                                <label for="inputCard" class="form-control-placeholder" >Name on Card</label>--%>
<%--                            </div>--%>
                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-primary rounded submit px-3">Sign Up</button>
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                        </form>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="${pageContext.request.contextPath}/resources/login/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/login/js/main.js"></script>

</body>
</html>


