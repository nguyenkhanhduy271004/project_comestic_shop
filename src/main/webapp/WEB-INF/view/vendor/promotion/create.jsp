<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="Nguyễn Duy - Dự án laptopshop">
            <meta name="author" content="Nguyễn Duy">
            <title>${promotion.id == null ? 'Thêm' : 'Sửa'} Chương trình Khuyến mãi - Nguyễn Duy</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="/css/styles.css">
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        </head>

        <body class="sb-nav-fixed bg-light">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main class="py-5">
                        <div class="card shadow-sm mx-auto" style="max-width: 700px;">
                            <div class="card-header bg-primary text-white text-center">
                                <h2 class="mb-0">${promotion.id == null ? 'Thêm' : 'Sửa'} Chương trình Khuyến mãi</h2>
                            </div>
                            <div class="card-body">
                                <form
                                    action="${promotion.id == null ? '/vendor/promotion/add' : '/vendor/promotion/edit'}"
                                    method="post" class="form">
                                    <input type="hidden" name="id" value="${promotion.id}">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />


                                    <div class="mb-3">
                                        <label for="name" class="form-label">Tên Khuyến mãi</label>
                                        <input type="text" id="name" name="name" class="form-control"
                                            value="${promotion.name}" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="description" class="form-label">Mô tả</label>
                                        <textarea id="description" name="description" class="form-control" rows="3"
                                            placeholder="Mô tả ngắn về khuyến mãi">${promotion.description}</textarea>
                                    </div>

                                    <div class="mb-3">
                                        <label for="discountRate" class="form-label">Giảm giá (%)</label>
                                        <input type="number" id="discountRate" name="discountRate" class="form-control"
                                            value="${promotion.discountRate}" min="1" max="100" required>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="startDate" class="form-label">Ngày bắt đầu</label>
                                            <input type="date" id="startDate" name="startDate" class="form-control"
                                                value="${promotion.startDate}" required>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="endDate" class="form-label">Ngày kết thúc</label>
                                            <input type="date" id="endDate" name="endDate" class="form-control"
                                                value="${promotion.endDate}" required>
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary px-4 py-2 rounded-pill">
                                            <i class="fas fa-save me-2"></i>${promotion.id == null ? 'Thêm Khuyến mãi' :
                                            'Cập nhật Khuyến mãi'}
                                        </button>
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
        </body>

        </html>