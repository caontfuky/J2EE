/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author BLAMAN
 */
public class Product {
    private int proId;
    private String name;
    private String material;
    private String description;
    private double cost;
    private String CostMoney;
    private int remainquantity;
    private int branid;
    private int genderid;
    private String gendername;
    private String brandname;
    
    public static String convertToMoney(double cost) {                
        double doublePayment = cost;
        NumberFormat n = NumberFormat.getCurrencyInstance(Locale.US); 
        return n.format(doublePayment);
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

    public int getProId() {
        return proId;
    }

    public void setProId(int proId) {
        this.proId = proId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        setCostMoney(convertToMoney(cost));
        this.cost = cost;
    }

    public int getRemainquantity() {
        return remainquantity;
    }

    public void setRemainquantity(int remainquantity) {
        this.remainquantity = remainquantity;
    }

    public int getBranid() {
        return branid;
    }

    public void setBranid(int branid) {
        this.branid = branid;
    }

    public int getGenderid() {
        return genderid;
    }

    public void setGenderid(int genderid) {
        this.genderid = genderid;
    }

    public String getCostMoney() {
        return CostMoney;
    }

    public void setCostMoney(String CostMoney) {
        this.CostMoney = CostMoney;
    }    
}
