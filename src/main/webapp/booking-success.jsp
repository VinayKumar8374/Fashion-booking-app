<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmed | Elite Fashion Hub</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .success-container {
            text-align: center;
            padding: 20px;
        }
        .success-card {
            background: white;
            padding: 60px;
            border-radius: 30px;
            max-width: 500px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }
        .success-icon {
            font-size: 80px;
            color: #10b981;
            margin-bottom: 20px;
        }
        .booking-details {
            background: #f8fafc;
            padding: 20px;
            border-radius: 16px;
            margin: 20px 0;
            text-align: left;
        }
        .booking-details p {
            margin: 10px 0;
        }
        .btn-return {
            display: inline-block;
            background: #3b82f6;
            color: white;
            padding: 12px 24px;
            border-radius: 40px;
            text-decoration: none;
            font-weight: 600;
        }
        h1 { color: #1e293b; margin-bottom: 20px; }
    </style>
</head>
<body>
    <div class="success-container">
        <div class="success-card">
            <i class="fas fa-check-circle success-icon"></i>
            <h1>Booking Confirmed!</h1>
            <p>Dear <strong>${customerName}</strong>, your booking is successful!</p>
            <div class="booking-details">
                <p><i class="fas fa-tshirt"></i> <strong>Item:</strong> ${itemName}</p>
                <p><i class="fas fa-ruler"></i> <strong>Size:</strong> ${size}</p>
                <p><i class="fas fa-box"></i> <strong>Quantity:</strong> ${quantity}</p>
                <p><i class="fas fa-envelope"></i> <strong>Confirmation sent to:</strong> ${email}</p>
            </div>
            <a href="index.jsp" class="btn-return"><i class="fas fa-arrow-left"></i> Continue Shopping</a>
        </div>
    </div>
</body>
</html>
