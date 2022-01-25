/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kontroler;

import db.DBBroker;
import domen.Gazdinstvo;
import domen.Poljoprivrednik;
import domen.Stado;
import domen.Zivotinja;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import pomocna.PomocnaKlasa;

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

    public ArrayList<Poljoprivrednik> vratiSvePoljoprivrednike() {
        db.otvoriKonekciju();
        ArrayList<Poljoprivrednik> listaP = db.vratiSvePoljoprivrednike();
        db.zatvoriKonekciju();
        return listaP;
    }

    public int vratiID() {
        db.otvoriKonekciju();
        int id = 0;
        id = db.vratiID();
        db.zatvoriKonekciju();
        return id;
    }

    public boolean napraviGazdinstvo(Gazdinstvo g) {
        db.otvoriKonekciju();
        boolean signal = db.napraviGazdinstvo(g);
        db.zatvoriKonekciju();
        return signal;
    }

    public ArrayList<Zivotinja> vratiSveZivotinje() {
        db.otvoriKonekciju();
        ArrayList<Zivotinja> listaZ = db.vratiSveZivotinje();
        db.zatvoriKonekciju();
        return listaZ;
    }

    public boolean updateGazdinstvo(Gazdinstvo gaz) {
        db.otvoriKonekciju();
        boolean signal1 = db.updateGazdinstvo(gaz);
        
        db.zatvoriKonekciju();
        return signal1;
    }

    public boolean sacuvajStada(ArrayList<Stado> listaStada) {
        db.otvoriKonekciju();
        boolean signal2 = false;
        int stadoId = 1;
        try {
                for (Stado stado : listaStada) {
                        stado.setStadoID(stadoId);
                        db.sacuvajStado(stado);
                        stadoId++;
                }
                signal2 = true;
                db.commit();
            } catch (SQLException ex) {
                db.rollback();
                System.out.println("Nije sacuvao stada");
             Logger.getLogger(Kontroler.class.getName()).log(Level.SEVERE, null, ex); 
        }
        
        db.zatvoriKonekciju();
        return signal2;
    }

    

    public ArrayList<Gazdinstvo> vratiListuGazdinstva() {
        db.otvoriKonekciju();
        ArrayList<Gazdinstvo> listaG = db.vratiSvaGazdinstva();
        db.zatvoriKonekciju();
        return listaG;
    }

    public ArrayList<Stado> vratiListuStada(int gazID) {
        db.otvoriKonekciju();
        ArrayList<Stado> listaS = db.vratiListuStada(gazID);
        db.zatvoriKonekciju();
        return listaS;
    }
    
    
    
}
