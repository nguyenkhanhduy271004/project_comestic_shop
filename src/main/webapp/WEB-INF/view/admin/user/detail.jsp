<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Nguyễn Duy - Dự án laptopshop" />
                <meta name="author" content="Nguyễn Duy" />
                <title>Detail User - Nguyễn Duy</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4 py-5">
                                <h1 class="mt-4 text-primary">Manage Users</h1>

                                <div class="card shadow-lg border-0 rounded-3">
                                    <div class="card-header bg-info text-white">
                                        <h3 class="mb-0">User Details</h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between mb-4">
                                            <h4 class="text-success">User ID: ${user.id}</h4>
                                            <a href="/admin/user" class="btn btn-success">
                                                <i class="fa fa-arrow-left"></i> Back to Users
                                            </a>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <ul class="list-group">
                                                    <li class="list-group-item"><strong>Email:</strong> ${user.email}
                                                    </li>
                                                    <li class="list-group-item"><strong>Full Name:</strong>
                                                        ${user.fullName}</li>
                                                    <li class="list-group-item"><strong>Address</strong>:
                                                        ${user.address == '' ? 'Chưa
                                                        cập nhật' : user.address}</li>

                                                </ul>
                                            </div>
                                            <div class="col-md-6 text-center">
                                                <img src="https://via.placeholder.com/150" alt="User Avatar"
                                                    class="img-fluid rounded-circle shadow-lg mb-3">
                                                <h5>Profile Picture</h5>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>