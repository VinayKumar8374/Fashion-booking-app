package com.fashion.model;

public class ClothingItem {
    private String id;
    private String name;
    private String category;
    private String brand;
    private String brandLogoUrl;
    private double price;
    private String imageUrl;
    private String description;
    private String sizeOptions;

    public ClothingItem(String id, String name, String category, String brand, 
                        String brandLogoUrl, double price, String imageUrl, 
                        String description, String sizeOptions) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.brand = brand;
        this.brandLogoUrl = brandLogoUrl;
        this.price = price;
        this.imageUrl = imageUrl;
        this.description = description;
        this.sizeOptions = sizeOptions;
    }

    // Getters and Setters
    public String getId() { return id; }
    public String getName() { return name; }
    public String getCategory() { return category; }
    public String getBrand() { return brand; }
    public String getBrandLogoUrl() { return brandLogoUrl; }
    public double getPrice() { return price; }
    public String getImageUrl() { return imageUrl; }
    public String getDescription() { return description; }
    public String getSizeOptions() { return sizeOptions; }
}
