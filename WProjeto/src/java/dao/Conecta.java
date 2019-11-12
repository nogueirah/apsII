package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conecta {
    public static Connection getConexao() throws Exception {
            Connection con = null;  
            
            String serverName="localhost";
            String mydatabase="estacionamento";
            
            
            String username="root";
            String password="root";
            
            String driverName ="com.mysql.jdbc.Driver";
            Class.forName(driverName);
            
            String url="jdbc:mysql://" + serverName + "/" + mydatabase;
            con = DriverManager.getConnection(url, username, password);
            
            return con;
                
        }
}
