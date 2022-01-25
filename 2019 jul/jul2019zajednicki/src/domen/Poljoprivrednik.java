/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domen;

import java.io.Serializable;

/**
 *
 * @author Gogic
 */
public class Poljoprivrednik implements Serializable {
    private int poljoprivrednikID;
    private String ime;
    private String prezime;
    private String username;
    private String password;

    public Poljoprivrednik() {
    }

    public Poljoprivrednik(int poljoprivrednikID, String ime, String prezime, String username, String password) {
        this.poljoprivrednikID = poljoprivrednikID;
        this.ime = ime;
        this.prezime = prezime;
        this.username = username;
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPoljoprivrednikID() {
        return poljoprivrednikID;
    }

    public void setPoljoprivrednikID(int poljoprivrednikID) {
        this.poljoprivrednikID = poljoprivrednikID;
    }

    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public String getPrezime() {
        return prezime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return ime + " " + prezime;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Poljoprivrednik other = (Poljoprivrednik) obj;
        if (this.poljoprivrednikID != other.poljoprivrednikID) {
            return false;
        }
        return true;
    }
    
    
    
    
}
