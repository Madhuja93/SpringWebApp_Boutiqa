package com.lithan.entity;

import java.io.Serializable;
import java.util.Date;

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
public class shoppingcart implements Serializable {

    public long getShoppingCart_ID() {
		return ShoppingCart_ID;
	}

	public void setShoppingCart_ID(long shoppingCart_ID) {
		ShoppingCart_ID = shoppingCart_ID;
	}

	public float getTotalPrice() {
		return TotalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		TotalPrice = totalPrice;
	}

	public Date getCheckOutDate() {
		return CheckOutDate;
	}

	public void setCheckOutDate(Date date) {
		CheckOutDate = date;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public user getUser() {
		return User;
	}

	public void setUser(user user) {
		User = user;
	}

	@Id
    private long ShoppingCart_ID;
	private float TotalPrice;
    private Date CheckOutDate;
    private String Status;
    
    @OneToOne(targetEntity = user.class, cascade = CascadeType.DETACH)
    @JoinColumn(name = "User_ID",referencedColumnName="User_ID")
    private user User;
    
    public shoppingcart(long shoppingCart_ID, float totalPrice, Date checkOutDate, String status, user user) {
		super();
		ShoppingCart_ID = shoppingCart_ID;
		TotalPrice = totalPrice;
		CheckOutDate = checkOutDate;
		Status = status;
		User = user;
	}
    
    public shoppingcart() {
    	
    }
}