<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>
<div class="container" style="margin-top:60px">
    <div class="row">
        <div class="col-md-6">
            <h2>Upload a file..</h2>
            <form:form action="${pageContext.request.contextPath}/file/upload?${_csrf.parameterName}=${_csrf.token}"
                       method="POST" enctype="multipart/form-data">

                <div class="input-group">
                    <label>Select file:</label>
                    <input name="file" type="file" class="form-control">
                </div>
                <br>
                <button type="submit" class="btn btn-info"> Upload</button>
            </form:form>

            <c:forEach var="f" items="${files}">
            <div>
                <label>${f.name}</label>
                <img height="100px" width="300px" src="${f.url}"/>
            </div>
            </c:forEach>
        </div>
        ${files}
    </div>
</div>
