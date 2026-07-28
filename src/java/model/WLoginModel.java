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
public class WLoginModel implements Model {

    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean isWorker = false;
        boolean profileExist = false;

        int w_id = 0;

        try {
            //SQL connection 
//            String driver = "com.mysql.cj.jdbc.Driver";
            Connection con = DBConnect.toConnect();

            String query = "SELECT * FROM wregister WHERE (email = ? OR phone = ?) AND password = ?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, username);
            ps.setString(3, password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String storedemail = rs.getString("email");
                String storedphone = rs.getString("phone");
                String storedpassword = rs.getString("password");
                if ((storedemail.equals(username) || storedphone.equals(username)) && storedpassword.equals(password)) {
                    isWorker = true;
                }
                w_id = rs.getInt("w_id");
                session.setAttribute("w_id", w_id);
                session.setAttribute("address_id", rs.getInt("address_id"));
                session.setAttribute("name", rs.getString("full_name"));
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("phone", rs.getString("phone"));
                session.setAttribute("gender", rs.getString("gender"));
                session.setAttribute("profile_pic_path", rs.getString("profile_pic_path"));
                String dob = new java.text.SimpleDateFormat("dd/MM/yyyy").format(rs.getDate("date_of_birth"));
                session.setAttribute("dob", dob);

            }
// For Checking Worker Has Profile or Not
            if (isWorker) {
                String isProfileExist = "SELECT * FROM wprofile WHERE w_id = ?";
                PreparedStatement ps1 = con.prepareStatement(isProfileExist);

                ps1.setInt(1, w_id);

                ResultSet rs1 = ps1.executeQuery();
                while (rs1.next()) {
                    if (rs1.getInt("profile_id") != 0) {
                        profileExist = true;
                    }
                    session.setAttribute("occupation", rs1.getString("occupation"));
                    session.setAttribute("exp_years", rs1.getString("experience_years"));
                    session.setAttribute("isAvailable", rs1.getString("is_available"));
                    session.setAttribute("bio", rs1.getString("bio"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {

            if (isWorker && profileExist) {
                request.getRequestDispatcher("whomemodel").forward(request, response);
            } else if (isWorker && profileExist == false) {
                request.getRequestDispatcher("WProfile").forward(request, response);
            } else {
                request.setAttribute("error", "Try with the correct password");
                request.getRequestDispatcher("WLogin").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
