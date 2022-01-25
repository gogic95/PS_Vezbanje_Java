/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pomoc;

import domen.Prognoza;
import domen.PrognozaRegion;
import java.util.ArrayList;
import java.util.Objects;

/**
 *
 * @author Gogic
 */
public class PomocnaKlasa {
    private ArrayList<PrognozaRegion> listaPR;
    private Prognoza prognoza;

    public PomocnaKlasa() {
    }

    public PomocnaKlasa(ArrayList<PrognozaRegion> listaPR, Prognoza prognoza) {
        this.listaPR = listaPR;
        this.prognoza = prognoza;
    }

    public Prognoza getPrognoza() {
        return prognoza;
    }

    public void setPrognoza(Prognoza prognoza) {
        this.prognoza = prognoza;
    }

    public ArrayList<PrognozaRegion> getListaPR() {
        return listaPR;
    }

    public void setListaPR(ArrayList<PrognozaRegion> listaPR) {
        this.listaPR = listaPR;
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
        final PomocnaKlasa other = (PomocnaKlasa) obj;
        if (!Objects.equals(this.prognoza, other.prognoza)) {
            return false;
        }
        return true;
    }
    
    
}
