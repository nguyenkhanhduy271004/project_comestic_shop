<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>Register - Cosmetic Shop</title>
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

                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                <link href="/client/css/bootstrap.min.css" rel="stylesheet">

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
                <meta name="_csrf" content="${_csrf.token}" />
                <meta name="_csrf_header" content="${_csrf.headerName}" />
                <style>
                    body {
                        background-color: #f7f4f3;
                        font-family: 'Open Sans', sans-serif;
                        color: #333;
                        margin-top: 100px;
                    }

                    .card {
                        border-radius: 15px;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                        margin-top: 50px;
                        padding: 40px 30px;
                        background-color: #fff;
                    }

                    .header-title {
                        font-size: 2rem;
                        color: #007bff;
                        font-weight: 600;
                        margin-bottom: 20px;
                        text-align: center;
                    }

                    .form-control {
                        border-radius: 8px;
                        padding: 10px 15px;
                        font-size: 1rem;
                        border: 1px solid #ddd;
                        transition: border-color 0.3s ease-in-out;
                    }

                    .form-control:focus {
                        border-color: #007bff;
                        box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
                    }

                    .btn-primary {
                        border-radius: 8px;
                        background-color: #007bff;
                        border: none;
                        padding: 12px 20px;
                        font-size: 1.1rem;
                        width: 100%;
                        transition: background-color 0.3s;
                    }

                    .btn-primary:hover {
                        background-color: #0056b3;
                    }

                    .form-group {
                        margin-bottom: 20px;
                    }

                    .alert {
                        border-radius: 8px;
                        font-size: 1rem;
                    }

                    .alert-danger {
                        background-color: #f8d7da;
                        color: #721c24;
                    }

                    .form-group label {
                        font-weight: 600;
                        margin-bottom: 10px;
                    }

                    .card-body {
                        max-width: 500px;
                        margin: 0 auto;
                    }

                    /* Styling for file input */
                    .form-control-file {
                        border-radius: 8px;
                        padding: 10px;
                    }

                    /* Styling for the form */
                    form {
                        /* margin-top: 30px; */
                    }
                </style>
            </head>

            <body>

                <jsp:include page="../layout/header.jsp" />

                <div class="container py-5 mt-5">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="header-title">Shop Registration</h2>

                            <c:if test="${not empty error}">
                                <div class="alert alert-danger">${error}</div>
                            </c:if>

                            <c:if test="${result.hasErrors()}">
                                <div class="alert alert-danger">
                                    <c:forEach items="${result.allErrors}" var="error">
                                        <p>${error.defaultMessage}</p>
                                    </c:forEach>
                                </div>
                            </c:if>

                            <form action="<c:url value='/shop/register' />" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                <div class="form-group">
                                    <label for="name">Shop Name</label>
                                    <input type="text" class="form-control" id="name" name="name"
                                        placeholder="Enter your shop name" required>
                                </div>

                                <div class="form-group">
                                    <label for="description">Description</label>
                                    <textarea class="form-control" id="description" name="description" rows="3"
                                        placeholder="Describe your shop" required></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="logo">Logo</label>
                                    <input type="file" class="form-control-file" id="logo" name="logo" required>
                                </div>



                                <button type="submit" class="btn btn-primary">Register Shop</button>
                            </form>
                        </div>
                    </div>
                </div>

                <jsp:include page="../layout/footer.jsp" />

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                <script src="/client/js/main.js"></script>
            </body>

            </html>