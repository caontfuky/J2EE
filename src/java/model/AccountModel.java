/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connectionDB.ConnectionDB;
import entity.Account;

/**
 *
 * @author Devil
 */
public class AccountModel {
    
    private static AccountModel Instance;

    public static AccountModel getInstance() {
            if (Instance == null) {
                    Instance = new AccountModel();
            }
            return Instance;
    }
        
    private Account LoginAccount;
    
    public AccountModel() {
        
    }
    
    public boolean canLogin(String userName, String password) {                
        String query="Select * from Account where Username=? and Password=?";
        try {
            PreparedStatement pre=ConnectionDB.getInstance().getconnection().prepareStatement(query);
            pre.setString(1, userName);
            pre.setString(2, password);        
            ResultSet rs;        
            rs = pre.executeQuery();
            if(rs.next()) {
                LoginAccount = new Account();
                LoginAccount.setAccountID(rs.getInt(1));
                LoginAccount.setUsername(rs.getString(2));
                LoginAccount.setPassword(rs.getString(3));
                
                return true;
            }
            else {
                return false;
            }
        }
        catch (ClassNotFoundException | SQLException ex)
        {
            return false;
        }
    }
    
    public boolean canSignup(String userName, String password) {
        String query="Select * from Account where Username=?";
        try {
            PreparedStatement pre=ConnectionDB.getInstance().getconnection().prepareStatement(query);
            pre.setString(1, userName);       
            ResultSet rs;        
            rs = pre.executeQuery();
            if(rs.next())
            {
                return false;
            }
            else
            {
                query="INSERT INTO Account ([Username], [Password])  Values (?, ?)";
                pre=ConnectionDB.getInstance().getconnection().prepareStatement(query);
                pre.setString(1, userName);       
                pre.setString(2, password);       

                pre.executeUpdate();

                return true;
            }
        }
        catch (ClassNotFoundException | SQLException ex)
        {
            return false;
        }
    }    

    public Account getLoginAccount() {
        return LoginAccount;
    }
}
