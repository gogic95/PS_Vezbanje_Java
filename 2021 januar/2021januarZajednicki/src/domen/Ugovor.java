/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domen;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 *
 * @author Gogic
 */
public class Ugovor implements Serializable{
    private Long ugovorID;
    private Date datumEvidentiranja;
    private String vrstaUgovora;
    private boolean dodatneUsluge;
    private Double cena;
    private Paket paket;
    private Pretplatnik pretplatnik;

    public Ugovor() {
    }

    public Ugovor(Long ugovorID, Date datumEvidentiranja, String vrstaUgovora, boolean dodatneUsluge, Double cena, Paket paket, Pretplatnik pretplatnik) {
        this.ugovorID = ugovorID;
        this.datumEvidentiranja = datumEvidentiranja;
        this.vrstaUgovora = vrstaUgovora;
        this.dodatneUsluge = dodatneUsluge;
        this.cena = cena;
        this.paket = paket;
        this.pretplatnik = pretplatnik;
    }

    public Pretplatnik getPretplatnik() {
        return pretplatnik;
    }

    public void setPretplatnik(Pretplatnik pretplatnik) {
        this.pretplatnik = pretplatnik;
    }

    public Long getUgovorID() {
        return ugovorID;
    }

    public void setUgovorID(Long ugovorID) {
        this.ugovorID = ugovorID;
    }

    public Date getDatumEvidentiranja() {
        return datumEvidentiranja;
    }

    public void setDatumEvidentiranja(Date datumEvidentiranja) {
        this.datumEvidentiranja = datumEvidentiranja;
    }

    public String getVrstaUgovora() {
        return vrstaUgovora;
    }

    public void setVrstaUgovora(String vrstaUgovora) {
        this.vrstaUgovora = vrstaUgovora;
    }

    public boolean isDodatneUsluge() {
        return dodatneUsluge;
    }

    public void setDodatneUsluge(boolean dodatneUsluge) {
        this.dodatneUsluge = dodatneUsluge;
    }

    public Double getCena() {
        return cena;
    }

    public void setCena(Double cena) {
        this.cena = cena;
    }

    public Paket getPaket() {
        return paket;
    }

    public void setPaket(Paket paket) {
        this.paket = paket;
    }

    @Override
    public int hashCode() {
        int hash = 5;
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
        final Ugovor other = (Ugovor) obj;
        if (!Objects.equals(this.ugovorID, other.ugovorID)) {
            return false;
        }
        return true;
    }
    
    
}
