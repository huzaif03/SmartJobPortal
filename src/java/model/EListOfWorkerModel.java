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
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huzaif
 */
public class EListOfWorkerModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        String zip_code = (String) session.getAttribute("zip_code");
        String city = (String) session.getAttribute("city");
        
        
        String is_available = "Available";
        String occupation = request.getParameter("occupation");

        try {
            Connection con = DBConnect.toConnect();

            String query = "select r.w_id,r.full_name,r.profile_pic_path,p.occupation,a.city,a.state,a.zip_code,p.experience_years,p.is_available"
                    + " from wregister r inner join waddress a on r.address_id = a.address_id inner join wprofile p on r.w_id = p.w_id "
                    + "WHERE p.occupation = ? AND p.is_available= ? AND (a.zip_code = ? OR a.city = ?);";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, occupation);
            ps.setString(2, is_available);
            ps.setString(3, zip_code);
            ps.setString(4, city);

            ResultSet rs = ps.executeQuery();
           
            List<Map<String, String>> workerList = new ArrayList<>();
            while (rs.next()) {
                
                Map<String, String> worker = new HashMap<>();
                worker.put("w_id", String.valueOf(rs.getInt("w_id")));
                worker.put("name", rs.getString("full_name"));
                worker.put("profile_pic_path", rs.getString("profile_pic_path"));
                worker.put("occupation", rs.getString("occupation"));
                worker.put("exp", rs.getString("experience_years"));
                worker.put("isAvailable", rs.getString("is_available"));
                worker.put("city", rs.getString("city"));
                worker.put("state", rs.getString("state"));
                worker.put("zip_code", rs.getString("zip_code"));

                workerList.add(worker); 
            }
              request.setAttribute("workerList", workerList);
              if(workerList.isEmpty()){
                  System.out.println("List is empty");
              }
              request.getRequestDispatcher("EListOfWorker").forward(request, response);
        } catch (SQLException e ) {
            e.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (ServletException ex) {
            Logger.getLogger(EListOfWorkerModel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
