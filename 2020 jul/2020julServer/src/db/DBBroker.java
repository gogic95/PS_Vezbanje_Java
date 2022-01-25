/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import domen.Meteorolog;
import domen.Prognoza;
import domen.PrognozaRegion;
import domen.Region;
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
            konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/prosoftjul20", "root", "root");
            konekcija.setAutoCommit(false);
            System.out.println("Povezan na bazu");
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

    public ArrayList<Meteorolog> vratiMeteorologe() {
        ArrayList<Meteorolog> lista = new ArrayList<>();
        String upit = "SELECT * FROM meteorolog";
        
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                Meteorolog m = new Meteorolog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                lista.add(m);
            }
            
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lista;
    }

    public ArrayList<Region> vratiRegione() {
        ArrayList<Region> lista = new ArrayList<>();
        String upit = "SELECT * FROM region";
        
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                Region r = new Region(rs.getInt(1), rs.getString(2), rs.getString(3));
                lista.add(r);
            }
            
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lista;
    }

    public int vratiIDPrognoze() throws SQLException {
        int id = 0;
        String upit = "SELECT MAX(PrognozaID) FROM prognoza";
       
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                id = rs.getInt(1);
            }
            
            s.close();
       
        
        
        return ++id;
    }

    public void sacuvajPrognozu(Prognoza p) throws SQLException {
        String upit = "INSERT INTO prognoza VALUES(?,?,?,?)";
        
        PreparedStatement ps = konekcija.prepareStatement(upit);
        ps.setInt(1, p.getPrognozaID());
        ps.setDate(2, new Date(p.getDan().getTime()));
        ps.setString(3, p.getOpis());
        ps.setInt(4, p.getMeteorolog().getMeteorologID());
        
        ps.executeUpdate();
        
        ps.close();
    }

    public void sacuvajPrognozZaRegion(PrognozaRegion pr) throws SQLException {
        String upit = "INSERT INTO prognozaregion VALUES(?,?,?,?,?,?)";
        
        PreparedStatement ps = konekcija.prepareStatement(upit);
        ps.setInt(1, pr.getPrognoza().getPrognozaID());
        ps.setInt(2, pr.getRB());
        ps.setDouble(3, pr.getTemperatura());
        ps.setString(4, pr.getMeteoAlarm());
        ps.setString(5, pr.getPojava());
        ps.setInt(6, pr.getRegion().getRegionID());
        
        ps.executeUpdate();
        
        ps.close();
    }

    public ArrayList<Prognoza> vratiPrognoze() {
         ArrayList<Prognoza> lista = new ArrayList<>();
        String upit = "SELECT * FROM prognoza p JOIN meteorolog m ON p.MeteorologID = m.MeteorologID";
        
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                Meteorolog m = new Meteorolog(1, rs.getString("m.Ime"), rs.getString("m.Prezime"), "", "");
                Prognoza p = new Prognoza(rs.getInt("p.PrognozaID"), new java.util.Date(rs.getDate("p.Dan").getTime()), "", m);
                lista.add(p);
            }
            
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lista;
    }

    public ArrayList<PrognozaRegion> vratiPrognozeRegionID(int id) {
        ArrayList<PrognozaRegion> lista = new ArrayList<>();
        String upit = "SELECT * FROM prognozaregion pr JOIN prognoza p ON pr.PrognozaID = p.PrognozaID JOIN region r ON r.RegionID = pr.RegionID WHERE p.PrognozaID ="+id;
        
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                Region r = new Region (1, rs.getString("r.Naziv"), "");
                Prognoza p = new Prognoza(rs.getInt("p.PrognozaID"), new java.util.Date(rs.getDate("p.Dan").getTime()), "", null);
                PrognozaRegion pr = new PrognozaRegion(p, 1, rs.getDouble("pr.Temperatura"), rs.getString("pr.MeteoAlarm"), rs.getString("pr.Pojava"), r);
                lista.add(pr);
            }
            
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lista;
    }
}
