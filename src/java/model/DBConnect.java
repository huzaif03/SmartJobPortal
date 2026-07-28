/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author huzaif
 */
public class DBConnect {
    private static final String user = "root";
    private static final String password = "your_password";
    private static final String url = "jdbc:mysql://localhost:3306/smartjobportal?useSSL=false&allowPublicKeyRetrieval=true";
    
    public static Connection toConnect(){
        Connection con = null;
        if(con != null){
            return con;
        }else{
        try{
            String driver = "com.mysql.cj.jdbc.Driver";
            Class.forName(driver);
            con = DriverManager.getConnection(url, user, password);
            System.out.println("Database Connected successfully");
        }catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        }
        return con;
    }   
    
}
