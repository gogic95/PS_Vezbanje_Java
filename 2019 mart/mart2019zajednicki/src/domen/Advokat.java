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
public class Advokat implements Serializable{
    private int advokatID;
    private String ime;
    private String prezime;
    private VrstaPostupka specijalnostZaVrstuPostupka;

    public Advokat() {
    }

    public Advokat(int advokatID, String ime, String prezime, VrstaPostupka specijalnostZaVrstuPostupka) {
        this.advokatID = advokatID;
        this.ime = ime;
        this.prezime = prezime;
        this.specijalnostZaVrstuPostupka = specijalnostZaVrstuPostupka;
    }

    public VrstaPostupka getSpecijalnostZaVrstuPostupka() {
        return specijalnostZaVrstuPostupka;
    }

    public void setSpecijalnostZaVrstuPostupka(VrstaPostupka specijalnostZaVrstuPostupka) {
        this.specijalnostZaVrstuPostupka = specijalnostZaVrstuPostupka;
    }

    public int getAdvokatID() {
        return advokatID;
    }

    public void setAdvokatID(int advokatID) {
        this.advokatID = advokatID;
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

    @Override
    public String toString() {
        return ime + " " + prezime;
    }
    
    
    
}
