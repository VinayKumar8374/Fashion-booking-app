// Filter and sort functionality
function filterAndSortProducts() {
    const category = document.getElementById('categoryFilter').value;
    const brand = document.getElementById('brandFilter').value;
    const sort = document.getElementById('sortBy').value;
    const products = document.querySelectorAll('.product-card');
    
    let visibleProducts = Array.from(products);
    
    visibleProducts = visibleProducts.filter(product => {
        const productCategory = product.dataset.category;
        const productBrand = product.dataset.brand;
        const categoryMatch = category === 'all' || productCategory === category;
        const brandMatch = brand === 'all' || productBrand === brand;
        return categoryMatch && brandMatch;
    });
    
    if (sort === 'priceLow') {
        visibleProducts.sort((a,b) => parseFloat(a.dataset.price) - parseFloat(b.dataset.price));
    } else if (sort === 'priceHigh') {
        visibleProducts.sort((a,b) => parseFloat(b.dataset.price) - parseFloat(a.dataset.price));
    }
    
    const grid = document.getElementById('productsGrid');
    grid.innerHTML = '';
    visibleProducts.forEach(p => grid.appendChild(p));
}

// Booking modal
function openBookingModal(id, name, price) {
    document.getElementById('itemId').value = id;
    document.getElementById('itemName').value = name;
    document.getElementById('bookingModal').style.display = 'block';
}

document.querySelector('.close').onclick = () => document.getElementById('bookingModal').style.display = 'none';
window.onclick = event => { if (event.target === document.getElementById('bookingModal')) document.getElementById('bookingModal').style.display = 'none'; }

// Attach event listeners
document.getElementById('categoryFilter')?.addEventListener('change', filterAndSortProducts);
document.getElementById('brandFilter')?.addEventListener('change', filterAndSortProducts);
document.getElementById('sortBy')?.addEventListener('change', filterAndSortProducts);
