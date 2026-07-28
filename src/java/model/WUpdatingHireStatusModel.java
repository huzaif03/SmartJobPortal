/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author huzaif
 */
public class WUpdatingHireStatusModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        int request_id =Integer.parseInt(request.getParameter("request_id"));
        String ans = request.getParameter("ans");
        
        try{
            Connection con = DBConnect.toConnect();
            if("Accepted".equals(ans)){
                String acceptQuery  ="update hirerequests set hirestatus = ? where request_id = ?;";
                PreparedStatement ps = con.prepareStatement(acceptQuery);
                
                ps.setString(1, ans);
                ps.setInt(2, request_id);
                
                ps.executeUpdate();
                
                
            }else if("Rejected".equals(ans)){
                String acceptQuery  ="update hirerequests set hirestatus = ? where request_id = ?;";
                PreparedStatement ps = con.prepareStatement(acceptQuery);
                
                ps.setString(1, ans);
                ps.setInt(2, request_id);
                
                ps.executeUpdate();  
            }else if("Completed".equals(ans)){
                String acceptQuery  ="update hirerequests set hirestatus = ? where request_id = ?;";
                PreparedStatement ps = con.prepareStatement(acceptQuery);
                
                ps.setString(1, ans);
                ps.setInt(2, request_id);
                
                ps.executeUpdate();  
                                
            }
            request.getRequestDispatcher("wnotificationmodel").forward(request, response);
        }catch(Exception ex){
            
        }
        
    }
    
}
