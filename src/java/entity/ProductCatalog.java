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
public class ProductCatalog {
    private int ProductID;
    private int CatalogID;
    
    public ProductCatalog() {
        ProductID = 0;
        CatalogID = 0;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getCatalogID() {
        return CatalogID;
    }

    public void setCatalogID(int CatalogID) {
        this.CatalogID = CatalogID;
    }
    
}
