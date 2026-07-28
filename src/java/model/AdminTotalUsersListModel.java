/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class AdminTotalUsersListModel implements Model{

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        
        String action =(String) request.getParameter("action");
        if(action.equals("worker")){
            try{
            String query = "Select * from wregister;";
            Connection con = DBConnect.toConnect();
            PreparedStatement ps=con.prepareStatement(query);
            
            ResultSet rs= ps.executeQuery();
            List<Map<String,String>> totalWorkers = new ArrayList<>();
            while(rs.next()){
                Map<String,String> worker = new HashMap<>();
                worker.put("w_id", String.valueOf(rs.getInt("w_id")));
                worker.put("name", rs.getString("full_name"));
                worker.put("phone", rs.getString("phone"));
                worker.put("email", rs.getString("email"));
                worker.put("status", rs.getString("status"));         
                
                totalWorkers.add(worker);
            }
            request.setAttribute("totalWorkers", totalWorkers);
            } catch (SQLException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }else if(action.equals("employer")){
            try{
            String query = "Select * from eregister;";
            Connection con = DBConnect.toConnect();
            PreparedStatement ps=con.prepareStatement(query);
            
            ResultSet rs= ps.executeQuery();
            List<Map<String,String>> totalEmployers = new ArrayList<>();
            while(rs.next()){
                Map<String,String> employer = new HashMap<>();
                employer.put("e_id", String.valueOf(rs.getInt("e_id")));
                employer.put("name", rs.getString("full_name"));
                employer.put("phone", rs.getString("phone"));
                employer.put("email", rs.getString("email"));
                employer.put("status", rs.getString("status"));         
                
                totalEmployers.add(employer);
            }
            request.setAttribute("totalEmployers", totalEmployers);
            } catch (SQLException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if(action.equals("admin")){
            try{
            String query = "Select * from adminregister;";
            Connection con = DBConnect.toConnect();
            PreparedStatement ps=con.prepareStatement(query);
            
            ResultSet rs= ps.executeQuery();
            List<Map<String,String>> totalAdmins = new ArrayList<>();
            while(rs.next()){
                Map<String,String> admin = new HashMap<>();
                admin.put("admin_id", String.valueOf(rs.getInt("admin_id")));
                admin.put("name", rs.getString("full_name"));
                admin.put("phone", rs.getString("phone"));
                admin.put("email", rs.getString("email"));                
                totalAdmins.add(admin);
            }
            request.setAttribute("totalAdmins", totalAdmins);
            } catch (SQLException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if(action.equals("hirerequests")){
            try{    
            String query = "Select * from hirerequests;";
            Connection con = DBConnect.toConnect();
            PreparedStatement ps=con.prepareStatement(query);
            
            ResultSet rs= ps.executeQuery();
            List<Map<String,String>> hireRequests = new ArrayList<>();
            while(rs.next()){
                Map<String,String> hire = new HashMap<>();
                hire.put("request_id", String.valueOf(rs.getInt("request_id")));
                hire.put("w_id", String.valueOf(rs.getInt("w_id")));
                hire.put("e_id", String.valueOf(rs.getInt("e_id")));
                hire.put("occupation", rs.getString("occupation"));
                hire.put("hirestatus", rs.getString("hirestatus"));         
                hireRequests.add(hire);
            }
            request.setAttribute("hireRequests", hireRequests);
            } catch (SQLException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if(action.equals("pendingrequests")){
            try{    
            String query = "Select * from hirerequests where hirestatus = 'Pending';";
            Connection con = DBConnect.toConnect();
            PreparedStatement ps=con.prepareStatement(query);
            
            ResultSet rs= ps.executeQuery();
            List<Map<String,String>> pendingRequests = new ArrayList<>();
            while(rs.next()){
                Map<String,String> pending = new HashMap<>();
                pending.put("request_id", String.valueOf(rs.getInt("request_id")));
                pending.put("w_id", String.valueOf(rs.getInt("w_id")));
                pending.put("e_id", String.valueOf(rs.getInt("e_id")));
                pending.put("occupation", rs.getString("occupation"));       
                pendingRequests.add(pending);
            }
            request.setAttribute("pendingRequests", pendingRequests);
            } catch (SQLException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if(action.equals("bannedusers")){
            try{
            String query = "Select * from wregister where status = 'Banned';";
            Connection con = DBConnect.toConnect();
            PreparedStatement ps=con.prepareStatement(query);
            
            ResultSet rs= ps.executeQuery();
            List<Map<String,String>> bannedWorkers = new ArrayList<>();
            while(rs.next()){
                Map<String,String> banWorker = new HashMap<>();
                banWorker.put("w_id", String.valueOf(rs.getInt("w_id")));
                banWorker.put("name", rs.getString("full_name"));
                banWorker.put("phone", rs.getString("phone"));
                banWorker.put("email", rs.getString("email"));
                banWorker.put("status", rs.getString("status"));         
                
                bannedWorkers.add(banWorker);
            }
            request.setAttribute("bannedWorkers", bannedWorkers);
            } catch (SQLException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            }
            try{
            String query = "Select * from eregister where status= 'Banned';";
            Connection con = DBConnect.toConnect();
            PreparedStatement ps=con.prepareStatement(query);
            
            ResultSet rs= ps.executeQuery();
            List<Map<String,String>> bannedEmployers = new ArrayList<>();
            while(rs.next()){
                Map<String,String> banEmployer = new HashMap<>();
                banEmployer.put("e_id", String.valueOf(rs.getInt("e_id")));
                banEmployer.put("name", rs.getString("full_name"));
                banEmployer.put("phone", rs.getString("phone"));
                banEmployer.put("email", rs.getString("email"));
                banEmployer.put("status", rs.getString("status"));         
                
                bannedEmployers.add(banEmployer);
            }
            request.setAttribute("bannedEmployers", bannedEmployers);
            } catch (SQLException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        
        if(action.equals("worker")){
            try {
                request.getRequestDispatcher("AdminTotalWorkerList").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if(action.equals("employer")){
            try {
            request.getRequestDispatcher("AdminTotalEmployerList").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if(action.equals("admin")){
            try {
            request.getRequestDispatcher("AdminTotalAdminsList").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if(action.equals("hirerequests")){
            try {
            request.getRequestDispatcher("AdminTotalHireRequestsList").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if(action.equals("pendingrequests")){
            try {
            request.getRequestDispatcher("AdminTotalPendingRequestList").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if(action.equals("bannedusers")){
            try {
            request.getRequestDispatcher("AdminTotalBannedUsersList").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(AdminTotalUsersListModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
