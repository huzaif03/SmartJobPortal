/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huzaif
 */
public class EHireWorkerModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        int e_id = Integer.parseInt(request.getParameter("e_id"));
        int w_id = Integer.parseInt(request.getParameter("w_id"));
        String occupation = request.getParameter("occupation");
        int request_id=-1;
        try {
            Connection con = DBConnect.toConnect();
            String query = "Insert into hirerequests(e_id,w_id,occupation) values(?,?,?);";
            PreparedStatement ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            
            
            ps.setInt(1, e_id);
            ps.setInt(2, w_id);
            ps.setString(3,occupation);
            
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if(rs.next()){
                request_id = rs.getInt(1);
            }
            
            
// For Future 
//            request.setAttribute("request_id", request_id);
//            request.getRequestDispatcher("EHireWorkerStatus").forward(request, response);
            request.setAttribute("successful","Request sent to worker You can check the status from Status button");
            request.getRequestDispatcher("elistofworkermodel").forward(request, response);
            
            
            
        }catch(SQLException ex){
            ex.printStackTrace();
        } catch (ServletException ex) {
            Logger.getLogger(EHireWorkerModel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(EHireWorkerModel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
