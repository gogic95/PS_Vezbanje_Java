/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import domen.Advokat;
import domen.Klijent;
import domen.Predmet;
import domen.VrstaPostupka;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.logging.Level;
import java.util.logging.Logger;
import pomocna.KlasaPretraga;

/**
 *
 * @author Gogic
 */
public class DBBroker {
    Connection konekcija;
    
    public void otvoriKonekciju(){
        try {
            konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/prosoftmart19", "root", "root");
            konekcija.setAutoCommit(false);
            System.out.println("Otvorena konekcija sa bazom");
            
        } catch (SQLException ex) {
            System.out.println("Neuspesno otvaranje konekcije sa bazom");
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void zatvoriKonekciju(){
        try {
            konekcija.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
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

    public ArrayList<Klijent> vratiKlijente() {
             ArrayList <Klijent> listaKlijenata = new ArrayList<>();
        try {
            String upit = "SELECT * FROM klijent";
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                Klijent k = new Klijent(rs.getInt("KlijentID"), rs.getString("Ime"), rs.getString("Prezime"), rs.getString("Telefon"), rs.getString("ElPosta"), rs.getString("Adresa"));
                listaKlijenata.add(k);
            }
                 
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
        return listaKlijenata;
    }

    public ArrayList<VrstaPostupka> vratiVrste() {
        ArrayList <VrstaPostupka> listaVrsti = new ArrayList<>();
        try {
            String upit = "SELECT * FROM vrstapostuka";
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                VrstaPostupka vr = new VrstaPostupka(rs.getInt("VrstaPostukaID"), rs.getString("Naziv"));
                listaVrsti.add(vr);
            }
                 
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
        return listaVrsti;
    }

    public ArrayList<Advokat> vratiAdvokate() {
        String upit = "SELECT * FROM advokat a JOIN vrstapostuka vp ON a.SpecijalnostZaVrstuPostupka = vp.VrstaPostukaID";
        ArrayList<Advokat> listaAdvokata = new ArrayList<>();
        
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                VrstaPostupka vp = new VrstaPostupka(rs.getInt("VrstaPostukaID"), rs.getString("Naziv"));
                Advokat a = new Advokat(rs.getInt("AdvokatID"), rs.getString("Ime"), rs.getString("Prezime"), vp);
                listaAdvokata.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        return listaAdvokata;
    }
    
  

    public void sacuvajPredmet(Predmet predmet) throws SQLException {
        String upit = "INSERT INTO predmet VALUES (?,?,?,?,?,?,?)";
        PreparedStatement ps = konekcija.prepareStatement(upit);
        ps.setInt(1, predmet.getPredmetID());
        ps.setString(2, predmet.getNaziv());
        ps.setString(3, predmet.getProblem());
        ps.setDate(4, new Date( predmet.getDatum().getTime()));
        ps.setInt(5, predmet.getAdvokat().getAdvokatID());
        ps.setInt(6, predmet.getKlijent().getKlijentID());
        ps.setInt(7, predmet.getVrstaPostupka().getVrstaPostupkaID());
        
        ps.executeUpdate();
    }

    public int vratiPredmetID() {
        String upit = "SELECT MAX(PredmetID) as max FROM predmet";
        int indeks = 0;
        
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                indeks = rs.getInt("max");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ++indeks;
    }

    public ArrayList<KlasaPretraga> vratiPretragu(String pretraga) {
       ArrayList<KlasaPretraga> listaPK = new ArrayList<>();
      
       String upit = "SELECT a.Ime,a.Prezime, COUNT(p.PredmetID) AS broj FROM predmet p JOIN advokat a ON p.AdvokatID = a.AdvokatID WHERE a.Ime LIKE '%"+pretraga+"%' OR a.Prezime LIKE '%"+pretraga+"%' GROUP BY p.AdvokatID ORDER BY broj ASC";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                String imePrezime = rs.getString("Ime") + " " + rs.getString("Prezime");
                KlasaPretraga kp = new KlasaPretraga(rs.getInt("broj"), imePrezime);
                listaPK.add(kp);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
       
             
       return listaPK;
    }
}
