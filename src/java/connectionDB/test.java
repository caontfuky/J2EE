/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connectionDB;

import java.sql.Connection;
import model.*;
import entity.*;
import java.io.Console;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author BLAMAN
 */
public class test {
    public static void main(String[]args) throws ClassNotFoundException, SQLException
    {
       Connection con=ConnectionDB.getInstance().getconnection();
       if(con!=null)
       {
           System.out.print("thanh cong");
       }
       
       CataLogModel model = new CataLogModel();
       List<Catalog> list = model.getAllCatalogParent();             
        for (Catalog catalog : list) {
            System.err.println(catalog.getCatalogID() + "/" +catalog.getParentID());
        }
    }
    
}
