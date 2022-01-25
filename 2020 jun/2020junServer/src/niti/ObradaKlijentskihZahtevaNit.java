/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package niti;

import domen.Banka;
import domen.Korisnik;
import domen.Zaposleni;
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
        while (true) {            
            KlijentskiZahtev kz = primiZahtev();
            ServerskiOdgovor so = new ServerskiOdgovor();
            switch(kz.getOperacija()){
                case Konstante.VRATI_KORISNIKE:
                    ArrayList<Korisnik> listaKorisnika = Kontroler.getInstance().vratiKorisnike();
                    so.setOdgovor(listaKorisnika);
                    break;
                case Konstante.VRATI_BANKE:
                    ArrayList<Banka> listaB = Kontroler.getInstance().vratiBanke();
                    so.setOdgovor(listaB);
                    break;
                case Konstante.SACUVAJ_KOMPANIJU:
                    ArrayList<Zaposleni> listaZ = (ArrayList<Zaposleni>) kz.getParametar();
                    boolean signal = Kontroler.getInstance().sacuvajKompaniju(listaZ);
                    so.setOdgovor(signal);
                    break;
                 case Konstante.VRATI_ID_ZAPOSLENOG:
                    long id = Kontroler.getInstance().vratiIDZaposlenog();
                    so.setOdgovor(id);
                    break;
                    
                case Konstante.VRATI_MATICNI:
                    String maticni = (String) kz.getParametar();
                    boolean signal1 = Kontroler.getInstance().proveriMaticni(maticni);
                    so.setOdgovor(signal1);
                    break;
                case Konstante.VRATI_ZIRORACUN:
                    String ziroRacun = (String) kz.getParametar();
                    boolean signal2 = Kontroler.getInstance().proveriZiroRacun(ziroRacun);
                    so.setOdgovor(signal2);
                    break;
                case Konstante.VRATI_JMBG:
                    String JMBG = (String) kz.getParametar();
                    boolean signal3 = Kontroler.getInstance().proveriJMBG(JMBG);
                    so.setOdgovor(signal3);
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
        } catch (IOException ex) {
            System.out.println("Nije poslao odgovor");
            Logger.getLogger(ObradaKlijentskihZahtevaNit.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
  
}
