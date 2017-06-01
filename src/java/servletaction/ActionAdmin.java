/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletaction;

import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import entity.*;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.*;
import org.apache.struts2.interceptor.ServletRequestAware;
import sun.java2d.pipe.Region;

/**
 *
 * @author BLAMAN
 */
public class ActionAdmin extends ActionSupport implements ServletRequestAware {

    private int proid;
    private int proeditid;

    private String proeitname;

    private String proeditmaterial;
    private String proeditdes;

    public String getProeitname() {
        return proeitname;
    }

    public void setProeitname(String proeitname) {
        this.proeitname = proeitname;
    }

    public String getProeditmaterial() {
        return proeditmaterial;
    }

    public void setProeditmaterial(String proeditmaterial) {
        this.proeditmaterial = proeditmaterial;
    }

    public String getProeditdes() {
        return proeditdes;
    }

    public void setProeditdes(String proeditdes) {
        this.proeditdes = proeditdes;
    }

    public String getProeditcost() {
        return proeditcost;
    }

    public void setProeditcost(String proeditcost) {
        this.proeditcost = proeditcost;
    }

    public int getProeditremainquantity() {
        return proeditremainquantity;
    }

    public void setProeditremainquantity(int proeditremainquantity) {
        this.proeditremainquantity = proeditremainquantity;
    }

    public String getProedtbrand() {
        return proedtbrand;
    }

    public void setProedtbrand(String proedtbrand) {
        this.proedtbrand = proedtbrand;
    }

    public String getProeditgender() {
        return proeditgender;
    }

    public void setProeditgender(String proeditgender) {
        this.proeditgender = proeditgender;
    }

    //Product edit property
   

    public String getProaddname() {
        return proaddname;
    }

    public void setProaddname(String proaddname) {
        this.proaddname = proaddname;
    }
    private String proeditcost;
    private int proeditremainquantity;
    private String proedtbrand;
    private String proeditgender;
    private String gendername;
    private String brandname;
   

    public String getProaddmaterial() {
        return proaddmaterial;
    }

    public void setProaddmaterial(String proaddmaterial) {
        this.proaddmaterial = proaddmaterial;
    }

    
     //Product add property
     private String proaddname;
      private String proaddmaterial;
    private String proaddtcost;
    private int proaddremainquantity;
    private String proaddbrand;
    private String proaddgender;
 
    private String proadddes;

    public String getProadddes() {
        return proadddes;
    }

    public void setProadddes(String proadddes) {
        this.proadddes = proadddes;
    }

    public String getProaddtcost() {
        return proaddtcost;
    }

    public void setProaddtcost(String proaddtcost) {
        this.proaddtcost = proaddtcost;
    }

    public int getProaddremainquantity() {
        return proaddremainquantity;
    }

    public void setProaddremainquantity(int proaddremainquantity) {
        this.proaddremainquantity = proaddremainquantity;
    }

    public String getProaddbrand() {
        return proaddbrand;
    }

    public void setProaddbrand(String proaddbrand) {
        this.proaddbrand = proaddbrand;
    }

    public String getProaddgender() {
        return proaddgender;
    }

    public void setProaddgender(String proaddgender) {
        this.proaddgender = proaddgender;
    }

    
    
    
    
    public String getGendername() {
        return gendername;
    }

    public void setGendername(String gendername) {
        this.gendername = gendername;
    }

    public String getBrandname() {
        return brandname;
    }

    public void setBrandname(String brandname) {
        this.brandname = brandname;
    }
    private Product product = new Product();
    ProductModel productmodel = new ProductModel();
    private HttpServletRequest request;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getProid() {
        return proid;
    }

    public int getProeditid() {
        return proeditid;
    }

    public void setProeditid(int proeditid) {
        this.proeditid = proeditid;
    }

    public void setProid(int proid) {
        this.proid = proid;
    }

    public String excuteDelete() {

        if (!productmodel.deleteProduct(proid).equals("Success")) {
            return ERROR;
        }
        return SUCCESS;

    }

    public String excuteEdit() {

        product = productmodel.getProductByID(proeditid);
        brandname = productmodel.getBrandByBrandId(proeditid);
        gendername = productmodel.getGenderByGenderId(proeditid);
        return SUCCESS;
    }

    public String updateEdit() {

        Product proedit = productmodel.getProductByID(proeditid);
        double cost = Double.parseDouble(proeditcost);
        try {
            productmodel.updateProduct(proeditid, proeitname, proeditmaterial, proeditdes, cost, proeditremainquantity, proedtbrand, proeditgender);
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
            return ERROR;
        }

        return SUCCESS;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        request = hsr;
    }

    public String backAdmin() {
        return SUCCESS;
    }

    public String addProduct() {
        return SUCCESS;
     
    }
    public String excuteAdd()
    {
        double cost = Double.parseDouble(proaddtcost);
        try {
            int result= productmodel.addProduct(proaddname, proaddmaterial, proadddes,cost,proaddremainquantity, proaddbrand, proaddgender);
            if(result==0)
            {
                return ERROR;
            }
            return SUCCESS;
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ActionAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ERROR;
    
    }
    public String backIndex()
    {
        return SUCCESS;
    }

}
