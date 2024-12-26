<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <div class="fixed-top">
            <div class="bg-gradient">
                <div class="menu-content d-flex justify-content-center">
                    <div class="menu-item">Freeship 15K cho tất cả đơn hàng mỹ phẩm</div>
                    <div class="separator mx-2">|</div>
                    <div class="menu-item">Mua sắm dễ dàng, nhận hàng tại cửa hàng gần nhất</div>
                    <div class="separator mx-2">|</div>
                    <div class="menu-item">Giảm giá đặc biệt cho khách hàng</div>
                </div>
            </div>
            <div class="container px-0">

                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="/" class="navbar-brand">
                        <img src="<c:url value='/client/img/imgThuonghieu/4.png' />" alt="Shop logo"
                            style="width: 70px;" />
                        <!-- <h1 class="text-primary display-6">Cosmetic Shop</h1> -->
                    </a>
                    <!-- Search Box -->
                    <form class="search-form-mobile d-flex mx-3" action="/search" method="get">
                        <input type="text" name="query" class="form-control search-test"
                            placeholder="Top 3 kem chống nắng HOT nhất" />
                        <button type="submit" class="btn search-button">
                            <i class="fas fa-search"></i>
                        </button>
                    </form>
                    <input type="checkbox" name="menu-checkbox" id="menu-checkbox" class="menu-checkbox" hidden />
                    <label for="menu-checkbox">
                        <svg class="menu-mobile-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                            <path
                                d="M0 96C0 78.3 14.3 64 32 64l384 0c17.7 0 32 14.3 32 32s-14.3 32-32 32L32 128C14.3 128 0 113.7 0 96zM0 256c0-17.7 14.3-32 32-32l384 0c17.7 0 32 14.3 32 32s-14.3 32-32 32L32 288c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32L32 448c-17.7 0-32-14.3-32-32s14.3-32 32-32l384 0c17.7 0 32 14.3 32 32z" />
                        </svg>
                    </label>
                    <!-- overlay -->
                    <label for="menu-checkbox" class="menu-overlay"> </label>
                    <!-- menu content -->
                    <div class="menu-drawer">
                        <!-- menu top -->
                        <div class="menu-drawer__top">
                            <!-- logo -->
                            <a href="http://127.0.0.1:5501/index.html" class="logo__mobile">
                                <img src="../client/img/imgThuonghieu/4.png" class="img_logo" />
                            </a>
                            <!-- icon close -->
                            <label for="menu-checkbox">
                                <svg class="close__menu" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                                    <path fill="currentConlor"
                                        d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z" />
                                </svg>
                            </label>
                        </div>
                        <!-- navigation mobile -->
                        <ul id="navbar__list--mobile">
                            <li class="navbar__item"><a href="#">Home</a></li>
                            <li class="navbar__item"><a href="/about">About</a></li>
                            <!-- <li class="navbar__item"><a href="#">New</a></li> -->
                            <li class="navbar__item"><a href="/contact">Contact</a></li>
                        </ul>
                    </div>
                    <%-- <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" --%>
                        <%-- data-bs-target="#navbarCollapse">--%>
                            <%-- <span class="fa fa-bars text-primary"></span>--%>
                                <%-- </button>--%>
                                    <div class="collapse navbar-collapse bg-white justify-content-between mx-5"
                                        id="navbarCollapse">

                                        <!-- Navigation Links -->
                                        <div class="navbar-nav">
                                            <a href="/" class="nav-item nav-link active" style="color: #000;">Home</a>
                                            <a href="/about" class="nav-item nav-link" style="color: #000;">About</a>
                                            <!-- <a href="/new" class="nav-item nav-link" style="color: #000;">New</a> -->
                                            <a href="/contact" class="nav-item nav-link"
                                                style="color: #000;">Contact</a>
                                        </div>

                                        <!-- Search Box -->
                                        <form class="search-form d-flex mx-3" action="/search" method="get">
                                            <input type="text" name="query" class="form-control search-test"
                                                placeholder="Top 3 kem chống nắng HOT nhất" />
                                            <button type="submit" class="btn search-button">
                                                <i class="fas fa-search"></i>
                                            </button>
                                        </form>

                                        <!-- Login and Cart Section -->
                                        <div class="d-flex m-3 me-0">
                                            <c:if test="${not empty pageContext.request.userPrincipal}">
                                                <a href="/cart" class="position-relative my-auto me-4">
                                                    <i class="fa fa-shopping-bag fa-2x" style="color: #e7456f;"></i>
                                                    <span
                                                        class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                                                        style="top: -5px; left: 15px; height: 20px; min-width: 20px;"
                                                        id="sumCart">
                                                        ${sessionScope.sum}
                                                    </span>
                                                </a>
                                                <div class="dropdown my-auto">
                                                    <a href="#" class="dropdown" role="button" id="dropdownMenuLink"
                                                        data-bs-toggle="dropdown" aria-expanded="false"
                                                        data-bs-toggle="dropdown" aria-expanded="false">
                                                        <i class="fas fa-user fa-2x" style="color: #e7456f;"></i>
                                                    </a>

                                                    <ul class="dropdown-menu dropdown-menu-end p-4"
                                                        aria-labelledby="dropdownMenuLink">
                                                        <li class="d-flex align-items-center flex-column"
                                                            style="min-width: 300px;">
                                                            <img style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;"
                                                                src="<c:url value='/client/img/avatar/5.png' />"
                                                                alt="Avatar logo" />
                                                            <div class="text-center my-3">
                                                                <c:out value="${sessionScope.fullName}" />
                                                            </div>
                                                        </li>

                                                        <li>
                                                            <a class="dropdown-item" href="/forgot-password">Đổi mật
                                                                khẩu</a>
                                                        </li>


                                                        <li><a class="dropdown-item" href="/profile">Quản lý tài
                                                                khoản</a></li>

                                                        <li><a class="dropdown-item" href="/order-history">Lịch sử mua
                                                                hàng</a></li>
                                                        <li><a class="dropdown-item" href="/user/wishlist">Sản phẩm yêu
                                                                thích</a></li>
                                                        <li>
                                                        <li>
                                                            <c:if
                                                                test="${sessionScope.role == 'ADMIN' or sessionScope.role == 'VENDOR'}">
                                                                <a href="/chat" class="nav-item nav-link"
                                                                    style="color: #000;">Hỗ trợ người bán</a>
                                                            </c:if>
                                                        </li>



                                                        <hr class="dropdown-divider">
                                                        </li>
                                                        <li>
                                                            <form method="post" action="/logout">
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                    value="${_csrf.token}" />
                                                                <button class="dropdown-item">Đăng xuất</button>
                                                            </form>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </c:if>
                                            <c:if test="${empty pageContext.request.userPrincipal}">
                                                <a href="/login" class="a-login position-relative my-auto">
                                                    Đăng nhập
                                                </a>
                                            </c:if>
                                        </div>
                                    </div>
                </nav>
            </div>
        </div>