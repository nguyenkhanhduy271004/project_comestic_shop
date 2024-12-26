<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat with Buyer</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        // Khởi tạo WebSocket kết nối với server
        var socket = new WebSocket("ws://localhost:8080/chat");

        // Khi có tin nhắn mới từ server
        socket.onmessage = function (event) {
            var message = event.data; // Nhận tin nhắn
            $('#chatBox').append('<p>' + message + '</p>'); // Thêm tin nhắn vào hộp chat
            $('#chatBox').scrollTop($('#chatBox')[0].scrollHeight); // Cuộn đến tin nhắn mới
        };

        // Gửi tin nhắn
        function sendMessage() {
            var message = $('#messageInput').val();
            socket.send(message); // Gửi tin nhắn tới WebSocket
            $('#messageInput').val(''); // Xóa input sau khi gửi
        }
    </script>
</head>

<body>
    <div class="container mt-5">
        <h1>Chat với Người Mua</h1>
        <div id="chatBox" style="height: 300px; overflow-y: scroll; border: 1px solid #ccc; padding: 10px;">
            <!-- Tin nhắn sẽ được hiển thị ở đây -->
        </div>
        <div class="mt-3">
            <input id="messageInput" type="text" class="form-control" placeholder="Nhập tin nhắn" />
            <button class="btn btn-primary mt-2" onclick="sendMessage()">Gửi</button>
        </div>
    </div>
</body>

</html>