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
public class Paket implements Serializable{
    private Long paketID;
    private String naziv;
    private String opis;
    private Double cena;
    private boolean aktivan;

    public Paket() {
    }

    public Paket(Long paketID, String naziv, String opis, Double cena, boolean aktivan) {
        this.paketID = paketID;
        this.naziv = naziv;
        this.opis = opis;
        this.cena = cena;
        this.aktivan = aktivan;
    }

    public boolean isAktivan() {
        return aktivan;
    }

    public void setAktivan(boolean aktivan) {
        this.aktivan = aktivan;
    }

    public Long getPaketID() {
        return paketID;
    }

    public void setPaketID(Long paketID) {
        this.paketID = paketID;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public Double getCena() {
        return cena;
    }

    public void setCena(Double cena) {
        this.cena = cena;
    }

    @Override
    public String toString() {
        return naziv;
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
        final Paket other = (Paket) obj;
        if (!Objects.equals(this.paketID, other.paketID)) {
            return false;
        }
        return true;
    }
    
    
}
