/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package niti;

import domen.Podnesak;
import domen.Sud;
import domen.TipSpora;
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
        while(true){
            KlijentskiZahtev kz = primiZahtev();
            ServerskiOdgovor so = new ServerskiOdgovor();
            
            switch(kz.getOperacija()){
                case Konstante.VRATI_SUDOVE:
                    ArrayList<Sud> listaS = Kontroler.getInstance().vratiSudove();
                    so.setOdgovor(listaS);
                    break;
                case Konstante.VRATI_TIPOVE_SPOROVA:
                    ArrayList<TipSpora> listaT = Kontroler.getInstance().vratiTipoveSporova();
                    so.setOdgovor(listaT);
                    break;
                case Konstante.SACUVAJ_PREDMET:
                    ArrayList<Podnesak> listaP = (ArrayList<Podnesak>) kz.getParametar();
                    boolean signal = Kontroler.getInstance().sacuvajPredmet(listaP);
                    if(signal){
                        so.setPoruka("Uspesno sacuvano sve");
                    }else{
                        so.setPoruka("Neuspesno cuvanje");
                    }
                    
                    so.setOdgovor(signal);
                    break;
                    
                case Konstante.DA_LI_JE_BROJ_VALIDAN:
                    String broj = (String) kz.getParametar();
                    boolean sig = Kontroler.getInstance().proveriBroj(broj);
                    so.setOdgovor(sig);
                    break;
                default: return;
                
            }
            posaljiOdgovor(so);
        }
    }

    private KlijentskiZahtev primiZahtev() {
        try {
            ObjectInputStream ois = new ObjectInputStream(s.getInputStream());
            return (KlijentskiZahtev) ois.readObject();
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
            System.out.println("Poslao odgovor");
        } catch (IOException ex) {
            System.out.println("Nije poslao odgovor");
            Logger.getLogger(ObradaKlijentskihZahtevaNit.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
