<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elite Fashion Hub</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', sans-serif; background: #f0f2f5; }
        .header { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 30px 0; text-align: center; }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .products-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 25px; margin-top: 30px; }
        .product-card { background: white; border-radius: 12px; overflow: hidden; transition: transform 0.3s; cursor: pointer; }
        .product-card:hover { transform: translateY(-5px); box-shadow: 0 10px 30px rgba(0,0,0,0.15); }
        .product-image { width: 100%; height: 300px; object-fit: cover; }
        .product-info { padding: 20px; }
        .brand { color: #667eea; font-weight: 600; margin-bottom: 8px; }
        .product-title { font-size: 18px; font-weight: 600; margin-bottom: 8px; }
        .price { font-size: 24px; font-weight: 700; color: #3b82f6; margin: 10px 0; }
        .btn-book { background: #3b82f6; color: white; border: none; padding: 12px; width: 100%; border-radius: 8px; font-weight: 600; cursor: pointer; }
        .btn-book:hover { background: #2563eb; }
        .modal { display: none; position: fixed; z-index: 1000; left: 0; top: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); }
        .modal-content { background: white; margin: 10% auto; padding: 30px; width: 90%; max-width: 500px; border-radius: 12px; }
        .close { float: right; font-size: 28px; cursor: pointer; }
        input, select { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ddd; border-radius: 6px; }
        .footer { text-align: center; padding: 40px; background: #1e293b; color: white; margin-top: 50px; }
        @media (max-width: 768px) { .products-grid { grid-template-columns: 1fr; } }
    </style>
</head>
<body>

<div class="header">
    <h1><i class="fas fa-tshirt"></i> Elite Fashion Hub</h1>
    <p>Premium Clothing Booking Platform</p>
</div>

<div class="container">
    <div class="products-grid" id="productsGrid"></div>
</div>

<div id="bookingModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>Book Your Item</h2>
        <input type="hidden" id="productId">
        <input type="text" id="productNameDisplay" readonly style="background:#f0f0f0; margin-bottom:15px;">
        <input type="text" id="customerName" placeholder="Full Name" required>
        <input type="email" id="email" placeholder="Email Address" required>
        <select id="size">
            <option>S</option><option>M</option><option>L</option><option>XL</option>
        </select>
        <input type="number" id="quantity" value="1" min="1" max="10">
        <button class="btn-book" onclick="confirmBooking()">Confirm Booking</button>
    </div>
</div>

<div class="footer">
    <p>&copy; 2026 Elite Fashion Hub - Enterprise Fashion Booking Platform</p>
</div>

<script>
const products = [
    { id: 1, name: "Slim Fit Oxford Shirt", brand: "Ralph Lauren", category: "Shirts", price: 89.99, image: "https://images.unsplash.com/photo-1598032895397-b9472444bf93?w=400" },
    { id: 2, name: "Stretch Denim Jeans", brand: "Levi's", category: "Pants", price: 79.99, image: "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?w=400" },
    { id: 3, name: "Graphic Print T-Shirt", brand: "Nike", category: "T-Shirts", price: 39.99, image: "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400" },
    { id: 4, name: "Casual Chinos", brand: "Tommy Hilfiger", category: "Casuals", price: 69.99, image: "https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=400" },
    { id: 5, name: "Wool Blazer", brand: "Hugo Boss", category: "Formals", price: 299.99, image: "https://images.unsplash.com/photo-1507679799987-c73779587ccf?w=400" },
    { id: 6, name: "Polo T-Shirt", brand: "Lacoste", category: "T-Shirts", price: 59.99, image: "https://images.unsplash.com/photo-1586363104861-3a5e2ab9d6ae?w=400" },
    { id: 7, name: "Cargo Pants", brand: "The North Face", category: "Pants", price: 89.99, image: "https://images.unsplash.com/photo-1517438476313-10d79c077051?w=400" },
    { id: 8, name: "Linen Summer Shirt", brand: "Zara", category: "Casuals", price: 49.99, image: "https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=400" },
    { id: 9, name: "Premium Trousers", brand: "Armani", category: "Formals", price: 159.99, image: "https://images.unsplash.com/photo-1594938374182-f1c9e6b9d7b0?w=400" },
    { id: 10, name: "Denim Jacket", brand: "Calvin Klein", category: "Casuals", price: 129.99, image: "https://images.unsplash.com/photo-1551537482-f2075a1d41f2?w=400" }
];

let currentProduct = null;

function renderProducts() {
    const grid = document.getElementById('productsGrid');
    grid.innerHTML = products.map(p => `
        <div class="product-card">
            <img src="${p.image}" class="product-image" onerror="this.src='https://via.placeholder.com/400x300?text=Fashion'" alt="${p.name}">
            <div class="product-info">
                <div class="brand">${p.brand} • ${p.category}</div>
                <div class="product-title">${p.name}</div>
                <div class="price">$${p.price}</div>
                <button class="btn-book" onclick="openModal(${p.id})">Book Now</button>
            </div>
        </div>
    `).join('');
}

function openModal(id) {
    currentProduct = products.find(p => p.id === id);
    document.getElementById('productId').value = currentProduct.id;
    document.getElementById('productNameDisplay').value = currentProduct.name;
    document.getElementById('bookingModal').style.display = 'block';
}

function closeModal() {
    document.getElementById('bookingModal').style.display = 'none';
}

function confirmBooking() {
    const name = document.getElementById('customerName').value;
    const email = document.getElementById('email').value;
    const size = document.getElementById('size').value;
    const quantity = document.getElementById('quantity').value;
    
    if(!name || !email) {
        alert('Please fill all fields');
        return;
    }
    
    alert(`✅ Booking Confirmed!\n\nProduct: ${currentProduct.name}\nCustomer: ${name}\nEmail: ${email}\nSize: ${size}\nQuantity: ${quantity}\n\nThank you for shopping with Elite Fashion Hub!`);
    closeModal();
}

window.onclick = function(event) {
    if (event.target === document.getElementById('bookingModal')) closeModal();
}

renderProducts();
</script>
</body>
</html>
