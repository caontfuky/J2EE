/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Devil
 */
public class Catalog {
    private int     CatalogID;
    private String  Name;
    private int     ParentID;
    
    public Catalog()
    {
        CatalogID   = 0;
        Name        = "";
        ParentID    = 0;
    }

    public int getCatalogID() {
        return CatalogID;
    }

    public void setCatalogID(int CatalogID) {
        this.CatalogID = CatalogID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public int getParentID() {
        return ParentID;
    }

    public void setParentID(int ParentID) {
        this.ParentID = ParentID;
    }
}
