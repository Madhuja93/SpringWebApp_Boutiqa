package com.lithan.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity // Used to map the entity to DB table
//@Table(name="tb_store") - Use @Table annotation when the db table name 
//is not same as java entity
public class user implements Serializable {

    @Id
    private long User_ID;
    // Ensure the fields name match with table column name
    // Otherwise use @Column annotation
    //@Column(name="store_name")


    private String FirstName;
    private String LastName;
    private String User_Type;
    private String EmailAddress;
    private String Password;

    public user() {}

    public user(String FirstName, String LastName, String User_Type, String EmailAddress, String Password) {
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.User_Type = User_Type;
        this.EmailAddress = EmailAddress;
        this.Password = Password;
    }

    public long getUser_Id() {
        return this.User_ID;
    }
    public void setUser_ID(int User_ID) {
        this.User_ID = User_ID;
    }
    public String getfirstName() {
        return this.FirstName;
    }
    public void setfirstName(String FirstName) {
        this.FirstName = FirstName;
    }
    public String getLastName() {
        return this.LastName;
    }
    public void setLastName(String LastName) {
        this.LastName = LastName;
    }
    public String getUser_Type() {
        return this.User_Type;
    }
    public void setUser_Type(String User_Type) {
        this.User_Type = User_Type;
    }
    public String getEmailAddress() {
        return this.EmailAddress;
    }
    public void setEmailAddress(String EmailAddress) {
        this.EmailAddress = EmailAddress;
    }
    public String getPassword() {
        return this.Password;
    }
    public void setPassword(String getPassword) {
        this.Password = getPassword;
    }

}