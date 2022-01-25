/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pomoc;

import domen.Sud;
import domen.TipSpora;
import java.util.Objects;

/**
 *
 * @author Gogic
 */
public class PomocnaKlasa {
    private Sud sud;
    private TipSpora tipSpora;
    private int brojPredmeta;

    public PomocnaKlasa() {
    }

    public PomocnaKlasa(Sud sud, TipSpora tipSpora, int brojPredmeta) {
        this.sud = sud;
        this.tipSpora = tipSpora;
        this.brojPredmeta = brojPredmeta;
    }

    public int getBrojPredmeta() {
        return brojPredmeta;
    }

    public void setBrojPredmeta(int brojPredmeta) {
        this.brojPredmeta = brojPredmeta;
    }

    public Sud getSud() {
        return sud;
    }

    public void setSud(Sud sud) {
        this.sud = sud;
    }

    public TipSpora getTipSpora() {
        return tipSpora;
    }

    public void setTipSpora(TipSpora tipSpora) {
        this.tipSpora = tipSpora;
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
        if (!Objects.equals(this.sud, other.sud)) {
            return false;
        }
        if (!Objects.equals(this.tipSpora, other.tipSpora)) {
            return false;
        }
        return true;
    }
    
    
}
