/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package niti;

import domen.Gazdinstvo;
import domen.Poljoprivrednik;
import domen.Stado;
import domen.Zivotinja;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import konstante.Konstante;
import kontroler.Kontroler;
import transferObjekat.KlijentskiZahtev;
import transferObjekat.ServerskiOdgovor;

/**
 *
 * @author Gogic
 */
class ObradaKlijentskihZahtevaNit extends Thread{
    Socket klijentSoket;

    public ObradaKlijentskihZahtevaNit(Socket klijentSoket) {
        this.klijentSoket = klijentSoket;
    }

    @Override
    public void run() {  
        while (true) {            
            KlijentskiZahtev kz = primiZahtev();
            ServerskiOdgovor so = new ServerskiOdgovor();
            switch(kz.getOperacija()){
                case Konstante.VRATI_SVE_POLJOPRIVREDNIKE:
                    ArrayList<Poljoprivrednik> listaP = Kontroler.getInstance().vratiSvePoljoprivrednike();
                    so.setOdgovor(listaP);
                    break;
                case Konstante.VRATI_MAX_ID:
                    int id = 0;
                    id = Kontroler.getInstance().vratiID();
                    so.setOdgovor(id);
                    break;
                case Konstante.NAPRAVI_GAZDINSTVO:
                    Gazdinstvo g = (Gazdinstvo) kz.getParametar();
                    boolean signal = Kontroler.getInstance().napraviGazdinstvo(g);
                    so.setOdgovor(signal);
                    break;
                case Konstante.VRATI_SVE_ZIVOTINJE:
                    ArrayList<Zivotinja> listaZ = Kontroler.getInstance().vratiSveZivotinje();
                    so.setOdgovor(listaZ);
                    break;
                case Konstante.UPDATE_GAZDINSTVO:
                    Gazdinstvo gaz = (Gazdinstvo) kz.getParametar();
                    boolean signal1 = Kontroler.getInstance().updateGazdinstvo(gaz);
                    so.setOdgovor(signal1);
                    break;
                case Konstante.SACUVAJ_STADA:
                    ArrayList<Stado> listaStada =  (ArrayList<Stado>) kz.getParametar();
                    boolean signal2 = Kontroler.getInstance().sacuvajStada(listaStada);
                    so.setOdgovor(signal2);
                    break;
                default: return;
                        
            }
            posaljiOdgovor(so);
            
        }
    }

    private KlijentskiZahtev primiZahtev() {
        try {
            ObjectInputStream ois = new ObjectInputStream(klijentSoket.getInputStream());
            
            return (KlijentskiZahtev) ois.readObject();
        } catch (IOException | ClassNotFoundException ex) {
            System.out.println("Nije primeljen zahtev");
            Logger.getLogger(ObradaKlijentskihZahtevaNit.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    private void posaljiOdgovor(ServerskiOdgovor so) {
        try {
            ObjectOutputStream oos = new ObjectOutputStream(klijentSoket.getOutputStream());
            oos.writeObject(so);
            System.out.println("Poslat odgovor");
        } catch (IOException ex) {
            System.out.println("Nije poslat odgovor");
            Logger.getLogger(ObradaKlijentskihZahtevaNit.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
