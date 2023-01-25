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
public class productshoppingcart implements Serializable {

    public productshoppingcart() {
    	
    }
    
    public productshoppingcart(int productShoppingCart_ID, int quantity, int shoppingCart_ID,
			float itemTotalPrice, product product) {
		super();
		ProductShoppingCart_ID = productShoppingCart_ID;
		Quantity = quantity;
		ShoppingCart_ID = shoppingCart_ID;
		ItemTotalPrice = itemTotalPrice;
		Product = product;
	}
    
    @Id
	private long ProductShoppingCart_ID;
	public long getProductShoppingCart_ID() {
		return ProductShoppingCart_ID;
	}
	
	@OneToOne(targetEntity = product.class, cascade = CascadeType.DETACH)
    @JoinColumn(name = "ProductID",referencedColumnName="ProductID")
    private product Product;

	public void setProductShoppingCart_ID(int productShoppingCart_ID) {
		ProductShoppingCart_ID = productShoppingCart_ID;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

	public long getShoppingCart_ID() {
		return ShoppingCart_ID;
	}

	public void setShoppingCart_ID(int shoppingCart_ID) {
		ShoppingCart_ID = shoppingCart_ID;
	}

	public float getItemTotalPrice() {
		return ItemTotalPrice;
	}

	public void setItemTotalPrice(float itemTotalPrice) {
		ItemTotalPrice = itemTotalPrice;
	}
	
	public product getProduct() {
        return Product;
    }

    public void setProduct(product product) {
    	Product = product;
    }

	private int Quantity;
    private long ShoppingCart_ID;
    private float ItemTotalPrice;

}