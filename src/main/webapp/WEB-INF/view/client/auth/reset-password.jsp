<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Reset Password</title>
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                    font-family: Arial, sans-serif;
                }

                body {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    min-height: 100vh;
                    background: linear-gradient(135deg, #6a11cb, #2575fc);
                    color: #333;
                }

                .container {
                    background-color: #fff;
                    padding: 2rem;
                    border-radius: 10px;
                    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
                    text-align: center;
                    max-width: 400px;
                    width: 100%;
                }

                h2 {
                    font-size: 2rem;
                    color: #333;
                    margin-bottom: 0.5rem;
                }

                p {
                    color: #666;
                    margin-bottom: 1.5rem;
                    font-size: 1rem;
                }

                .error {
                    color: #d9534f;
                    font-size: 0.9rem;
                    margin-bottom: 1rem;
                }

                .input-group {
                    display: flex;
                    flex-direction: column;
                    margin-bottom: 1.5rem;
                }

                .otp-input-container {
                    display: flex;
                    justify-content: center;
                    gap: 10px;
                    margin-bottom: 1.5rem;
                    margin-top: 1.5rem;
                }

                .otp-input-container input {
                    width: 50px;
                    height: 50px;
                    font-size: 1.5rem;
                    text-align: center;
                    border: 1px solid #ddd;
                    border-radius: 4px;
                    transition: border-color 0.3s;
                }

                .otp-input-container input:focus {
                    border-color: #6a11cb;
                }

                button {
                    background: linear-gradient(135deg, #6a11cb, #2575fc);
                    color: #fff;
                    padding: 0.8rem;
                    border: none;
                    border-radius: 5px;
                    font-size: 1rem;
                    cursor: pointer;
                    transition: transform 0.3s, box-shadow 0.3s;
                }

                button:hover {
                    transform: translateY(-3px);
                    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
                }

                .countdown {
                    font-size: 1.5rem;
                    color: #d9534f;
                    margin-top: 1.5rem;
                }

                .disabled-btn {
                    color: #ccc;
                    cursor: not-allowed;
                }

                .input-group {
                    display: flex;
                    flex-direction: column;
                    margin-bottom: 1.5rem;
                }

                .input-group input {
                    padding: 0.8rem;
                    font-size: 1rem;
                    border: 1px solid #ddd;
                    border-radius: 5px;
                    transition: border-color 0.3s;
                    outline: none;
                }

                .input-group input:focus {
                    border-color: #6a11cb;
                }

                .input-group input::placeholder {
                    color: #aaa;
                }

                .input-group input:focus::placeholder {
                    color: transparent;
                }

                .form-error {
                    font-size: 0.9rem;
                    color: #d9534f;
                    margin-top: 0.5rem;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <h2>Reset Password</h2>
                <p>Enter the OTP sent to your email and set a new password.</p>

                <c:if test="${not empty error}">
                    <div class="error">${error}</div>
                </c:if>

                <form:form method="post" action="/reset-password" modelAttribute="resetPasswordForm">
                    <div class="otp-input-container">
                        <form:input path="otp1" maxlength="1" id="otp1" required="true"
                            oninput="moveFocus(this, 'otp2')" />
                        <form:input path="otp2" maxlength="1" id="otp2" required="true"
                            oninput="moveFocus(this, 'otp3')" />
                        <form:input path="otp3" maxlength="1" id="otp3" required="true"
                            oninput="moveFocus(this, 'otp4')" />
                        <form:input path="otp4" maxlength="1" id="otp4" required="true" oninput="submitOtp()" />
                    </div>
                    <div id="otp-error" class="error" style="display: none;">Invalid OTP, please try again.</div>

                    <input type="hidden" id="otp" name="otp" />

                    <div class="input-group">
                        <form:input path="newPassword" type="password" placeholder="Enter new password"
                            required="true" />
                        <form:errors path="newPassword" cssClass="error" />
                    </div>

                    <div class="input-group">
                        <form:input path="confirmPassword" type="password" placeholder="Confirm new password"
                            required="true" />
                        <form:errors path="confirmPassword" cssClass="error" />
                    </div>

                    <button type="submit">Reset Password</button>
                </form:form>

                <div id="countdown" class="countdown">3:00</div>
            </div>

            <script>
                var timeLeft = 180;

                function updateCountdown() {
                    var minutes = Math.floor(timeLeft / 60);
                    var seconds = timeLeft % 60;

                    if (seconds < 10) {
                        seconds = "0" + seconds;
                    }

                    document.getElementById("countdown").textContent = minutes + ":" + seconds;

                    if (timeLeft <= 0) {
                        clearInterval(countdownInterval);
                        document.getElementById("countdown").textContent = "00:00";
                    }

                    timeLeft--;
                }

                var countdownInterval = setInterval(updateCountdown, 1000);

                function moveFocus(currentInput, nextInputId) {
                    if (currentInput.value.length == currentInput.maxLength) {
                        document.getElementById(nextInputId).focus();
                    }
                }

                function submitOtp() {
                    var otp = '';
                    otp += document.getElementById('otp1').value;
                    otp += document.getElementById('otp2').value;
                    otp += document.getElementById('otp3').value;
                    otp += document.getElementById('otp4').value;
                    document.getElementById('otp').value = otp;
                }
            </script>
        </body>

        </html>