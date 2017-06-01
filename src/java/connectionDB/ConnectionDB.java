/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connectionDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author BLAMAN
 */
public class ConnectionDB {

    String url = "jdbc:sqlserver://DESKTOP-ISDDIEC:1433;databaseName=J2EE_FINAL";
    String dabaseName ="J2EE_FINAL";
    String user = "cao";
    String pass = "12345";
    private static ConnectionDB connectionDB;
    public static ConnectionDB getInstance()
    {
        if(connectionDB==null)
        {
            connectionDB=new ConnectionDB();
            
        }
        return connectionDB;
    }
    public Connection getconnection() throws ClassNotFoundException{

        Connection con = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(url, user, pass);
            return con;
        } catch (SQLException e) {
        }
        return con;

    }
    

}
