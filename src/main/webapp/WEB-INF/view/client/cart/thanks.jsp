<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Success</title>
        <link rel="icon" href="<c:url value='/client/img/imgThuonghieu/4.png' />" type="image/png">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .order-success-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                max-width: 400px;
                width: 100%;
            }

            .order-success-container h1 {
                color: #28a745;
            }

            .order-success-container p {
                color: #333;
                margin-bottom: 20px;
            }

            .order-success-container a {
                display: inline-block;
                padding: 10px 20px;
                background-color: #28a745;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .order-success-container a:hover {
                background-color: #218838;
            }
        </style>
    </head>

    <body>
        <div class="order-success-container">
            <h1>Đặt hàng thành công!</h1>
            <p>Cảm ơn bạn đã mua sắm tại cửa hàng của chúng tôi. Đơn hàng của bạn sẽ được xử lý trong thời gian sớm
                nhất.</p>
            <a href="/">Tiếp tục mua sắm</a>
        </div>
    </body>

    </html>