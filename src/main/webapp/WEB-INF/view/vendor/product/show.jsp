<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Nguyễn Duy - Dự án laptopshop" />
                <meta name="author" content="Nguyễn Duy" />
                <title>Dashboard - Nguyễn Duy</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <style>
                    /* Sửa lại thiết kế form lọc */
                    .filter-form {
                        display: flex;
                        flex-wrap: wrap;
                        gap: 20px;
                        justify-content: center;
                        margin-bottom: 30px;
                    }

                    .filter-form label {
                        width: 150px;
                        font-weight: bold;
                    }

                    .filter-form input {
                        width: 250px;
                        margin-bottom: 15px;
                    }

                    .filter-form button {
                        width: 150px;
                        padding: 10px;
                    }

                    /* Sửa lại bảng sản phẩm */
                    .product-table {
                        width: 100%;
                        margin-top: 30px;
                        border-collapse: collapse;
                    }

                    .product-table th,
                    .product-table td {
                        padding: 12px;
                        text-align: center;
                    }

                    .product-table th {
                        background-color: #f8f9fa;
                        border: 1px solid #dee2e6;
                    }

                    .product-table td {
                        border: 1px solid #dee2e6;
                    }

                    .product-table .action-btn {
                        display: inline-block;
                        margin: 0 5px;
                    }

                    .pagination {
                        justify-content: center;
                    }

                    /* Cải thiện nút Filter */
                    .filter-btn {
                        background-color: #007bff;
                        /* Màu nền xanh */
                        color: #fff;
                        /* Màu chữ trắng */
                        font-size: 16px;
                        /* Kích thước chữ */
                        padding: 10px 20px;
                        /* Khoảng cách xung quanh chữ */
                        border: none;
                        /* Xóa viền mặc định */
                        border-radius: 30px;
                        /* Bo góc nút */
                        transition: all 0.3s ease;
                        /* Hiệu ứng chuyển tiếp khi hover */
                        box-shadow: 0 4px 6px rgba(0, 123, 255, 0.4);
                        /* Đổ bóng nhẹ cho nút */
                    }

                    .filter-btn:hover {
                        background-color: #0056b3;
                        /* Màu nền khi hover */
                        box-shadow: 0 6px 10px rgba(0, 123, 255, 0.6);
                        /* Đổ bóng đậm hơn khi hover */
                        transform: translateY(-2px);
                        /* Nâng nút lên khi hover */
                    }

                    .filter-btn:focus {
                        outline: none;
                        /* Xóa viền khi focus vào nút */
                        box-shadow: 0 0 5px 2px rgba(0, 123, 255, 0.7);
                        /* Thêm hiệu ứng viền focus */
                    }
                </style>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Products</h1>

                                <!-- Form lọc sản phẩm -->
                                <div class="filter-form mt-4">
                                    <form action="/vendor/product" method="get"
                                        class="d-flex flex-wrap justify-content-center align-items-center"
                                        style="gap: 10px;">
                                        <div>
                                            <label for="name">Product Name:</label>
                                            <input type="text" id="name" name="name" class="form-control"
                                                value="${param.name}" placeholder="Enter product name">
                                        </div>
                                        <div>
                                            <label for="minPrice">Min Price:</label>
                                            <input type="number" id="minPrice" name="minPrice" class="form-control"
                                                value="${param.minPrice}" placeholder="Min price">
                                        </div>
                                        <div>
                                            <label for="maxPrice">Max Price:</label>
                                            <input type="number" id="maxPrice" name="maxPrice" class="form-control"
                                                value="${param.maxPrice}" placeholder="Max price">
                                        </div>
                                        <div>
                                            <label for="factory">Factory:</label>
                                            <input type="text" id="factory" name="factory" class="form-control"
                                                value="${param.factory}" placeholder="Enter factory name">
                                        </div>
                                        <div>
                                            <button type="submit" class="btn btn-primary filter-btn">Filter</button>
                                        </div>
                                    </form>
                                </div>

                                <!-- Kiểm tra xem có sản phẩm hay không -->
                                <c:choose>
                                    <c:when test="${not empty products}">
                                        <!-- Bảng sản phẩm -->
                                        <table class="product-table">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Price</th>
                                                    <th>Factory</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="product" items="${products}">
                                                    <!-- Lọc theo tên sản phẩm -->
                                                    <c:if
                                                        test="${empty param.name || product.name.toLowerCase().contains(param.name.toLowerCase())}">
                                                        <!-- Lọc theo giá -->
                                                        <c:if
                                                            test="${(empty param.minPrice || product.price >= param.minPrice) && (empty param.maxPrice || product.price <= param.maxPrice)}">
                                                            <!-- Lọc theo nhà máy -->
                                                            <c:if
                                                                test="${empty param.factory || product.factory.toLowerCase().contains(param.factory.toLowerCase())}">
                                                                <tr>
                                                                    <td>${product.id}</td>
                                                                    <td>${product.name}</td>
                                                                    <td>
                                                                        <fmt:formatNumber type="number"
                                                                            value="${product.price}" /> đ
                                                                    </td>
                                                                    <td>${product.factory}</td>
                                                                    <td>
                                                                        <a href="/vendor/product/${product.id}"
                                                                            class="btn btn-success action-btn">View</a>
                                                                        <a href="/vendor/product/update/${product.id}"
                                                                            class="btn btn-warning action-btn">Update</a>
                                                                        <a href="/vendor/product/delete/${product.id}"
                                                                            class="btn btn-danger action-btn">Delete</a>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                        <!-- Phân trang -->
                                        <nav aria-label="Page navigation example" style="margin: 20px;">
                                            <ul class="pagination">
                                                <li class="page-item ${currentPage eq 1 ? 'disabled' : ''}">
                                                    <a class="page-link" href="/vendor/product?page=${currentPage - 1}"
                                                        aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                                <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                    <li class="page-item ${loop.index eq currentPage ? 'active' : ''}">
                                                        <a class="page-link"
                                                            href="/vendor/product?page=${loop.index}">${loop.index}</a>
                                                    </li>
                                                </c:forEach>
                                                <li class="page-item ${currentPage eq totalPages ? 'disabled' : ''}">
                                                    <a class="page-link" href="/vendor/product?page=${currentPage + 1}"
                                                        aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- Hiển thị khi không có sản phẩm -->
                                        <div class="alert alert-warning text-center mt-4">
                                            Hiện tại không có sản phẩm.
                                        </div>
                                    </c:otherwise>
                                </c:choose>
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