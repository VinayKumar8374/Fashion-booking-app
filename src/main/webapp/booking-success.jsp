<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmed | Elite Fashion Hub</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body class="success-page">
    <div class="success-container">
        <div class="success-card">
            <i class="fas fa-check-circle success-icon"></i>
            <h1>Booking Confirmed!</h1>
            <p>Dear <strong>${customerName}</strong>, you have successfully booked</p>
            <div class="booking-details">
                <p><i class="fas fa-tshirt"></i> Item: ${itemName}</p>
                <p><i class="fas fa-ruler"></i> Size: ${size}</p>
                <p><i class="fas fa-box"></i> Quantity: ${quantity}</p>
                <p><i class="fas fa-envelope"></i> Confirmation sent to: ${email}</p>
            </div>
            <a href="index.jsp" class="btn-return"><i class="fas fa-arrow-left"></i> Continue Shopping</a>
        </div>
    </div>
</body>
</html>
