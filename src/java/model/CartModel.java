/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import connectionDB.ConnectionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Devil
 */
public class CartModel {
        
    private static CartModel Instance;

    public static CartModel getInstance() {
            if (Instance == null) {
                    Instance = new CartModel();
            }
            return Instance;
    }
    
    public CartModel() {
        
    }
    
    public void insertCart(double totalCost, int totalQuatity, int accountID)    {
        String query="INSERT INTO Cart ([TotalCost], [TotalQuantity], [AccountID], [CreatedTime])  Values (?, ?, ?, GETDATE())";
        try {
                PreparedStatement pre=ConnectionDB.getInstance().getconnection().prepareStatement(query);
                pre.setDouble(1, totalCost);       
                pre.setInt(2, totalQuatity);
                pre.setInt(3, accountID);       


                pre.executeUpdate();            
        }
        catch (ClassNotFoundException | SQLException ex)
        {
        }
    }
    
    public int getCheckoutCartID() {
        String query = "SELECT MAX(CartID) as MAX FROM Cart";
        try {
            PreparedStatement pre=ConnectionDB.getInstance().getconnection().prepareStatement(query);        
            ResultSet rs=pre.executeQuery();
            if(rs.next()) {
                return rs.getInt(1);
            }
            else {
                return -1;
            }
        }
        catch (Exception ex ){
            return -1;
        }
    }
    
    public void insertCartDetail(int cartID, int productID, int quantity) {
        String query="INSERT INTO CartDetail ([CartID], [ProductID], [Quantity])  Values (?, ?, ?)";
        try {
                PreparedStatement pre=ConnectionDB.getInstance().getconnection().prepareStatement(query);
                pre.setInt(1, cartID);       
                pre.setInt(2, productID);
                pre.setInt(3, quantity);    

                pre.executeUpdate();
            
        }
        catch (ClassNotFoundException | SQLException ex)
        {
        }
    }
}
