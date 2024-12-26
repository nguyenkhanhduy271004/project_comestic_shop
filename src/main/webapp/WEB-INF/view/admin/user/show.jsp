<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="Nguyễn Duy - Dự án laptopshop" />
            <meta name="author" content="Nguyễn Duy" />
            <title>Dashboard - Nguyễn Duy</title>
            <link href="/css/styles.css" rel="stylesheet" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4" style="margin-top: 200px;">
                            <h1 class="mt">Manage Users</h1>
                            <!-- Filter Form -->
                            <div class="row justify-content-center mb-4">
                                <form action="/admin/user" method="get" class="form-inline"
                                    style="width: 100%; max-width: 900px; margin: 0 auto;">
                                    <div class="row w-100">
                                        <!-- Filter by Email -->
                                        <div class="col-4 mb-2">
                                            <label for="email" class="form-label">Email</label>
                                            <input type="text" class="form-control" id="email" name="email"
                                                placeholder="Enter email" value="${param.email}">
                                        </div>
                                        <!-- Filter by Full Name -->
                                        <div class="col-4 mb-2">
                                            <label for="fullName" class="form-label">Full Name</label>
                                            <input type="text" class="form-control" id="fullName" name="fullName"
                                                placeholder="Enter full name" value="${param.fullName}">
                                        </div>
                                        <!-- Filter by Role -->
                                        <div class="col-4 mb-2">
                                            <label for="role" class="form-label">Role</label>
                                            <select class="form-select" id="role" name="role">
                                                <option value="">Select Role</option>
                                                <option value="ADMIN" ${param.role eq 'ADMIN' ? 'selected' : '' }>Admin
                                                </option>
                                                <option value="USER" ${param.role eq 'USER' ? 'selected' : '' }>User
                                                </option>
                                                <option value="VENDOR" ${param.role eq 'VENDOR' ? 'selected' : '' }>
                                                    VENDOR
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary mt-3">Filter</button>
                                </form>
                            </div>

                            <div class="mt-2">
                                <div class="row">
                                    <div class="col-12 mx-auto">
                                        <div class="d-flex justify-content-between">
                                            <h3>Table Users</h3>
                                            <a href="/admin/user/create" class="btn btn-primary">Create a user</a>
                                        </div>

                                        <hr />
                                        <table class="table table-bordered mt-4">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Email</th>
                                                    <th>Full Name</th>
                                                    <th>Role</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="user" items="${users}">
                                                    <!-- Lọc theo Email -->
                                                    <c:if
                                                        test="${empty param.email || user.email.toLowerCase().contains(param.email.toLowerCase())}">
                                                        <!-- Lọc theo Full Name -->
                                                        <c:if
                                                            test="${empty param.fullName || user.fullName.toLowerCase().contains(param.fullName.toLowerCase())}">
                                                            <!-- Lọc theo Role -->
                                                            <c:if
                                                                test="${empty param.role || user.role.name == param.role}">
                                                                <tr>
                                                                    <td>${user.id}</td>
                                                                    <td>${user.email}</td>
                                                                    <td>${user.fullName}</td>
                                                                    <td>${user.role.name}</td>
                                                                    <td>
                                                                        <a href="/admin/user/${user.id}"
                                                                            class="btn btn-success">View</a>
                                                                        <a href="/admin/user/update/${user.id}"
                                                                            class="btn btn-warning">Update</a>
                                                                        <a href="/admin/user/delete/${user.id}"
                                                                            class="btn btn-danger">Delete</a>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                            </tbody>
                                        </table>


                                        <!-- Pagination -->
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination justify-content-center">
                                                <li class="page-item ${currentPage eq 1 ? 'disabled' : ''}">
                                                    <a class="page-link" href="/admin/user?page=${currentPage - 1}"
                                                        aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                        <span class="sr-only">Previous</span>
                                                    </a>
                                                </li>
                                                <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                    <li class="page-item">
                                                        <a class="${loop.index eq currentPage ? 'active page-link' : 'page-link'}"
                                                            href="/admin/user?page=${loop.index}">
                                                            ${loop.index}
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                                <li class="page-item ${currentPage eq totalPages ? 'disabled' : ''}">
                                                    <a class="page-link" href="/admin/user?page=${currentPage + 1}"
                                                        aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                        <span class="sr-only">Next</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
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