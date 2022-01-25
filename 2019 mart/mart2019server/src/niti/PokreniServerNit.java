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

    @Override
    public void run() {
        try {
            ServerSocket ss = new ServerSocket(9000);
            System.out.println("Server je pokrenut!");
            while(true){
                Socket s = ss.accept();
                System.out.println("Klijent je povezan!");
                ObradaKlijentskogZahtevaNit okzn = new ObradaKlijentskogZahtevaNit(s);
                okzn.start();
            }
            
        } catch (IOException ex) {
            System.out.println("Server nije pokrenut!");
            Logger.getLogger(PokreniServerNit.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    
}
