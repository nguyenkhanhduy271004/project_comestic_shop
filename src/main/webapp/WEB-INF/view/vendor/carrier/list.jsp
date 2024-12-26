<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Nguyễn Duy - Dự án laptopshop" />
                <meta name="author" content="Nguyễn Duy" />
                <title>Manager Carrier - Nguyễn Duy</title>
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
                            <div class="container-fluid px-4">
                                <h1 class="mt-4 mb-4">Manage Carriers</h1>
                                <div class="mt-4 mb-2">
                                    <a href="/vendor/add-carriers" class="btn btn-success">
                                        <i class="fas fa-plus"></i> Add Carrier
                                    </a>
                                </div>

                                <!-- Table Card -->
                                <div class="card">
                                    <div class="card-header bg-primary text-white">
                                        <h5 class="card-title mb-0">List Carriers</h5>
                                    </div>
                                    <div class="card-body">
                                        <table class="table table-hover table-bordered">
                                            <thead class="table-primary">
                                                <tr>
                                                    <th scope="col" style="width: 10%">ID</th>
                                                    <th scope="col" style="width: 90%">Name carrier</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="carrier" items="${carriers}">
                                                    <tr>
                                                        <td>${carrier.id}</td>
                                                        <td>${carrier.name}</td>
                                                    </tr>
                                                </c:forEach>
                                                <c:if test="${empty carriers}">
                                                    <tr>
                                                        <td colspan="2" class="text-center text-muted">Không có dữ liệu
                                                        </td>
                                                    </tr>
                                                </c:if>
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