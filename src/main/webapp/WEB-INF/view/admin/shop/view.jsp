<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Nguyễn Duy - Dự án laptopshop" />
                <meta name="author" content="Nguyễn Duy" />
                <title>Shop Details - Nguyễn Duy</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                    rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <style>
                    .shop-details {
                        /* border: 1px solid #ddd;
                        border-radius: 8px;
                        padding: 30px; */
                        /* box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); */
                        /* background-color: #f9f9f9; */
                    }

                    .shop-details h1 {
                        font-size: 2rem;
                        margin-bottom: 20px;
                        color: #343a40;
                    }

                    .shop-details p {
                        font-size: 1.1rem;
                        color: #6c757d;
                    }

                    .shop-details .btn {
                        background-color: #007bff;
                        color: #fff;
                        border-radius: 4px;
                        text-decoration: none;
                    }

                    .shop-details .btn:hover {
                        background-color: #0056b3;
                    }

                    .shop-header {
                        text-align: center;
                        margin-bottom: 30px;
                    }

                    .shop-logo {
                        max-width: 150px;
                        max-height: 150px;
                        border-radius: 8px;
                        object-fit: cover;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    }

                    .card {
                        border: none;
                        border-radius: 10px;
                        margin-bottom: 20px;
                    }

                    .card-body {
                        padding: 20px;
                    }
                </style>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(function () {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <div class="shop-details">
                                    <div class="shop-header">
                                        <h1>Shop Details</h1>
                                        <img src="/images/logo-shop/${shop.logo}" alt="Shop Logo" class="shop-logo">
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="">
                                                <div class="card-body">
                                                    <h5 class="card-title"><i class="fas fa-info-circle"></i> Shop
                                                        Information</h5>
                                                    <p><strong>ID:</strong> ${shop.id}</p>
                                                    <p><strong>Name:</strong> ${shop.name}</p>
                                                    <p><strong>Description:</strong> ${shop.description}</p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title"><i class="fas fa-link"></i> Homepage</h5>
                                                    <p><strong>Homepage Content:</strong></p>
                                                    <div class="alert alert-info">${shop.homepageContent}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="text-center mt-4">
                                        <p><strong>Active:</strong> ${shop.active ? "Yes" : "No"}</p>
                                        <a href="<c:url value='/admin/shops' />" class="btn btn-primary">Back to Shop
                                            List</a>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>