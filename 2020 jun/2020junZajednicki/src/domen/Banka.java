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
public class Banka implements  Serializable{
    private Long bankaID;
    private String naziv;
    private String adresa;
    private int JedinstveniBrojPlatPrometa;

    public Banka() {
    }

    public Banka(Long bankaID, String naziv, String adresa, int JedinstveniBrojPlatPrometa) {
        this.bankaID = bankaID;
        this.naziv = naziv;
        this.adresa = adresa;
        this.JedinstveniBrojPlatPrometa = JedinstveniBrojPlatPrometa;
    }

    public int getJedinstveniBrojPlatPrometa() {
        return JedinstveniBrojPlatPrometa;
    }

    public void setJedinstveniBrojPlatPrometa(int JedinstveniBrojPlatPrometa) {
        this.JedinstveniBrojPlatPrometa = JedinstveniBrojPlatPrometa;
    }

    public Long getBankaID() {
        return bankaID;
    }

    public void setBankaID(Long bankaID) {
        this.bankaID = bankaID;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
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
        final Banka other = (Banka) obj;
        if (!Objects.equals(this.bankaID, other.bankaID)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return naziv;
    }
    
    
     
}
