/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kontroler;

import db.DBBroker;
import domen.Linija;
import domen.Stanica;
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

    public ArrayList<Stanica> vratiSveStanice() {
        ArrayList<Stanica> listaStanica = new ArrayList<>();
        db.otvoriKonekciju();
        listaStanica = db.vratiSveStanice();
        db.zatvoriKonekciju();
        return listaStanica;
    }
    
    
    public int vratiID(){
        db.otvoriKonekciju();
        int maxID = db.vratiID();
        db.zatvoriKonekciju();
        return ++maxID;
    }

    public boolean sacuvajLiniju(Linija linija) {
        boolean status = false;
        db.otvoriKonekciju();
        try {
            db.sacuvajLiniju(linija);
            status = true;
            db.commit();
        } catch (SQLException ex) {
            db.rollback();
            Logger.getLogger(Kontroler.class.getName()).log(Level.SEVERE, null, ex);
        }
        db.zatvoriKonekciju();
        return status;
    }

    public ArrayList<Linija> vratiSveLinije() {
        ArrayList<Linija> listaLinija = new ArrayList<>();
        db.otvoriKonekciju();
        listaLinija = db.vratiSveLinije();
        db.zatvoriKonekciju();
        return listaLinija;
    }

    public ArrayList<Linija> vratiSveLinije(String filter) {
        ArrayList<Linija> listaLinija = new ArrayList<>();
        db.otvoriKonekciju();
        listaLinija = db.vratiSveLinije(filter);
        db.zatvoriKonekciju();
        return listaLinija;
    }
    
}
