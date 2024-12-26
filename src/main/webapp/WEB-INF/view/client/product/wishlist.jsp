<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Danh sách yêu thích - Cosmetic Shop</title>

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
                <link href="<c:url value='/client/css/responsive-home.css' />" rel="stylesheet">

                <meta name="_csrf" content="${_csrf.token}" />
                <meta name="_csrf_header" content="${_csrf.headerName}" />

                <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
                    rel="stylesheet">
            </head>

            <body style="margin-top: 100px;">

                <jsp:include page="../layout/header.jsp" />

                <div class="container py-5 mt-5">
                    <h3 class="fw-bold mb-4">Danh sách yêu thích của bạn</h3>

                    <c:if test="${empty wishlist}">
                        <p class="alert alert-warning">Không có sản phẩm nào trong danh sách yêu thích của bạn.</p>
                    </c:if>

                    <c:if test="${not empty wishlist}">
                        <div class="row">
                            <c:forEach var="product" items="${wishlist}">
                                <div class="product">
                                    <a href="<c:url value='/product/${product.id}' />">
                                        <div class="img-product">
                                            <img src="<c:url value='/images/product/${product.image}' />"
                                                alt="${product.name}">
                                        </div>
                                        <div class="detail-product">
                                            <h6>${product.factory}</h6>
                                            <span class="product-name">${product.name}</span>
                                            <div class="price">
                                                <fmt:formatNumber value="${product.price}" type="number" />
                                                <sup>đ</sup>
                                            </div>
                                            <ul class="star-rating">
                                                <c:forEach begin="1" end="5" var="star">
                                                    <li><a href="#" data-value="${star}">&#9733;</a></li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <input class="form-control d-none" type="text" value="${product.id}"
                                            name="id" />

                                        <input class="form-control d-none" type="text" name="quantity"
                                            id="cartDetails0.quantity" value="1" />
                                        <button data-product-id="${product.id}"
                                            class="btnAddToCartDetail btn border border-secondary  px-4 py-2 mb-4 mt-4"
                                            style="background-color: #000; color: #fff;">
                                            <i class="fa fa-shopping-bag me-2"></i>
                                            Thêm vào giỏ
                                        </button>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
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