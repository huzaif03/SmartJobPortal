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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huzaif
 */
public class WMyProfileModel implements Model{

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        int addressId = (int)session.getAttribute("address_id");
        try{
            Connection con = DBConnect.toConnect();
            String query = "Select * from waddress where address_id = ?;";
            PreparedStatement ps= con.prepareStatement(query);
            
            ps.setInt(1,addressId);
            
            ResultSet rs= ps.executeQuery();
            Map<String, String> address = new HashMap<>();
            if(rs.next()){
                address.put("street", rs.getString("street"));
                address.put("city", rs.getString("city"));
                address.put("state", rs.getString("state"));
                address.put("zip_code", rs.getString("zip_code"));
                address.put("country", rs.getString("country"));
            }
            request.setAttribute("address", address);
        } catch (SQLException ex) {
            Logger.getLogger(WMyProfileModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            
            request.getRequestDispatcher("WMyProfile").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(WMyProfileModel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(WMyProfileModel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
