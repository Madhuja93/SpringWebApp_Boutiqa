package com.lithan.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.cache.spi.support.AbstractReadWriteAccess.Item;

import java.util.List;

@Entity
public class product implements Serializable {

    @Id
    private long ProductID;
    private String P_Name;
    private float P_Price;
    private String ProductDetail;
    private String P_Category;
    
    @OneToOne(targetEntity = user.class, cascade = CascadeType.DETACH)
    @JoinColumn(name = "User_ID",referencedColumnName="User_ID")
    private user User;

    public product() {

    }

    public product(long productID, String p_Name, float p_Price, String productDetail, String p_Category) {
        ProductID = productID;
        P_Name = p_Name;
        P_Price = p_Price;
        ProductDetail = productDetail;
        P_Category = p_Category;
    }

    public long getProductID() {
        return ProductID;
    }

    public void setProductID(long productID) {
        ProductID = productID;
    }

    public String getP_Name() {
        return P_Name;
    }

    public void setP_Name(String p_Name) {
        P_Name = p_Name;
    }

    public float getP_Price() {
        return P_Price;
    }

    public void setP_Price(float p_Price) {
        P_Price = p_Price;
    }

    public String getProductDetail() {
        return ProductDetail;
    }

    public void setProductDetail(String productDetail) {
        ProductDetail = productDetail;
    }

    public String getP_Category() {
        return P_Category;
    }

    public void setP_Category(String p_Category) {
        P_Category = p_Category;
    }
    
    public user getUser() {
        return User;
    }

    public void setUser(user user) {
    	User = user;
    }

}