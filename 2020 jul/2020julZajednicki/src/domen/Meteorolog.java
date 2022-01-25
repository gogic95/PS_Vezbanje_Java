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
public class Meteorolog implements Serializable{
    private int meteorologID;
    private String ime;
    private String prezime;
    private String username;
    private String password;

    public Meteorolog() {
    }

    public Meteorolog(int meteorologID, String ime, String prezime, String username, String password) {
        this.meteorologID = meteorologID;
        this.ime = ime;
        this.prezime = prezime;
        this.username = username;
        this.password = password;
    }

    @Override
    public String toString() {
        return ime+" "+prezime;
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
        final Meteorolog other = (Meteorolog) obj;
        if (this.meteorologID != other.meteorologID) {
            return false;
        }
        return true;
    }

    public int getMeteorologID() {
        return meteorologID;
    }

    public void setMeteorologID(int meteorologID) {
        this.meteorologID = meteorologID;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
}
