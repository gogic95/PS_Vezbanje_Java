/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kontroler;

import db.DBBroker;
import domen.Advokat;
import domen.Klijent;
import domen.Predmet;
import domen.VrstaPostupka;
import java.sql.SQLException;
import java.util.ArrayList;
import pomocna.KlasaPretraga;

/**
 *
 * @author Gogic
 */
public class Kontroler {
    
    private static Kontroler instance;
    DBBroker db;
    
    
    private Kontroler() {
        db = new DBBroker();
    }

    public static Kontroler getInstance() {
        if(instance == null){
            instance = new Kontroler();
        }
        return instance;
    }

    public ArrayList<Klijent> vratiKlijente() {
        ArrayList<Klijent> listaKlijenata = new ArrayList<>();
        db.otvoriKonekciju();
        listaKlijenata = db.vratiKlijente();
        
        db.zatvoriKonekciju();
        
        return listaKlijenata;
    }

    public ArrayList<VrstaPostupka> vratiVrste() {
        ArrayList<VrstaPostupka> listaVrsti = new ArrayList<>();
        db.otvoriKonekciju();
        listaVrsti = db.vratiVrste();
        
        db.zatvoriKonekciju();
        
        return listaVrsti;
    }

    public ArrayList<Advokat> vratiAdvokate() {
        ArrayList<Advokat> listaAdvokata = new ArrayList<>();
        db.otvoriKonekciju();
        listaAdvokata = db.vratiAdvokate();
        db.zatvoriKonekciju();
        return listaAdvokata;
    }

    public boolean sacuvajPredmete(ArrayList<Predmet> listaPredmeta) {
        boolean signal = false;
        db.otvoriKonekciju();
        try {
            for (Predmet predmet : listaPredmeta) {
                int predmetID = db.vratiPredmetID();
                predmet.setPredmetID(predmetID);
                db.sacuvajPredmet(predmet);
            }
            signal = true;
            db.commit();
        } catch (SQLException e) {
            db.rollback();
        }
        db.zatvoriKonekciju();
        return signal;
    }

    public ArrayList<KlasaPretraga> vratiPretragu(String pretraga) {
        ArrayList<KlasaPretraga> lista = new ArrayList<>();
        db.otvoriKonekciju();
        lista = db.vratiPretragu(pretraga);
        db.zatvoriKonekciju();
        return lista;
    }
    
    
    
    
}
