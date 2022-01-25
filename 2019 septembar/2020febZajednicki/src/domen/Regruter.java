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
public class Regruter implements Serializable{
    private int regruterID;
    private String imePrezime;
    private String username;
    private String password;

    public Regruter() {
    }

    public Regruter(int regruterID, String imePrezime, String username, String password) {
        this.regruterID = regruterID;
        this.imePrezime = imePrezime;
        this.username = username;
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRegruterID() {
        return regruterID;
    }

    public void setRegruterID(int regruterID) {
        this.regruterID = regruterID;
    }

    public String getImePrezime() {
        return imePrezime;
    }

    public void setImePrezime(String imePrezime) {
        this.imePrezime = imePrezime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return imePrezime;
    }

    @Override
    public int hashCode() {
        int hash = 3;
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
        final Regruter other = (Regruter) obj;
        if (this.regruterID != other.regruterID) {
            return false;
        }
        return true;
    }
    
    
    
}
