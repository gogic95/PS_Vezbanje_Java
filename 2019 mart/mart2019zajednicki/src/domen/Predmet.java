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
    private String naziv;
    private String problem;
    private Date datum;
    private Advokat advokat;
    private Klijent klijent;
    private VrstaPostupka vrstaPostupka;

    public Predmet() {
    }

    public Predmet(int predmetID, String naziv, String problem, Date datum, Advokat advokat, Klijent klijent, VrstaPostupka vrstaPostupka) {
        this.predmetID = predmetID;
        this.naziv = naziv;
        this.problem = problem;
        this.datum = datum;
        this.advokat = advokat;
        this.klijent = klijent;
        this.vrstaPostupka = vrstaPostupka;
    }

    public VrstaPostupka getVrstaPostupka() {
        return vrstaPostupka;
    }

    public void setVrstaPostupka(VrstaPostupka vrstaPostupka) {
        this.vrstaPostupka = vrstaPostupka;
    }

    public int getPredmetID() {
        return predmetID;
    }

    public void setPredmetID(int predmetID) {
        this.predmetID = predmetID;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public String getProblem() {
        return problem;
    }

    public void setProblem(String problem) {
        this.problem = problem;
    }

    public Date getDatum() {
        return datum;
    }

    public void setDatum(Date datum) {
        this.datum = datum;
    }

    public Advokat getAdvokat() {
        return advokat;
    }

    public void setAdvokat(Advokat advokat) {
        this.advokat = advokat;
    }

    public Klijent getKlijent() {
        return klijent;
    }

    public void setKlijent(Klijent klijent) {
        this.klijent = klijent;
    }

    @Override
    public String toString() {
        return naziv;
    }
    
    
    
}
