/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import domen.Izdanje;
import domen.Publikacija;
import domen.Vest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
            konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/mart2020", "root", "root");
            konekcija.setAutoCommit(false);
        } catch (SQLException ex) {
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

    public ArrayList<Publikacija> vratiPublikacije() {
       ArrayList<Publikacija> lista = new ArrayList<>();
       String upit = "SELECT * FROM publikacija";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                Publikacija p = new Publikacija(rs.getInt(1), rs.getString(2));
                lista.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lista;
        
    }

    public ArrayList<Izdanje> vratiIzdanja() {
         ArrayList<Izdanje> lista = new ArrayList<>();
        
       String upit = "SELECT * FROM izdanje i JOIN publikacija p ON i.PublikacijaID = p.PublikacijaID";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                Publikacija p = new Publikacija(rs.getInt(4), rs.getString("Naziv"));
                
                Izdanje i = new Izdanje(rs.getInt(1), new Date(rs.getDate(2).getTime()), rs.getInt(3), p);
                lista.add(i);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lista;
    }

    public void sacuvajIzdanje(Izdanje i) throws SQLException {
        String upit = "INSERT INTO izdanje VALUES(?,?,?,?)";
        
        PreparedStatement ps = konekcija.prepareStatement(upit);
        ps.setInt(1, i.getIzdanjeID());
        ps.setDate(2,new java.sql.Date(i.getDatum().getTime()));
        ps.setInt(3, i.getBroj());
        ps.setInt(4, i.getPublikacija().getPublikacijaID());
        
        ps.executeUpdate();
        ps.close();
    }

    public void sacuvajVest(Vest vest) throws SQLException {
        String upit = "INSERT INTO vest VALUES(?,?,?,?)";
        
        PreparedStatement ps = konekcija.prepareStatement(upit);
        ps.setInt(1, vest.getIzdanje().getIzdanjeID());
        ps.setInt(2,vest.getRB());
        ps.setString(3, vest.getNaslov());
        ps.setString(4, vest.getTekst());
        
        ps.executeUpdate();
        ps.close();
    }

    public int vratiIDizdanja() throws SQLException {
        String upit = "SELECT MAX(IzdanjeID) FROM izdanje";
        int id = 0;
        Statement s = konekcija.createStatement();
        ResultSet rs = s.executeQuery(upit);
        while(rs.next()){
            id = rs.getInt(1);
        }
        
        s.close();
        return ++id;
    }

    public ArrayList<Vest> vratiVest() {
        String upit = "SELECT * FROM vest v JOIN izdanje i ON v.IzdanjeID = i.IzdanjeID JOIN publikacija p ON i.PublikacijaID=p.PublikacijaID";
        ArrayList<Vest> lista = new ArrayList<>();
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                Publikacija p = new Publikacija(rs.getInt("p.PublikacijaID"), rs.getString("Naziv"));
                
                Izdanje i = new Izdanje(rs.getInt(1), new Date(rs.getDate(6).getTime()), rs.getInt("Broj"), p);
                Vest v = new Vest(i, rs.getInt("RB"), rs.getString("Naslov"), rs.getString("Vest"));
                lista.add(v);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lista;
    }

    public ArrayList<Vest> vratiVestSaFilterom(String deoNaslova) {
        String upit = "SELECT * FROM vest v JOIN izdanje i ON v.IzdanjeID = i.IzdanjeID JOIN publikacija p ON i.PublikacijaID=p.PublikacijaID WHERE v.Naslov LIKE '%"+deoNaslova+"%' OR v.Vest LIKE '%"+deoNaslova+"%'";
        ArrayList<Vest> lista = new ArrayList<>();
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                Publikacija p = new Publikacija(rs.getInt("p.PublikacijaID"), rs.getString("Naziv"));
                
                Izdanje i = new Izdanje(rs.getInt(1), new Date(rs.getDate(6).getTime()), rs.getInt("Broj"), p);
                Vest v = new Vest(i, rs.getInt("RB"), rs.getString("Naslov"), rs.getString("Vest"));
                lista.add(v);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lista;
    }
}
