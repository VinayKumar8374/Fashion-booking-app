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
        body { font-family: 'Inter', sans-serif; background: #f0f2f5; }
        
        .header { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 60px 0; text-align: center; }
        .header h1 { font-size: 48px; margin-bottom: 15px; }
        .header p { font-size: 18px; opacity: 0.9; }
        
        .container { max-width: 1400px; margin: 0 auto; padding: 20px 40px; }
        
        .filters { background: white; padding: 20px; border-radius: 12px; margin-bottom: 30px; display: flex; gap: 20px; flex-wrap: wrap; align-items: center; box-shadow: 0 2px 8px rgba(0,0,0,0.05); }
        .filters select { padding: 10px 20px; border: 1px solid #ddd; border-radius: 8px; font-size: 14px; cursor: pointer; }
        .filters label { font-weight: 600; color: #333; }
        
        .products-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 30px; margin: 40px 0; }
        
        .product-card { background: white; border-radius: 16px; overflow: hidden; transition: transform 0.3s, box-shadow 0.3s; cursor: pointer; box-shadow: 0 2px 8px rgba(0,0,0,0.08); }
        .product-card:hover { transform: translateY(-5px); box-shadow: 0 12px 24px rgba(0,0,0,0.15); }
        
        .product-image { width: 100%; height: 320px; object-fit: cover; background: #667eea; }
        
        .product-info { padding: 20px; }
        .brand { color: #667eea; font-weight: 600; margin-bottom: 8px; font-size: 14px; }
        .product-title { font-size: 18px; font-weight: 700; margin-bottom: 8px; color: #1e293b; }
        .price { font-size: 24px; font-weight: 800; color: #3b82f6; margin: 12px 0; }
        .old-price { text-decoration: line-through; color: #94a3b8; font-size: 14px; margin-left: 10px; font-weight: normal; }
        
        .btn-book { background: #3b82f6; color: white; border: none; padding: 14px; width: 100%; border-radius: 10px; font-size: 16px; font-weight: 600; cursor: pointer; transition: background 0.3s; margin-top: 10px; }
        .btn-book:hover { background: #2563eb; }
        
        .stats { background: linear-gradient(135deg, #1e293b, #0f172a); color: white; padding: 60px 0; margin-top: 60px; }
        .stats-grid { display: flex; justify-content: space-around; text-align: center; flex-wrap: wrap; gap: 30px; }
        .stat h3 { font-size: 48px; margin-bottom: 10px; }
        
        .modal { display: none; position: fixed; z-index: 1000; left: 0; top: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); }
        .modal-content { background: white; margin: 10% auto; padding: 30px; width: 90%; max-width: 500px; border-radius: 20px; }
        .close { float: right; font-size: 28px; cursor: pointer; }
        .modal-content input, .modal-content select { width: 100%; padding: 12px; margin: 10px 0; border: 1px solid #ddd; border-radius: 8px; }
        
        .footer { background: #0f172a; color: #94a3b8; text-align: center; padding: 40px; }
        
        @media (max-width: 768px) { .products-grid { grid-template-columns: 1fr; } .header h1 { font-size: 32px; } .container { padding: 20px; } }
    </style>
</head>
<body>

<div class="header">
    <h1><i class="fas fa-tshirt"></i> Elite Fashion Hub</h1>
    <p>Premium Clothing Booking Platform | 50+ Luxury Brands</p>
</div>

<div class="container">
    <div class="filters">
        <label><i class="fas fa-filter"></i> Filter:</label>
        <select id="categoryFilter">
            <option value="all">All Categories</option>
            <option value="Shirts">Shirts</option>
            <option value="Pants">Pants</option>
            <option value="T-Shirts">T-Shirts</option>
            <option value="Casuals">Casuals</option>
            <option value="Formals">Formals</option>
        </select>
        <select id="brandFilter">
            <option value="all">All Brands</option>
        </select>
        <select id="sortBy">
            <option value="default">Sort by: Featured</option>
            <option value="priceLow">Price: Low to High</option>
            <option value="priceHigh">Price: High to Low</option>
        </select>
    </div>
    
    <div class="products-grid" id="productsGrid">
        <div style="text-align:center; padding:50px;">Loading products...</div>
    </div>
</div>

<div class="stats">
    <div class="container">
        <div class="stats-grid">
            <div class="stat"><h3>50+</h3><p>Premium Brands</p></div>
            <div class="stat"><h3>10K+</h3><p>Happy Customers</p></div>
            <div class="stat"><h3>24/7</h3><p>Support</p></div>
            <div class="stat"><h3>100%</h3><p>Authentic</p></div>
        </div>
    </div>
</div>

<div id="bookingModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2><i class="fas fa-shopping-bag"></i> Book Now</h2>
        <input type="hidden" id="productId">
        <input type="text" id="productNameDisplay" readonly style="background:#f0f0f0; font-weight:600;">
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
    <p><i class="fas fa-shield-alt"></i> Secure Booking | <i class="fas fa-truck"></i> Free Delivery | <i class="fas fa-undo-alt"></i> Easy Returns</p>
</div>

<script>
const products = [
    { id: 1, name: "Slim Fit Oxford Shirt", brand: "Ralph Lauren", category: "Shirts", price: 89.99, image: "https://images.unsplash.com/photo-1598032895397-b9472444bf93?w=400", description: "Classic formal shirt, 100% cotton" },
    { id: 2, name: "Stretch Denim Jeans", brand: "Levi's", category: "Pants", price: 79.99, image: "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?w=400", description: "Comfort stretch jeans" },
    { id: 3, name: "Graphic Print T-Shirt", brand: "Nike", category: "T-Shirts", price: 39.99, image: "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400", description: "Cotton blend, athletic fit" },
    { id: 4, name: "Casual Chinos", brand: "Tommy Hilfiger", category: "Casuals", price: 69.99, image: "https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=400", description: "Slim fit chinos" },
    { id: 5, name: "Wool Blazer", brand: "Hugo Boss", category: "Formals", price: 299.99, image: "https://images.unsplash.com/photo-1507679799987-c73779587ccf?w=400", description: "Premium wool blend" },
    { id: 6, name: "Polo T-Shirt", brand: "Lacoste", category: "T-Shirts", price: 59.99, image: "https://images.unsplash.com/photo-1586363104861-3a5e2ab9d6ae?w=400", description: "Classic pique polo" },
    { id: 7, name: "Cargo Pants", brand: "The North Face", category: "Pants", price: 89.99, image: "https://images.unsplash.com/photo-1517438476313-10d79c077051?w=400", description: "Durable cotton cargo" },
    { id: 8, name: "Linen Summer Shirt", brand: "Zara", category: "Casuals", price: 49.99, image: "https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=400", description: "Breathable linen" },
    { id: 9, name: "Premium Trousers", brand: "Armani", category: "Formals", price: 159.99, image: "https://images.unsplash.com/photo-1594938374182-f1c9e6b9d7b0?w=400", description: "Tailored fit trousers" },
    { id: 10, name: "Denim Jacket", brand: "Calvin Klein", category: "Casuals", price: 129.99, image: "https://images.unsplash.com/photo-1551537482-f2075a1d41f2?w=400", description: "Classic denim jacket" },
    { id: 11, name: "Velvet Blazer", brand: "Gucci", category: "Formals", price: 499.99, image: "https://images.unsplash.com/photo-1509631179647-0177331693ae?w=400", description: "Luxurious velvet" },
    { id: 12, name: "Hoodie", brand: "Champion", category: "Casuals", price: 54.99, image: "https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400", description: "Reverse weave hoodie" },
    { id: 13, name: "Yoga Leggings", brand: "Lululemon", category: "Pants", price: 98.99, image: "https://images.unsplash.com/photo-1506629082955-511b1aa562c8?w=400", description: "High-waisted leggings" },
    { id: 14, name: "Silk Tie", brand: "Hermès", category: "Formals", price: 199.99, image: "https://images.unsplash.com/photo-1589756823695-278bc923f962?w=400", description: "100% silk tie" },
    { id: 15, name: "Cashmere Sweater", brand: "Brunello", category: "Casuals", price: 895.00, image: "https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=400", description: "Ultra-soft cashmere" }
];

let currentProduct = null;

function renderProducts() {
    const category = document.getElementById('categoryFilter').value;
    const brand = document.getElementById('brandFilter').value;
    const sort = document.getElementById('sortBy').value;
    
    let filtered = products.filter(p => {
        return (category === 'all' || p.category === category) &&
               (brand === 'all' || p.brand === brand);
    });
    
    if (sort === 'priceLow') filtered.sort((a,b) => a.price - b.price);
    if (sort === 'priceHigh') filtered.sort((a,b) => b.price - a.price);
    
    const grid = document.getElementById('productsGrid');
    if (filtered.length === 0) {
        grid.innerHTML = '<div style="text-align:center; padding:50px;">No products found</div>';
        return;
    }
    
    grid.innerHTML = filtered.map(p => `
        <div class="product-card">
            <img src="${p.image}" class="product-image" onerror="this.src='https://via.placeholder.com/400x320?text=Fashion+Item'" alt="${p.name}">
            <div class="product-info">
                <div class="brand"><i class="fas fa-tag"></i> ${p.brand} • ${p.category}</div>
                <div class="product-title">${p.name}</div>
                <div class="price">$${p.price} <span class="old-price">$${Math.round(p.price * 1.4)}</span></div>
                <button class="btn-book" onclick="openModal(${p.id})"><i class="fas fa-calendar-check"></i> Book Now</button>
            </div>
        </div>
    `).join('');
}

function populateBrands() {
    const brands = [...new Set(products.map(p => p.brand))];
    const brandSelect = document.getElementById('brandFilter');
    brands.forEach(brand => {
        const option = document.createElement('option');
        option.value = brand;
        option.textContent = brand;
        brandSelect.appendChild(option);
    });
}

function openModal(id) {
    currentProduct = products.find(p => p.id === id);
    document.getElementById('productId').value = currentProduct.id;
    document.getElementById('productNameDisplay').value = currentProduct.name;
    document.getElementById('bookingModal').style.display = 'block';
}

function closeModal() {
    document.getElementById('bookingModal').style.display = 'none';
    document.getElementById('customerName').value = '';
    document.getElementById('email').value = '';
}

function confirmBooking() {
    const name = document.getElementById('customerName').value;
    const email = document.getElementById('email').value;
    const size = document.getElementById('size').value;
    const quantity = document.getElementById('quantity').value;
    
    if (!name || !email) {
        alert('❌ Please fill all fields');
        return;
    }
    
    alert(`✅ BOOKING CONFIRMED!\n\nProduct: ${currentProduct.name}\nBrand: ${currentProduct.brand}\nCustomer: ${name}\nEmail: ${email}\nSize: ${size}\nQuantity: ${quantity}\n\nThank you for shopping with Elite Fashion Hub!`);
    closeModal();
}

document.getElementById('categoryFilter').addEventListener('change', renderProducts);
document.getElementById('brandFilter').addEventListener('change', renderProducts);
document.getElementById('sortBy').addEventListener('change', renderProducts);
window.onclick = function(event) { if (event.target === document.getElementById('bookingModal')) closeModal(); }

populateBrands();
renderProducts();
</script>

</body>
</html>
