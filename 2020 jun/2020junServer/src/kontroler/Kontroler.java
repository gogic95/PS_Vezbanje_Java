/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kontroler;

import db.DBBroker;
import domen.Banka;
import domen.Kompanija;
import domen.Korisnik;
import domen.Zaposleni;
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

    public ArrayList<Korisnik> vratiKorisnike() {
        db.otvoriKonekciju();
        ArrayList<Korisnik> lista = db.vratiKorisnike();
        db.zatvoriKonekciju();
        
        return lista;
    }

    public ArrayList<Banka> vratiBanke() {
        db.otvoriKonekciju();
        ArrayList<Banka> lista = db.vratiBanke();
        db.zatvoriKonekciju();
        
        return lista;
    }

    public boolean sacuvajKompaniju(ArrayList<Zaposleni> listaZ) {
        boolean signal = false;
        Kompanija komp = listaZ.get(0).getKompanija();
        db.otvoriKonekciju();
        try {
            long id = db.vratiIDKompanije();
            komp.setKompanijaID(id);
            db.sacuvajKompaniju(komp);
            for (Zaposleni zaposleni : listaZ) {
                zaposleni.setKompanija(komp);
                db.sacuvajZaposlenog(zaposleni);
            }
            signal = true;
            db.commit();
        } catch (SQLException e) {
            db.rollback();
            e.printStackTrace();
        }
        
        db.zatvoriKonekciju();
        return signal;
    }

    public long vratiIDZaposlenog() {
        db.otvoriKonekciju();
        long id = db.vratiIDZaposlenog();
        db.zatvoriKonekciju();
        
        return ++id;
    }

    public boolean proveriMaticni(String maticni) {
        db.otvoriKonekciju();
        boolean signal = db.proveriMaticni(maticni);
        db.zatvoriKonekciju();
        return signal;
    }

    public boolean proveriZiroRacun(String ziroRacun) {
       db.otvoriKonekciju();
        boolean signal = db.proveriZiro(ziroRacun);
        db.zatvoriKonekciju();
        return signal;
    }

    public boolean proveriJMBG(String JMBG) {
        db.otvoriKonekciju();
        boolean signal = db.proveriJMBG(JMBG);
        db.zatvoriKonekciju();
        return signal;
    }

    public ArrayList<Zaposleni> vratiZaposlene() {
        db.otvoriKonekciju();
        ArrayList<Zaposleni> lista = db.vratiZaposlene();
        db.zatvoriKonekciju();
        
        return lista;
    }
    

}
