/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pomocna;

/**
 *
 * @author Gogic
 */
public class KlasaPretraga {
    private int brojPredmeta;
    private String imePrezime;

    public KlasaPretraga() {
    }

    public KlasaPretraga(int brojPredmeta, String imePrezime) {
        this.brojPredmeta = brojPredmeta;
        this.imePrezime = imePrezime;
    }

    public String getImePrezime() {
        return imePrezime;
    }

    public void setImePrezime(String imePrezime) {
        this.imePrezime = imePrezime;
    }

    public int getBrojPredmeta() {
        return brojPredmeta;
    }

    public void setBrojPredmeta(int brojPredmeta) {
        this.brojPredmeta = brojPredmeta;
    }
    
    
}
