/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package niti;

import domen.Linija;
import domen.Stanica;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import kontroler.Kontroler;
import operacije.Konstante;
import transferObjekat.KlijentskiZahtev;
import transferObjekat.ServerskiOdgovor;

/**
 *
 * @author Gogic
 */
class ObradaKlijentskihZahtevaNit extends Thread{
    Socket soket;

    public ObradaKlijentskihZahtevaNit(Socket soket) {
        this.soket = soket;
    }
    
    
    
    @Override
    public void run() {
        while(true){
        KlijentskiZahtev kz = prihvatiZahtev();
        ServerskiOdgovor so = new ServerskiOdgovor();
        
        switch(kz.getOperacija()){
            case Konstante.VRATI_SVE_STANICE:
                ArrayList<Stanica> listaStanica = Kontroler.getInstance().vratiSveStanice();
                so.setOdgovor(listaStanica);
                break;
            case Konstante.SACUVAJ_LINIJU:
                boolean status = false;
                 System.out.println("Stigao");
                Linija linija = (Linija) kz.getParametar();
                status = Kontroler.getInstance().sacuvajLiniju(linija);
                if(status){
                    so.setPoruka("uspesno");
                }else{
                    so.setPoruka("neuspesno");
                }
                break;
            case Konstante.VRATI_ID:
                int id = 0;
                id = Kontroler.getInstance().vratiID();
                so.setOdgovor(id);
                break;
            case Konstante.VRATI_SVE_LINIJE:
                ArrayList<Linija> lista = Kontroler.getInstance().vratiSveLinije();
                so.setOdgovor(lista);
                break;
             default: return;
        }
        
        posaljiOdgovor(so);
        }
    }

    private KlijentskiZahtev prihvatiZahtev() {
        try {
            ObjectInputStream ois = new ObjectInputStream(soket.getInputStream());
            return  (KlijentskiZahtev) ois.readObject();
        } catch (IOException | ClassNotFoundException ex) {
            Logger.getLogger(ObradaKlijentskihZahtevaNit.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    private void posaljiOdgovor(ServerskiOdgovor so) {
        try {
            ObjectOutputStream oos = new ObjectOutputStream(soket.getOutputStream());
            oos.writeObject(so);
        } catch (IOException ex) {
            Logger.getLogger(ObradaKlijentskihZahtevaNit.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
}
