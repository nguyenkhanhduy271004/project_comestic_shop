<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="Nguyễn Duy - Dự án laptopshop" />
            <meta name="author" content="Nguyễn Duy" />
            <title>Dashboard - Thêm Nhà Vận Chuyển</title>
            <link href="/css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <meta name="_csrf" content="${_csrf.token}" />
            <meta name="_csrf_header" content="${_csrf.headerName}" />
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container mt-5">
                            <h1 class="text-center mb-4">Thêm Nhà Vận Chuyển</h1>
                            <div class="card shadow-sm p-4">
                                <form action="${pageContext.request.contextPath}/admin/carrier/add" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                    <div class="form-group mb-3">
                                        <label for="name" class="form-label">Tên nhà vận chuyển:</label>
                                        <input type="text" class="form-control" id="name" name="name"
                                            placeholder="Nhập tên nhà vận chuyển" required />
                                    </div>

                                    <div class="form-group mb-4">
                                        <label for="shippingFee" class="form-label">Phí vận chuyển:</label>
                                        <input type="number" class="form-control" id="shippingFee" name="shippingFee"
                                            placeholder="Nhập phí vận chuyển" required step="0.01" />
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary px-5">
                                            <i class="fas fa-save"></i> Lưu
                                        </button>
                                        <a href="${pageContext.request.contextPath}/admin/carrier"
                                            class="btn btn-secondary px-5 ms-2">
                                            <i class="fas fa-arrow-left"></i> Quay lại
                                        </a>
                                    </div>
                                </form>
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