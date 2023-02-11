<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../head.jsp"/>
<jsp:include page="../header.jsp"/>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col py-3">
            <form:form modelAttribute="service" action="saveService" method="get" cssStyle="padding: 20px">
                <div class="row mb-3">
                    <label for="inputId" class="col-sm-2 col-form-label">ID</label>
                    <div class="col-sm-10">
                        <form:input readonly="true" type="text" id="inputId" path="id"/>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputName" class="col-sm-2 col-form-label">Name</label>
                    <div class="col-sm-10">
                        <form:input type="text" id="inputName" path="name"/>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputPrice" class="col-sm-2 col-form-label">Price</label>
                    <div class="col-sm-10">
                        <form:input type="text" id="inputPrice" path="price"/>
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="inputImageLink" class="col-sm-2 col-form-label">Image</label>
                    <div class="col-sm-10">
                        <form:input type="text" id="inputImageLink" path="img"/>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="inputDescription" class="col-sm-2 col-form-label">Description</label>
                    <div class="col-sm-10">
                        <form:input type="text" id="inputDescription" path="description"/>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Save</button>
            </form:form>
        </div>
    </div>
</div>
<jsp:include page="../footer.jsp"/>