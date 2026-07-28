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
public class ELoginModel implements Model {

    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean isWorker = false;

        try {
            //SQL connection 
//            String driver = "com.mysql.cj.jdbc.Driver";
            Connection con = DBConnect.toConnect();

            String query = "SELECT r.*,a.street,a.zip_code,a.city,a.state,a.country FROM eregister r INNER JOIN eaddress a ON r.address_id = a.address_id WHERE (r.email = ? OR r.phone = ?) AND r.password = ?;";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, username);
            ps.setString(3, password);

            ResultSet rs = ps.executeQuery();
            System.out.println("Check");
            while (rs.next()) {
                String storedemail = rs.getString("email");
                String storedphone = rs.getString("phone");
                String storedpassword = rs.getString("password");
                if ((storedemail.equals(username) || storedphone.equals(username)) && storedpassword.equals(password)) {
                    isWorker = true;
                }
                HttpSession session = request.getSession();
                session.setAttribute("e_id", rs.getInt("e_id"));
                session.setAttribute("name", rs.getString("full_name"));
                session.setAttribute("phone", rs.getString("phone"));
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("gender", rs.getString("gender"));
                session.setAttribute("dob", rs.getString("gender"));
                String dob = new java.text.SimpleDateFormat("dd/MM/yyyy").format(rs.getDate("date_of_birth"));
                session.setAttribute("dob", dob);

                session.setAttribute("street", rs.getString("street"));
                session.setAttribute("zip_code", rs.getString("zip_code"));
                session.setAttribute("city", rs.getString("city"));
                session.setAttribute("state", rs.getString("state"));
                session.setAttribute("country", rs.getString("country"));

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (isWorker) {
                request.getRequestDispatcher("EHome").forward(request, response);
            } else {
                request.setAttribute("error", "Login Failed");
                request.getRequestDispatcher("ELogin").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
