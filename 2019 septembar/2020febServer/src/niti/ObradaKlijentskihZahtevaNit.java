/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package niti;

import domen.Intervju;
import domen.Kandidat;
import domen.Regruter;
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
public class ObradaKlijentskihZahtevaNit extends Thread{
    Socket s;

    public ObradaKlijentskihZahtevaNit(Socket s) {
        this.s = s;
    }

    
    
    @Override
    public void run() {
        while (true) { 
            KlijentskiZahtev kz = primiZahtev();
            ServerskiOdgovor so = new ServerskiOdgovor();
            switch(kz.getOperacija()){
                case Konstante.VRATI_REGRUTERE:
                    ArrayList<Regruter> listaReg = Kontroler.getInstance().vratiRegrutere();
                    so.setOdgovor(listaReg);
                    break;
                 case Konstante.VRATI_KANDIDATE:
                    ArrayList<Kandidat> listaKan = Kontroler.getInstance().vratiKandidate();
                    so.setOdgovor(listaKan);
                    break;   
                 case Konstante.SACUVAJ_INTERVJU:
                    ArrayList<Intervju> listaI = (ArrayList<Intervju>) kz.getParametar();
                    boolean signal = Kontroler.getInstance().sacuvajIntervju(listaI);
                    so.setOdgovor(signal);
                    break;    
                default: return;
            }
            posaljiOdgovor(so);
            
        }
    }

    private KlijentskiZahtev primiZahtev() {
        try {
            ObjectInputStream ois = new ObjectInputStream(s.getInputStream());
            return  (KlijentskiZahtev) ois.readObject();
        } catch (IOException | ClassNotFoundException ex) {
            System.out.println("Nije primio zahtev");
            Logger.getLogger(ObradaKlijentskihZahtevaNit.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    private void posaljiOdgovor(ServerskiOdgovor so) {
        try {
            ObjectOutputStream oos = new ObjectOutputStream(s.getOutputStream());
            oos.writeObject(so);
        } catch (IOException ex) {
            System.out.println("Nije poslao odgovor");
            Logger.getLogger(ObradaKlijentskihZahtevaNit.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
