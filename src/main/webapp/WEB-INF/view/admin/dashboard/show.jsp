<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="Nguyễn Duy - Dự án laptopshop" />
            <meta name="author" content="Nguyễn Duy" />
            <title>Dashboard - Nguyễn Duy</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link href="css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    background-color: #f4f6f9;
                    color: #333;
                }

                .card {
                    border-radius: 10px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    transition: transform 0.2s ease-in-out;
                }

                .card:hover {
                    transform: translateY(-5px);
                }

                .card-body {
                    font-size: 1.2em;
                    font-weight: 600;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    height: 100px;
                }

                .card-footer {
                    background-color: rgba(255, 255, 255, 0.2);
                    border-top: 1px solid rgba(255, 255, 255, 0.1);
                }

                .stretched-link {
                    font-weight: bold;
                }

                .container-fluid {
                    padding: 2em;
                }

                .breadcrumb {
                    background: none;
                    font-size: 1.1em;
                    font-weight: 500;
                }

                .breadcrumb-item a {
                    color: #007bff;
                }

                .breadcrumb-item.active {
                    color: #6c757d;
                }

                /* CSS cho phần biểu đồ */
                .chart-container {
                    width: 100%;
                    max-width: 800px;
                    margin: 2em auto;
                }

                canvas {
                    width: 100% !important;
                    height: 400px;
                }
            </style>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4" style="margin-top: 180px;">
                            <h1 class="mt-4">Dashboard</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Thống kê</li>
                            </ol>
                            <div class="row">
                                <div class="col-xl-4 col-md-6">
                                    <div class="card bg-primary text-white mb-4">
                                        <div class="card-body">Số lượng User (${countUsers})</div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link" href="/admin/user">Xem chi
                                                tiết</a>
                                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-md-6">
                                    <div class="card bg-danger text-white mb-4">
                                        <div class="card-body">Số lượng Product (${countProducts})</div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link" href="/admin/product">Xem chi
                                                tiết</a>
                                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-md-6">
                                    <div class="card bg-success text-white mb-4">
                                        <div class="card-body">Số lượng Order (${countOrders})</div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link" href="/admin/order">Xem chi
                                                tiết</a>
                                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Biểu đồ thu nhập theo tháng -->
                            <div class="chart-container">
                                <h4 class="text-center">Thu nhập theo tháng</h4>
                                <canvas id="incomeChart"></canvas>
                            </div>
                        </div>
                    </main>
                    <jsp:include page="../layout/footer.jsp" />
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="js/scripts.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                crossorigin="anonymous"></script>
            <script>
                // Dữ liệu thu nhập theo tháng (thêm tháng có thu nhập = 0 cho các tháng không có dữ liệu)
                var incomeData = {
                    labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
                    datasets: [{
                        label: 'Thu nhập (VND)',
                        data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 14000000, 15000000, 16000000], // Dữ liệu thu nhập cho 3 tháng và 0 cho các tháng còn lại
                        backgroundColor: 'rgba(0, 123, 255, 0.6)',
                        borderColor: 'rgba(0, 123, 255, 1)',
                        borderWidth: 1
                    }]
                };

                // Cấu hình biểu đồ
                var ctx = document.getElementById('incomeChart').getContext('2d');
                var incomeChart = new Chart(ctx, {
                    type: 'bar', // Chọn loại biểu đồ là cột
                    data: incomeData,
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    stepSize: 2000000,
                                    callback: function (value) { return value.toLocaleString(); } // Định dạng số
                                }
                            }
                        }
                    }
                });
            </script>
        </body>

        </html>