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
public class Stado implements Serializable {
    private Gazdinstvo gazdinstvo;
    private int stadoID;
    private int brojGrla;
    private double iznosSubvencije;
    private Zivotinja zivotinja;

    public Stado() {
    }

    public Stado(Gazdinstvo gazdinstvo, int stadoID, int brojGrla, double iznosSubvencije, Zivotinja zivotinja) {
        this.gazdinstvo = gazdinstvo;
        this.stadoID = stadoID;
        this.brojGrla = brojGrla;
        this.iznosSubvencije = iznosSubvencije;
        this.zivotinja = zivotinja;
    }

    public Zivotinja getZivotinja() {
        return zivotinja;
    }

    public void setZivotinja(Zivotinja zivotinja) {
        this.zivotinja = zivotinja;
    }

    public Gazdinstvo getGazdinstvo() {
        return gazdinstvo;
    }

    public void setGazdinstvo(Gazdinstvo gazdinstvo) {
        this.gazdinstvo = gazdinstvo;
    }

    public int getStadoID() {
        return stadoID;
    }

    public void setStadoID(int stadoID) {
        this.stadoID = stadoID;
    }

    public int getBrojGrla() {
        return brojGrla;
    }

    public void setBrojGrla(int brojGrla) {
        this.brojGrla = brojGrla;
    }

    public double getIznosSubvencije() {
        return iznosSubvencije;
    }

    public void setIznosSubvencije(double iznosSubvencije) {
        this.iznosSubvencije = iznosSubvencije;
    }

    
    
    
}
