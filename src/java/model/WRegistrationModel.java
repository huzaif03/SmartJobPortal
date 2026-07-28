/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.time.LocalDate;
import java.time.Period;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author huzaif
 */
public class WRegistrationModel implements Model {

    @Override
    public void businessLogic(HttpServletRequest request, HttpServletResponse response) {

//        Variables for store the Personal information
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String password = request.getParameter("password");
        int address_id = -1;

//        Variables to store the Address
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zip_code = request.getParameter("zip");
        String country = request.getParameter("country");
//        flag
        boolean isRegistered = false;
        String errorMessage = null;

        String profilePicPath = null; // ← profile pic local path
        String idCardFrontPath = null; // ← id card front local path
        String idCardBackPath = null; // ← id card back local path

        LocalDate birthDate = LocalDate.parse(dob);
        LocalDate currentDate = LocalDate.now();

        int age = Period.between(birthDate, currentDate).getYears();

        try {
            // AGE PERMIT TO WORK           
            if (age < 18) {
                request.setAttribute("underAge", "You are not eligible to work in India, Because of Indian Government guidlines");
                request.getRequestDispatcher("WRegister").forward(request, response);
            }
// PROFILE PICTURE UPLOAD
            Part profilePicPart = request.getPart("profile_pic");

            String ppDisposition = profilePicPart.getHeader("content-disposition");
            String ppFileName = "";
            for (String token : ppDisposition.split(";")) {
                if (token.trim().startsWith("filename")) {
                    ppFileName = token.substring(token.indexOf("=") + 2, token.length() - 1);
                    break;
                }
            }
            String ppExtension = ppFileName.substring(ppFileName.lastIndexOf(".")).toLowerCase();
            String ppUniqueName = "profile_" + email + "_" + System.currentTimeMillis() + ppExtension;
            String ppUploadDir = "/home/huzaif/uploads/profilepics";
            File ppDir = new File(ppUploadDir);
            if (!ppDir.exists()) {
                ppDir.mkdirs();
            }
            profilePicPath = ppUploadDir + File.separator + ppUniqueName;
            InputStream ppIn = profilePicPart.getInputStream();
            OutputStream ppOut = new FileOutputStream(new File(profilePicPath));
            byte[] ppBytes = new byte[1024];
            int ppRead = 0;
            while ((ppRead = ppIn.read(ppBytes)) != -1) {
                ppOut.write(ppBytes, 0, ppRead);
            }
            ppOut.close();
            ppIn.close();
// ID CARD FRONT UPLOAD
            Part idCardFrontPart = request.getPart("idcard_front");

            String ifDisposition = idCardFrontPart.getHeader("content-disposition");
            String ifFileName = "";
            for (String token : ifDisposition.split(";")) {
                if (token.trim().startsWith("filename")) {
                    ifFileName = token.substring(token.indexOf("=") + 2, token.length() - 1);
                    break;
                }
            }

            String ifExtension = ifFileName
                    .substring(ifFileName.lastIndexOf("."))
                    .toLowerCase();

            String ifUniqueName = "idfront_" + email + "_"
                    + System.currentTimeMillis()
                    + ifExtension;

            String ifUploadDir = "/home/huzaif/uploads/idcards";
            File ifDir = new File(ifUploadDir);
            if (!ifDir.exists()) {
                ifDir.mkdirs();
            }

            idCardFrontPath = ifUploadDir + File.separator + ifUniqueName;
            InputStream ifIn = idCardFrontPart.getInputStream();
            OutputStream ifOut = new FileOutputStream(new File(idCardFrontPath));
            byte[] ifBytes = new byte[1024];
            int ifRead = 0;
            while ((ifRead = ifIn.read(ifBytes)) != -1) {
                ifOut.write(ifBytes, 0, ifRead);
            }
            ifOut.close();
            ifIn.close();
// ID CARD BACK UPLOAD
            Part idCardBackPart = request.getPart("idcard_back");

            String ibDisposition = idCardBackPart.getHeader("content-disposition");
            String ibFileName = "";
            for (String token : ibDisposition.split(";")) {
                if (token.trim().startsWith("filename")) {
                    ibFileName = token.substring(token.indexOf("=") + 2, token.length() - 1);
                    break;
                }
            }

            String ibExtension = ibFileName.substring(ibFileName.lastIndexOf(".")).toLowerCase();

            String ibUniqueName = "idback_" + email + "_" + System.currentTimeMillis() + ibExtension;
            idCardBackPath = ifUploadDir + File.separator + ibUniqueName;
            InputStream  ibIn  = idCardBackPart.getInputStream();
            OutputStream ibOut = new FileOutputStream(new File(idCardBackPath));
            byte[] ibBytes     = new byte[1024];
            int    ibRead      = 0;
            while ((ibRead = ibIn.read(ibBytes)) != -1) {
                ibOut.write(ibBytes, 0, ibRead);
            }
            ibOut.close();
            ibIn.close();

            //SQL connection 
//            String driver = "com.mysql.cj.jdbc.Driver";
            Connection con = DBConnect.toConnect();

//      for Insert address and Get address_id  in waddress table          
            String addressInsert = "INSERT INTO waddress(street,city,state,zip_code,country) values (?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(addressInsert, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, street);
            ps.setString(2, city);
            ps.setString(3, state);
            ps.setString(4, zip_code);
            ps.setString(5, country);
            ps.executeUpdate();

            ResultSet generatedid = ps.getGeneratedKeys();
            if (generatedid.next()) {
                address_id = generatedid.getInt(1);
            }

//      For Insert personal details in wregister table
            String insertQueary = "INSERT INTO wregister(full_name,phone,email,gender,date_of_birth,password,address_id,idcard_front_path,idcard_back_path,profile_pic_path) VALUES(?,?,?,?,?,?,?,?,?,?)";

            ps = con.prepareStatement(insertQueary);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, gender);
            ps.setString(5, dob);
            ps.setString(6, password);
            ps.setInt(7, address_id);
            ps.setString(8, idCardFrontPath);
            ps.setString(9, idCardBackPath);
            ps.setString(10, profilePicPath);

            int row = ps.executeUpdate();
            if (row > 0) {
                isRegistered = true;
            }
        } catch (SQLIntegrityConstraintViolationException e) {
            e.printStackTrace();
            String msg = e.getMessage().toLowerCase();
            if (msg.contains("email")) {
                errorMessage = "email";
            } else if (msg.contains("phone")) {
                errorMessage = "phone";
            } else {
                errorMessage = "account";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException ex) {
            Logger.getLogger(WRegistrationModel.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(WRegistrationModel.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            if (isRegistered) {
                request.setAttribute("message", "Registration Successful! Please Login.");
                request.getRequestDispatcher("WLogin").forward(request, response);
            } else {
                request.setAttribute("error", "Registration Failed. Please try again.");
                request.getRequestDispatcher("WRegister").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
