/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kontrolor;

import db.DBBroker;
import domen.Paket;
import domen.Pretplatnik;
import domen.Ugovor;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Gogic
 */
public class Kontrolor {
    private static Kontrolor instance;
    DBBroker db;

    private Kontrolor() {
        db = new DBBroker();
    }

    public static Kontrolor getInstance() {
        if(instance == null){
            instance = new Kontrolor();
        }
        return instance;
    }

    public ArrayList<Paket> vratiPakete() {
        db.otvoriKonekciju();
        ArrayList<Paket> lista = db.vratiPakete();
        
        db.zatvoriKonekciju();
        return lista;
    }

    public ArrayList<Pretplatnik> vratiPretplatnike() {
        db.otvoriKonekciju();
        ArrayList<Pretplatnik> lista = db.vratiPretplatnike();
        
        db.zatvoriKonekciju();
        return lista;
    }

    public boolean sacuvajUgovore(ArrayList<Ugovor> listaU) {
        db.otvoriKonekciju();
        boolean signal = false;
        try{
            for (Ugovor ugovor : listaU) {
                db.sacuvajUgovor(ugovor);
            }
            signal = true;
            db.commit();
        }catch(SQLException ex){
            db.rollback();
            ex.printStackTrace();
            
        }
        db.zatvoriKonekciju();
        return signal;
    }

    public ArrayList<Ugovor> vratiUgovore() {
        db.otvoriKonekciju();
        ArrayList<Ugovor> lista = db.vratiUgovore();
        
        db.zatvoriKonekciju();
        return lista;
    }

    public void obrisiUgovor(Ugovor u) {
        db.otvoriKonekciju();
        try {
            db.obrisiUgovor(u);
            db.commit();
        } catch (SQLException ex) {
            db.rollback();
            Logger.getLogger(Kontrolor.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        db.zatvoriKonekciju();
    }
    
    
    
    
}
