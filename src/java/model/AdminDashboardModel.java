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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author huzaif
 */
public class AdminDashboardModel implements Model{
    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        int workerCount = 0;
        int employerCount = 0;
        int adminCount = 0;
        int pendingCount = 0;
        int hireRequestsCount = 0;
        int bannedWorkerCount = 0;
        int bannedEmployerCount = 0;
        HttpSession session = request.getSession(false);
        try{
           String count = "SELECT "
            + "(SELECT COUNT(*) FROM wregister) AS workerCount, "
            + "(SELECT COUNT(*) FROM eregister) AS employerCount, "
            + "(SELECT COUNT(*) FROM adminregister) AS adminCount, "
            + "(SELECT COUNT(*) FROM hirerequests) AS hireRequestsCount, "
            + "(SELECT COUNT(*) FROM hirerequests WHERE hirestatus='Pending') AS pendingCount, "
            + "(SELECT COUNT(*) FROM wregister WHERE status='Banned') AS bannedWorkerCount, "
            + "(SELECT COUNT(*) FROM eregister WHERE status='Banned') AS bannedEmployerCount";
            Connection con = DBConnect.toConnect();
            PreparedStatement ps = con.prepareStatement(count);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
               workerCount = rs.getInt("workerCount");
               employerCount = rs.getInt("employerCount");
               adminCount  = rs.getInt("adminCount");
               pendingCount  = rs.getInt("pendingCount");
               hireRequestsCount = rs.getInt("hireRequestsCount");
               bannedWorkerCount = rs.getInt("bannedWorkerCount");
               bannedEmployerCount = rs.getInt("bannedEmployerCount");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDashboardModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(workerCount);
        try {
            session.setAttribute("workerCount", workerCount);
            session.setAttribute("employerCount", employerCount);
            session.setAttribute("adminCount", adminCount);
            session.setAttribute("pendingCount", pendingCount);
            session.setAttribute("hireRequestsCount", hireRequestsCount);
            session.setAttribute("bannedWorkerCount", bannedWorkerCount);
            session.setAttribute("bannedEmployerCount", bannedEmployerCount);
            request.getRequestDispatcher("AdminDashboard").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(AdminDashboardModel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AdminDashboardModel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
