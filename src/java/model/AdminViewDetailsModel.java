/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huzaif
 */
public class AdminViewDetailsModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        if (request.getParameter("w_id") != null) {
            int w_id = Integer.parseInt(request.getParameter("w_id"));
            try {
                Connection con = DBConnect.toConnect();
                String query = "SELECT r.*, a.street, a.city, a.state, a.zip_code, a.country "
                        + "FROM wregister r INNER JOIN waddress a ON r.address_id = a.address_id "
                        + "WHERE w_id = ?;";

                String wprofile = "Select * from wprofile where w_id = ?";
                PreparedStatement ps1 = con.prepareStatement(query);
                PreparedStatement ps2 = con.prepareStatement(wprofile);

                ps1.setInt(1, w_id);
                ps2.setInt(1, w_id);

                ResultSet rs1 = ps1.executeQuery();
                ResultSet rs2 = ps2.executeQuery();

                Map<String, String> personalInfo = new HashMap<>();
                List<Map<String, String>> workProfiles = new ArrayList<>();

                if (rs1.next()) {
                    personalInfo.put("w_id", rs1.getString("w_id"));
                    personalInfo.put("full_name", rs1.getString("full_name"));
                    personalInfo.put("phone", rs1.getString("phone"));
                    personalInfo.put("email", rs1.getString("email"));
                    personalInfo.put("gender", rs1.getString("gender"));
                    personalInfo.put("password", rs1.getString("password"));
                    personalInfo.put("address_id", rs1.getString("address_id"));
                    personalInfo.put("profile_pic_path", rs1.getString("profile_pic_path"));
                    personalInfo.put("idcard_front_path", rs1.getString("idcard_front_path"));
                    personalInfo.put("idcard_back_path", rs1.getString("idcard_back_path"));

                    String dob = new java.text.SimpleDateFormat("dd/MM/yyyy").format(rs1.getDate("date_of_birth"));
                    personalInfo.put("dob", dob);
                    java.sql.Timestamp ts = rs1.getTimestamp("created_at");
                    LocalDate date = ts.toLocalDateTime().toLocalDate();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy");
                    personalInfo.put("created_at", date.format(formatter));
                    
                    personalInfo.put("status", rs1.getString("status"));
                    personalInfo.put("street", rs1.getString("street"));
                    personalInfo.put("city", rs1.getString("city"));
                    personalInfo.put("state", rs1.getString("state"));
                    personalInfo.put("zip_code", rs1.getString("zip_code"));
                    personalInfo.put("country", rs1.getString("country"));
                }
                request.setAttribute("personalInfo", personalInfo);
                while (rs2.next()) {
                    Map<String, String> workProfile = new HashMap<>();

                    workProfile.put("profile_id", rs2.getString("profile_id"));
                    workProfile.put("occupation", rs2.getString("occupation"));
                    workProfile.put("exp_years", rs2.getString("experience_years"));
                    workProfile.put("isAvailable", rs2.getString("is_available"));
                    workProfile.put("bio", rs2.getString("bio"));

                    workProfiles.add(workProfile);
                }
                request.setAttribute("workProfiles", workProfiles);

            } catch (SQLException ex) {
                Logger.getLogger(AdminViewDetailsModel.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                request.getRequestDispatcher("AdminViewDetails").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(AdminViewDetailsModel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(AdminViewDetailsModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
