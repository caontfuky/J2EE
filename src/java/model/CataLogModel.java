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
import entity.Catalog;

/**
 *
 * @author Devil
 */
public class CataLogModel {
    
    public CataLogModel()
    {
        
    }
    
    public List<Catalog> getAllCatalogByParentID(String id) throws ClassNotFoundException, SQLException    {
        List<Catalog> list = new ArrayList<>();
        String query="Select *from Catalog where Catalog.ParentID=?";
        PreparedStatement pre=ConnectionDB.getInstance().getconnection().prepareStatement(query);
        pre.setString(1, id);
        
        ResultSet rs=pre.executeQuery();
        while(rs.next())
        {
            Catalog object = new Catalog();
            
            object.setCatalogID(Integer.parseInt(rs.getString(1)));
            object.setName(rs.getString(2));
            object.setParentID(Integer.parseInt(rs.getString(3)));
            
            list.add(object);
        }              
        return list;
    }
    
    public List<Catalog> getAllCatalogParent() throws ClassNotFoundException, SQLException {
                List<Catalog> list = new ArrayList<>();
        String query="Select *from Catalog where Catalog.ParentID is null";
        PreparedStatement pre=ConnectionDB.getInstance().getconnection().prepareStatement(query);        
        ResultSet rs=pre.executeQuery();
        while(rs.next())
        {
            Catalog object = new Catalog();
            
            object.setCatalogID(Integer.parseInt(rs.getString(1)));
            object.setName(rs.getString(2));
            
            list.add(object);
        }              
        return list;
    }           
}
