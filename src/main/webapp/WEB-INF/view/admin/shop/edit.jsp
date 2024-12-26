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
                <title>Create User - Nguyễn Duy</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Shop</h1>

                                <!-- Thông báo thành công hoặc lỗi -->
                                <c:if test="${not empty successMessage}">
                                    <div class="alert alert-success" role="alert">
                                        ${successMessage}
                                    </div>
                                </c:if>
                                <c:if test="${not empty errorMessage}">
                                    <div class="alert alert-danger" role="alert">
                                        ${errorMessage}
                                    </div>
                                </c:if>

                                <form action="<c:url value='/admin/shops/edit/${shop.id}' />" method="post">
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Name</label>
                                        <input type="text" id="name" name="name" class="form-control"
                                            value="${shop.name}" required />
                                    </div>

                                    <div class="mb-3">
                                        <label for="description" class="form-label">Description</label>
                                        <textarea id="description" name="description"
                                            class="form-control">${shop.description}</textarea>
                                    </div>

                                    <div class="mb-3">
                                        <label for="logo" class="form-label">Logo</label>
                                        <input type="text" id="logo" name="logo" class="form-control"
                                            value="${shop.logo}" />
                                    </div>

                                    <div class="mb-3">
                                        <label for="homepageContent" class="form-label">Homepage Content</label>
                                        <textarea id="homepageContent" name="homepageContent"
                                            class="form-control">${shop.homepageContent}</textarea>
                                    </div>

                                    <div class="form-check mb-3">
                                        <input type="checkbox" id="active" name="active" class="form-check-input"
                                            ${shop.active ? 'checked' : '' }>
                                        <label for="active" class="form-check-label">Active</label>
                                    </div>

                                    <div class="mb-3">
                                        <button type="submit" class="btn btn-primary">Save Changes</button>
                                    </div>

                                    <!-- CSRF token -->
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </form>
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