/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import domen.Podnesak;
import domen.Predmet;
import domen.Sud;
import domen.TipSpora;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Gogic
 */
public class DBBroker {
    Connection konekcija;
    
    public void otvoriKonekciju(){
        try {
            konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/prosoftsept19","root","root");
            konekcija.setAutoCommit(false);
            System.out.println("Povezao se sa bazom");
        } catch (SQLException ex) {
            System.out.println("Nije se povezao sa bazom");
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void zatvoriKonekciju(){
        try {
            konekcija.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void commit(){
        try {
            konekcija.commit();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void rollback(){
        try {
            konekcija.rollback();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Sud> vratiSudove() {
        ArrayList<Sud> listaS = new ArrayList<>();
        String upit = "SELECT * FROM sud";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
               Sud sud = new Sud(rs.getInt("SudID"), rs.getString("Naziv"), rs.getString("Adresa"));
               listaS.add(sud);
            }
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
                
        return listaS;
    }

    public ArrayList<TipSpora> vartiSporove() {
       ArrayList<TipSpora> listaS = new ArrayList<>();
        String upit = "SELECT * FROM tipspora";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
               TipSpora ts = new TipSpora(rs.getInt("TipSporaID"), rs.getString("Naziv"));
               listaS.add(ts);
            }
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
                
        return listaS;
    }

    public void sacuvajPodnesak(Podnesak podnesak) throws SQLException {
        String upit = "INSERT INTO podnesak VALUES(?,?,?,?,?)";
        
        PreparedStatement ps = konekcija.prepareStatement(upit);
        ps.setInt(1, podnesak.getPredmet().getPredmetID());
        ps.setInt(2, podnesak.getRB());
        ps.setDate(3, new Date(podnesak.getDatumPrijema().getTime()));
        ps.setString(4, podnesak.getOpis());
        ps.setString(5, podnesak.getVrstaPodneska());
        
        
        ps.executeUpdate();
        
        ps.close();
    }

    public int sacuvajPredmet(Predmet pred) throws SQLException{
        String upit = "INSERT INTO predmet(BrojPredmeta,DatumPrijema,Tuzilac,Tuzeni,PlacenaSudskaTaksa,TipSporaID,SudID,Status) VALUES(?,?,?,?,?,?,?,?)";
        int id = 0;
        PreparedStatement ps = konekcija.prepareStatement(upit, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, pred.getBrojPredmeta());
        ps.setDate(2, new Date(pred.getDatumPredmeta().getTime()));
        ps.setString(3, pred.getTuzilac());
        ps.setString(4, pred.getTuzeni());
        ps.setBoolean(5, pred.isPlacenaSudskaTaksa());
        ps.setInt(6, pred.getTipSpora().getTipSporaID());
        ps.setInt(7, pred.getSud().getSudID());
        ps.setString(8, pred.getStatus());
        
        ps.executeUpdate();
        ResultSet rs = ps.getGeneratedKeys();
        while(rs.next()){
        id = rs.getInt(1);
        
        }
        ps.close();
        return id;
    }

    public boolean proveriBroj(String broj) {
        boolean sig = false;
        String upit = "SELECT * FROM predmet WHERE BrojPredmeta = '"+broj+"'";
        
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            if(rs.next() == false){
                sig = true;
            }
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return sig;
    }

    public ArrayList<Predmet> vratiPredmete() {
        ArrayList<Predmet> listaPr = new ArrayList<>();
        String upit = "SELECT * FROM predmet p JOIN sud s ON p.SudID=s.SudID JOIN tipspora ts ON p.TipSporaID = ts.TipSporaID";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
               TipSpora ts = new TipSpora(rs.getInt("ts.TipSporaID"), rs.getString("ts.Naziv"));
               Sud sud = new Sud(rs.getInt("s.SudID"), rs.getString("s.Naziv"), rs.getString("Adresa"));
               Predmet pr = new Predmet(rs.getInt(1), rs.getString(2), null, "tuzilac", "tuzeni", true, ts, sud, "neresen");
               listaPr.add(pr);
            }
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
                
        return listaPr;
    }
}
