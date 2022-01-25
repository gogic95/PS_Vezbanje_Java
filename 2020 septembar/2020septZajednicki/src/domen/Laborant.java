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
public class Laborant implements Serializable{
    private int laborantID;
    private String ime;
    private String prezime;
    private String username;
    private String password;
    private Laboratorija laboratorija;

    public Laborant() {
    }

    public Laborant(int laborantID, String ime, String prezime, String username, String password, Laboratorija laboratorija) {
        this.laborantID = laborantID;
        this.ime = ime;
        this.prezime = prezime;
        this.username = username;
        this.password = password;
        this.laboratorija = laboratorija;
    }

    public Laboratorija getLaboratorija() {
        return laboratorija;
    }

    public void setLaboratorija(Laboratorija laboratorija) {
        this.laboratorija = laboratorija;
    }

    public int getLaborantID() {
        return laborantID;
    }

    public void setLaborantID(int laborantID) {
        this.laborantID = laborantID;
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
        final Laborant other = (Laborant) obj;
        if (this.laborantID != other.laborantID) {
            return false;
        }
        return true;
    }
    
    
}
