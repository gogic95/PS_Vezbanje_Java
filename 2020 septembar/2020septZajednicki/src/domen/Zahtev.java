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
public class Zahtev implements Serializable{
    
    private int zahtevID;
    private Date datumVremeTestiranja;
    private boolean hitno;
    private String tip;
    private String rezultat;
    private Date datumVremeRezultata;
    private String napomena;
    private String status;
    private OsiguranoLice osiguranoLice;
    private Laboratorija laboratorija;
    private Laborant laborant;

    public Zahtev() {
    }

    public Zahtev(int zahtevID, Date datumVremeTestiranja, boolean hitno, String tip, String rezultat, Date datumVremeRezultata, String napomena, String status, OsiguranoLice osiguranoLice, Laboratorija laboratorija, Laborant laborant) {
        this.zahtevID = zahtevID;
        this.datumVremeTestiranja = datumVremeTestiranja;
        this.hitno = hitno;
        this.tip = tip;
        this.rezultat = rezultat;
        this.datumVremeRezultata = datumVremeRezultata;
        this.napomena = napomena;
        this.status = status;
        this.osiguranoLice = osiguranoLice;
        this.laboratorija = laboratorija;
        this.laborant = laborant;
    }

    public Laborant getLaborant() {
        return laborant;
    }

    public void setLaborant(Laborant laborant) {
        this.laborant = laborant;
    }

    public int getZahtevID() {
        return zahtevID;
    }

    public void setZahtevID(int zahtevID) {
        this.zahtevID = zahtevID;
    }

    public Date getDatumVremeTestiranja() {
        return datumVremeTestiranja;
    }

    public void setDatumVremeTestiranja(Date datumVremeTestiranja) {
        this.datumVremeTestiranja = datumVremeTestiranja;
    }

    public boolean isHitno() {
        return hitno;
    }

    public void setHitno(boolean hitno) {
        this.hitno = hitno;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String getRezultat() {
        return rezultat;
    }

    public void setRezultat(String rezultat) {
        this.rezultat = rezultat;
    }

    public Date getDatumVremeRezultata() {
        return datumVremeRezultata;
    }

    public void setDatumVremeRezultata(Date datumVremeRezultata) {
        this.datumVremeRezultata = datumVremeRezultata;
    }

    public String getNapomena() {
        return napomena;
    }

    public void setNapomena(String napomena) {
        this.napomena = napomena;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public OsiguranoLice getOsiguranoLice() {
        return osiguranoLice;
    }

    public void setOsiguranoLice(OsiguranoLice osiguranoLice) {
        this.osiguranoLice = osiguranoLice;
    }

    public Laboratorija getLaboratorija() {
        return laboratorija;
    }

    public void setLaboratorija(Laboratorija laboratorija) {
        this.laboratorija = laboratorija;
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
        final Zahtev other = (Zahtev) obj;
        if (this.zahtevID != other.zahtevID) {
            return false;
        }
        if (!Objects.equals(this.osiguranoLice, other.osiguranoLice)) {
            return false;
        }
        if (!Objects.equals(this.laboratorija, other.laboratorija)) {
            return false;
        }
        if (!Objects.equals(this.laborant, other.laborant)) {
            return false;
        }
        return true;
    }

    
    
    
    
}
