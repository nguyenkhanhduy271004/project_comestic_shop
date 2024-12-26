<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <div class="container mt-5">
                                    <h1 class="text-center mb-4">Manage Carriers</h1>

                                    <div class="text-right mb-3">
                                        <a href="${pageContext.request.contextPath}/admin/carrier/add"
                                            class="btn btn-primary">
                                            <i class="fas fa-plus"></i> Thêm
                                        </a>
                                    </div>

                                    <table class="table table-bordered table-striped">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>Tên nhà vận chuyển</th>
                                                <th>Phí vận chuyển</th>
                                                <th>Thao tác</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="carrier" items="${carriers}">
                                                <tr>
                                                    <td>
                                                        <c:out value="${carrier.name}" />
                                                    </td>
                                                    <td>
                                                        <fmt:formatNumber type="number"
                                                            value="${carrier.shippingFee}" /> đ
                                                    </td>
                                                    <td>
                                                        <a href="${pageContext.request.contextPath}/admin/carrier/edit/${carrier.id}"
                                                            class="btn btn-warning btn-sm">
                                                            <i class="fas fa-edit"></i> Chỉnh sửa
                                                        </a>
                                                        <a href="${pageContext.request.contextPath}/admin/carrier/delete/${carrier.id}"
                                                            class="btn btn-danger btn-sm"
                                                            onclick="return confirm('Bạn có chắc muốn xóa?')">
                                                            <i class="fas fa-trash-alt"></i> Xóa
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
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