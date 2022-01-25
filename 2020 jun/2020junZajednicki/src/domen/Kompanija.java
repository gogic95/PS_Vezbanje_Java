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
public class Kompanija implements Serializable {
    private Long kompanijaID;
    private String naziv;
    private String tipKompanije;
    private boolean pdvObveznik;
    private String maticniBroj;
    private Date datumVremeEvidentiranja;
    private int brojZaposlenih;
    private Korisnik korisnik;

    public Kompanija() {
    }

    public Kompanija(Long kompanijaID, String naziv, String tipKompanije, boolean pdvObveznik, String maticniBroj, Date datumVremeEvidentiranja, int brojZaposlenih, Korisnik korisnik) {
        this.kompanijaID = kompanijaID;
        this.naziv = naziv;
        this.tipKompanije = tipKompanije;
        this.pdvObveznik = pdvObveznik;
        this.maticniBroj = maticniBroj;
        this.datumVremeEvidentiranja = datumVremeEvidentiranja;
        this.brojZaposlenih = brojZaposlenih;
        this.korisnik = korisnik;
    }

    public Korisnik getKorisnik() {
        return korisnik;
    }

    public void setKorisnik(Korisnik korisnik) {
        this.korisnik = korisnik;
    }

    public Long getKompanijaID() {
        return kompanijaID;
    }

    public void setKompanijaID(Long kompanijaID) {
        this.kompanijaID = kompanijaID;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public String getTipKompanije() {
        return tipKompanije;
    }

    public void setTipKompanije(String tipKompanije) {
        this.tipKompanije = tipKompanije;
    }

    public boolean isPdvObveznik() {
        return pdvObveznik;
    }

    public void setPdvObveznik(boolean pdvObveznik) {
        this.pdvObveznik = pdvObveznik;
    }

    public String getMaticniBroj() {
        return maticniBroj;
    }

    public void setMaticniBroj(String maticniBroj) {
        this.maticniBroj = maticniBroj;
    }

    public Date getDatumVremeEvidentiranja() {
        return datumVremeEvidentiranja;
    }

    public void setDatumVremeEvidentiranja(Date datumVremeEvidentiranja) {
        this.datumVremeEvidentiranja = datumVremeEvidentiranja;
    }

    public int getBrojZaposlenih() {
        return brojZaposlenih;
    }

    public void setBrojZaposlenih(int brojZaposlenih) {
        this.brojZaposlenih = brojZaposlenih;
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
        final Kompanija other = (Kompanija) obj;
        if (!Objects.equals(this.kompanijaID, other.kompanijaID)) {
            return false;
        }
        return true;
    }
    
    
    
    
}
