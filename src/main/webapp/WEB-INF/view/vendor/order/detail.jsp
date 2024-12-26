<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="Nguyễn Duy - Dự án laptopshop" />
                    <meta name="author" content="Nguyễn Duy" />
                    <title>Order Detail - Nguyễn Duy</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Order Detail</h1>
                                    <div class="mt-5">
                                        <div class="row">
                                            <div class="col-md-10 mx-auto">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <h3>Order Detail for ID = ${orderDetails[0].order.id}</h3>
                                                    <a href="/vendor/order" class="btn btn-secondary">Back</a>
                                                </div>
                                                <hr />
                                                <div class="table-responsive">
                                                    <table class="table table-striped">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">Image</th>
                                                                <th scope="col">Product Name</th>
                                                                <th scope="col">Price</th>
                                                                <th scope="col">Quantity</th>
                                                                <th scope="col">Total</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:if test="${empty orderDetails}">
                                                                <tr>
                                                                    <td colspan="5" class="text-center">No products in
                                                                        this order</td>
                                                                </tr>
                                                            </c:if>

                                                            <c:forEach items="${orderDetails}" var="orderDetail">
                                                                <c:if test="${orderDetail.product.shop.id == shopId}">
                                                                    <tr>
                                                                        <td>
                                                                            <img src="/images/product/${orderDetail.product.image}"
                                                                                class="img-fluid"
                                                                                style="width: 100px; height: 100px; object-fit: cover;"
                                                                                alt="">
                                                                        </td>
                                                                        <td>
                                                                            ${orderDetail.product.name}
                                                                        </td>
                                                                        <td>
                                                                            <fmt:formatNumber
                                                                                value="${orderDetail.price}"
                                                                                type="number" /> đ
                                                                        </td>
                                                                        <td>
                                                                            <div class="input-group">
                                                                                ${orderDetail.quantity}
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <fmt:formatNumber
                                                                                value="${orderDetail.price * orderDetail.quantity}"
                                                                                type="number" /> đ
                                                                        </td>
                                                                    </tr>
                                                                </c:if>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
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