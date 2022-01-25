/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domen;

import java.io.Serializable;
import java.util.Objects;

/**
 *
 * @author Gogic
 */
public class Pretplatnik implements Serializable{
    private Long pretplatnikID;
    private String ime;
    private String prezime;

    public Pretplatnik() {
    }

    public Pretplatnik(Long pretplatnikID, String ime, String prezime) {
        this.pretplatnikID = pretplatnikID;
        this.ime = ime;
        this.prezime = prezime;
    }

    public String getPrezime() {
        return prezime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }

    public Long getPretplatnikID() {
        return pretplatnikID;
    }

    public void setPretplatnikID(Long pretplatnikID) {
        this.pretplatnikID = pretplatnikID;
    }

    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    @Override
    public String toString() {
        return ime+" "+prezime;
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
        final Pretplatnik other = (Pretplatnik) obj;
        if (!Objects.equals(this.pretplatnikID, other.pretplatnikID)) {
            return false;
        }
        return true;
    }
    
    
}
