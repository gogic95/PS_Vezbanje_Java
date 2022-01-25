/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kontroler;

import db.DBBroker;
import domen.Laborant;
import domen.Laboratorija;
import domen.Zahtev;
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

    public ArrayList<Laborant> vratiLaborante() {
        db.otvoriKonekciju();
        
        ArrayList<Laborant> lista = db.vratiLaborante();
        
        db.zatvoriKonekciju();
        return lista;
    }

    public ArrayList<Zahtev> vratiZahteve() {
        db.otvoriKonekciju();
        
        ArrayList<Zahtev> lista = db.vratiZahteve();
        
        db.zatvoriKonekciju();
        return lista;
    }

    public boolean sacuvajZahteve(ArrayList<Zahtev> listaZah) {
        boolean signal = false;
        db.otvoriKonekciju();
        try{
        for (Zahtev zahtev : listaZah) {
            db.sacuvajZahtev(zahtev);
        }
        signal = true;
        db.commit();
        }
        catch(SQLException ex){
            ex.printStackTrace();
            db.rollback();
          
        }
        db.zatvoriKonekciju();
        return  signal;
        
    }

    public ArrayList<Zahtev> vratiZahteveObradjene() {
        db.otvoriKonekciju();
        
        ArrayList<Zahtev> lista = db.vratiZahteveObradjene();
        
        db.zatvoriKonekciju();
        return lista;
    }

    public ArrayList<Laboratorija> vratiLaboratorije() {
        db.otvoriKonekciju();
        
        ArrayList<Laboratorija> lista = db.vratiLaboratorija();
        
        db.zatvoriKonekciju();
        return lista;
    }
    
    
    
    
}
