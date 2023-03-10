<footer class="footer">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <nav class="d-flex">
                    <ul class="m-0 p-0">
                        <li>
                            <a href="#">
                                Home
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Company
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Portfolio
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Blog
                            </a>
                        </li>
                    </ul>
                </nav>

            </div>
            <div class="col-md-6">
                <p class="copyright d-flex justify-content-end">2023 Design by
                    <a href="#">MY DANA TEAM</a> Admin Dashboard
                </p>
            </div>
        </div>
    </div>
</footer>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="${pageContext.request.contextPath}/resources/assets/admin/js/jquery-3.3.1.slim.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/admin/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/admin/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/admin/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/admin/DataTable/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
            $('#content').toggleClass('active');
        });

        $('.more-button,.body-overlay').on('click', function () {
            $('#sidebar,.body-overlay').toggleClass('show-nav');
        });

    });
</script>
</body>

</html>
