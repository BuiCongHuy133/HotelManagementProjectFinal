<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,400i,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/paymentSandF.css" >
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" >
</head>
<body>
<div class="card">
    <div style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">
        <i class="fa fa-times special" style="color: red;font-size: 100px;line-height: 200px;margin-left:0px;"></i>
    </div>
    <h1 style="color: red">Failed</h1>
    <h2> Booking No
        <h2 style="color:red">${sessionScope.external_ID}</h2>
        <h2>Your account is incorrect or has insufficient funds<h2>
    </h2>
    <br>
    <div><a href="${pageContext.request.contextPath}/booking/searchBooking?searchKey=${sessionScope.external_ID}">Try again</a></div>
</div>
</body>
</html>