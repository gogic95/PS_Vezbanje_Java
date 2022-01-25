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
public class OsiguranoLice implements Serializable{
    private int osiguranoLiceID;
    private String ime;
    private String prezime;
    private String LBO;
    private String krvnaGrupa;

    public OsiguranoLice() {
    }

    public OsiguranoLice(int osiguranoLiceID, String ime, String prezime, String LBO, String krvnaGrupa) {
        this.osiguranoLiceID = osiguranoLiceID;
        this.ime = ime;
        this.prezime = prezime;
        this.LBO = LBO;
        this.krvnaGrupa = krvnaGrupa;
    }

    public String getKrvnaGrupa() {
        return krvnaGrupa;
    }

    public void setKrvnaGrupa(String krvnaGrupa) {
        this.krvnaGrupa = krvnaGrupa;
    }

    public int getOsiguranoLiceID() {
        return osiguranoLiceID;
    }

    public void setOsiguranoLiceID(int osiguranoLiceID) {
        this.osiguranoLiceID = osiguranoLiceID;
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

    public String getLBO() {
        return LBO;
    }

    public void setLBO(String LBO) {
        this.LBO = LBO;
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
        final OsiguranoLice other = (OsiguranoLice) obj;
        if (this.osiguranoLiceID != other.osiguranoLiceID) {
            return false;
        }
        return true;
    }
    
    
}
