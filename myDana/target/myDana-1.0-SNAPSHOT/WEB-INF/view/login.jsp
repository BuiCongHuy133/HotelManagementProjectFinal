<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <title>Login </title>
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
                        <div class="d-flex">
                            <div class="w-100">
                                <h3 class="mb-4">Sign In</h3>
                            </div>

                        </div>

                        <form name='loginForm' action="${pageContext.request.contextPath}/login/checkLogin" method='POST'>
                            <h6 class="form-control-msg" style="color:red" >${msg}</h6>

                            <div class="form-group mt-3">
                                <input id="username" name="username" type="text" class="form-control" required>
                                <label class="form-control-placeholder" >Username</label>
                            </div>
                            <div class="form-group">
                                <input id="password" name="password" type="password" class="form-control" required>
                                <label class="form-control-placeholder" >Password</label>
                                <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-primary rounded submit px-3">Sign In</button>
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <div class="form-group d-md-flex">
                                <div class="w-50 text-left">
                                    <label class="checkbox-wrap checkbox-primary mb-0">Remember Me
                                        <input type="checkbox">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                            </div>
                        </form>
                        <p class="text-center">Not a member? <a href="${pageContext.request.contextPath}/registration/">Sign Up</a></p>
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


