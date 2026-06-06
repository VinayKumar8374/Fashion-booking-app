<%@ page import="java.util.List, com.fashion.model.ClothingItem, com.fashion.util.DataGenerator" %>
<%
    List<ClothingItem> items = DataGenerator.generateClothingItems();
    request.setAttribute("clothingItems", items);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elite Fashion Hub | Premium Clothing Booking</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Enterprise Header -->
    <header class="enterprise-header">
        <div class="container">
            <div class="logo-section">
                <i class="fas fa-tshirt logo-icon"></i>
                <span class="logo-text">Elite Fashion Hub</span>
                <span class="enterprise-badge">ENTERPRISE</span>
            </div>
            <nav class="main-nav">
                <a href="#"><i class="fas fa-home"></i> Home</a>
                <a href="#shirts"><i class="fas fa-shirt"></i> Shirts</a>
                <a href="#pants"><i class="fas fa-shopping-bag"></i> Pants</a>
                <a href="#tshirts"><i class="fas fa-tshirt"></i> T-Shirts</a>
                <a href="#casuals"><i class="fas fa-user-friends"></i> Casuals</a>
                <a href="#formals"><i class="fas fa-briefcase"></i> Formals</a>
            </nav>
            <div class="header-actions">
                <i class="fas fa-search"></i>
                <i class="fas fa-shopping-cart"></i>
                <button class="btn-primary-small">Sign In</button>
            </div>
        </div>
    </header>

    <!-- Hero Banner -->
    <section class="hero">
        <div class="hero-content">
            <h1>Premium Fashion Collection</h1>
            <p>Discover the latest trends from 50+ luxury & premium brands</p>
            <button class="btn-hero">Explore Collection →</button>
        </div>
    </section>

    <!-- Filter Bar -->
    <div class="filter-bar">
        <div class="container">
            <span class="filter-label"><i class="fas fa-filter"></i> Filter by:</span>
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
                <option value="Ralph Lauren">Ralph Lauren</option>
                <option value="Levi's">Levi's</option>
                <option value="Nike">Nike</option>
                <option value="Tommy Hilfiger">Tommy Hilfiger</option>
                <option value="Hugo Boss">Hugo Boss</option>
            </select>
            <select id="sortBy">
                <option value="default">Sort by: Featured</option>
                <option value="priceLow">Price: Low to High</option>
                <option value="priceHigh">Price: High to Low</option>
            </select>
        </div>
    </div>

    <!-- Products Grid -->
    <div class="container">
        <div class="products-grid" id="productsGrid">
            <c:forEach items="${clothingItems}" var="item">
                <div class="product-card" data-category="${item.category}" data-brand="${item.brand}" data-price="${item.price}">
                    <div class="product-badge">${item.category}</div>
                    <img src="${item.imageUrl}" alt="${item.name}" class="product-image" onerror="this.src='https://via.placeholder.com/400x500?text=Fashion'">
                    <div class="product-info">
                        <div class="brand-row">
                            <img src="${item.brandLogoUrl}" alt="${item.brand}" class="brand-logo" onerror="this.src='https://via.placeholder.com/30?text=Brand'">
                            <span class="brand-name">${item.brand}</span>
                        </div>
                        <h3 class="product-title">${item.name}</h3>
                        <p class="product-desc">${item.description}</p>
                        <div class="price-row">
                            <span class="current-price">$${item.price}</span>
                            <span class="original-price">$${Math.round(item.price * 1.4)}</span>
                            <span class="discount">-30%</span>
                        </div>
                        <div class="size-options">Sizes: ${item.sizeOptions}</div>
                        <button class="btn-book" onclick="openBookingModal('${item.id}', '${item.name}', ${item.price})">
                            <i class="fas fa-calendar-check"></i> Book Now
                        </button>
                    </div>
                </div>
            </c:forEach>
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
            <div class="stat">
                <h3>50+</h3>
                <p>Premium Brands</p>
            </div>
            <div class="stat">
                <h3>10K+</h3>
                <p>Happy Customers</p>
            </div>
            <div class="stat">
                <h3>24/7</h3>
                <p>Support Available</p>
            </div>
            <div class="stat">
                <h3>100%</h3>
                <p>Authentic Products</p>
            </div>
        </div>
    </div>

    <!-- Booking Modal -->
    <div id="bookingModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
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
                <button type="submit" class="btn-submit">Confirm Booking</button>
            </form>
        </div>
    </div>

    <footer class="enterprise-footer">
        <div class="container">
            <p>&copy; 2026 Elite Fashion Hub - Enterprise Fashion Booking Platform</p>
            <p><i class="fas fa-shield-alt"></i> Secure Booking | <i class="fas fa-truck"></i> Express Delivery | <i class="fas fa-undo-alt"></i> Easy Returns</p>
        </div>
    </footer>

    <script src="js/script.js"></script>
    <script>
        // Since JSTL may not be configured in simple setup, we'll load items via JS
        window.clothingItems = ${clothingItemsJson};
    </script>
</body>
</html>
