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
public class Prijava implements Serializable{
    private Long prijavaID;
    private String drzavljanstvo;
    private String JMBG;
    private String ime;
    private String prezime;
    private String email;
    private String mobilniTelefon;
    private boolean specificnaOboljenja;
    private Date datumPrijave;
    private Opstina opstina;

    public Prijava() {
    }

    public Prijava(Long prijavaID, String drzavljanstvo, String JMBG, String ime, String prezime, String email, String mobilniTelefon, boolean specificnaOboljenja, Date datumPrijave, Opstina opstina) {
        this.prijavaID = prijavaID;
        this.drzavljanstvo = drzavljanstvo;
        this.JMBG = JMBG;
        this.ime = ime;
        this.prezime = prezime;
        this.email = email;
        this.mobilniTelefon = mobilniTelefon;
        this.specificnaOboljenja = specificnaOboljenja;
        this.datumPrijave = datumPrijave;
        this.opstina = opstina;
    }

    public Opstina getOpstina() {
        return opstina;
    }

    public void setOpstina(Opstina opstina) {
        this.opstina = opstina;
    }

    public Long getPrijavaID() {
        return prijavaID;
    }

    public void setPrijavaID(Long prijavaID) {
        this.prijavaID = prijavaID;
    }

    public String getDrzavljanstvo() {
        return drzavljanstvo;
    }

    public void setDrzavljanstvo(String drzavljanstvo) {
        this.drzavljanstvo = drzavljanstvo;
    }

    public String getJMBG() {
        return JMBG;
    }

    public void setJMBG(String JMBG) {
        this.JMBG = JMBG;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobilniTelefon() {
        return mobilniTelefon;
    }

    public void setMobilniTelefon(String mobilniTelefon) {
        this.mobilniTelefon = mobilniTelefon;
    }

    public boolean isSpecificnaOboljenja() {
        return specificnaOboljenja;
    }

    public void setSpecificnaOboljenja(boolean specificnaOboljenja) {
        this.specificnaOboljenja = specificnaOboljenja;
    }

    public Date getDatumPrijave() {
        return datumPrijave;
    }

    public void setDatumPrijave(Date datumPrijave) {
        this.datumPrijave = datumPrijave;
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
        final Prijava other = (Prijava) obj;
        if (!Objects.equals(this.prijavaID, other.prijavaID)) {
            return false;
        }
        return true;
    }
    
    
}
