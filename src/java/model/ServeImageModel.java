/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huzaif
 */
public class ServeImageModel implements Model{

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {
        String path = request.getParameter("path");
        
        try{
            if(path == null || path.isEmpty()){
                System.out.println("Path Is Empty");
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            File file = new File(path);
            if(!file.exists()){
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            
            response.reset();
            String contentType = Files.probeContentType(file.toPath());
            response.setContentType(contentType != null ? contentType : "application/octet-stream");
            
            
            InputStream in = new FileInputStream(file);
            OutputStream out = response.getOutputStream();
            byte[] buffer = new byte[1024];
            int bytesRead=0;
            while((bytesRead = in.read(buffer))!= -1){
                out.write(buffer, 0 ,bytesRead);
            }
            in.close();
            out.flush();
            out.close();
        } catch (IOException ex) {
            Logger.getLogger(ServeImageModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
