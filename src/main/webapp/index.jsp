<%@ page import="java.util.List, com.fashion.model.ClothingItem, com.fashion.util.DataGenerator" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elite Fashion Hub</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', sans-serif; background: #f8fafc; }
        .container { max-width: 1400px; margin: 0 auto; padding: 20px; }
        .products-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 30px; }
        .product-card { background: white; border-radius: 16px; overflow: hidden; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .product-image { width: 100%; height: 350px; object-fit: cover; }
        .product-info { padding: 20px; }
        .btn-book { background: #3b82f6; color: white; border: none; padding: 12px; width: 100%; border-radius: 8px; cursor: pointer; }
        .header { background: white; padding: 20px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .logo { font-size: 24px; font-weight: bold; color: #3b82f6; }
    </style>
</head>
<body>
<div class="header">
    <div class="container">
        <div class="logo">👔 Elite Fashion Hub</div>
    </div>
</div>

<div class="container">
    <div class="products-grid" id="productsGrid">
        <% 
            List<ClothingItem> items = DataGenerator.generateClothingItems();
            for(ClothingItem item : items) {
        %>
        <div class="product-card">
            <img src="<%= item.getImageUrl() %>" class="product-image" alt="<%= item.getName() %>" 
                 onerror="this.src='https://via.placeholder.com/400x350?text=Fashion'">
            <div class="product-info">
                <h3><%= item.getName() %></h3>
                <p><strong><%= item.getBrand() %></strong> | <%= item.getCategory() %></p>
                <p style="font-size: 24px; color: #3b82f6;">$<%= item.getPrice() %></p>
                <button class="btn-book" onclick="bookItem('<%= item.getName() %>', <%= item.getPrice() %>)">Book Now</button>
            </div>
        </div>
        <% } %>
    </div>
</div>

<script>
function bookItem(name, price) {
    alert(`Booking initiated for ${name} - $${price}\nPlease contact support to complete booking.`);
}
</script>
</body>
</html>
