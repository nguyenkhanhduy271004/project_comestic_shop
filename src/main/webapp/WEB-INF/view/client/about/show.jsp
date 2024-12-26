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
                <style>
                    /* Reset some basic styling */
                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                    }

                    body {
                        font-family: Arial, sans-serif;
                        line-height: 1.6;
                        background-color: #f8f8f8;
                        color: #333;
                    }

                    /* Header */
                    header {
                        background-color: #fff;
                        padding: 20px 0;
                        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                    }

                    nav {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        max-width: 1200px;
                        margin: 0 auto;
                        padding: 0 20px;
                    }

                    nav .logo img {
                        height: 50px;
                    }

                    nav .nav-links {
                        list-style: none;
                        display: flex;
                    }

                    nav .nav-links li {
                        margin-left: 30px;
                    }

                    nav .nav-links a {
                        text-decoration: none;
                        color: #333;
                        font-size: 1rem;
                    }

                    nav .nav-links a:hover {
                        color: #007bff;
                    }

                    /* Intro Section */
                    .intro {
                        background-color: #f9f9f9;
                        padding: 50px 0;
                        text-align: center;
                    }

                    .intro h1 {
                        font-size: 2.5rem;
                        margin-bottom: 20px;
                        color: #007bff;
                    }

                    .intro p {
                        font-size: 1.2rem;
                        color: #555;
                    }

                    /* Core Values */
                    .core-values {
                        padding: 50px 0;
                        background-color: #fff;
                    }

                    .core-values h2 {
                        text-align: center;
                        font-size: 2rem;
                        margin-bottom: 40px;
                        color: #007bff;
                    }

                    .values {
                        display: flex;
                        justify-content: space-around;
                        text-align: center;
                    }

                    .value {
                        width: 30%;
                    }

                    .value h3 {
                        font-size: 1.5rem;
                        color: #333;
                    }

                    .value p {
                        font-size: 1rem;
                        color: #777;
                    }

                    /* Team Section */
                    .team {
                        padding: 50px 0;
                        background-color: #f9f9f9;
                    }

                    .team h2 {
                        text-align: center;
                        font-size: 2rem;
                        margin-bottom: 40px;
                        color: #007bff;
                    }

                    .team-members {
                        gap: 10px;
                        display: flex;
                        justify-content: space-around;
                        text-align: center;
                    }

                    .member {
                        width: 30%;
                    }

                    .member img {
                        width: 100%;
                        /* height: 500px; */
                        height: 60%;
                        border-radius: 50%;
                        margin-bottom: 20px;
                    }

                    .member h3 {
                        font-size: 1.2rem;
                        color: #333;
                    }

                    .member p {
                        font-size: 1rem;
                        color: #777;
                    }

                    /* Contact Info */
                    .contact-info {
                        padding: 50px 0;
                        background-color: #fff;
                        text-align: center;
                    }

                    .contact-info h2 {
                        font-size: 2rem;
                        margin-bottom: 20px;
                        color: #007bff;
                    }

                    .contact-info ul {
                        list-style: none;
                        font-size: 1rem;
                        color: #555;
                    }

                    .contact-info ul li {
                        margin-bottom: 10px;
                    }

                    /* Footer */
                    footer {
                        background-color: #333;
                        color: #fff;
                        padding: 20px 0;
                        text-align: center;
                    }

                    @media (max-width: 768px) {

                        .core-values h2,
                        .intro h1 {
                            font-size: 2rem;
                        }

                        .core-values .values {
                            flex-direction: column;
                            align-items: center;
                        }

                        .value {
                            width: 80%;
                            margin-bottom: 20px;
                        }

                        .image-grid {
                            flex-direction: column;
                            align-items: center;
                        }

                        .image-grid .image-item {
                            width: 80%;
                            margin-bottom: 20px;
                        }
                    }

                    @media (max-width: 480px) {
                        .intro p {
                            font-size: 1rem;
                        }

                        .core-values .value {
                            width: 100%;
                        }
                    }
                </style>
            </head>

            <body>

                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>

                <jsp:include page="../layout/header.jsp" />

                <%--<jsp:include page="../layout/carousel.jsp" />--%>

                <section class="intro" style="margin-top: 140px">
                    <div class="container">
                        <h1>Chào mừng đến với Cửa Hàng Mỹ Phẩm</h1>
                        <p>
                            Chúng tôi cung cấp các sản phẩm chăm sóc sắc đẹp chất lượng cao,
                            giúp bạn luôn rạng rỡ và tự tin.
                        </p>
                    </div>
                </section>

                <!-- Giá trị cốt lõi -->
                <section class="core-values">
                    <div class="container">
                        <h2>Giá trị cốt lõi của chúng tôi</h2>
                        <div class="values">
                            <div class="value">
                                <h3>Chất lượng</h3>
                                <p>
                                    Chúng tôi chỉ bán các sản phẩm mỹ phẩm có nguồn gốc rõ ràng, an
                                    toàn và hiệu quả.
                                </p>
                            </div>
                            <div class="value">
                                <h3>Đổi mới</h3>
                                <p>
                                    Luôn cập nhật xu hướng và công nghệ mới nhất để mang đến những
                                    sản phẩm tối ưu nhất cho bạn.
                                </p>
                            </div>
                            <div class="value">
                                <h3>Uy tín</h3>
                                <p>
                                    Khách hàng của chúng tôi luôn là ưu tiên hàng đầu. Chúng tôi cam
                                    kết phục vụ bạn một cách tốt nhất.
                                </p>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Đội ngũ -->
                <section class="team">
                    <div class="container">
                        <h2>Đội ngũ của chúng tôi</h2>
                        <div class="team-members">
                            <div class="member">
                                <img src="/client/img/avatar/nghia.jpg" alt="Đội ngũ 1" />
                                <h3>Lê Quang Trọng Nghĩa</h3>
                                <p>Giám đốc điều hành</p>
                            </div>
                            <div class="member">
                                <img src="/client/img/avatar/duy.jpg" alt="Đội ngũ 2" />
                                <h3>Nguyễn Khánh Duy</h3>
                                <p>Giám đốc kinh doanh</p>
                            </div>
                            <div class="member">
                                <img src="/client/img/avatar/lap.jpg" alt="Đội ngũ 3" />
                                <h3>Phan Quốc Lập</h3>
                                <p>Giám đốc nghiên cứu sản phẩm</p>
                            </div>
                            <div class="member">
                                <img src="/client/img/avatar/hungceo.png" alt="Đội ngũ 4" />
                                <h3>Nguyễn Quang Hùng</h3>
                                <p>Giám đốc tư vấn sắc đẹp</p>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Liên hệ -->
                <section class="contact-info">
                    <div class="container">
                        <h2>Liên hệ với chúng tôi</h2>
                        <p>
                            Chúng tôi luôn sẵn sàng hỗ trợ bạn. Hãy liên hệ với chúng tôi qua
                            các kênh dưới đây:
                        </p>
                        <ul>
                            <li>Email: support@mypham.com</li>
                            <li>Điện thoại: +84 123 456 789</li>
                            <li>Địa chỉ: 123 Đường ABC, TP.HCM, Việt Nam</li>
                        </ul>
                    </div>
                </section>
                </main>

                <!-- Footer -->
                <footer>
                    <div class="container">
                        <p>&copy; 2024 Cửa Hàng Mỹ Phẩm. Tất cả các quyền được bảo lưu.</p>
                    </div>
                </footer>

                <%--<jsp:include page="../layout/feature.jsp" />--%>
                <%--<jsp:include page="../layout/footer.jsp" />--%>

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
                <!--
                <script src="<c:url value='/client/js/carousel-prev-next.js' />"></script>
                <script src="<c:url value='/client/js/add-product-storage.js' />"></script>
                <script src="<c:url value='/client/js/add-cart.js' />"></script>
                <script src="<c:url value='/client/js/cart-show.js' />"></script> -->
            </body>

            </html>