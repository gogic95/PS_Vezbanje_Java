/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kontroler;

import db.DBBroker;
import domen.Korisnik;
import domen.Nastavnik;
import domen.PredajePredmet;
import domen.Predmet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

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

    public ArrayList<Korisnik> vratiKorisnike() {
        db.otvoriKonekciju();
        ArrayList<Korisnik> lista = db.vratiKorisnike();
        
        db.zatvoriKonekciju();
        return lista;
    }

    public ArrayList<Nastavnik> vratiNastavnike() {
        db.otvoriKonekciju();
        ArrayList<Nastavnik> lista = db.vratiNastavnike();
        
        db.zatvoriKonekciju();
        return lista;
    }

    public ArrayList<Predmet> vratiPredmete() {
        db.otvoriKonekciju();
        ArrayList<Predmet> lista = db.vratiPredmete();
        
        db.zatvoriKonekciju();
        return lista;
    }

    public boolean sacuvajAngazmane(ArrayList<PredajePredmet> listaPr) {
        boolean signal = false;
        db.otvoriKonekciju();
        try {
            for (PredajePredmet predajePredmet : listaPr) {
            
                db.sacuvajAngazman(predajePredmet);
                }
            signal = true;
            db.commit();
            } catch (SQLException ex) {
                db.rollback();
                Logger.getLogger(Kontroler.class.getName()).log(Level.SEVERE, null, ex);
            }
     
        
        db.zatvoriKonekciju();
        return signal;
    }

    public ArrayList<PredajePredmet> vratiPredajePredmet() {
        db.otvoriKonekciju();
        ArrayList<PredajePredmet> lista = db.vratiPredajePredmete();
        
        db.zatvoriKonekciju();
        return lista;
    }
    
    
    
    
    
}
