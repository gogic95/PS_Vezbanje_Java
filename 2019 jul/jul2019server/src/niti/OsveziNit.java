/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package niti;

import forme.GlavnaServerskaForma;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Gogic
 */
public class OsveziNit extends Thread{
    GlavnaServerskaForma gsf;

    public OsveziNit(GlavnaServerskaForma gsf) {
        this.gsf = gsf;
    }

    @Override
    public void run() {
        while (true) {            
            try {
                sleep(10000);
                gsf.filtriraj();
                System.out.println("osvezeno");
            } catch (InterruptedException ex) {
                Logger.getLogger(OsveziNit.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    
}
