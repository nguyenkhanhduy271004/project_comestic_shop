<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="Nguyễn Duy - Dự án laptopshop" />
            <meta name="author" content="Nguyễn Duy" />
            <title>Create Product - Nguyễn Duy</title>
            <link href="/css/styles.css" rel="stylesheet" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <script>
                $(document).ready(() => {
                    const avatarFile = $("#avatarFile");
                    avatarFile.change(function (e) {
                        const imgURL = URL.createObjectURL(e.target.files[0]);
                        $("#avatarPreview").attr("src", imgURL).show();
                    });
                });
            </script>
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        </head>

        <body class="sb-nav-fixed bg-light">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4" style="display: flex; justify-content: center;">Manage Promotions </h1>
                            <!-- <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/vendor" class="text-decoration-none">Dashboard</a>
                                </li>
                                <li class="breadcrumb-item"><a href="/vendor/product" class="text-decoration-none">Sản
                                        phẩm</a></li>
                                <li class="breadcrumb-item active">Chương trình Khuyến mãi</li>
                            </ol> -->
                            <div class="card shadow-sm mt-5">
                                <div
                                    class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                    <h5 class="mb-0">Danh sách chương trình khuyến mãi</h5>
                                    <a href="/vendor/promotion/add" class="btn btn-light btn-sm">+ Thêm Khuyến mãi
                                        mới</a>
                                </div>
                                <div class="card-body">
                                    <table class="table table-bordered table-hover text-center align-middle">
                                        <thead class="table-primary">
                                            <tr>
                                                <th scope="col">Tên</th>
                                                <th scope="col">Mô tả</th>
                                                <th scope="col">Giảm giá (%)</th>
                                                <th scope="col">Ngày bắt đầu</th>
                                                <th scope="col">Ngày kết thúc</th>
                                                <th scope="col">Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="promotion" items="${promotions}">
                                                <tr>
                                                    <td>${promotion.name}</td>
                                                    <td>${promotion.description}</td>
                                                    <td>${promotion.discountRate}</td>
                                                    <td>${promotion.startDate}</td>
                                                    <td>${promotion.endDate}</td>
                                                    <td>
                                                        <a href="/vendor/promotion/edit/${promotion.id}"
                                                            class="btn btn-warning btn-sm me-1">
                                                            <i class="fas fa-edit"></i> Sửa
                                                        </a>
                                                        <a href="/vendor/promotion/delete/${promotion.id}"
                                                            class="btn btn-danger btn-sm">
                                                            <i class="fas fa-trash-alt"></i> Xóa
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
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