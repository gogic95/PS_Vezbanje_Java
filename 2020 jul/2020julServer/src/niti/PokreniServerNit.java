/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package niti;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Gogic
 */
public class PokreniServerNit extends Thread{
    ServerSocket ss;

    @Override
    public void run() {
        try {
            ss = new ServerSocket(9000);
            System.out.println("Server pokrenut");
            while (true) {                
                Socket s = ss.accept();
                System.out.println("Klijent je povezan");
                ObradaKlijentskihZahtevaNit okzn = new ObradaKlijentskihZahtevaNit(s);
                okzn.start();
            }
        } catch (IOException ex) {
            Logger.getLogger(PokreniServerNit.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    
}
