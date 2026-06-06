package com.fashion.util;

import com.fashion.model.ClothingItem;
import java.util.ArrayList;
import java.util.List;

public class DataGenerator {
    public static List<ClothingItem> generateClothingItems() {
        List<ClothingItem> items = new ArrayList<>();
        
        // Using high-quality placeholder images (replace with real URLs if needed)
        items.add(new ClothingItem("1", "Slim Fit Oxford Shirt", "Shirts", "Ralph Lauren", 
            "https://logo.clearbit.com/ralphlauren.com", 89.99, 
            "https://images.unsplash.com/photo-1598032895397-b9472444bf93?w=400", 
            "Classic formal shirt, 100% cotton", "S,M,L,XL"));
            
        items.add(new ClothingItem("2", "Stretch Denim Jeans", "Pants", "Levi's", 
            "https://logo.clearbit.com/levi.com", 79.99, 
            "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?w=400", 
            "Comfort stretch jeans", "30,32,34,36"));
            
        items.add(new ClothingItem("3", "Graphic Print T-Shirt", "T-Shirts", "Nike", 
            "https://logo.clearbit.com/nike.com", 39.99, 
            "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400", 
            "Cotton blend, athletic fit", "S,M,L,XL"));
            
        items.add(new ClothingItem("4", "Casual Chinos", "Casuals", "Tommy Hilfiger", 
            "https://logo.clearbit.com/tommy.com", 69.99, 
            "https://images.unsplash.com/photo-1594938298603-c8148c4dae35?w=400", 
            "Slim fit chinos", "30,32,34"));
            
        items.add(new ClothingItem("5", "Wool Blazer", "Formals", "Hugo Boss", 
            "https://logo.clearbit.com/hugoboss.com", 299.99, 
            "https://images.unsplash.com/photo-1507679799987-c73779587ccf?w=400", 
            "Premium wool blend", "S,M,L,XL"));
            
        items.add(new ClothingItem("6", "Polo T-Shirt", "T-Shirts", "Lacoste", 
            "https://logo.clearbit.com/lacoste.com", 59.99, 
            "https://images.unsplash.com/photo-1586363104861-3a5e2ab9d6ae?w=400", 
            "Classic pique polo", "S,M,L,XL"));
            
        items.add(new ClothingItem("7", "Cargo Pants", "Pants", "The North Face", 
            "https://logo.clearbit.com/thenorthface.com", 89.99, 
            "https://images.unsplash.com/photo-1517438476313-10d79c077051?w=400", 
            "Durable cotton cargo", "30,32,34,36"));
            
        items.add(new ClothingItem("8", "Linen Summer Shirt", "Casuals", "Zara", 
            "https://logo.clearbit.com/zara.com", 49.99, 
            "https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=400", 
            "Breathable linen", "S,M,L,XL"));
            
        items.add(new ClothingItem("9", "Smart Blouse", "Shirts", "Michael Kors", 
            "https://logo.clearbit.com/michaelkors.com", 79.99, 
            "https://images.unsplash.com/photo-1598550874175-4d0ef436c909?w=400", 
            "Elegant silk blouse", "XS,S,M,L"));
            
        items.add(new ClothingItem("10", "Premium Trousers", "Formals", "Armani", 
            "https://logo.clearbit.com/armani.com", 159.99, 
            "https://images.unsplash.com/photo-1594938374182-f1c9e6b9d7b0?w=400", 
            "Tailored fit trousers", "30,32,34,36"));
            
        items.add(new ClothingItem("11", "Denim Jacket", "Casuals", "Calvin Klein", 
            "https://logo.clearbit.com/calvinklein.com", 129.99, 
            "https://images.unsplash.com/photo-1551537482-f2075a1d41f2?w=400", 
            "Classic denim jacket", "S,M,L,XL"));
            
        items.add(new ClothingItem("12", "Athletic Shorts", "Pants", "Adidas", 
            "https://logo.clearbit.com/adidas.com", 34.99, 
            "https://images.unsplash.com/photo-1565693413256-d6e9c9a2f173?w=400", 
            "Breathable training shorts", "S,M,L,XL"));
            
        return items;
    }
}
