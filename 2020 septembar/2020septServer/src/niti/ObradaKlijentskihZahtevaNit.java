/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package niti;

import domen.Laborant;
import domen.Zahtev;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import kons.Konstante;
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
            case Konstante.VRATI_LABORANTE:
                ArrayList<Laborant> lista = kontroler.Kontroler.getInstance().vratiLaborante();
                so.setOdgovor(lista);
                break;
            case Konstante.VRATI_ZAHTEVE:
                ArrayList<Zahtev> listaZ = kontroler.Kontroler.getInstance().vratiZahteve();
                so.setOdgovor(listaZ);
                break;
            case Konstante.SACUVAJ_ZAHTEVE:
                ArrayList<Zahtev> listaZah = (ArrayList<Zahtev>) kz.getParametar();
                boolean signal = Kontroler.getInstance().sacuvajZahteve(listaZah);
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
