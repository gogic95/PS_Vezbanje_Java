/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pomoc;

import domen.Kandidat;
import domen.Regruter;
import java.util.ArrayList;
import java.util.Objects;

/**
 *
 * @author Gogic
 */
public class PomocnaKlasa {
    private Regruter regruter;
    private ArrayList<Kandidat> listaK;

    public PomocnaKlasa() {
    }

    public PomocnaKlasa(Regruter regruter, ArrayList<Kandidat> listaK) {
        this.regruter = regruter;
        this.listaK = listaK;
    }

    public ArrayList<Kandidat> getListaK() {
        return listaK;
    }

    public void setListaK(ArrayList<Kandidat> listaK) {
        this.listaK = listaK;
    }

    public Regruter getRegruter() {
        return regruter;
    }

    public void setRegruter(Regruter regruter) {
        this.regruter = regruter;
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
        if (!Objects.equals(this.regruter, other.regruter)) {
            return false;
        }
        return true;
    }
    
    
}
