<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>OTP Verification</title>
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

            .verification-container {
                background-color: #fff;
                padding: 2rem;
                border-radius: 8px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
                text-align: center;
                max-width: 400px;
                width: 100%;
            }

            h2 {
                font-size: 1.8rem;
                color: #333;
                margin-bottom: 1rem;
            }

            .otp-input-container {
                display: flex;
                margin-bottom: 1.5rem;
                justify-content: center;
                gap: 10px;
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
                border-radius: 4px;
                font-size: 1rem;
                cursor: pointer;
                transition: transform 0.3s, box-shadow 0.3s;
            }

            button:hover {
                transform: translateY(-3px);
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            }

            .error {
                color: #d9534f;
                font-size: 0.9rem;
                margin-top: 0.5rem;
            }

            .resend-btn {
                background: none;
                color: #2575fc;
                border: none;
                font-size: 1rem;
                cursor: pointer;
                margin-top: 1rem;
            }

            .resend-btn:hover {
                text-decoration: underline;
            }

            .timer {
                font-size: 1.2rem;
                color: #d9534f;
                margin-top: 1rem;
            }

            .disabled-btn {
                color: #ccc;
                cursor: not-allowed;
            }

            .countdown {
                font-size: 40px;
                font-weight: bold;
            }
        </style>
    </head>

    <body>
        <div class="verification-container">
            <h2>OTP Verification</h2>
            <p>Please enter the OTP sent to your email.</p>

            <form:form method="post" action="/verify-otp" modelAttribute="otpForm">
                <div class="otp-input-container">
                    <form:input path="otp1" maxlength="1" id="otp1" required="required"
                        oninput="moveFocus(this, 'otp2')" />
                    <form:input path="otp2" maxlength="1" id="otp2" required="required"
                        oninput="moveFocus(this, 'otp3')" />
                    <form:input path="otp3" maxlength="1" id="otp3" required="required"
                        oninput="moveFocus(this, 'otp4')" />
                    <form:input path="otp4" maxlength="1" id="otp4" required="required" oninput="submitOtp()" />
                </div>

                <div id="otp-error" class="error" style="display: none;">Invalid OTP, please try again.</div>

                <input type="hidden" id="otp" name="otp" />

                <button type="submit">Verify OTP</button>
            </form:form>

            <form action="/resend-otp" method="post">
                <button type="submit" class="resend-btn" id="resendOtpBtn" disabled>Resend OTP</button>
            </form>

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