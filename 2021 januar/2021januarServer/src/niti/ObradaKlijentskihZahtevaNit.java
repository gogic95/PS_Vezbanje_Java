/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package niti;

import domen.Paket;
import domen.Pretplatnik;
import domen.Ugovor;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import kons.Konstante;
import kontrolor.Kontrolor;
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
                case Konstante.VRATI_PAKETE:
                    ArrayList<Paket> listaPak = Kontrolor.getInstance().vratiPakete();
                    so.setOdgovor(listaPak);
                    break;
                case Konstante.VRATI_PRETPLATNIKE:
                    ArrayList<Pretplatnik> listaPre = Kontrolor.getInstance().vratiPretplatnike();
                    so.setOdgovor(listaPre);
                    break;    
                case Konstante.SACUVAJ_UGOVORE:
                    ArrayList<Ugovor> listaU = (ArrayList<Ugovor>) kz.getParametar();
                    boolean signal = Kontrolor.getInstance().sacuvajUgovore(listaU);
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
            return (KlijentskiZahtev) ois.readObject();
        } catch (IOException | ClassNotFoundException ex) {
            Logger.getLogger(ObradaKlijentskihZahtevaNit.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    private void posaljiOdgovor(ServerskiOdgovor so) {
        try {
            ObjectOutputStream oos = new ObjectOutputStream(s.getOutputStream());
            oos.writeObject(so);
        } catch (IOException ex) {
            Logger.getLogger(ObradaKlijentskihZahtevaNit.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
    
}
