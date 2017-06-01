/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servletaction;

/**
 *
 * @author Devil
 */

import com.opensymphony.xwork2.ActionSupport;
import model.*;
import entity.*;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

public class CartAction extends ActionSupport {
    private final String ProductList = "ProductList";
    private int ProductID;
    private int Quantity;

    private double TotalPrice;
    private int TotalQuantity;
    
    private Map Data;
    
    private CartModel cartModel = CartModel.getInstance();
    
    public CartAction() {
    }
    
    public String addItem() {

        HttpSession session = ServletActionContext.getRequest().getSession(true);
        
        if(session.getAttribute("Login") == null)
            return ERROR;
        
        if(session.getAttribute(ProductList) != null) {
            Data = (HashMap)session.getAttribute(ProductList);
            Data.put(ProductID, Quantity);
        }
        else {
            Data = new HashMap();
            Data.put(ProductID, Quantity);
            session.setAttribute(ProductList, Data);
        }
        
        return SUCCESS;
    }
    
    public String removeItem() {
        HttpSession session = ServletActionContext.getRequest().getSession();
        Data = (HashMap)session.getAttribute(ProductList);
        Data.remove(ProductID);
        return SUCCESS;
    }
    
    public String checkout() {
        HttpSession session = ServletActionContext.getRequest().getSession(true);
        
        if(session.getAttribute(ProductList) == null) {
            return ERROR;
        }
        else {                        
            Data = (HashMap)session.getAttribute(ProductList);
            
            if(Data.isEmpty())
                return ERROR;
            Account loginAccount = (Account)session.getAttribute("Login");
            Iterator iterator = Data.keySet().iterator(); 
            
//            cartModel.createCart(TotalPrice, TotalQuantity);  
            cartModel.insertCart(TotalPrice, TotalQuantity, loginAccount.getAccountID());
            
            int checkoutCartID = cartModel.getCheckoutCartID();
            
            while(iterator.hasNext()) {                                
                int key = (int)iterator.next();
                int value = (int)Data.get(key);                                                                       
                cartModel.insertCartDetail(checkoutCartID, key, value);                
            }
            
            session.removeAttribute(ProductList);
        }

        return SUCCESS;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }    

    public double getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(double TotalPrice) {
        this.TotalPrice = TotalPrice;
    }

    public int getTotalQuantity() {
        return TotalQuantity;
    }

    public void setTotalQuantity(int TotalQuantity) {
        this.TotalQuantity = TotalQuantity;
    }
}
