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
/**
 *
 * @author huzaif
 */
public class AdminLoginModel implements Model{
    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean isAdmin = false;
        try {
            Connection con = DBConnect.toConnect();
            String query = "SELECT * FROM adminregister WHERE (email = ? OR phone = ?) AND password = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, username);
            ps.setString(3, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                isAdmin =true;
                HttpSession session = request.getSession(true);
                session.setAttribute("admin_id", rs.getInt("admin_id"));
                session.setAttribute("name", rs.getString("full_name"));
                session.setAttribute("email", rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if(isAdmin){ 
                request.getRequestDispatcher("admindashboardmodel").forward(request, response);          
            }else{
                request.setAttribute("error", "Invalid Password");
                request.getRequestDispatcher("AdminLogin").forward(request, response);
            }       
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
