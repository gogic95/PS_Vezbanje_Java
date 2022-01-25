/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pomocna;

import domen.Gazdinstvo;
import domen.Stado;
import java.util.ArrayList;
import java.util.Objects;

/**
 *
 * @author Gogic
 */
public class PomocnaKlasa {
    private Gazdinstvo gazdinstvo;
    private ArrayList<Stado> listaStada;

    public PomocnaKlasa() {
    }

    public PomocnaKlasa(Gazdinstvo gazdinstvo, ArrayList<Stado> listaStada) {
        this.gazdinstvo = gazdinstvo;
        this.listaStada = listaStada;
    }

    public ArrayList<Stado> getListaStada() {
        return listaStada;
    }

    public void setListaStada(ArrayList<Stado> listaStada) {
        this.listaStada = listaStada;
    }

    public Gazdinstvo getGazdinstvo() {
        return gazdinstvo;
    }

    public void setGazdinstvo(Gazdinstvo gazdinstvo) {
        this.gazdinstvo = gazdinstvo;
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
        final PomocnaKlasa other = (PomocnaKlasa) obj;
        if (!Objects.equals(this.gazdinstvo, other.gazdinstvo)) {
            return false;
        }
        return true;
    }
    
    
}
