/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kontroler;

import db.DBBroker;
import domen.Meteorolog;
import domen.Prognoza;
import domen.PrognozaRegion;
import domen.Region;
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

    public ArrayList<Meteorolog> vratiMeteorologe() {
        db.otvoriKonekciju();
        ArrayList<Meteorolog> lista = db.vratiMeteorologe();
        db.zatvoriKonekciju();
        return lista;
    }

    public ArrayList<Region> vratiRegione() {
        db.otvoriKonekciju();
        ArrayList<Region> lista = db.vratiRegione();
        db.zatvoriKonekciju();
        return lista;
    }

    public boolean sacuvajPrognozu(ArrayList<PrognozaRegion> listaPR) {
        boolean signal = false;
        db.otvoriKonekciju();
        Prognoza p = listaPR.get(0).getPrognoza();
        try {
            int id = db.vratiIDPrognoze();
            p.setPrognozaID(id);
            db.sacuvajPrognozu(p);
            for (PrognozaRegion prognozaRegion : listaPR) {
                prognozaRegion.setPrognoza(p);
                db.sacuvajPrognozZaRegion(prognozaRegion);
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

    public ArrayList<Prognoza> vratiPrognoze() {
        db.otvoriKonekciju();
        ArrayList<Prognoza> lista = db.vratiPrognoze();
        db.zatvoriKonekciju();
        return lista;
    }

    public ArrayList<PrognozaRegion> vratiPrognozeRegionSaID(int id) {
       db.otvoriKonekciju();
        ArrayList<PrognozaRegion> lista = db.vratiPrognozeRegionID(id);
        db.zatvoriKonekciju();
        return lista;
    }
    
    
    
    
}
