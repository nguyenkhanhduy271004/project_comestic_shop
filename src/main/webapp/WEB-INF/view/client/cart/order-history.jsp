<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Lịch sử mua hàng - Cosmetic Shop</title>

                <link rel="icon" href="<c:url value='/client/img/imgThuonghieu/4.png' />" type="image/png">

                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

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
                <<<<<<< HEAD <meta name="_csrf" content="${_csrf.token}" />
                <meta name="_csrf_header" content="${_csrf.headerName}" />

                =======
                <link href="<c:url value='/client/css/responsive-home.css' />" rel="stylesheet">
                >>>>>>> bc9ccb327a05dca192bcc5169d1442f805bd54b4
                <style>
                    :root {
                        --primary-color: #FFC0CB;
                        --accent-color: #B76E79;
                        --background-light: #FAFAFA;
                        --background-color: #F8E1E7;
                        --gold-color: #FFD700;
                        --text-color: #333;
                    }

                    body {
                        font-family: 'Poppins', sans-serif;
                        background-color: var(--background-color);
                        color: var(--text-color);
                    }

                    h1,
                    h2,
                    h3,
                    .breadcrumb-item,
                    .table th,
                    .table td {
                        font-family: 'Playfair Display', serif;
                    }

                    .btn-primary {
                        background-color: var(--primary-color);
                        color: white;
                        border-radius: 30px;
                        font-weight: bold;
                        transition: background-color 0.3s;
                    }

                    .btn-primary:hover {
                        background-color: var(--accent-color);
                        color: white;
                    }

                    .table-container {
                        background-color: var(--background-light);
                        padding: 20px;
                        border-radius: 10px;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    }

                    .table thead th {
                        background-color: var(--primary-color);
                        color: white;
                        text-align: center;
                        vertical-align: middle;
                    }

                    .table tbody tr {
                        border-bottom: 1px solid #ddd;
                        transition: background-color 0.3s;
                    }

                    .table tbody tr:hover {
                        background-color: var(--background-light);
                    }

                    .breadcrumb {
                        background-color: transparent;
                        padding: 0;
                    }

                    .breadcrumb-item a {
                        color: var(--text-color);
                    }

                    .breadcrumb-item.active {
                        color: var(--accent-color);
                    }

                    .order-id-row {
                        font-weight: bold;
                        color: var(--accent-color);
                    }

                    .product-image {
                        width: 80px !important;
                        height: 80px !important;
                        object-fit: cover;
                        border-radius: 8px;
                    }

                    .no-orders {
                        text-align: center;
                        color: gray;
                        padding: 20px;
                        font-size: 1.2em;
                    }

                    button {
                        padding: 10px 20px;
                        font-size: 16px;
                        font-weight: bold;
                        border: none;
                        border-radius: 5px;
                        cursor: pointer;
                        transition: background-color 0.3s ease, transform 0.3s ease;
                    }

                    /* Nút hủy với nền đỏ */
                    button[type="submit"] {
                        background-color: #f44336;
                        /* Màu đỏ */
                        color: white;
                    }

                    /* Khi người dùng hover (di chuột) */
                    button[type="submit"]:hover {
                        background-color: #d32f2f;
                        /* Màu đỏ đậm */
                        transform: translateY(-3px);
                        /* Hiệu ứng nhấn nút */
                    }

                    /* Khi người dùng nhấn vào nút */
                    button[type="submit"]:active {
                        background-color: #c62828;
                        /* Màu đỏ sậm hơn */
                        transform: translateY(0);
                        /* Khôi phục hiệu ứng nhấn */
                    }

                    /* Tạo hiệu ứng khi di chuột qua nút */
                    button[type="submit"]:focus {
                        outline: none;
                        /* Loại bỏ đường viền khi nút được focus */
                        box-shadow: 0 0 0 3px rgba(244, 67, 54, 0.5);
                        /* Tạo viền sáng khi focus */
                    }
                </style>
            </head>

            <body>
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>

                <jsp:include page="../layout/header.jsp" />

                <div class="container-fluid py-5 mt-4">
                    <div class="container py-5">
                        <nav aria-label="breadcrumb" class="mb-4">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Lịch sử mua hàng</li>
                            </ol>
                        </nav>

                        <div class="table-container">
                            <div class="table-responsive">
                                <table class="table align-middle table-borderless">
                                    <thead>
                                        <tr>
                                            <th scope="col">Sản phẩm</th>
                                            <th scope="col">Tên</th>
                                            <th scope="col">Giá cả</th>
                                            <th scope="col">Số lượng</th>
                                            <th scope="col">Thành tiền</th>
                                            <th scope="col">Trạng thái</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${empty orders}">
                                            <tr>
                                                <td colspan="6" class="no-orders">Không có đơn hàng nào được tạo
                                                </td>
                                            </tr>
                                        </c:if>
                                        <c:forEach var="order" items="${orders}">
                                            <tr class="order-id-row">
                                                <td colspan="6">Order ID: ${order.id} </span> - Tổng tiền:
                                                    <fmt:formatNumber type="number" value="${order.totalPrice}" /> đ
                                                    - <span id="orderDate">Ngày đặt hàng:
                                                        2024-12-09T08:37:17.717889</span>

                                                </td>
                                            </tr>

                                            <!-- Lặp qua các shop -->
                                            <c:forEach var="entry" items="${groupedOrderDetails}">
                                                <!-- entry.getKey() sẽ là tên shop -->
                                                <tr class="shop-id-row">
                                                    <td colspan="6"><span style="font-weight: 600;">Shop:
                                                            ${entry.key}</span></td>
                                                    <!-- Hiển thị tên shop -->
                                                </tr>

                                                <!-- Lặp qua các orderDetail của shop đó -->
                                                <c:forEach var="orderDetail" items="${entry.value}">
                                                    <tr>
                                                        <td><img src="/images/product/${orderDetail.product.image}"
                                                                class="img-fluid product-image"></td>
                                                        <td><a href="/product/${orderDetail.product.id}"
                                                                class="text-decoration-none">${orderDetail.product.name}</a>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when
                                                                    test="${orderDetail.product.discountPercentage != null}">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${orderDetail.price * (1 - orderDetail.product.discountPercentage / 100)}" />
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <fmt:formatNumber type="number"
                                                                        value="${orderDetail.price}" />
                                                                </c:otherwise>
                                                            </c:choose>
                                                            đ
                                                        </td>
                                                        <td>${orderDetail.quantity}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when
                                                                    test="${orderDetail.product.discountPercentage != null}">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${orderDetail.price * orderDetail.quantity * (1 - orderDetail.product.discountPercentage / 100)}" />
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <fmt:formatNumber type="number"
                                                                        value="${orderDetail.price * orderDetail.quantity}" />
                                                                </c:otherwise>
                                                            </c:choose>
                                                            đ
                                                        </td>
                                                        <td>${orderDetail.status}</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:forEach>
                                            <c:if test="${orderPendingStatus[order.id]}">
                                                <tr class="cancel-order-row">
                                                    <td colspan="6" style="text-align: right; padding-right: 70px;">
                                                        <form action="/cancelOrder" method="post">
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}" />
                                                            <input type="hidden" name="orderId" value="${order.id}" />
                                                            <button type="submit" class="btn-cancel">Hủy đặt
                                                                hàng</button>
                                                        </form>
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

                <jsp:include page="../layout/footer.jsp" />


                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="<c:url value='/client/lib/easing/easing.min.js' />"></script>
                <script src="<c:url value='/client/lib/waypoints/waypoints.min.js' />"></script>
                <script src="<c:url value='/client/lib/lightbox/js/lightbox.min.js' />"></script>
                <script src="<c:url value='/client/lib/owlcarousel/owl.carousel.min.js' />"></script>
                <script src="<c:url value='/client/js/main.js?version=4' />"></script>
                <script
                    src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>


            </body>

            </html>