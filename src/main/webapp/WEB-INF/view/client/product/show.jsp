<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title> Sản Phẩm - Comestic Shop</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">
                    <meta name="_csrf" content="${_csrf.token}" />
                    <meta name="_csrf_header" content="${_csrf.headerName}" />

                    <link rel="icon" href="<c:url value='/client/img/imgThuonghieu/4.png' />" type="image/png">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">
                    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
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
                    <link href="<c:url value='/client/css/carousel-product.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/css/header.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/css/footer.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/css/common.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/css/product.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/css/hot-product.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/css/sale-product.css' />" rel="stylesheet">
                    <link href="<c:url value='/client/css/responsive-product.css' />" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                    <style>
                        .page-link.disabled {
                            color: var(--bs-pagination-disabled-color);
                            pointer-events: none;
                            background-color: var(--bs-pagination-disabled-bg);
                        }

                        #criteriaFilter,
                        #factoryFilter,
                        #targetFilter,
                        #priceFilter,
                        #shortprice {
                            background-color: #f9f9f9;
                            border-radius: 8px;
                            padding: 20px;
                            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                            margin-bottom: 20px;
                        }

                        #criteriaFilter .mb-2,
                        #factoryFilter .mb-2 {
                            font-size: 1.2rem;
                            font-weight: 600;
                            color: #333;
                            margin-bottom: 10px;
                        }

                        .form-check-inline {
                            margin-right: 15px;
                        }

                        .form-check-input {
                            position: relative;
                            top: 2px;
                            margin-right: 8px;
                            cursor: pointer;
                        }

                        .form-check-label {
                            font-size: 1rem;
                            color: #555;
                            cursor: pointer;
                            transition: color 0.3s;
                        }

                        .form-check-label:hover {
                            color: #007bff;
                        }

                        .form-check-input:checked {
                            background-color: #007bff;
                            border-color: #007bff;
                        }

                        .col-12 {
                            margin-bottom: 15px;
                        }

                        @media (max-width: 768px) {
                            .row.g-4 {
                                flex-direction: column;
                            }

                            .col-md-4 {
                                margin-bottom: 15px;
                            }
                        }

                        .form-check-input:checked+.form-check-label {
                            font-weight: 700;
                            color: #007bff;
                        }

                        .button {
                            padding: 15px 30px;
                            font-size: 16px;
                            color: white;
                            background: linear-gradient(45deg, #ff6a00, #ee0979);
                            border: none;
                            border-radius: 50px;
                            cursor: pointer;
                            outline: none;
                            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
                            transition: transform 0.3s ease, filter 0.3s ease;
                        }

                        .button:hover {
                            transform: translateY(-5px);
                            filter: brightness(1.2) contrast(1.1) saturate(1.3);
                        }

                        .button:active {
                            transform: translateY(2px);
                            filter: brightness(0.9) contrast(1.2);
                        }

                        .button:focus {
                            outline: none;
                        }
                    </style>
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />

                    <!-- Single Product Start -->
                    <div class="container-fluid py-5 mt-5">
                        <div class="container py-5">
                            <div class="row g-4 mb-5">
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Danh Sách Sản Phẩm
                                            </li>
                                        </ol>
                                    </nav>
                                </div>

                                <div class="row g-4 fruite">
                                    <div class="col-12 col-md-4">
                                        <div class="row g-4">
                                            <div class="col-12" id="criteriaFilter">
                                                <div class="mb-2"><b>Tiêu chí</b></div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="criteria-1"
                                                        value="new" onclick="selectOnlyThis(this)">
                                                    <label class="form-check-label" for="criteria-1">Sản phẩm
                                                        mới</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="criteria-2"
                                                        value="best_seller" onclick="selectOnlyThis(this)">
                                                    <label class="form-check-label" for="criteria-2">Bán chạy</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="criteria-3"
                                                        value="evaluate" onclick="selectOnlyThis(this)">
                                                    <label class="form-check-label" for="criteria-3">Đánh giá</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="criteria-4"
                                                        value="favorite" onclick="selectOnlyThis(this)">
                                                    <label class="form-check-label" for="criteria-4">Yêu thích</label>
                                                </div>
                                            </div>
                                            <div class="col-12" id="factoryFilter">
                                                <div class="mb-2"><b>Hãng sản xuất</b></div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-1"
                                                        value="ESSENCE">
                                                    <label class="form-check-label" for="factory-1">Essence</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-2"
                                                        value="VELVET_TOUCH">
                                                    <label class="form-check-label" for="factory-2">Velvet Touch</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-3"
                                                        value="CHIC_COSMETICS">
                                                    <label class="form-check-label" for="factory-3">Chic
                                                        Cosmetics</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-4"
                                                        value="NAIL_COUTURE">
                                                    <label class="form-check-label" for="factory-4">Nail Couture</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-5"
                                                        value="CALVIN_KLEIN">
                                                    <label class="form-check-label" for="factory-5">Calvin Klein</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-6"
                                                        value="CHANEL">
                                                    <label class="form-check-label" for="factory-6">Chanel</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-7"
                                                        value="Dior">
                                                    <label class="form-check-label" for="factory-7">Dior</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-8"
                                                        value="DOLCE_GABBANA">
                                                    <label class="form-check-label" for="factory-8">Dolce &
                                                        Gabbana</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-9"
                                                        value="Gucci">
                                                    <label class="form-check-label" for="factory-9">Gucci</label>
                                                </div>

                                            </div>
                                            <div class="col-12" id="targetFilter">
                                                <div class="mb-2"><b>Mục đích sử dụng</b></div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-1"
                                                        value="MASCARA">
                                                    <label class="form-check-label" for="target-1">Mascara</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-2"
                                                        value="EYESHADOW">
                                                    <label class="form-check-label" for="target-2">Eyeshadow</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-3"
                                                        value="SETTING_POWDER">
                                                    <label class="form-check-label" for="target-3">Setting
                                                        Powder</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-4"
                                                        value="LIPSTICK">
                                                    <label class="form-check-label" for="target-4">Lipstick</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-5"
                                                        value="NAIL_POLISH">
                                                    <label class="form-check-label" for="target-5">Nail Polish</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-6"
                                                        value="FRAGRANCE">
                                                    <label class="form-check-label" for="target-6">Fragrance</label>
                                                </div>



                                            </div>
                                            <div class="col-12" id="priceFilter">
                                                <div class="mb-2"><b>Mức giá</b></div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-2"
                                                        value="duoi-500">
                                                    <label class="form-check-label" for="price-2">Dưới 500.000</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-3"
                                                        value="500-1-trieu">
                                                    <label class="form-check-label" for="price-3">Từ 500.000 - 1
                                                        triệu</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-4"
                                                        value="1-3-trieu">
                                                    <label class="form-check-label" for="price-4">Từ 1 triệu - 3
                                                        triệu</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-5"
                                                        value="tren-3-trieu">
                                                    <label class="form-check-label" for="price-5">Trên 3 triệu</label>
                                                </div>
                                            </div>
                                            <div class="col-12" id="shortprice">
                                                <div class="mb-2"><b>Sắp xếp</b></div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="sort-1"
                                                        value="gia-tang-dan" name="radio-sort">
                                                    <label class="form-check-label" for="sort-1">Giá tăng dần</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="sort-2"
                                                        value="gia-giam-dan" name="radio-sort">
                                                    <label class="form-check-label" for="sort-2">Giá giảm dần</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="sort-3" checked
                                                        value="gia-nothing" name="radio-sort">
                                                    <label class="form-check-label" for="sort-3">Không sắp xếp</label>
                                                </div>

                                            </div>
                                            <div class="col-12">
                                                <button
                                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4"
                                                    id="btnFilter">
                                                    Lọc Sản Phẩm
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <button id="filter-toggle" class="filter-toggle button">Filter</button>
                                    <div class="col-12 col-md-8 text-center">
                                        <div class="row g-4">
                                            <c:if test="${products.size() ==  0}">
                                                <div>Không tìm thấy sản phẩm</div>
                                            </c:if>
                                            <c:forEach var="product" items="${products}">
                                                <div class="col-md-6 col-lg-4">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="/images/product/${product.image}"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Item
                                                        </div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4 style="font-size: 15px;">
                                                                <a href="/product/${product.id}" class="product-name">
                                                                    ${product.name}
                                                                </a>
                                                            </h4>

                                                            <p class="short-desc">${product.shortDesc}</p>
                                                            <div
                                                                class="d-flex  flex-lg-wrap justify-content-center flex-column">
                                                                <p style="font-size: 15px; text-align: center; width: 100%;"
                                                                    class="text-dark  fw-bold mb-3">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${product.price}" />
                                                                    đ
                                                                </p>
                                                                <!-- <form action="/add-product-to-cart/${product.id}"
                                                                    method="post">
                                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                                        value="${_csrf.token}" />

                                                                    <button data-product-id="${product.id}"
                                                                        class="btnAddToCartDetail mx-auto btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Thêm vào giỏ
                                                                    </button>
                                                                </form> -->
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                    value="${_csrf.token}" />
                                                                <input class="form-control d-none" type="text"
                                                                    value="${product.id}" name="id" />

                                                                <input class="form-control d-none" type="text"
                                                                    name="quantity" id="cartDetails0.quantity"
                                                                    value="1" />

                                                                <button data-product-id="${product.id}"
                                                                    class="btnAddToCartDetail mx-auto btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Thêm vào giỏ
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>


                                            <c:if test="${totalPages > 0}">
                                                <div class="pagination d-flex justify-content-center mt-5">
                                                    <li class="page-item">
                                                        <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                            href="/products?page=${currentPage - 1}${queryString}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>
                                                    </li>
                                                    <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                        <li class="page-item">
                                                            <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                                                href="/products?page=${loop.index + 1}${queryString}">
                                                                ${loop.index + 1}
                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                    <li class="page-item">
                                                        <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                            href="/products?page=${currentPage + 1}${queryString}"
                                                            aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>

                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Single Product End -->

                    <jsp:include page="../layout/footer.jsp" />


                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>



                    <!-- Tải jQuery trước -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

                    <!-- Tải jquery.toast.min.js sau khi jQuery được tải -->
                    <script
                        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>

                    <!-- Các script khác -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="<c:url value='/client/lib/easing/easing.min.js' />"></script>
                    <script src="<c:url value='/client/lib/waypoints/waypoints.min.js' />"></script>
                    <script src="<c:url value='/client/lib/lightbox/js/lightbox.min.js' />"></script>
                    <script src="<c:url value='/client/lib/owlcarousel/owl.carousel.min.js' />"></script>
                    <script src="<c:url value='/client/js/main.js?version=4' />"></script>


                    <script>
                        function selectOnlyThis(checkbox) {
                            const checkboxes = document.querySelectorAll('#criteriaFilter .form-check-input');
                            checkboxes.forEach((item) => {
                                if (item !== checkbox) item.checked = false;
                            });
                        }
                        document.querySelector('.filter-toggle').addEventListener('click', function () {
                            var filterContainer = document.querySelector('.col-md-4');
                            if (filterContainer.style.display === 'none') {
                                filterContainer.style.display = 'block';
                            } else {
                                filterContainer.style.display = 'none';
                            }
                        });
                    </script>


                </body>

                </html>