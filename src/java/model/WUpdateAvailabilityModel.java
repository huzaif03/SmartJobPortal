/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huzaif
 */
public class WUpdateAvailabilityModel implements Model{

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        int w_id=(int)(session.getAttribute("w_id"));
        String isAvailable = null;
        
        
        boolean availableFlag =Boolean.parseBoolean( request.getParameter("availableFlag"));
        if(availableFlag){
            isAvailable = "Available";
        }else if(!availableFlag){
            isAvailable = "Not Available";
        }
        try{
            Connection con = DBConnect.toConnect();
            String query = "Update wprofile set is_available = ? where w_id = ?;";
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, isAvailable);
            ps.setInt(2, w_id);
            
            ps.executeUpdate();
            
        }catch(SQLException e){
            e.printStackTrace();
        }
        session.setAttribute("isAvailable", isAvailable);
        try {
            request.getRequestDispatcher("whomemodel").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(WUpdateAvailabilityModel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(WUpdateAvailabilityModel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
