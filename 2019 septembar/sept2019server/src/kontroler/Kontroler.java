/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kontroler;

import db.DBBroker;
import domen.Podnesak;
import domen.Predmet;
import domen.Sud;
import domen.TipSpora;
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

    public ArrayList<Sud> vratiSudove() {
        ArrayList<Sud> listaS = new ArrayList<>();
        db.otvoriKonekciju();
        listaS = db.vratiSudove();
        db.zatvoriKonekciju();
        return  listaS;
        }

    public ArrayList<TipSpora> vratiTipoveSporova() {
        ArrayList<TipSpora> listaT = new ArrayList<>();
        db.otvoriKonekciju();
        listaT = db.vartiSporove();
        db.zatvoriKonekciju();
        return  listaT;
    }

    public boolean sacuvajPredmet(ArrayList<Podnesak> listaP) {
        boolean signal = false;
        Predmet pred = listaP.get(0).getPredmet();
        db.otvoriKonekciju();
        try{
            int id = db.sacuvajPredmet(pred);
            for (Podnesak podnesak : listaP) {
                podnesak.getPredmet().setPredmetID(id);
                db.sacuvajPodnesak(podnesak);
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

    public boolean proveriBroj(String broj) {
       db.otvoriKonekciju();
       boolean sig = db.proveriBroj(broj);
       db.zatvoriKonekciju();
       return sig;
    }

    public ArrayList<Predmet> vratiPredmete() {
        ArrayList<Predmet> listaPr = new ArrayList<>();
        db.otvoriKonekciju();
        listaPr = db.vratiPredmete();
        db.zatvoriKonekciju();
        return  listaPr;
    }
    
    
}
