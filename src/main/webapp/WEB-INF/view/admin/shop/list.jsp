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
                <title>Shop List - Nguyễn Duy</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid">
                                <h1 class="mt-4">Manage Shops</h1>

                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Tên Shop</th>
                                            <th>Mô Tả</th>
                                            <th>Logo</th>
                                            <!-- <th>Trạng Thái</th> -->
                                            <th>Hành Động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="shop" items="${shops}">
                                            <tr>
                                                <td>${shop.id}</td>
                                                <td>${shop.name}</td>
                                                <td>${shop.description}</td>
                                                <td>
                                                    <c:if test="${not empty shop.logo}">
                                                        <img src="/images/logo-shop/${shop.logo}" alt="Logo" width="50"
                                                            height="50" />
                                                    </c:if>
                                                </td>
                                                <!-- <td>${shop.active ? 'Kích hoạt' : 'Không kích hoạt'}</td> -->

                                                <td style="display: flex; gap: 4px;">
                                                    <div>
                                                        <a href="/admin/shops/view/${shop.id}"
                                                            class="btn btn-info">View</a>
                                                    </div>
                                                    <div>
                                                        <a href="/admin/shops/edit/${shop.id}"
                                                            class="btn btn-warning">Edit</a>
                                                    </div>
                                                    <div>
                                                        <form action="/admin/shops/delete/${shop.id}" method="POST"
                                                            onsubmit="return confirm('Bạn chắc chắn muốn xóa shop này?')">
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}" />
                                                            <button type="submit" class="btn btn-danger">Delete</button>
                                                        </form>
                                                    </div>

                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                                <!-- Phân trang -->
                                <div>
                                    <ul class="pagination">
                                        <c:forEach var="i" begin="0" end="${totalPages - 1}">
                                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                                <a class="page-link" href="/admin/shops?page=${i}">${i + 1}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </main>
                    </div>
                </div>
            </body>

            </html>