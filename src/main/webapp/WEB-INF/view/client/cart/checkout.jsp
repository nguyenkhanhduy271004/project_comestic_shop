<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="utf-8">
                        <title> Thanh toán - laptopshop</title>
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
                        <link href="<c:url value='/client/lib/owlcarousel/assets/owl.carousel.min.css' />"
                            rel="stylesheet">
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
                                            <li class="breadcrumb-item active" aria-current="page">Thông tin thanh toán
                                            </li>
                                        </ol>
                                    </nav>
                                </div>

                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">Sản phẩm</th>
                                                <th scope="col">Tên</th>
                                                <th scope="col">Giá cả</th>
                                                <th scope="col">Số lượng</th>
                                                <th scope="col">Thành tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${ empty cartDetails}">
                                                <tr>
                                                    <td colspan="6">
                                                        Không có sản phẩm trong giỏ hàng
                                                    </td>
                                                </tr>
                                            </c:if>
                                            <c:forEach var="cartDetail" items="${cartDetails}">

                                                <tr>
                                                    <th scope="row">
                                                        <div class="d-flex align-items-center">
                                                            <img src="/images/product/${cartDetail.product.image}"
                                                                class="img-fluid me-5 rounded-circle"
                                                                style="width: 80px; height: 80px;" alt="">
                                                        </div>
                                                    </th>
                                                    <td>
                                                        <p class="mb-0 mt-4">
                                                            <a href="/product/${cartDetail.product.id}" target="_blank">
                                                                ${cartDetail.product.name}
                                                            </a>
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4">
                                                            <c:choose>
                                                                <c:when
                                                                    test="${cartDetail.product.discountPercentage > 0}">
                                                                    <fmt:formatNumber
                                                                        value="${cartDetail.price * (1 - cartDetail.product.discountPercentage / 100)}"
                                                                        type="number" /> đ
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <fmt:formatNumber value="${cartDetail.price}"
                                                                        type="number" /> đ
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <div class="input-group quantity mt-4" style="width: 100px;">
                                                            <input type="text"
                                                                class="form-control form-control-sm text-center border-0"
                                                                value="${cartDetail.quantity}">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                            <c:choose>
                                                                <c:when
                                                                    test="${cartDetail.product.discountPercentage > 0}">
                                                                    <fmt:formatNumber
                                                                        value="${(cartDetail.price * (1 - cartDetail.product.discountPercentage / 100)) * cartDetail.quantity}"
                                                                        type="number" /> đ
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <fmt:formatNumber value="${cartDetail.price}"
                                                                        type="number" /> đ
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </p>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                                <c:if test="${not empty cartDetails}">
                                    <form:form action="/place-order" method="post" modelAttribute="cart">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <input type="hidden" name="promotionId" id="promotionId" value="0" />
                                        <input type="hidden" name="totalShippingFee" id="totalShippingFee"
                                            value="${totalShippingFee}" />
                                        <div class="mt-5 row g-4 justify-content-start">
                                            <div class="col-12 col-md-6">
                                                <div class="p-4 ">
                                                    <h5>Thông Tin Người Nhận
                                                    </h5>
                                                    <div class="row">
                                                        <div class="col-12 form-group mb-3">
                                                            <label>Tên người nhận</label>
                                                            <input class="form-control" name="receiverName"
                                                                value="${user.fullName}" required />
                                                        </div>
                                                        <div class="col-12 form-group mb-3">
                                                            <label>Địa chỉ người nhận</label>
                                                            <input class="form-control" value="${user.address}"
                                                                name="receiverAddress" required />
                                                        </div>
                                                        <div class="col-12 form-group mb-3">
                                                            <label>Số điện thoại</label>
                                                            <input class="form-control" value="${user.phone}"
                                                                name="receiverPhone" required />
                                                        </div>
                                                        <div class="mt-4">
                                                            <i class="fas fa-arrow-left"></i>
                                                            <a href="/cart">Quay lại giỏ hàng</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="bg-light rounded">
                                                    <div class="p-4">
                                                        <h1 class="display-6 mb-4">Thông Tin <span
                                                                class="fw-normal">Thanh
                                                                Toán</span></h1>

                                                        <div class="d-flex justify-content-between">
                                                            <h5 class="mb-0 me-4">Phí vận chuyển</h5>
                                                            <div class="">
                                                                <fmt:formatNumber value="${totalShippingFee}"
                                                                    type="number" pattern="#,##0" />
                                                                <span>₫</span>
                                                            </div>
                                                        </div>

                                                        <!-- Thêm lựa chọn hình thức thanh toán -->
                                                        <div class="mt-3 d-flex flex-column">
                                                            <h5 class="mb-3">Chọn hình thức thanh toán</h5>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio"
                                                                    name="paymentMethod" id="cod" value="COD" checked>
                                                                <label class="form-check-label" for="cod">
                                                                    Thanh toán khi nhận hàng (COD)
                                                                </label>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio"
                                                                    name="paymentMethod" id="vnpay" value="VNPay">
                                                                <label class="form-check-label" for="vnpay">
                                                                    Thanh toán qua VNPay
                                                                </label>
                                                            </div>
                                                            <div
                                                                class="d-flex justify-content-between align-items-center mt-3">
                                                                <h5 class="mb-0">Mã giảm giá</h5>
                                                                <button type="button" class="btn btn-primary btn-sm"
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#discountModal">
                                                                    Thêm mã giảm giá
                                                                </button>
                                                            </div>
                                                            <div id="selectedDiscount" class="mt-3"
                                                                style="display: none;">
                                                                <p><strong>Đã chọn:</strong> <span
                                                                        id="discountName"></span><span
                                                                        id="discountRate"></span> <a href="#"
                                                                        onclick="resetPage()">x</a></p>

                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div
                                                        class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                                        <h5 class="mb-0 ps-4 me-4">Tổng số tiền</h5>
                                                        <p class="mb-0 pe-4" data-cart-total-price="${totalPrice}">
                                                            <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                        </p>
                                                    </div>

                                                    <button type="submit"
                                                        class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4">
                                                        Xác nhận thanh toán
                                                    </button>
                                                </div>
                                            </div>

                                        </div>
                                    </form:form>
                                </c:if>

                            </div>
                        </div>

                        <div class="modal fade" id="discountModal" tabindex="-1" aria-labelledby="discountModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="discountModalLabel">Chọn mã giảm giá</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <c:if test="${not empty promotions}">
                                            <ul class="list-group">
                                                <c:forEach var="promotion" items="${promotions}">
                                                    <li
                                                        class="list-group-item d-flex justify-content-between align-items-center">
                                                        <div>
                                                            <h6>${promotion.name} (${promotion.discountRate}%)</h6>
                                                            <small>${promotion.description}</small>
                                                        </div>
                                                        <button type="button"
                                                            class="btn btn-outline-primary btn-sm apply-discount"
                                                            data-promotion-id="${promotion.id}"
                                                            data-discount-rate="${promotion.discountRate}">
                                                            Chọn
                                                        </button>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </c:if>
                                        <c:if test="${empty promotions}">
                                            <p>Không có mã giảm giá nào khả dụng.</p>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Cart Page End -->


                        <jsp:include page="../layout/footer.jsp" />


                        <!-- Back to Top -->
                        <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                                class="fa fa-arrow-up"></i></a>


                        <!-- JavaScript Libraries -->
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                        <script src="/client/lib/easing/easing.min.js"></script>
                        <script src="/client/lib/waypoints/waypoints.min.js"></script>
                        <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                        <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                        <!-- Template Javascript -->
                        <script src="/client/js/main.js?version=1"></script>
                        <script>
                            let isDiscountApplied = false;

                            document.querySelectorAll('.apply-discount').forEach(function (button) {
                                button.addEventListener('click', function () {
                                    if (isDiscountApplied) {
                                        return;
                                    }

                                    var promotionId = this.getAttribute('data-promotion-id');
                                    var discountRate = parseFloat(this.getAttribute('data-discount-rate'));
                                    var promotionName = this.closest('li').querySelector('h6').textContent;
                                    var shopId = this.getAttribute('data-shop-id');

                                    document.getElementById('discountName').textContent = promotionName;
                                    document.getElementById('selectedDiscount').style.display = 'block';

                                    document.querySelector('input[name="promotionId"]').value = promotionId;

                                    isDiscountApplied = true;

                                    document.querySelectorAll('.apply-discount').forEach(function (button) {
                                        button.disabled = true;
                                    });

                                    const originalPrice = parseFloat(document.querySelector('[data-cart-total-price]').getAttribute('data-cart-total-price'));

                                    if (shopId === "" || shopId === null) {
                                        if (!isNaN(originalPrice) && !isNaN(discountRate)) {
                                            const discountedPrice = originalPrice - (originalPrice * (discountRate / 100));
                                            const formattedPrice = discountedPrice.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
                                            document.querySelector('[data-cart-total-price]').innerText = formattedPrice;
                                        }
                                    } else {
                                        var shopTotalPrice = 0;

                                        document.querySelectorAll('.cart-item').forEach(function (item) {
                                            var itemShopId = item.getAttribute('data-shop-id');
                                            if (itemShopId == shopId) {
                                                var itemPrice = parseFloat(item.querySelector('.item-price').innerText.replace('đ', '').replace(',', '').trim());
                                                shopTotalPrice += itemPrice;
                                            }
                                        });

                                        if (!isNaN(shopTotalPrice) && !isNaN(discountRate)) {
                                            const discountedShopPrice = shopTotalPrice - (shopTotalPrice * (discountRate / 100));
                                            const formattedShopPrice = discountedShopPrice.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
                                            document.querySelector('[data-cart-total-price]').innerText = formattedShopPrice;
                                        }
                                    }

                                    var modal = bootstrap.Modal.getInstance(document.getElementById('discountModal'));
                                    modal.hide();
                                });
                            });

                            function resetPage() {
                                document.getElementById('discountName').textContent = '';
                                document.getElementById('discountRate').textContent = '';

                                location.reload();
                            }
                        </script>


                    </body>

                    </html>