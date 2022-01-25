/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package niti;

import forme.GlavnaServerskForma;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Gogic
 */
public class OsveziNit extends Thread{
    GlavnaServerskForma gsf;

    public OsveziNit(GlavnaServerskForma gsf) {
        this.gsf = gsf;
    }

    @Override
    public void run() {
        while (true) {            
            try {
                gsf.srediTabelu();
                sleep(10000);
                System.out.println("osvezio");
            } catch (InterruptedException ex) {
                Logger.getLogger(OsveziNit.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
    }
    
    
}