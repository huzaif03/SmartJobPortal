/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
public class ECancelRequestModel implements Model{

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        int request_id =Integer.parseInt( request.getParameter("request_id"));
        String reason = request.getParameter("reason");
        
        try{
            String query = "Update hirerequests  set hirestatus = 'Cancelled',cancelreason = ? where request_id = ? ;";
            Connection con = DBConnect.toConnect();
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, reason);
            ps.setInt(2, request_id);
            
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(ECancelRequestModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            request.getRequestDispatcher("EHireWorkerStatus").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ECancelRequestModel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ECancelRequestModel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
