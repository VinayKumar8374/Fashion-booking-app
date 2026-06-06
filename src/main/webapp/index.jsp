<!-- Products Grid with Enhanced Image Handling -->
<div class="container">
    <div class="products-grid" id="productsGrid">
        <% 
            List<ClothingItem> items = DataGenerator.generateClothingItems();
            for(ClothingItem item : items) {
        %>
        <div class="product-card" data-category="<%= item.getCategory() %>" 
             data-brand="<%= item.getBrand() %>" data-price="<%= item.getPrice() %>">
            <div class="product-badge"><%= item.getCategory() %></div>
            <img src="<%= item.getImageUrl() %>" 
                 alt="<%= item.getName() %>" 
                 class="product-image"
                 loading="lazy"
                 onerror="this.onerror=null; this.src='data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 width=%22400%22 height=%22500%22 viewBox=%220 0 400 500%22%3E%3Crect width=%22400%22 height=%22500%22 fill=%22%23667eea%22/%3E%3Ctext x=%2250%25%22 y=%2250%25%22 text-anchor=%22middle%22 fill=%22white%22 font-size=%2220%22 dy=%22.3em%22%3E<%= item.getName() %>%3C/text%3E%3C/svg%3E';">
            <div class="product-info">
                <div class="brand-row">
                    <img src="<%= item.getBrandLogoUrl() %>" 
                         alt="<%= item.getBrand() %>" 
                         class="brand-logo"
                         onerror="this.onerror=null; this.src='data:image/svg+xml,%3Csvg xmlns=%22http://www.w3.org/2000/svg%22 width=%2230%22 height=%2230%22 viewBox=%220 0 30 30%22%3E%3Ccircle cx=%2215%22 cy=%2215%22 r=%2215%22 fill=%22%233b82f6%22/%3E%3Ctext x=%2250%25%22 y=%2250%25%22 text-anchor=%22middle%22 fill=%22white%22 font-size=%2212%22 dy=%22.3em%22%3E<%= item.getBrand().charAt(0) %>%3C/text%3E%3C/svg%3E';">
                    <span class="brand-name"><%= item.getBrand() %></span>
                </div>
                <h3 class="product-title"><%= item.getName() %></h3>
                <p class="product-desc"><%= item.getDescription() %></p>
                <div class="price-row">
                    <span class="current-price">$<%= String.format("%.2f", item.getPrice()) %></span>
                    <span class="original-price">$<%= String.format("%.2f", item.getPrice() * 1.4) %></span>
                    <span class="discount">-30%</span>
                </div>
                <div class="size-options">
                    <i class="fas fa-ruler-combined"></i> Sizes: <%= item.getSizeOptions() %>
                </div>
                <button class="btn-book" onclick="openBookingModal('<%= item.getId() %>', '<%= item.getName() %>', <%= item.getPrice() %>)">
                    <i class="fas fa-calendar-check"></i> Book Now
                </button>
            </div>
        </div>
        <% } %>
    </div>
</div>
