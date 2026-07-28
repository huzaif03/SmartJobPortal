/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author huzaif
 */
public class EHireWorkerStatusModel implements Model{

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
       
        try{
            if(session == null || session.getAttribute("e_id")== null){
                request.setAttribute("error", "Please Login First");
                request.getRequestDispatcher("ELogin").forward(request, response);
            }else{
                 int e_id = (int)session.getAttribute("e_id");
                 Connection con = DBConnect.toConnect();
            String hs="select h.*,w.full_name,w.phone,w.profile_pic_path,wa.city,wa.state,wa.zip_code "
                    + "from hirerequests h inner join wregister w on h.w_id = w.w_id "
                    + "inner join waddress wa on w.address_id = wa.address_id "
                    + "where h.e_id = ? "
                    + "ORDER BY h.created_at DESC";
            
             PreparedStatement ps= con.prepareStatement(hs);
             ps.setInt(1, e_id);
             
             ResultSet rs = ps.executeQuery();
             
             List<Map<String, String>> workerHiredList = new ArrayList<>();
            while (rs.next()) {
                
                Map<String, String>  hireRequest= new HashMap<>();
                hireRequest.put("request_id", String.valueOf(rs.getInt("request_id")));
                hireRequest.put("w_id", String.valueOf(rs.getInt("w_id")));
                hireRequest.put("name", rs.getString("full_name"));
                hireRequest.put("occupation", rs.getString("occupation"));
                hireRequest.put("city", rs.getString("city"));
                hireRequest.put("state", rs.getString("state"));
                hireRequest.put("zip_code", rs.getString("zip_code"));
                hireRequest.put("hirestatus", rs.getString("hirestatus"));
                hireRequest.put("phone", rs.getString("phone"));
                hireRequest.put("profile_pic_path", rs.getString("profile_pic_path"));

                workerHiredList.add(hireRequest); 
            }
            
            request.setAttribute("workerHiredList", workerHiredList);
            request.getRequestDispatcher("EHireWorkerStatus").forward(request, response);
             

            }
                       
        }catch(Exception ex){
            ex.printStackTrace();
        }
        
    }
    
}
