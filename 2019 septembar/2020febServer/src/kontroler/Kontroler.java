/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kontroler;

import db.DBBroker;
import domen.Intervju;
import domen.Kandidat;
import domen.Regruter;
import java.sql.Date;
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

    public ArrayList<Regruter> vratiRegrutere() {
        db.otvoriKonekciju();
        ArrayList<Regruter> listaReg = db.vratiListuRegrutera();
        db.zatvoriKonekciju();
        return listaReg;
    }

    public ArrayList<Kandidat> vratiKandidate() {
        db.otvoriKonekciju();
        ArrayList<Kandidat> listaKan = db.vratiKandidate();
        db.zatvoriKonekciju();
        return listaKan;
    }

    public boolean sacuvajIntervju(ArrayList<Intervju> listaI) {
        boolean signal = false;
        db.otvoriKonekciju();
        try {
                for (Intervju intervju : listaI) {

                        db.sacuvajIntervju(intervju);
                }
                signal = true;
                db.commit();
        } catch (SQLException ex) {
                db.rollback();
                ex.printStackTrace();
                Logger.getLogger(Kontroler.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        db.zatvoriKonekciju();
        return signal;
    }

   

    public ArrayList<Kandidat> vratiKandidate(int id) {
        db.otvoriKonekciju();
        ArrayList<Kandidat> listaKan1 = db.vratiKandidateIzIntervjua(id);
        db.zatvoriKonekciju();
        return listaKan1;
    }

    public ArrayList<Kandidat> vratiKandidateDatum(int id, Date datum1, Date datum2) {
        db.otvoriKonekciju();
        ArrayList<Kandidat> listaKan1 = db.vratiKandidateIzIntervjua(id,datum1,datum2);
        db.zatvoriKonekciju();
        return listaKan1;
    }
    
    
    
}
