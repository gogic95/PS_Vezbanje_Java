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
public class LinijaStanica implements Serializable{
    private Linija linija;
    private Stanica stanica;

    public LinijaStanica() {
    }

    public LinijaStanica(Linija linija, Stanica stanica) {
        this.linija = linija;
        this.stanica = stanica;
    }

    public Stanica getStanica() {
        return stanica;
    }

    public void setStanica(Stanica stanica) {
        this.stanica = stanica;
    }

    public Linija getLinija() {
        return linija;
    }

    public void setLinija(Linija linija) {
        this.linija = linija;
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
        final LinijaStanica other = (LinijaStanica) obj;
        if (!Objects.equals(this.stanica, other.stanica)) {
            return false;
        }
        return true;
    }
    
    
    
}
