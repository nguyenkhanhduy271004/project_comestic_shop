<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Thông tin cá nhân - Cosmetic Shop</title>

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
            </head>

            <body style="margin-top: 120px;">

                <jsp:include page="../layout/header.jsp" />

                <div class="container mt-5">
                    <h2 class="text-center mb-4">Thông tin cá nhân</h2>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="card d-flex align-items-center">
                                <img style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden; margin-top: 20px;"
                                    src="/images/avatar/${user.avatar}" alt="Avatar logo" />
                                <div class="card-body d-flex align-items-center flex-column">
                                    <h5 class="card-title">
                                        <c:out value="${user.fullName}" />
                                    </h5>
                                    <p class="card-text"><i class="fas fa-envelope"></i>
                                        <c:out value="${user.email}" />
                                    </p>
                                    <p class="card-text"><i class="fas fa-phone"></i>
                                        <c:out value="${user.phone}" />
                                    </p>
                                    <!-- <a href="/profile/edit" class="btn btn-primary">Cập nhật thông tin</a> -->
                                </div>
                            </div>
                        </div>

                        <!-- Personal Information Form -->
                        <div class="col-md-8">
                            <form method="post" action="/profile/update" enctype="multipart/form-data">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <div class="form-group">
                                    <label for="fullName">Tên đầy đủ</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName"
                                        value="${user.fullName}" required>
                                </div>
                                <div class="form-group">
                                    <label for="phone">Số điện thoại</label>
                                    <input type="text" class="form-control" id="phone" name="phone"
                                        value="${user.phone}" required>
                                </div>
                                <div class="form-group">
                                    <label for="address">Địa chỉ</label>
                                    <textarea class="form-control" id="address"
                                        name="address">${user.address}</textarea>
                                </div>
                                <div class="form-group">
                                    <label for="avatar">Ảnh đại diện</label>
                                    <input type="file" class="form-control" id="avatar" name="avatar">
                                </div>
                                <button type="submit" class="btn btn-success mt-4">Cập nhật thông tin</button>
                            </form>
                        </div>
                    </div>




                </div>

                <jsp:include page="../layout/footer.jsp" />

                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="<c:url value='/client/js/main.js' />"></script>
            </body>

            </html>