/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import domen.Intervju;
import domen.Kandidat;
import domen.Regruter;
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
            konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/prosoftfeb20","root","root");
            konekcija.setAutoCommit(false);
            System.out.println("Otvorio konekciju sa bazom");
        } catch (SQLException ex) {
            System.out.println("NIJE Otvorio konekciju sa bazom");
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

    public ArrayList<Regruter> vratiListuRegrutera() {
        ArrayList<Regruter> listaReg = new ArrayList<>();
        String upit = "SELECT * FROM regruter";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Regruter reg = new Regruter(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4));
                listaReg.add(reg);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaReg;
    }

    public ArrayList<Kandidat> vratiKandidate() {
        ArrayList<Kandidat> listaKan = new ArrayList<>();
        String upit = "SELECT * FROM kandidat";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Kandidat kan = new Kandidat(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                listaKan.add(kan);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaKan;
    }

    public void sacuvajIntervju(Intervju intervju) throws SQLException {
        String upit = "INSERT INTO intervju(Datum,Opis,BrojPoenaTest,VozackaDozvola,PrethodnoIskustvo,KandidatID,RegruterID) VALUES (?,?,?,?,?,?,?)";
        
        PreparedStatement ps = konekcija.prepareStatement(upit);
        ps.setDate(1, new Date(intervju.getDatum().getTime()));
        ps.setString(2, intervju.getOpis());
        ps.setDouble(3, intervju.getBrojPoenaTest());
        ps.setString(4, intervju.getVozacka());
        ps.setBoolean(5, intervju.isPrethodnoIskustvo());
        ps.setInt(6, intervju.getKandidat().getKandidatID());
        ps.setInt(7, intervju.getRegruter().getRegruterID());
        
        ps.executeUpdate();
        
        ps.close();
        
    }

    public ArrayList<Kandidat> vratiKandidateIzIntervjua(int id) {
        ArrayList<Kandidat> listaKan1 = new ArrayList<>();
        String upit = "SELECT * FROM intervju i JOIN kandidat k ON i.KandidatID = k.KandidatID WHERE i.RegruterID ="+id;
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Kandidat kan = new Kandidat(rs.getInt("k.KandidatID"), rs.getString("k.ImePrezime"), rs.getString("k.StrucnaSprema"), rs.getString("k.Zanimanje"));
                listaKan1.add(kan);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaKan1;
    }

    public ArrayList<Kandidat> vratiKandidateIzIntervjua(int id, Date datum1, Date datum2) {
        ArrayList<Kandidat> listaKan1 = new ArrayList<>();
        String upit = "SELECT * FROM intervju i JOIN kandidat k ON i.KandidatID = k.KandidatID WHERE i.RegruterID ="+id+" AND i.Datum >'"+datum2+"' AND i.Datum < '"+datum1+"'";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Kandidat kan = new Kandidat(rs.getInt("k.KandidatID"), rs.getString("k.ImePrezime"), rs.getString("k.StrucnaSprema"), rs.getString("k.Zanimanje"));
                listaKan1.add(kan);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaKan1;
    }
}
