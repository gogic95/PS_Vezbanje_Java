/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package komunikacija;

import domen.Linija;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import operacije.Konstante;
import transferObjekat.KlijentskiZahtev;
import transferObjekat.ServerskiOdgovor;

/**
 *
 * @author Gogic
 */
public class KomunikacijSaServerom {
    private static  KomunikacijSaServerom instance;

    Socket soket;
    
    private KomunikacijSaServerom() {
        try {
            soket = new Socket("localhost", 9000);
            System.out.println("Povezao se sa serverom");
        } catch (IOException ex) {
            
            System.out.println("Neuspesno se povezao sa serverom");
            Logger.getLogger(KomunikacijSaServerom.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static KomunikacijSaServerom getInstance() {
        if(instance == null){
            instance = new KomunikacijSaServerom();
        }
        return instance;
    }

    
    public void postaljiZahtev(KlijentskiZahtev kz){
        try {
            ObjectOutputStream oos = new ObjectOutputStream(soket.getOutputStream());
            oos.writeObject(kz);
        } catch (IOException ex) {
            Logger.getLogger(KomunikacijSaServerom.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ServerskiOdgovor primiOdgovor(){
        try {
            ObjectInputStream ois = new ObjectInputStream(soket.getInputStream());
            return (ServerskiOdgovor) ois.readObject();
        } catch (IOException | ClassNotFoundException ex) {
            Logger.getLogger(KomunikacijSaServerom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Linija> vratiSveLinije() {
        KlijentskiZahtev kz = new KlijentskiZahtev(Konstante.VRATI_SVE_LINIJE, null);
        KomunikacijSaServerom.getInstance().postaljiZahtev(kz);
        ArrayList<Linija> lista = (ArrayList<Linija>) KomunikacijSaServerom.getInstance().primiOdgovor().getOdgovor();
        
        return lista;
    }
    
}
