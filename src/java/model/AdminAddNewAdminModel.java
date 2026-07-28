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
public class AdminAddNewAdminModel implements Model{

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session  = request.getSession(false);
        
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        if((int)session.getAttribute("admin_id") == 1){
            try{
                String query = "Insert into adminregister(full_name,phone,email,gender,password) values(?,?,?,?,?);";
                Connection con = DBConnect.toConnect();
                PreparedStatement ps = con.prepareStatement(query);
                
                ps.setString(1, name);
                ps.setString(2, phone);
                ps.setString(3, email);
                ps.setString(4, gender);
                ps.setString(5, password);
                ps.executeUpdate();
                session.setAttribute("adminCount", (int)session.getAttribute("adminCount")+1);
            } catch (SQLException ex) {
                Logger.getLogger(AdminAddNewAdminModel.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("succesfull", "Registration Successfull");
            try {
                request.getRequestDispatcher("admintotaluserslistmodel?action=admin").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(AdminAddNewAdminModel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(AdminAddNewAdminModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
}
