<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title> Giỏ hàng - comesticshop</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">
                    <link rel="icon" href="<c:url value='/client/img/imgThuonghieu/4.png' />" type="image/png">


                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                    <link href="<c:url value='/client/lib/lightbox/css/lightbox.min.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/lib/owlcarousel/assets/owl.carousel.min.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/css/bootstrap.min.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/css/style.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/css/carousel-product.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/css/header.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/css/footer.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/css/common.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/css/product.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/css/hot-product.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/css/sale-product.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/css/responsive-home.css' />" rel="stylesheet">
                    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
                        rel="stylesheet">
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />

                    <!-- Cart Page Start -->
                    <div class="container-fluid py-5">
                        <div class="container py-5">
                            <div class="mb-3">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Chi Tiết Giỏ Hàng</li>
                                    </ol>
                                </nav>
                            </div>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col"></th>
                                            <th scope="col"></th>
                                            <th scope="col"></th>
                                            <th scope="col" style="vertical-align: middle;">Số lượng
                                            </th>
                                            <th scope="col" style="text-align: center; vertical-align: middle;">Thành
                                                tiền</th>
                                            <th scope="col" style="text-align: center; vertical-align: middle;">Xử lý
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${empty shopCartDetailsMap}">
                                            <tr>
                                                <td colspan="6">Không có sản phẩm trong giỏ hàng</td>
                                            </tr>
                                        </c:if>
                                        <c:forEach var="entry" items="${shopCartDetailsMap}">
                                            <c:set var="shop" value="${entry.key}" />
                                            <c:set var="cartDetails" value="${entry.value}" />
                                            <tr>
                                                <td colspan="6">
                                                    <h5 style="font-size: 1rem;">Shop: ${shop.name}</h5>
                                                </td>
                                            </tr>
                                            <c:forEach var="cartDetail" items="${cartDetails}">
                                                <tr>
                                                    <td style="vertical-align: middle;">
                                                        <img src="/images/product/${cartDetail.product.image}"
                                                            class="img-fluid rounded-circle"
                                                            style="width: 80px; height: 80px;" alt="">
                                                    </td>
                                                    <td style="vertical-align: middle;">
                                                        <p>
                                                            <a href="/product/${cartDetail.product.id}" target="_blank">
                                                                ${cartDetail.product.name}
                                                            </a>
                                                        </p>
                                                    </td>
                                                    <td style="vertical-align: middle;">
                                                        <!-- <c:choose>
                                                            <c:when test="${cartDetail.product.discountPercentage > 0}">
                                                                <fmt:formatNumber
                                                                    value="${cartDetail.price * (1 - cartDetail.product.discountPercentage / 100)}"
                                                                    type="number" /> đ
                                                            </c:when>
                                                            <c:otherwise>
                                                                <fmt:formatNumber value="${cartDetail.price}"
                                                                    type="number" /> đ
                                                            </c:otherwise>
                                                        </c:choose> -->
                                                    </td>
                                                    <td style="text-align: center; ">
                                                        <div class="input-group quantity mt-4" style="width: 100px;">
                                                            <div class="input-group-btn">
                                                                <button
                                                                    class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                                    <i class="fa fa-minus"></i>
                                                                </button>
                                                            </div>
                                                            <input type="text"
                                                                class="form-control form-control-sm text-center border-0"
                                                                value="${cartDetail.quantity}"
                                                                data-cart-detail-id="${cartDetail.id}"
                                                                data-cart-detail-price="${cartDetail.product.discountPercentage > 0 ? (cartDetail.price * (1 - cartDetail.product.discountPercentage / 100)) : cartDetail.price}"
                                                                data-cart-detail-index="${status.index}"
                                                                data-cart-product-quantity="${cartDetail.product.quantity}">
                                                            <div class="input-group-btn">
                                                                <button
                                                                    class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                                    <i class="fa fa-plus"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </td>

                                                    <td style="text-align: center; ">
                                                        <c:choose>
                                                            <c:when test="${cartDetail.product.discountPercentage > 0}">
                                                                <p class="mb-0 mt-4"
                                                                    data-cart-detail-id="${cartDetail.id}">
                                                                    <fmt:formatNumber
                                                                        value="${(cartDetail.price * (1 - cartDetail.product.discountPercentage / 100)) * cartDetail.quantity}"
                                                                        type="number" /> đ
                                                                </p>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <p class="mb-0 mt-4"
                                                                    data-cart-detail-id="${cartDetail.id}">
                                                                    <fmt:formatNumber
                                                                        value="${cartDetail.price * cartDetail.quantity}"
                                                                        type="number" /> đ
                                                                </p>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td style="text-align: center; vertical-align: middle;">
                                                        <form method="post"
                                                            action="/delete-cart-product/${cartDetail.id}">
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}" />
                                                            <button class="btn btn-danger btn-sm">
                                                                <i class="fa fa-times"></i>
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td colspan="4"></td>
                                                <td>
                                                    <strong>Tổng tiền shop: </strong>
                                                    <fmt:formatNumber value="${shopTotalPrices[shop]}" type="number" />
                                                    đ
                                                </td>
                                                <td></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>

                                </table>
                            </div>
                            <c:if test="${not empty cartDetails}">
                                <div class="mt-5 row g-4 justify-content-start">
                                    <div class="col-12 col-md-8">
                                        <div class="bg-light rounded">
                                            <div class="p-4">
                                                <h1 class="display-6 mb-4">Thông Tin <span class="fw-normal">Đơn
                                                        Hàng</span>
                                                </h1>
                                                <div class="d-flex justify-content-between mb-4">
                                                    <h5 class="mb-0 me-4">Tạm tính:</h5>
                                                    <p class="mb-0" data-cart-total-price="${totalPrice}">
                                                        <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                    </p>
                                                </div>
                                                <div class="d-flex justify-content-between">
                                                    <h5 class="mb-0 me-4">Phí vận chuyển</h5>
                                                    <div class="">
                                                        <fmt:formatNumber value="${totalShippingFee}" type="number"
                                                            pattern="#,##0" />
                                                        <span>₫</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div
                                                class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                                <h5 class="mb-0 ps-4 me-4">Tổng số tiền</h5>
                                                <p class="mb-0 pe-4" data-cart-total-price="${totalAmount}">
                                                    <fmt:formatNumber type="number" value="${totalAmount}" /> đ
                                                </p>
                                            </div>
                                            <form:form action="/confirm-checkout" method="post" modelAttribute="cart">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <div style="display: none;">
                                                    <c:forEach var="cartDetail" items="${cart.cartDetails}"
                                                        varStatus="status">
                                                        <div class="mb-3">
                                                            <div class="form-group">
                                                                <label>Id:</label>
                                                                <form:input class="form-control" type="text"
                                                                    value="${cartDetail.id}"
                                                                    path="cartDetails[${status.index}].id" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Quantity:</label>
                                                                <form:input class="form-control" type="text"
                                                                    value="${cartDetail.quantity}"
                                                                    path="cartDetails[${status.index}].quantity" />
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <button
                                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4">Xác
                                                    nhận thanh toán
                                                </button>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <!-- Cart Page End -->


                    <jsp:include page="../layout/footer.jsp" />


                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js?version=17"></script>
                    <script
                        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>

                    <script>

                    </script>

                </body>

                </html>