/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;

/**
 *
 * @author huzaif
 */
public class WProfileModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        int w_id = (int) session.getAttribute("w_id");
        System.out.println("Worker Id :- " + w_id);
        String occupation = request.getParameter("occupation");
        String experience_years = request.getParameter("experience_years");
        String bio = request.getParameter("bio");
        String isAvailable = request.getParameter("isAvailable");
        
        boolean profileExist = false;

        try {
//            String driver = "com.mysql.cj.jdbc.Driver";
            Connection con = DBConnect.toConnect();

            String query = "INSERT INTO wprofile (w_id,occupation,experience_years,bio,is_available) VALUES (?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, w_id);
            ps.setString(2, occupation);
            ps.setString(3, experience_years);
            ps.setString(4, bio);
            ps.setString(5, isAvailable);

            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                if (rs.getInt(1) != 0) {
                    profileExist = true;
                }
            }
                    session.setAttribute("occupation", occupation);
                    session.setAttribute("exp_years", experience_years);
                    session.setAttribute("isAvailable",isAvailable);
                    session.setAttribute("bio", bio);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            if (profileExist) {
                request.getRequestDispatcher("wnotificationmodel").forward(request, response);
            } else {
                request.getRequestDispatcher("WProfile").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
