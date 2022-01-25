/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pk;

/**
 *
 * @author Gogic
 */
public class PomocnaKlasa {
    private String tip;
    private int brojPozitivnih;
    private int brojNegativnih;

    public PomocnaKlasa() {
    }

    public PomocnaKlasa(String tip, int brojPozitivnih, int brojNegativnih) {
        this.tip = tip;
        this.brojPozitivnih = brojPozitivnih;
        this.brojNegativnih = brojNegativnih;
    }

    public int getBrojNegativnih() {
        return brojNegativnih;
    }

    public void setBrojNegativnih(int brojNegativnih) {
        this.brojNegativnih = brojNegativnih;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public int getBrojPozitivnih() {
        return brojPozitivnih;
    }

    public void setBrojPozitivnih(int brojPozitivnih) {
        this.brojPozitivnih = brojPozitivnih;
    }
    
    
}
