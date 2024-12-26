<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Trang chủ - Cosmetic Shop</title>

                <link rel="icon" href="<c:url value='/client/img/imgThuonghieu/4.png' />" type="image/png">

                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">

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

            <body>

                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>

                <jsp:include page="../layout/header.jsp" />

                <jsp:include page="../layout/carousel.jsp" />

                <div class="hot-selling-product">
                    <div class="container">
                        <div class="title">TOP SẢN PHẨM BÁN CHẠY</div>
                        <div class="menu-hot-product">
                            <button class="carousel-button prev"><i class="fas fa-chevron-left"></i></button>
                            <button class="carousel-button next"><i class="fas fa-chevron-right"></i></button>
                            <div class="list-hot-product">
                                <c:forEach var="product" items="${topSellingProducts}">
                                    <div class="product">
                                        <a href="<c:url value='/product/${product.id}' />">
                                            <div class="img-product">
                                                <img src="<c:url value='/images/product/${product.image}' />"
                                                    alt="${product.name}">
                                            </div>
                                            <div class="detail-product">
                                                <h6>${product.factory}</h6>
                                                <ul class="star-rating">
                                                    <c:forEach begin="1" end="5" var="star">
                                                        <li>
                                                            <a href="#" data-value="${star}"
                                                                class="${star <= product.star ? 'filled' : ''}">
                                                                <c:choose>
                                                                    <c:when test="${star <= product.star}">
                                                                        &#9733;
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        &#9734;
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                                <span class="product-name">${product.name}</span>
                                                <div class="price">
                                                    <fmt:formatNumber value="${product.price}" type="number" />
                                                    <sup>đ</sup>
                                                </div>



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
                        </div>
                        <div class="show-all">
                            <a href="<c:url value='/products' />">
                                <button class="btn-show-all">Xem tất cả</button>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="sale">
                    <div class="container">
                        <div class="header-sale">
                            <img src="<c:url value='/client/img/img-FlashSale/logo.webp' />" alt="Flash Sale Logo" />
                            <a href="<c:url value='/products-sell' />">
                                <button class="btn-show-all">Xem tất cả</button>
                            </a>
                        </div>
                        <div class="main-sale">
                            <button class="carousel-button prevSale"><i class="fas fa-chevron-left"></i></button>
                            <button class="carousel-button nextSale"><i class="fas fa-chevron-right"></i></button>
                            <div class="list-sale-product">
                                <c:forEach var="product" items="${products}">
                                    <c:choose>
                                        <c:when
                                            test="${product.discountPercentage != null and product.discountPercentage > 0}">
                                            <div class="product">
                                                <a href="<c:url value='/product/${product.id}' />">
                                                    <div class="feature">
                                                        <fmt:formatNumber value="${product.discountPercentage}"
                                                            type="number" pattern="0" />%
                                                    </div>
                                                    <div class="img-product">
                                                        <img src="<c:url value='/images/product/${product.image}' />"
                                                            alt="${product.name}">
                                                        <button class="show-now">Xem ngay</button>
                                                    </div>
                                                    <div class="detail-product">
                                                        <h6>${product.factory}</h6>
                                                        <ul class="star-rating">
                                                            <c:forEach begin="1" end="5" var="star">
                                                                <li>
                                                                    <a href="#" data-value="${star}"
                                                                        class="${star <= product.star ? 'filled' : ''}">
                                                                        <c:choose>
                                                                            <c:when test="${star <= product.star}">
                                                                                &#9733;
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                &#9734;
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </a>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                        <span class="product-name">${product.name}</span>
                                                        <div class="price">
                                                            <span class="old-price"
                                                                style="text-decoration: line-through;">
                                                                <fmt:formatNumber value="${product.price}"
                                                                    type="number" />
                                                                <sup>đ</sup>
                                                            </span>
                                                            <span class="official-price">
                                                                <fmt:formatNumber
                                                                    value="${product.price - (product.price * product.discountPercentage / 100)}"
                                                                    type="number" />
                                                                <sup>đ</sup>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
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
                                        </c:when>
                                        <c:otherwise>
                                            <!-- Do nothing for products without a valid discountPercentage -->
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>

                    </div>
                </div>

                <jsp:include page="../layout/feature.jsp" />
                <jsp:include page="../layout/footer.jsp" />

                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="<c:url value='/client/lib/easing/easing.min.js' />"></script>
                <script src="<c:url value='/client/lib/waypoints/waypoints.min.js' />"></script>
                <script src="<c:url value='/client/lib/lightbox/js/lightbox.min.js' />"></script>
                <script src="<c:url value='/client/lib/owlcarousel/owl.carousel.min.js' />"></script>
                <script src="<c:url value='/client/js/main.js?version=6' />"></script>
                <script
                    src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
                <!-- 
                <script src="<c:url value='/client/js/carousel-prev-next.js' />"></script>
                <script src="<c:url value='/client/js/add-product-storage.js' />"></script>
                <script src="<c:url value='/client/js/add-cart.js' />"></script>
                <script src="<c:url value='/client/js/cart-show.js' />"></script> -->
            </body>

            </html>