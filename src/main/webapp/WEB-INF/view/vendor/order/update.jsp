<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="Order Update - Nguyễn Duy" />
                    <meta name="author" content="Nguyễn Duy" />
                    <title>Update Order</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Update Order</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/vendor">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="/vendor/order">Orders</a></li>
                                        <li class="breadcrumb-item active">Update</li>
                                    </ol>

                                    <!-- Order Information -->
                                    <div class="card mb-4">
                                        <div class="card-header bg-primary text-white">
                                            <h5 class="mb-0">Order Information</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <h6 class="fw-bold">Order ID:</h6>
                                                    <p class="fs-5 mb-0 text-muted">${newOrder.id}</p>
                                                </div>
                                                <div class="col-md-6">
                                                    <h6 class="fw-bold">Total Price:</h6>
                                                    <p class="fs-5 mb-0 text-muted">
                                                        <fmt:formatNumber value="${totalValueForShop}" type="number" />
                                                        đ
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Update Form -->
                                    <div class="card">
                                        <div class="card-header bg-secondary text-white">
                                            <h5 class="mb-0">Update Order</h5>
                                        </div>
                                        <div class="card-body">
                                            <form:form method="post" action="/vendor/order/update" class="row"
                                                modelAttribute="newOrder">
                                                <form:input type="hidden" path="id" />
                                                <!-- User Information -->
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label">User:</label>
                                                    <form:input type="text" class="form-control" path="user.fullName"
                                                        disabled="true" />
                                                </div>

                                                <!-- Status -->
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label">Status:</label>
                                                    <form:select class="form-select" path="status">
                                                        <form:option value="PENDING">PENDING</form:option>
                                                        <form:option value="SHIPPING">SHIPPING</form:option>
                                                        <form:option value="COMPLETE">COMPLETE</form:option>
                                                        <form:option value="CANCELLED">CANCELLED</form:option>
                                                    </form:select>
                                                </div>

                                                <!-- Submit Button -->
                                                <div class="col-12">
                                                    <button type="submit" class="btn btn-success w-100">Update
                                                        Order</button>
                                                </div>
                                            </form:form>
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