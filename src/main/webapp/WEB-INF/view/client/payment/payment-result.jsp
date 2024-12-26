<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <title>Kết quả thanh toán</title>
            <link rel="icon" href="<c:url value='/client/img/imgThuonghieu/4.png' />" type="image/png">
            <style>
                body {
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    background-color: #e9ecef;
                    margin: 0;
                    padding: 0;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    min-height: 100vh;
                }

                .container {
                    background-color: #ffffff;
                    border-radius: 10px;
                    box-shadow: 0px 10px 15px rgba(0, 0, 0, 0.1);
                    padding: 30px;
                    width: 100%;
                    max-width: 500px;
                    text-align: center;
                }

                h1 {
                    color: #333333;
                    font-size: 1.8em;
                    margin-bottom: 10px;
                }

                .success {
                    color: #28a745;
                    font-weight: bold;
                    font-size: 1.4em;
                    margin-top: 0;
                }

                .error {
                    color: #dc3545;
                    font-weight: bold;
                    font-size: 1.4em;
                    margin-top: 0;
                }

                .transaction-info {
                    margin-top: 20px;
                    text-align: left;
                }

                .transaction-info p {
                    margin: 8px 0;
                    font-size: 1em;
                    color: #555;
                }

                .transaction-info p strong {
                    color: #333;
                }

                .back-button {
                    display: inline-block;
                    margin-top: 25px;
                    padding: 12px 30px;
                    background-color: #28a745;
                    color: #ffffff;
                    text-decoration: none;
                    font-weight: bold;
                    border-radius: 5px;
                    transition: background-color 0.3s ease;
                }

                .back-button:hover {
                    background-color: #218838;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <h1>Kết quả thanh toán</h1>

                <% String message=(String) request.getAttribute("message"); String vnpAmount=(String)
                    request.getAttribute("vnp_Amount"); String vnpOrderInfo=(String)
                    request.getAttribute("vnp_OrderInfo"); String vnpTxnRef=(String) request.getAttribute("vnp_TxnRef");
                    String vnpTransactionNo=(String) request.getAttribute("vnp_TransactionNo"); String
                    vnpResponseCode=(String) request.getAttribute("vnp_ResponseCode"); %>

                    <h2 class="<%= " 00".equals(vnpResponseCode) ? "success" : "error" %>">
                        <%= message !=null ? message : "Thông tin thanh toán chưa rõ." %>
                    </h2>

                    <div class="transaction-info">
                        <p><strong>Mã giao dịch:</strong>
                            <%= vnpTxnRef !=null ? vnpTxnRef : "Không có" %>
                        </p>
                        <!-- <p><strong>Số tiền:</strong>
                            <fmt:formatNumber value="${vnpAmount}" type="currency" currencySymbol="VND" />
                        </p> -->

                        <p><strong>Thông tin đơn hàng:</strong>
                            <%= vnpOrderInfo !=null ? vnpOrderInfo : "Không có" %>
                        </p>
                        <p><strong>Mã giao dịch VNPay:</strong>
                            <%= vnpTransactionNo !=null ? vnpTransactionNo : "Không có" %>
                        </p>
                        <!-- <p><strong>Mã phản hồi:</strong>
                            <%= vnpResponseCode !=null ? vnpResponseCode : "Không có" %>
                        </p> -->
                    </div>

                    <a href="/" class="back-button">Quay lại trang chủ</a>
            </div>
        </body>

        </html>