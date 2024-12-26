<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Nguyễn Duy - Dự án laptopshop" />
                <meta name="author" content="Nguyễn Duy" />
                <title>Manager Orders - Nguyễn Duy</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Orders</h1>
                                <!-- <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Order</li>
                                </ol> -->

                                <!-- Filter Form -->
                                <div class="row justify-content-center mb-4">
                                    <form action="/admin/order" method="get" class="form-inline"
                                        style="display: flex; align-items: center; gap: 10px; width: 90%; margin: 0 auto;">
                                        <label for="status" class="mr-2"
                                            style="flex: 1; text-align: right; font-weight: bold;">
                                            Filter by Status:</label>
                                        <select name="status" id="status" class="form-control mr-3"
                                            style="flex: 2; padding: 5px 10px;">
                                            <option value="">All</option>
                                            <option value="PENDING" ${param.status eq 'PENDING' ? 'selected' : '' }>
                                                PENDING</option>
                                            <option value="SHIPPING" ${param.status eq 'SHIPPING' ? 'selected' : '' }>
                                                SHIPPING</option>
                                            <option value="COMPLETE" ${param.status eq 'COMPLETE' ? 'selected' : '' }>
                                                COMPLETE</option>
                                            <option value="CANCELLED" ${param.status eq 'CANCELLED' ? 'selected' : '' }>
                                                CANCELLED</option>
                                        </select>
                                        <button type="submit" class="btn btn-primary">Filter</button>
                                    </form>
                                </div>

                                <!-- Order Table -->
                                <div class="mt-5">
                                    <c:choose>
                                        <c:when test="${not empty orders}">
                                            <table class="table table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Total Price</th>
                                                        <th>User</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="order" items="${orders}">
                                                        <!-- Check status filter -->
                                                        <c:if
                                                            test="${param.status == null || param.status == '' || order.status eq param.status}">
                                                            <tr>
                                                                <th>${order.id}</th>
                                                                <td>
                                                                    <fmt:formatNumber type="number"
                                                                        value="${order.totalPrice}" /> đ
                                                                </td>
                                                                <td>${order.user.fullName}</td>
                                                                <td>${order.status}</td>
                                                                <td>
                                                                    <a href="/admin/order/${order.id}"
                                                                        class="btn btn-success">View</a>
                                                                    <a href="/admin/order/update/${order.id}"
                                                                        class="btn btn-warning mx-2">Update</a>
                                                                    <a href="/admin/order/delete/${order.id}"
                                                                        class="btn btn-danger">Delete</a>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                </tbody>
                                            </table>

                                            <!-- Pagination -->
                                            <nav aria-label="Page navigation">
                                                <ul class="pagination justify-content-center">
                                                    <li class="page-item ${currentPage eq 1 ? 'disabled' : ''}">
                                                        <a class="page-link" href="/admin/order?page=${currentPage - 1}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">&lt;</span>
                                                        </a>
                                                    </li>

                                                    <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                        <li
                                                            class="page-item ${loop.index eq currentPage ? 'active' : ''}">
                                                            <a class="page-link"
                                                                href="/admin/order?page=${loop.index}">${loop.index}</a>
                                                        </li>
                                                    </c:forEach>

                                                    <li
                                                        class="page-item ${currentPage eq totalPages ? 'disabled' : ''}">
                                                        <a class="page-link" href="/admin/order?page=${currentPage + 1}"
                                                            aria-label="Next">
                                                            <span aria-hidden="true">&gt;</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="alert alert-warning text-center">No orders available</div>
                                        </c:otherwise>
                                    </c:choose>
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