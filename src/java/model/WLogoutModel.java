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

/**
 *
 * @author huzaif
 */
public class WLogoutModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);

        try {
                session.invalidate();
                request.getRequestDispatcher("WLogin").forward(request, response);
                
        } catch (ServletException ex) {
            Logger.getLogger(WLogoutModel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(WLogoutModel.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
