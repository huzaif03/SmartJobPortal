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
public class AdminUpdatingStatusModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
//        HttpSession session = request.getSession(false);
            String status = request.getParameter("status");
           
        if(request.getParameter("w_id")!=null){
            int w_id = Integer.parseInt(request.getParameter("w_id"));
            try{
               String updateStatus = "Update wregister set status = ? where w_id = ?;"; 
               Connection con = DBConnect.toConnect();
                PreparedStatement ps=con.prepareStatement(updateStatus);
                ps.setString(1, status);
                ps.setInt(2, w_id);
                ps.executeUpdate();
            }  catch (SQLException ex) {
                   Logger.getLogger(AdminUpdatingStatusModel.class.getName()).log(Level.SEVERE, null, ex);
            }
                try {
                    request.getRequestDispatcher("admintotaluserslistmodel?action=worker").forward(request, response);
                } catch (ServletException ex) {
                    Logger.getLogger(AdminUpdatingStatusModel.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(AdminUpdatingStatusModel.class.getName()).log(Level.SEVERE, null, ex);
                }
        }else if(request.getParameter("e_id")!=null){
            int e_id = Integer.parseInt(request.getParameter("e_id"));
            try{
               String updateStatus = "Update eregister set status = ? where e_id = ?;"; 
               Connection con = DBConnect.toConnect();
                PreparedStatement ps=con.prepareStatement(updateStatus);
                ps.setString(1, status);
                ps.setInt(2, e_id);
                ps.executeUpdate();
            }  catch (SQLException ex) {
                   Logger.getLogger(AdminUpdatingStatusModel.class.getName()).log(Level.SEVERE, null, ex);
            }
                try {
                    request.getRequestDispatcher("admintotaluserslistmodel?action=employer").forward(request, response);
                } catch (ServletException ex) {
                    Logger.getLogger(AdminUpdatingStatusModel.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(AdminUpdatingStatusModel.class.getName()).log(Level.SEVERE, null, ex);
                }
        }
    }
    
}
