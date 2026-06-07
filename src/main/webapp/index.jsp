<%@ page import="java.util.List, com.fashion.model.ClothingItem, com.fashion.util.DataGenerator" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elite Fashion Hub | Premium Clothing Booking</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: #f8fafc;
            color: #1e293b;
        }

        /* Header */
        .enterprise-header {
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            position: sticky;
            top: 0;
            z-index: 1000;
            padding: 20px 0;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 40px;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        .logo-section {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .logo-icon {
            font-size: 28px;
            color: #3b82f6;
        }

        .logo-text {
            font-size: 22px;
            font-weight: 700;
        }

        .enterprise-badge {
            background: linear-gradient(135deg, #3b82f6, #8b5cf6);
            color: white;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 10px;
            font-weight: 600;
        }

        .main-nav {
            display: flex;
            gap: 32px;
        }

        .main-nav a {
            text-decoration: none;
            color: #475569;
            font-weight: 500;
            transition: 0.3s;
        }

        .main-nav a:hover {
            color: #3b82f6;
        }

        /* Hero */
        .hero {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 80px 0;
            text-align: center;
            color: white;
        }

        .hero h1 {
            font-size: 56px;
            margin-bottom: 20px;
        }

        .btn-hero {
            background: white;
            color: #667eea;
            padding: 14px 32px;
            border-radius: 40px;
            font-weight: 600;
            border: none;
            cursor: pointer;
            margin-top: 20px;
        }

        /* Filter Bar */
        .filter-bar {
            background: white;
            padding: 16px 0;
            border-bottom: 1px solid #e2e8f0;
            margin-bottom: 40px;
        }

        .filter-bar select {
            padding: 10px 20px;
            border-radius: 8px;
            border: 1px solid #cbd5e1;
            margin: 0 10px;
        }

        /* Products Grid */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 32px;
            margin: 40px 0;
        }

        .product-card {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            position: relative;
        }

        .product-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 25px -12px rgba(0,0,0,0.1);
        }

        .product-badge {
            position: absolute;
            top: 15px;
            left: 15px;
            background: rgba(0,0,0,0.8);
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            z-index: 2;
        }

        .product-image {
            width: 100%;
            height: 400px;
            object-fit: cover;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .product-info {
            padding: 20px;
        }

        .brand-row {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 12px;
        }

        .brand-logo {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            object-fit: contain;
            background: white;
            padding: 4px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .brand-name {
            font-weight: 600;
            color: #3b82f6;
        }

        .product-title {
            font-size: 18px;
            font-weight: 600;
            margin: 8px 0;
        }

        .product-desc {
            color: #64748b;
            font-size: 14px;
            margin: 8px 0;
        }

        .price-row {
            display: flex;
            gap: 12px;
            align-items: center;
            margin: 12px 0;
        }

        .current-price {
            font-size: 24px;
            font-weight: 700;
            color: #3b82f6;
        }

        .original-price {
            text-decoration: line-through;
            color: #94a3b8;
        }

        .discount {
            background: #ef4444;
            color: white;
            padding: 2px 8px;
            border-radius: 20px;
            font-size: 12px;
        }

        .size-options {
            font-size: 13px;
            color: #64748b;
            margin: 10px 0;
        }

        .btn-book {
            background: #3b82f6;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            font-weight: 600;
            transition: background 0.3s;
        }

        .btn-book:hover {
            background: #2563eb;
        }

        /* Brands Showcase */
        .brands-showcase {
            background: white;
            padding: 60px 0;
            margin: 40px 0;
        }

        .section-title {
            text-align: center;
            font-size: 32px;
            margin-bottom: 40px;
        }

        .brands-grid {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 40px;
        }

        .brand-item {
            font-size: 20px;
            font-weight: 600;
            color: #475569;
        }

        /* Stats Section */
        .stats-section {
            background: linear-gradient(135deg, #1e293b, #0f172a);
            color: white;
            padding: 60px 0;
        }

        .stats-grid {
            display: flex;
            justify-content: space-around;
            text-align: center;
            flex-wrap: wrap;
        }

        .stat h3 {
            font-size: 48px;
            margin-bottom: 8px;
        }

        /* Modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 2000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
        }

        .modal-content {
            background: white;
            margin: 10% auto;
            padding: 30px;
            width: 450px;
            border-radius: 20px;
            max-width: 90%;
        }

        .close {
            float: right;
            font-size: 28px;
            cursor: pointer;
        }

        .modal-content input,
        .modal-content select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
        }

        /* Footer */
        .enterprise-footer {
            background: #0f172a;
            color: #94a3b8;
            padding: 40px 0;
            text-align: center;
            margin-top: 60px;
        }

        @media (max-width: 768px) {
            .main-nav {
                display: none;
            }
            .products-grid {
                grid-template-columns: 1fr;
            }
            .hero h1 {
                font-size: 32px;
            }
        }
    </style>
</head>
<body>

<!-- Enterprise Header -->
<header class="enterprise-header">
    <div class="container">
        <div class="header-content">
            <div class="logo-section">
                <i class="fas fa-tshirt logo-icon"></i>
                <span class="logo-text">Elite Fashion Hub</span>
                <span class="enterprise-badge">ENTERPRISE</span>
            </div>
            <nav class="main-nav">
                <a href="#"><i class="fas fa-home"></i> Home</a>
                <a href="#"><i class="fas fa-shirt"></i> Shirts</a>
                <a href="#"><i class="fas fa-shopping-bag"></i> Pants</a>
                <a href="#"><i class="fas fa-tshirt"></i> T-Shirts</a>
                <a href="#"><i class="fas fa-user-friends"></i> Casuals</a>
                <a href="#"><i class="fas fa-briefcase"></i> Formals</a>
            </nav>
            <div class="header-actions">
                <i class="fas fa-search"></i>
                <i class="fas fa-shopping-cart"></i>
            </div>
        </div>
    </div>
</header>

<!-- Hero Banner -->
<section class="hero">
    <div class="container">
        <h1>Premium Fashion Collection</h1>
        <p>Discover the latest trends from 50+ luxury & premium brands</p>
        <button class="btn-hero" onclick="scrollToProducts()">Explore Collection →</button>
    </div>
</section>

<!-- Filter Bar -->
<div class="filter-bar">
    <div class="container">
        <span class="filter-label"><i class="fas fa-filter"></i> Filter by:</span>
        <select id="categoryFilter" onchange="filterProducts()">
            <option value="all">All Categories</option>
            <option value="Shirts">Shirts</option>
            <option value="Pants">Pants</option>
            <option value="T-Shirts">T-Shirts</option>
            <option value="Casuals">Casuals</option>
            <option value="Formals">Formals</option>
        </select>
        <select id="brandFilter" onchange="filterProducts()">
            <option value="all">All Brands</option>
        </select>
        <select id="sortBy" onchange="filterProducts()">
            <option value="default">Sort by: Featured</option>
            <option value="priceLow">Price: Low to High</option>
            <option value="priceHigh">Price: High to Low</option>
        </select>
    </div>
</div>

<!-- Products Grid -->
<div class="container">
    <div class="products-grid" id="productsGrid">
        <% 
            List<ClothingItem> items = DataGenerator.generateClothingItems();
            request.setAttribute("items", items);
        %>
    </div>
</div>

<!-- Brands Showcase -->
<div class="brands-showcase">
    <div class="container">
        <h2 class="section-title">Trusted By Leading Brands</h2>
        <div class="brands-grid">
            <div class="brand-item"><i class="fab fa-nike"></i> Nike</div>
            <div class="brand-item"><i class="fab fa-adidas"></i> Adidas</div>
            <div class="brand-item"><i class="fas fa-crown"></i> Gucci</div>
            <div class="brand-item"><i class="fas fa-gem"></i> Prada</div>
            <div class="brand-item"><i class="fas fa-tshirt"></i> Zara</div>
            <div class="brand-item"><i class="fas fa-suitcase"></i> Louis Vuitton</div>
        </div>
    </div>
</div>

<!-- Stats Section -->
<div class="stats-section">
    <div class="container">
        <div class="stats-grid">
            <div class="stat"><h3>50+</h3><p>Premium Brands</p></div>
            <div class="stat"><h3>10K+</h3><p>Happy Customers</p></div>
            <div class="stat"><h3>24/7</h3><p>Support Available</p></div>
            <div class="stat"><h3>100%</h3><p>Authentic Products</p></div>
        </div>
    </div>
</div>

<!-- Booking Modal -->
<div id="bookingModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2><i class="fas fa-shopping-bag"></i> Book This Item</h2>
        <form id="bookingForm" action="book" method="POST">
            <input type="hidden" id="itemId" name="itemId">
            <input type="hidden" id="itemName" name="itemName">
            <label>Full Name:</label>
            <input type="text" name="customerName" required placeholder="John Doe">
            <label>Email Address:</label>
            <input type="email" name="email" required placeholder="john@example.com">
            <label>Select Size:</label>
            <select name="size" required>
                <option>S</option><option>M</option><option>L</option><option>XL</option>
            </select>
            <label>Quantity:</label>
            <input type="number" name="quantity" value="1" min="1" max="10">
            <button type="submit" class="btn-book">Confirm Booking</button>
        </form>
    </div>
</div>

<footer class="enterprise-footer">
    <div class="container">
        <p>&copy; 2026 Elite Fashion Hub - Enterprise Fashion Booking Platform</p>
        <p><i class="fas fa-shield-alt"></i> Secure Booking | <i class="fas fa-truck"></i> Express Delivery | <i class="fas fa-undo-alt"></i> Easy Returns</p>
    </div>
</footer>

<script>
    // Get products from server-side
    const products = [
        <% 
            List<ClothingItem> productList = (List<ClothingItem>) request.getAttribute("items");
            for(int i = 0; i < productList.size(); i++) {
                ClothingItem item = productList.get(i);
        %>
        {
            id: "<%= item.getId() %>",
            name: "<%= item.getName() %>",
            category: "<%= item.getCategory() %>",
            brand: "<%= item.getBrand() %>",
            price: <%= item.getPrice() %>,
            image: "<%= item.getImageUrl() %>",
            brandLogo: "<%= item.getBrandLogoUrl() %>",
            description: "<%= item.getDescription() %>",
            sizeOptions: "<%= item.getSizeOptions() %>"
        }<%= i < productList.size() - 1 ? "," : "" %>
        <% } %>
    ];

    let currentProducts = [...products];

    // Populate brand filter
    const brands = [...new Set(products.map(p => p.brand))];
    const brandSelect = document.getElementById('brandFilter');
    brands.forEach(brand => {
        const option = document.createElement('option');
        option.value = brand;
        option.textContent = brand;
        brandSelect.appendChild(option);
    });

    function renderProducts() {
        const category = document.getElementById('categoryFilter').value;
        const brand = document.getElementById('brandFilter').value;
        const sort = document.getElementById('sortBy').value;
        
        let filtered = products.filter(p => {
            return (category === 'all' || p.category === category) &&
                   (brand === 'all' || p.brand === brand);
        });
        
        if (sort === 'priceLow') {
            filtered.sort((a,b) => a.price - b.price);
        } else if (sort === 'priceHigh') {
            filtered.sort((a,b) => b.price - a.price);
        }
        
        const grid = document.getElementById('productsGrid');
        if (filtered.length === 0) {
            grid.innerHTML = '<div style="text-align:center; padding:50px;">No products found</div>';
            return;
        }
        
        grid.innerHTML = filtered.map(p => `
            <div class="product-card">
                <div class="product-badge">${p.category}</div>
                <img src="${p.image}" class="product-image" alt="${p.name}" onerror="this.src='https://via.placeholder.com/400x500?text=Fashion+Item'">
                <div class="product-info">
                    <div class="brand-row">
                        <img src="${p.brandLogo}" class="brand-logo" onerror="this.style.display='none'">
                        <span class="brand-name">${p.brand}</span>
                    </div>
                    <h3 class="product-title">${p.name}</h3>
                    <p class="product-desc">${p.description}</p>
                    <div class="price-row">
                        <span class="current-price">$${p.price}</span>
                        <span class="original-price">$${Math.round(p.price * 1.4)}</span>
                        <span class="discount">-30%</span>
                    </div>
                    <div class="size-options"><i class="fas fa-ruler-combined"></i> Sizes: ${p.sizeOptions}</div>
                    <button class="btn-book" onclick="openBookingModal('${p.id}', '${p.name}', ${p.price})">
                        <i class="fas fa-calendar-check"></i> Book Now
                    </button>
                </div>
            </div>
        `).join('');
    }

    function filterProducts() {
        renderProducts();
    }

    function scrollToProducts() {
        document.getElementById('productsGrid').scrollIntoView({ behavior: 'smooth' });
    }

    function openBookingModal(id, name, price) {
        document.getElementById('itemId').value = id;
        document.getElementById('itemName').value = name;
        document.getElementById('bookingModal').style.display = 'block';
    }

    function closeModal() {
        document.getElementById('bookingModal').style.display = 'none';
    }

    window.onclick = function(event) {
        if (event.target === document.getElementById('bookingModal')) {
            closeModal();
        }
    }

    // Initial render
    renderProducts();
</script>

</body>
</html>
