/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import entity.Product;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import connectionDB.ConnectionDB;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.PreparedStatement;
/**
 *
 * @author BLAMAN
 */
public class ProductModel {
        
    private static ProductModel Instance;

    public static ProductModel getInstance() {
            if (Instance == null) {
                    Instance = new ProductModel();
            }
            return Instance;
    }
    public ProductModel()    {
        
    }
    
    public List<Product> getAllProducts() throws ClassNotFoundException, SQLException    {
        List<Product>list=new ArrayList<>();
        String sql="Select*from Product";
        Statement st=ConnectionDB.getInstance().getconnection().createStatement();
        ResultSet rs=st.executeQuery(sql);
        while(rs.next())
        {
            Product s=new Product();                            
            s.setProId(rs.getInt(1));
            s.setName(rs.getString(2));
            s.setMaterial(rs.getString(3));
            s.setDescription(rs.getString(4));
            s.setCost(rs.getDouble(5));
            s.setRemainquantity(rs.getInt(6));
            s.setBranid(rs.getInt(7));
            s.setGenderid(rs.getInt(8));
            list.add(s);            
        }
                    
        return list;
    }
    
    
    public List<Product> getAllProductss() throws ClassNotFoundException, SQLException    {
        List<Product>list=new ArrayList<>();
        String sql="Select*from Product";
        Statement st=ConnectionDB.getInstance().getconnection().createStatement();
        ResultSet rs=st.executeQuery(sql);
        while(rs.next())
        {
            Product s=new Product();                            
            s.setProId(rs.getInt(1));
            s.setName(rs.getString(2));
            s.setMaterial(rs.getString(3));
            s.setDescription(rs.getString(4));
            s.setCost(rs.getDouble(5));
            s.setRemainquantity(rs.getInt(6));
            s.setBrandname( getBrandByBrandId(rs.getInt(7)));
            s.setGendername(getGenderByGenderId(rs.getInt(8)));
            list.add(s);            
        }
                    
        return list;
    }
    
    
    
    
    public List<Product> getAllProductByCatalogID(int catalogID)    {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT * FROM Product, ProductCatalog WHERE ProductCatalog.CatalogID=? and ProductCatalog.ProductID = Product.ProductID";
        try {                        
            PreparedStatement pre=ConnectionDB.getInstance().getconnection().prepareStatement(sql);
            pre.setInt(1, catalogID);                                            
            ResultSet rs = pre.executeQuery();
            
            while(rs.next())
            {
                Product s=new Product();
                s.setProId(rs.getInt(1));
                s.setName(rs.getString(2));
                s.setMaterial(rs.getString(3));
                s.setDescription(rs.getString(4));
                s.setCost(rs.getDouble(5));
                s.setRemainquantity(rs.getInt(6));
                s.setBranid(rs.getInt(7));
                s.setGenderid(rs.getInt(8));
                listProduct.add(s);            
            }

            return listProduct;

        }
        catch (ClassNotFoundException | SQLException ex) {
            return listProduct;
        }
    }
    
    public Product getProductByID(int productID)    {                
        Product s = new Product();
        String sql = "SELECT * FROM Product WHERE Product.ProductID=?";
        try {                        
            PreparedStatement pre=ConnectionDB.getInstance().getconnection().prepareStatement(sql);
            pre.setInt(1, productID);                                            
            ResultSet rs = pre.executeQuery();
            
            if(rs.next())
            {
                s.setProId(rs.getInt(1));
                s.setName(rs.getString(2));
                s.setMaterial(rs.getString(3));
                s.setDescription(rs.getString(4));
                s.setCost(rs.getDouble(5));
                s.setRemainquantity(rs.getInt(6));
                s.setBranid(rs.getInt(7));
                s.setGenderid(rs.getInt(8));
            }

            return s;

        }
        catch (ClassNotFoundException | SQLException ex) {
            return s;
        }
    }
    
    public String getGenderByGenderId(int proid) {
        String sql = "select Name from Gender where GenderId=?";
        String gendername = "";
        try {
            PreparedStatement pre = ConnectionDB.getInstance().getconnection().prepareStatement(sql);
            pre.setInt(1, proid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                gendername = rs.getString(1);
            }
            return gendername;
        } catch (ClassNotFoundException | SQLException e) {
            return "Error System";

        }

    }

    public String getBrandByBrandId(int brandid) {
        String sql = "select Name from Brand where BrandId=?";
        String gendername = "";
        try {
            PreparedStatement pre = ConnectionDB.getInstance().getconnection().prepareStatement(sql);
            pre.setInt(1, brandid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                gendername = rs.getString(1);
            }
            return gendername;
        } catch (ClassNotFoundException | SQLException e) {
            return "Error System";

        }

    }

    public String deleteProduct(int id) {
        String sql = "Delete From Product where ProductID=?";
        String exception = "";
        try {
            PreparedStatement pre = ConnectionDB.getInstance().getconnection().prepareStatement(sql);
            pre.setInt(1, id);
            int x = pre.executeUpdate();

            if (x != 1) {
                return "Fail";
            }
            return "Success";

        } catch (ClassNotFoundException | SQLException ex) {
            exception = ex.getMessage();
            return exception;
        }

    }

    public int getBrandIdbyName(String brandname) throws SQLException, ClassNotFoundException {
        int _brandid = 0;

        String sql = "select BrandId from Brand where Name=?";
        PreparedStatement pr = ConnectionDB.getInstance().getconnection().prepareStatement(sql);
        pr.setString(1, brandname);
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {
            _brandid = rs.getInt(1);
        }

        return _brandid;
    }

    public int getGenderIdbyName(String genderName) throws SQLException, ClassNotFoundException {
        int genderid = 0;
        String sql = "select GenderId from Gender where Name=?";
        PreparedStatement pr = ConnectionDB.getInstance().getconnection().prepareStatement(sql);
        pr.setString(1, genderName);
        ResultSet rs = pr.executeQuery();
        while (rs.next()) {
            genderid = rs.getInt(1);
        }
        return genderid;
    }

    public void updateProduct(int proedit, String name, String material, String des, double cost, int remain, String brand, String gender) throws SQLException, ClassNotFoundException {
        int _brandid = getBrandIdbyName(brand);
        int genderid = getGenderIdbyName(gender);
        String sql = "Update Product set Name=?, Material=?, Desciption=?, Cost=?, RemainQuantity=?, BrandID=?, GenderID=? where ProductID=? ";
        PreparedStatement pre = ConnectionDB.getInstance().getconnection().prepareStatement(sql);
        pre.setString(1, name);
        pre.setString(2, material);
        pre.setString(3, des);
        pre.setDouble(4, cost);
        pre.setInt(5, remain);
        pre.setInt(6, _brandid);
        pre.setInt(7, genderid);
        pre.setInt(8, proedit);
        pre.executeUpdate();

    }

    public void addBrand(String name) throws SQLException, ClassNotFoundException {
        String sql = "insert into Brand"
                + "(Name) Values"
                + "(?)";
        PreparedStatement pre = ConnectionDB.getInstance().getconnection().prepareStatement(sql);
        pre.setString(1, name);
        pre.executeUpdate();
    }

    public int addProduct(String name, String material, String des, double cost, int remain, String brand, String gender) throws SQLException, ClassNotFoundException {
        int _brandid = getBrandIdbyName(brand);
        int _genderid = getGenderIdbyName(gender);
        if (_brandid != 0 && _genderid != 0) {
            String sqlcheck = "select*from Product where Name=?, Material=?, Desciption=?, Cost=?, BrandID=?, GenderID=?";
            PreparedStatement pre = ConnectionDB.getInstance().getconnection().prepareStatement(sqlcheck);

            pre.setString(1, name);
            pre.setString(2, material);
            pre.setString(3, des);
            pre.setDouble(4, cost);           
            pre.setInt(5, _brandid);
            pre.setInt(6, _genderid);
            ResultSet rs=pre.executeQuery();
            while(rs.next())
            {
                return 0;
            }

        }       

        addBrand(brand);
        int brandid = getBrandIdbyName(brand);
        int genderid = getGenderIdbyName(gender);
        String sql = "Insert into Product"
                + "(Name,Material,Desciption,Cost,RemainQuantity,BrandID,GenderID)Values"
                + "(?,?,?,?,?,?,?)";
        PreparedStatement pre = ConnectionDB.getInstance().getconnection().prepareStatement(sql);

        pre.setString(1, name);
        pre.setString(2, material);
        pre.setString(3, des);
        pre.setDouble(4, cost);
        pre.setInt(5, remain);
        pre.setInt(6, brandid);
        pre.setInt(7, genderid);
        pre.executeUpdate();
        return 1;
        

    }
}
