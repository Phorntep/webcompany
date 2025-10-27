<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="test.aspx.vb" Inherits="Billing_SNC.test" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTP Verification</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .otp-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
        }

        input[type="text"] {
            padding: 10px;
            font-size: 16px;
            width: 100%;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
        }

        .timer {
            color: red;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="otp-container">
    <h2>OTP Verification</h2>

    <form id="otpForm" runat="server">
        <input type="text" name="otp" id="otp" placeholder="Enter OTP" maxlength="6" required>
        <p class="timer" id="timer">OTP expires in 02:00 minutes </p>
        <asp:Button ID="Button" runat="server" Text="Verify OTP" OnClick="VerifyOTP_Click" />
    </form>

    <p id="errorMsg" class="error"></p>
</div>

<script>
    // Countdown timer for OTP expiration
    let timeLeft = 120;
    let timerElement = document.getElementById('timer');
    let timerInterval = setInterval(() => {
        timeLeft--;
        let minutes = Math.floor(timeLeft / 60);
        let seconds = timeLeft % 60;
        timerElement.textContent = `OTP expires in ${minutes}:${seconds < 10 ? '0' : ''}${seconds} minutes`;

        if (timeLeft <= 0) {
            clearInterval(timerInterval);
            timerElement.textContent = "OTP has expired!";
            document.getElementById('otp').disabled = true;
            document.querySelector('button').disabled = true;
        }
    }, 1000);
</script>

</body>
</html>
