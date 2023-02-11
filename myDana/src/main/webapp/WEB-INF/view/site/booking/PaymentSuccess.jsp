<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,400i,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/paymentSandF.css" >
</head>
<body>
<div class="card">
    <div style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">
        <i class="fa fa-check" style="color: green">✓</i>
    </div>
    <h1>Success</h1>
    <h2> Thanks you for payment Booking No
        <h2 style="color:red">${sessionScope.external_ID}</h2>
        Please go to <a href="${pageContext.request.contextPath}/booking/searchBooking?searchKey=${sessionScope.external_ID}"> here </a> to confirm your booking infomation</h2>
    <br>
    <a href="${pageContext.request.contextPath}/home/">Back to Home</a>
</div>
</body>
</html>