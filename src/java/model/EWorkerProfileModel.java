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
import java.util.HashMap;
import java.util.Map;
import java.time.LocalDate;
import java.time.Period;

/**
 *
 * @author huzaif
 */
public class EWorkerProfileModel implements Model{

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        int w_id = Integer.parseInt(request.getParameter("w_id"));
        
        
        try{
            Connection con = DBConnect.toConnect();
            String query = "select r.w_id,r.full_name,r.date_of_birth,r.profile_pic_path,p.occupation,a.city,a.state,a.zip_code,p.experience_years,p.is_available,p.bio "
                    + "from wregister r inner join waddress a on r.address_id = a.address_id inner join wprofile p on r.w_id = p.w_id where r.w_id = ?;";
            PreparedStatement ps=con.prepareStatement(query);
            
            ps.setInt(1, w_id);
            
            ResultSet rs = ps.executeQuery();
            Map<String,String> worker = new HashMap<>();
            if(rs.next()){
                worker.put("w_id", String.valueOf(rs.getInt("w_id")));
                worker.put("name", rs.getString("full_name"));
                worker.put("occupation", rs.getString("occupation"));
                worker.put("exp", rs.getString("experience_years"));
                worker.put("isAvailable", rs.getString("is_available"));
                worker.put("city", rs.getString("city"));
                worker.put("state", rs.getString("state"));
                worker.put("zip_code", rs.getString("zip_code"));
                worker.put("bio", rs.getString("bio"));
                worker.put("profile_pic_path", rs.getString("profile_pic_path"));
                
                String dob = rs.getString("date_of_birth");
                
                
                LocalDate birthDate = LocalDate.parse(dob);
                LocalDate currentDate = LocalDate.now();
                
                String age =String.valueOf( Period.between(birthDate, currentDate).getYears());
                worker.put("age", age);
                
            }
                
            request.setAttribute("worker", worker);
            try {
                request.getRequestDispatcher("EWorkerProfile").forward(request, response);
            } catch (ServletException | IOException ex) {
                ex.printStackTrace();
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        
    }
    
}
