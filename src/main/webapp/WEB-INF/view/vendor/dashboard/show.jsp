<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="Nguyễn Duy - Dự án cosmetic shop" />
            <meta name="author" content="Nguyễn Duy" />
            <title>Dashboard - Quản lý doanh thu</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link href="css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

            <!-- Thêm Chart.js -->
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
                    height: 500px;
                    /* Tăng chiều cao của khung chứa biểu đồ */
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

                /* Custom style for chart */
                .chart-container {
                    margin-top: 30px;
                }

                #revenueChart {
                    width: 100% !important;
                    height: 100% !important;
                }
            </style>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4" style="margin-top: 300px;">
                            <h1 class="mt-4" style="margin-bottom: 100px;">Dashboard - Quản lý doanh thu</h1>
                            <div class="row">
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-info text-white mb-4">
                                        <div class="card-body" style="height: 100px;">
                                            Tổng Doanh Thu: ${totalRevenue != null ? totalRevenue : "7.234.000"} VND
                                        </div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link" href="#">Xem chi tiết</a>
                                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-primary text-white mb-4">
                                        <div class="card-body" style="height: 100px;">Số lượng khách hàng: ${countUsers
                                            != null ? countUsers :
                                            0}</div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link" href="/vendor/user">Xem chi
                                                tiết</a>
                                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-danger text-white mb-4">
                                        <div class="card-body" style="height: 100px;">Số lượng sản phẩm: ${countProducts
                                            != null ?
                                            countProducts : 0}</div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link" href="/vendor/product">Xem chi
                                                tiết</a>
                                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-md-6">
                                    <div class="card bg-success text-white mb-4">
                                        <div class="card-body" style="height: 100px;">Số lượng đơn hàng: ${countOrders
                                            != null ? countOrders :
                                            0}</div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link" href="/vendor/order">Xem chi
                                                tiết</a>
                                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Thống kê doanh thu</li>
                            </ol>

                            <!-- Biểu đồ thống kê doanh thu hàng tháng -->
                            <div class="row chart-container">
                                <div class="col-xl-12">
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <i class="fas fa-chart-line"></i>
                                            Doanh Thu Hàng Tháng
                                        </div>
                                        <div class="card-body">
                                            <canvas id="revenueChart" width="1000" height="500"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </main>
                    <jsp:include page="../layout/footer.jsp" />
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="js/scripts.js"></script>

            <script>
                var months = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'];

                // Dữ liệu giả cho doanh thu hàng tháng
                var revenueData = [
                    [1, 1500000],
                    [2, 1700000],
                    [3, 1800000],
                    [4, 2000000],
                    [5, 2200000],
                    [6, 2500000],
                    [7, 2300000],
                    [8, 2400000],
                    [9, 2100000],
                    [10, 2600000],
                    [11, 2800000],
                    [12, 3000000]
                ];

                var data = revenueData.map(function (item) {
                    return item[1];
                });

                var ctx = document.getElementById('revenueChart').getContext('2d');
                var revenueChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: months,
                        datasets: [{
                            label: 'Doanh Thu (VND)',
                            data: data,
                            borderColor: 'rgb(75, 192, 192)',
                            fill: false,
                            tension: 0.1
                        }]
                    },
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    callback: function (value) {
                                        return (value / 1000000).toLocaleString() + 'M';
                                    },
                                    stepSize: 1000000
                                }
                            }
                        }
                    }
                });
            </script>

        </body>

        </html>