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
public class PrognozaRegion implements Serializable{
    private Prognoza prognoza;
    private int RB;
    private double temperatura;
    private String meteoAlarm;
    private String pojava;
    private Region region;

    public PrognozaRegion() {
    }

    public PrognozaRegion(Prognoza prognoza, int RB, double temperatura, String meteoAlarm, String pojava, Region region) {
        this.prognoza = prognoza;
        this.RB = RB;
        this.temperatura = temperatura;
        this.meteoAlarm = meteoAlarm;
        this.pojava = pojava;
        this.region = region;
    }

    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }

    public Prognoza getPrognoza() {
        return prognoza;
    }

    public void setPrognoza(Prognoza prognoza) {
        this.prognoza = prognoza;
    }

    public int getRB() {
        return RB;
    }

    public void setRB(int RB) {
        this.RB = RB;
    }

    public double getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(double temperatura) {
        this.temperatura = temperatura;
    }

    public String getMeteoAlarm() {
        return meteoAlarm;
    }

    public void setMeteoAlarm(String meteoAlarm) {
        this.meteoAlarm = meteoAlarm;
    }

    public String getPojava() {
        return pojava;
    }

    public void setPojava(String pojava) {
        this.pojava = pojava;
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
        final PrognozaRegion other = (PrognozaRegion) obj;
        if (this.RB != other.RB) {
            return false;
        }
        if (!Objects.equals(this.prognoza, other.prognoza)) {
            return false;
        }
        return true;
    }
    
}
