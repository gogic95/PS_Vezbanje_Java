/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package niti;

import forme.ServerskaForma;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Gogic
 */
public class OsveziNit extends Thread{
    ServerskaForma sf;

    public OsveziNit(ServerskaForma sf) {
        this.sf = sf;
    }

    @Override
    public void run() {
        while(true){
            try {
                sleep(5000);
                sf.pronadji();
                System.out.println("nit je osvezena");
            } catch (InterruptedException ex) {
                System.out.println("nit nije osvezena");
                Logger.getLogger(OsveziNit.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    
}
