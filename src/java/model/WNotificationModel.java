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
public class WNotificationModel implements Model{

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
//            int w_id = Integer.parseInt(request.getParameter("w_id"));\
               HttpSession session = request.getSession(true);
               int w_id = (int) session.getAttribute("w_id");
            
            try{
                Connection con = DBConnect.toConnect();
                String query = "Select h.*,e.full_name,a.city,a.state,a.zip_code "
                        + "from hirerequests h inner join eregister e ON h.e_id = e.e_id inner join eaddress a on e.address_id = a.address_id "
                        + "where h.w_id = ? "
                        + "order by h.created_at desc";
                PreparedStatement ps = con.prepareStatement(query);
                
                ps.setInt(1,w_id);
                
                ResultSet rs =ps.executeQuery();
                List<Map<String, String>> allRequests = new ArrayList<>();
                while(rs.next()){
                  Map<String, String> re = new HashMap<>();
                    re.put("request_id", String.valueOf(rs.getInt("request_id")));
                    re.put("e_id", String.valueOf(rs.getInt("e_id")));
                    re.put("w_id", String.valueOf(rs.getInt("w_id")));
                    re.put("occupation", rs.getString("occupation"));
                    re.put("hirestatus", rs.getString("hirestatus"));
                    re.put("name", rs.getString("full_name"));
                    re.put("city", rs.getString("city"));
                    re.put("state", rs.getString("state"));
                    re.put("zip_code", rs.getString("zip_code"));
                 
                 allRequests.add(re);
                }
                
                request.setAttribute("allRequests", allRequests);
                request.getRequestDispatcher("WNotification").forward(request, response);
                
            }catch (SQLException | ServletException |IOException  ex){
                ex.printStackTrace();
            }
            
    }
    
}
