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
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
        
public class AccountAction extends ActionSupport {
    private final Account       entity  = new Account();
    private final AccountModel  model   =  AccountModel.getInstance();
    private final String        Login   = "Login";
    public String canLogin()   {
        String result = ERROR;
        
        if(model.canLogin(entity.getUsername(), entity.getPassword()))
        {
            if((AccountModel.getInstance().getLoginAccount().getPassword().equals("admin")&&AccountModel.getInstance().getLoginAccount().getUsername().equals("admin")))
            {
                result="ADMIN";
                return result;
            }
            HttpSession session = ServletActionContext.getRequest().getSession(true);
            result = SUCCESS;
            if(session.getAttribute(Login) != null)
                result = ERROR;
            
            session.removeAttribute(Login);
            session.setAttribute(Login, model.getLoginAccount());

        }
        return result;
    }
    
    public String canSignup() {
        String result = ERROR;
        if(model.canSignup(entity.getUsername(), entity.getPassword()))  {
            canLogin();
            result = SUCCESS;
        }
        
        return result;
    }
    
    public String canLogout()
    {
        HttpSession session = ServletActionContext.getRequest().getSession();
        session.removeAttribute(Login);
        session.invalidate();
        return SUCCESS;
    }
    public String caoTest()
    {
        HttpSession session = ServletActionContext.getRequest().getSession(true);
        session.setAttribute("ThanhCao", "Nguyen Thanh Cao");
        System.out.print("Thanh cao debug");
        return SUCCESS;
    }
    public void setUsername(String username)    {
        entity.setUsername(username);
    }
    
    public void setPassword(String password)    {
        entity.setPassword(password);
    }
    
    public String getUsername()    {
        return entity.getUsername();
    }
    
    public String getPassword() {
        return entity.getPassword();
    }
}
