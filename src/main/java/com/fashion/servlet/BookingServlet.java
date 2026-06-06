package com.fashion.servlet;

import com.fashion.model.ClothingItem;
import com.fashion.util.DataGenerator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/book")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String itemId = request.getParameter("itemId");
        String itemName = request.getParameter("itemName");
        String customerName = request.getParameter("customerName");
        String email = request.getParameter("email");
        String size = request.getParameter("size");
        String quantity = request.getParameter("quantity");
        
        // Simple validation
        if (customerName == null || email == null || itemId == null) {
            response.sendRedirect("index.jsp?error=1");
            return;
        }
        
        request.setAttribute("itemName", itemName);
        request.setAttribute("customerName", customerName);
        request.setAttribute("email", email);
        request.setAttribute("size", size);
        request.setAttribute("quantity", quantity);
        
        request.getRequestDispatcher("booking-success.jsp").forward(request, response);
    }
}
