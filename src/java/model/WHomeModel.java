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
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

/**
 *
 * @author huzaif
 */
public class WHomeModel implements Model{

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        
        HttpSession session = request.getSession(false);
        int w_id =(int) session.getAttribute("w_id");
        try {
            Connection con = DBConnect.toConnect();
//Counting the Pending Requests and Completed Requests
                String count = "SELECT COUNT(CASE WHEN hirestatus = ? THEN 1 END) AS pending_count, "
                        + "COUNT(CASE WHEN hirestatus = ? THEN 1 END) AS completed_count "
                        + "FROM hirerequests where w_id = ?";

                PreparedStatement ps = con.prepareStatement(count);
                ps.setString(1, "Pending");
                ps.setString(2, "Completed");
                ps.setInt(3, w_id);
                
                ResultSet rs= ps.executeQuery();
                if(rs.next()){

                         session.setAttribute("pendingRequestCount", rs.getInt("pending_count"));
                         session.setAttribute("completedJobsCount", rs.getInt("completed_count"));
                }
            request.getRequestDispatcher("WHome").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(WHomeModel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(WHomeModel.class.getName()).log(Level.SEVERE, null, ex);
        }catch(SQLException e){
            e.printStackTrace();
        }   
    }
    
}
