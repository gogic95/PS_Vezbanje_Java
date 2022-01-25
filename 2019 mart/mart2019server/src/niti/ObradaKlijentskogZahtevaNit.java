/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package niti;

import domen.Advokat;
import domen.Klijent;
import domen.Predmet;
import domen.VrstaPostupka;
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
public class ObradaKlijentskogZahtevaNit extends Thread{
    Socket klijentskiSoket;
    boolean kraj = false;
    
    public ObradaKlijentskogZahtevaNit(Socket soket) {
        this.klijentskiSoket = soket;
    }

    @Override
    public void run() {
        while(!kraj){
            KlijentskiZahtev kz = primiZahtev();
            ServerskiOdgovor so = new ServerskiOdgovor();
            
            switch(kz.getOperacija()){
                case Konstante.VRATI_KLIJENTE:
                    ArrayList <Klijent> listaKlijenata = Kontroler.getInstance().vratiKlijente();
                    so.setOdgovor(listaKlijenata);
                    break;
                    
                case Konstante.VRATI_VRSTE:
                    ArrayList <VrstaPostupka> listaVrsti = Kontroler.getInstance().vratiVrste();
                    so.setOdgovor(listaVrsti);
                    break;
                  
                case Konstante.VRATI_ADVOKATE:
                    ArrayList<Advokat> listaAdvokata = Kontroler.getInstance().vratiAdvokate();
                    so.setOdgovor(listaAdvokata);
                    break;
                    
                case Konstante.SACUVAJ:
                    ArrayList<Predmet> listaPredmeta = (ArrayList<Predmet>) kz.getParametar();
                    boolean signal = Kontroler.getInstance().sacuvajPredmete(listaPredmeta);
                    if(signal){
                        so.setPoruka("uspesno");
                    }else{
                        so.setPoruka("greska prilikom cuvanja");
                    }
                    break;
            }
            
            posaljiOdgovor(so);
        }
    }

    private KlijentskiZahtev primiZahtev() {
        try {
            
            ObjectInputStream ois = new ObjectInputStream(klijentskiSoket.getInputStream());
            //ovako je cule uradio
            return (KlijentskiZahtev) ois.readObject();
        } catch (IOException | ClassNotFoundException ex) {
            System.out.println("Neuspesno primanje zahteva");
            Logger.getLogger(ObradaKlijentskogZahtevaNit.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }

    private void posaljiOdgovor(ServerskiOdgovor so) {
        
        try {
            
            ObjectOutputStream oos = new ObjectOutputStream(klijentskiSoket.getOutputStream());
            //ovako je cule uradio
            oos.writeObject(so);
        } catch (IOException ex) {
            System.out.println("Neuspesno slanje odgovora");
            Logger.getLogger(ObradaKlijentskogZahtevaNit.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    
}
