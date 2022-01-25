/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package komunikacija;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;
import transferObjekat.KlijentskiZahtev;
import transferObjekat.ServerskiOdgovor;

/**
 *
 * @author Gogic
 */
public class KomunikacijaSaServerom {
    private static KomunikacijaSaServerom instance;
    Socket s;
    
    
    private KomunikacijaSaServerom() {
        try {
            s = new Socket("localhost", 9000);
            System.out.println("Povezao se sa serverom!");
        } catch (IOException ex) {
            Logger.getLogger(KomunikacijaSaServerom.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static KomunikacijaSaServerom getInstance() {
        if(instance == null){
            instance = new KomunikacijaSaServerom();
        }
        return instance;
    }
    
    public void posaljiZahtev(KlijentskiZahtev kz){
        try {
            ObjectOutputStream oos = new ObjectOutputStream(s.getOutputStream());
            oos.writeObject(kz);
        } catch (IOException ex) {
            Logger.getLogger(KomunikacijaSaServerom.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ServerskiOdgovor primiOdgovor(){
        try {
            ObjectInputStream ois = new ObjectInputStream(s.getInputStream());
            return (ServerskiOdgovor) ois.readObject();
        } catch (IOException | ClassNotFoundException ex) {
            Logger.getLogger(KomunikacijaSaServerom.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
