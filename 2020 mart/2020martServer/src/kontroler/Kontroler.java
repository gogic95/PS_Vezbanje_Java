/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kontroler;

import db.DBBroker;
import domen.Izdanje;
import domen.Publikacija;
import domen.Vest;
import java.sql.SQLException;
import java.util.ArrayList;

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

    public ArrayList<Publikacija> vratiPublikacije() {
        db.otvoriKonekciju();
        ArrayList<Publikacija> lista = db.vratiPublikacije();
        db.zatvoriKonekciju();
        return lista;
    }

    public ArrayList<Izdanje> vratiIzdanja() {
        db.otvoriKonekciju();
        ArrayList<Izdanje> lista = db.vratiIzdanja();
        db.zatvoriKonekciju();
        return lista;
    }

    public boolean sacuvajIzdanje(ArrayList<Vest> listaVesti) {
        boolean signal = false;
        db.otvoriKonekciju();
        Izdanje i = listaVesti.get(0).getIzdanje();
        try {
            int ID = db.vratiIDizdanja();
            i.setIzdanjeID(ID);
            db.sacuvajIzdanje(i);
            for (Vest vest : listaVesti) {
                db.sacuvajVest(vest);
            }
            signal = true;
            db.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            db.rollback();
        }
        
        
        db.zatvoriKonekciju();
        return signal;
    }

    public ArrayList<Vest> vratiVesti() {
        db.otvoriKonekciju();
        ArrayList<Vest> lista = db.vratiVest();
        db.zatvoriKonekciju();
        return lista;
    }

    public ArrayList<Vest> vratiVestiSaFilterom(String deoNaslova) {
        db.otvoriKonekciju();
        ArrayList<Vest> lista = db.vratiVestSaFilterom(deoNaslova);
        db.zatvoriKonekciju();
        return lista;
    }
    
    
    
}
