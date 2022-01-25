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
public class Opstina implements Serializable{
    private Long opstinaID;
    private int pttBroj;
    private String naziv;

    public Opstina() {
    }

    public Opstina(Long opstinaID, int pttBroj, String naziv) {
        this.opstinaID = opstinaID;
        this.pttBroj = pttBroj;
        this.naziv = naziv;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public Long getOpstinaID() {
        return opstinaID;
    }

    public void setOpstinaID(Long opstinaID) {
        this.opstinaID = opstinaID;
    }

    public int getPttBroj() {
        return pttBroj;
    }

    public void setPttBroj(int pttBroj) {
        this.pttBroj = pttBroj;
    }

    @Override
    public String toString() {
        return naziv;
    }

    @Override
    public int hashCode() {
        int hash = 3;
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
        final Opstina other = (Opstina) obj;
        if (!Objects.equals(this.opstinaID, other.opstinaID)) {
            return false;
        }
        return true;
    }
    
    
}
