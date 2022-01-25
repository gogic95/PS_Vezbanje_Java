/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domen;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Gogic
 */
public class Predmet implements Serializable{
    private int predmetID;
    private String brojPredmeta;
    private Date datumPredmeta;
    private String tuzilac;
    private String tuzeni;
    private boolean placenaSudskaTaksa;
    private TipSpora tipSpora;
    private Sud sud;
    private String status;

    public Predmet() {
    }

    public Predmet(int predmetID, String brojPredmeta, Date datumPredmeta, String tuzilac, String tuzeni, boolean placenaSudskaTaksa, TipSpora tipSpora, Sud sud, String status) {
        this.predmetID = predmetID;
        this.brojPredmeta = brojPredmeta;
        this.datumPredmeta = datumPredmeta;
        this.tuzilac = tuzilac;
        this.tuzeni = tuzeni;
        this.placenaSudskaTaksa = placenaSudskaTaksa;
        this.tipSpora = tipSpora;
        this.sud = sud;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPredmetID() {
        return predmetID;
    }

    public void setPredmetID(int predmetID) {
        this.predmetID = predmetID;
    }

    public String getBrojPredmeta() {
        return brojPredmeta;
    }

    public void setBrojPredmeta(String brojPredmeta) {
        this.brojPredmeta = brojPredmeta;
    }

    public Date getDatumPredmeta() {
        return datumPredmeta;
    }

    public void setDatumPredmeta(Date datumPredmeta) {
        this.datumPredmeta = datumPredmeta;
    }

    public String getTuzilac() {
        return tuzilac;
    }

    public void setTuzilac(String tuzilac) {
        this.tuzilac = tuzilac;
    }

    public String getTuzeni() {
        return tuzeni;
    }

    public void setTuzeni(String tuzeni) {
        this.tuzeni = tuzeni;
    }

    public boolean isPlacenaSudskaTaksa() {
        return placenaSudskaTaksa;
    }

    public void setPlacenaSudskaTaksa(boolean placenaSudskaTaksa) {
        this.placenaSudskaTaksa = placenaSudskaTaksa;
    }

    public TipSpora getTipSpora() {
        return tipSpora;
    }

    public void setTipSpora(TipSpora tipSpora) {
        this.tipSpora = tipSpora;
    }

    public Sud getSud() {
        return sud;
    }

    public void setSud(Sud sud) {
        this.sud = sud;
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
        final Predmet other = (Predmet) obj;
        if (this.predmetID != other.predmetID) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return brojPredmeta;
    }
    
    
}
