/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kontroler;

import db.DBBroker;
import domen.Opstina;
import domen.Prijava;
import domen.StavkaPrijave;
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

    public ArrayList<Opstina> vratiOpstine() {
        db.otvoriKonekciju();
        ArrayList<Opstina> lista = db.vratiOpstine();
        db.zatvoriKonekciju();
        return lista;
    }

    public boolean sacuvajPrijavu(ArrayList<StavkaPrijave> listaS) {
        boolean signal = false;
        Prijava p = listaS.get(0).getPrijava();
        db.otvoriKonekciju();
        try {
            Long id = db.sacuvajPrijavu(p);
            for (StavkaPrijave sp : listaS) {
                p.setPrijavaID(id);
                sp.setPrijava(p);
                db.sacuvajStavkuPrijave(sp);
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

    public ArrayList<Prijava> vratiPrijave() {
        db.otvoriKonekciju();
        ArrayList<Prijava> lista = db.vratiPrijave();
        db.zatvoriKonekciju();
        return lista;
    }

    public void obrisiIzBaze(Prijava p) {
       db.otvoriKonekciju();
        db.obrisiPrijavu(p);
        db.zatvoriKonekciju();
    }
    
    
    
    
}
