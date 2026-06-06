package com.fashion.util;

import com.fashion.model.ClothingItem;
import java.util.ArrayList;
import java.util.List;
import java.util.Base64;

public class DataGenerator {
    
    // Embedded base64 images (1x1 pixel transparent as fallback, but we'll use actual data)
    private static final String FASHION_PLACEHOLDER = "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='400' height='500' viewBox='0 0 400 500'%3E%3Crect width='400' height='500' fill='%23667eea'/%3E%3Ctext x='50%25' y='50%25' text-anchor='middle' fill='white' font-size='20' dy='.3em'%3EFashion Item%3C/text%3E%3C/svg%3E";
    
    // We'll use high-quality Unsplash fashion images that are guaranteed to work
    private static final String[] IMAGE_URLS = {
        "https://images.unsplash.com/photo-1534126511673-b6899657816a?w=400&h=500&fit=crop",  // Formal shirt
        "https://images.unsplash.com/photo-1473966968600-fa801b869a1a?w=400&h=500&fit=crop",  // Jeans
        "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400&h=500&fit=crop",  // T-shirt
        "https://images.unsplash.com/photo-1483985988355-763728e1935b?w=400&h=500&fit=crop",  // Casual wear
        "https://images.unsplash.com/photo-1507679799987-c73779587ccf?w=400&h=500&fit=crop",  // Formal suit
        "https://images.unsplash.com/photo-1586363104861-3a5e2ab9d6ae?w=400&h=500&fit=crop",  // Polo
        "https://images.unsplash.com/photo-1517438476313-10d79c077051?w=400&h=500&fit=crop",  // Cargo
        "https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=400&h=500&fit=crop",  // Linen shirt
        "https://images.unsplash.com/photo-1598550874175-4d0ef436c909?w=400&h=500&fit=crop",  // Blouse
        "https://images.unsplash.com/photo-1594938374182-f1c9e6b9d7b0?w=400&h=500&fit=crop",  // Trousers
        "https://images.unsplash.com/photo-1551537482-f2075a1d41f2?w=400&h=500&fit=crop",  // Jacket
        "https://images.unsplash.com/photo-1565693413256-d6e9c9a2f173?w=400&h=500&fit=crop"   // Shorts
    };
    
    private static final String[] BRAND_LOGOS = {
        "https://logo.clearbit.com/ralphlauren.com?size=60",
        "https://logo.clearbit.com/levi.com?size=60",
        "https://logo.clearbit.com/nike.com?size=60",
        "https://logo.clearbit.com/tommy.com?size=60",
        "https://logo.clearbit.com/hugoboss.com?size=60",
        "https://logo.clearbit.com/lacoste.com?size=60",
        "https://logo.clearbit.com/thenorthface.com?size=60",
        "https://logo.clearbit.com/zara.com?size=60",
        "https://logo.clearbit.com/michaelkors.com?size=60",
        "https://logo.clearbit.com/armani.com?size=60",
        "https://logo.clearbit.com/calvinklein.com?size=60",
        "https://logo.clearbit.com/adidas.com?size=60"
    };
    
    public static List<ClothingItem> generateClothingItems() {
        List<ClothingItem> items = new ArrayList<>();
        
        items.add(new ClothingItem("1", "Slim Fit Oxford Shirt", "Shirts", "Ralph Lauren", 
            BRAND_LOGOS[0], 89.99, IMAGE_URLS[0], 
            "Classic formal shirt, 100% premium cotton with wrinkle-resistant finish", "S,M,L,XL"));
            
        items.add(new ClothingItem("2", "Stretch Denim Jeans", "Pants", "Levi's", 
            BRAND_LOGOS[1], 79.99, IMAGE_URLS[1], 
            "Comfort stretch jeans with authentic vintage wash", "30,32,34,36"));
            
        items.add(new ClothingItem("3", "Graphic Print T-Shirt", "T-Shirts", "Nike", 
            BRAND_LOGOS[2], 39.99, IMAGE_URLS[2], 
            "Cotton blend, athletic fit with moisture-wicking technology", "S,M,L,XL"));
            
        items.add(new ClothingItem("4", "Casual Chinos", "Casuals", "Tommy Hilfiger", 
            BRAND_LOGOS[3], 69.99, IMAGE_URLS[3], 
            "Slim fit chinos with signature stripe detailing", "30,32,34"));
            
        items.add(new ClothingItem("5", "Wool Blazer", "Formals", "Hugo Boss", 
            BRAND_LOGOS[4], 299.99, IMAGE_URLS[4], 
            "Premium wool blend blazer, tailored for modern professionals", "S,M,L,XL"));
            
        items.add(new ClothingItem("6", "Polo T-Shirt", "T-Shirts", "Lacoste", 
            BRAND_LOGOS[5], 59.99, IMAGE_URLS[5], 
            "Classic pique polo with embroidered crocodile logo", "S,M,L,XL"));
            
        items.add(new ClothingItem("7", "Cargo Pants", "Pants", "The North Face", 
            BRAND_LOGOS[6], 89.99, IMAGE_URLS[6], 
            "Durable cotton cargo pants with multiple utility pockets", "30,32,34,36"));
            
        items.add(new ClothingItem("8", "Linen Summer Shirt", "Casuals", "Zara", 
            BRAND_LOGOS[7], 49.99, IMAGE_URLS[7], 
            "Breathable linen shirt, perfect for summer", "S,M,L,XL"));
            
        items.add(new ClothingItem("9", "Smart Blouse", "Shirts", "Michael Kors", 
            BRAND_LOGOS[8], 79.99, IMAGE_URLS[8], 
            "Elegant silk-blend blouse with feminine cut", "XS,S,M,L"));
            
        items.add(new ClothingItem("10", "Premium Trousers", "Formals", "Armani", 
            BRAND_LOGOS[9], 159.99, IMAGE_URLS[9], 
            "Tailored fit trousers in premium wool blend", "30,32,34,36"));
            
        items.add(new ClothingItem("11", "Denim Jacket", "Casuals", "Calvin Klein", 
            BRAND_LOGOS[10], 129.99, IMAGE_URLS[10], 
            "Classic denim jacket with modern slim fit", "S,M,L,XL"));
            
        items.add(new ClothingItem("12", "Athletic Shorts", "Pants", "Adidas", 
            BRAND_LOGOS[11], 34.99, IMAGE_URLS[11], 
            "Breathable training shorts with built-in liner", "S,M,L,XL"));
            
        // Add 8 more items for variety
        items.add(new ClothingItem("13", "Velvet Dinner Jacket", "Formals", "Dolce & Gabbana", 
            "https://logo.clearbit.com/dolcegabbana.com?size=60", 499.99, 
            "https://images.unsplash.com/photo-1509631179647-0177331693ae?w=400&h=500&fit=crop", 
            "Luxurious velvet jacket for special occasions", "S,M,L,XL"));
            
        items.add(new ClothingItem("14", "Hooded Sweatshirt", "Casuals", "Champion", 
            "https://logo.clearbit.com/champion.com?size=60", 54.99, 
            "https://images.unsplash.com/photo-1556821840-3a63f95609a7?w=400&h=500&fit=crop", 
            "Reverse weave hoodie, fleece-lined", "S,M,L,XL"));
            
        items.add(new ClothingItem("15", "Printed Leggings", "Pants", "Lululemon", 
            "https://logo.clearbit.com/lululemon.com?size=60", 98.99, 
            "https://images.unsplash.com/photo-1506629082955-511b1aa562c8?w=400&h=500&fit=crop", 
            "High-waisted yoga leggings, buttery soft", "XS,S,M,L"));
            
        items.add(new ClothingItem("16", "Silk Tie Set", "Formals", "Hermès", 
            "https://logo.clearbit.com/hermes.com?size=60", 199.99, 
            "https://images.unsplash.com/photo-1589756823695-278bc923f962?w=400&h=500&fit=crop", 
            "100% silk necktie with pocket square", "One Size"));
            
        items.add(new ClothingItem("17", "Cashmere Sweater", "Casuals", "Brunello Cucinelli", 
            "https://logo.clearbit.com/brunellocucinelli.com?size=60", 895.00, 
            "https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=400&h=500&fit=crop", 
            "Ultra-soft cashmere crewneck sweater", "S,M,L,XL"));
            
        items.add(new ClothingItem("18", "Crop Top", "T-Shirts", "Fashion Nova", 
            "https://logo.clearbit.com/fashionnova.com?size=60", 24.99, 
            "https://images.unsplash.com/photo-1529139574466-a303027c1d8b?w=400&h=500&fit=crop", 
            "Trendy ribbed knit crop top", "XS,S,M"));
            
        items.add(new ClothingItem("19", "Pleated Skirt", "Casuals", "Mango", 
            "https://logo.clearbit.com/mango.com?size=60", 45.99, 
            "https://images.unsplash.com/photo-1583496661160-fb5886a0e8be?w=400&h=500&fit=crop", 
            "Pleated midi skirt, elegant drape", "XS,S,M,L"));
            
        items.add(new ClothingItem("20", "Bomber Jacket", "Casuals", "Alpha Industries", 
            "https://logo.clearbit.com/alphaindustries.com?size=60", 159.99, 
            "https://images.unsplash.com/photo-1551028719-00167b16eac1?w=400&h=500&fit=crop", 
            "Classic MA-1 bomber jacket", "S,M,L,XL"));
            
        return items;
    }
}
