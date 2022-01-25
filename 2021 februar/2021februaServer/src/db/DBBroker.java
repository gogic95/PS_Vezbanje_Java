/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import domen.Opstina;
import domen.Prijava;
import domen.StavkaPrijave;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
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
            konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/prosoftfeb21", "root", "root");
            konekcija.setAutoCommit(false);
            System.out.println("Otvorena baza");
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

    public ArrayList<Opstina> vratiOpstine() {
        String upit = "SELECT * FROM opstina";
        ArrayList<Opstina> lista = new ArrayList<>();
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Opstina o = new Opstina(rs.getLong(1), rs.getInt(2), rs.getString(3));
                lista.add(o);
                
            }
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lista;
    }

    public Long sacuvajPrijavu(Prijava p) throws SQLException {
        String upit = "INSERT INTO prijava (Drzavljanstvo,JMBG,Ime,Prezime,ElektronskaPosta,MobilniTelefon,SpecificnaOboljenja,DatumPrijave,OpstinaID) VALUES (?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = konekcija.prepareStatement(upit, Statement.RETURN_GENERATED_KEYS);
        
        ps.setString(1, p.getDrzavljanstvo());
        ps.setString(2, p.getJMBG());
        ps.setString(3, p.getIme());
        ps.setString(4, p.getPrezime());
        ps.setString(5, p.getEmail());
        ps.setString(6, p.getMobilniTelefon());
        ps.setBoolean(7, p.isSpecificnaOboljenja());
        ps.setTimestamp(8, new Timestamp(p.getDatumPrijave().getTime()));
        ps.setLong(9, p.getOpstina().getOpstinaID());
        
        ps.executeUpdate();
        Long id = 0l;
        ResultSet rs = ps.getGeneratedKeys();
        while (rs.next()){
            id = rs.getLong(1);
        }
        ps.close();
        return id;
    }

    public void sacuvajStavkuPrijave(StavkaPrijave sp) throws SQLException {
        String upit = "INSERT INTO stavkaprijave VALUES (?,?,?)";
        PreparedStatement ps = konekcija.prepareStatement(upit);
        
        ps.setLong(1, sp.getPrijava().getPrijavaID());
        ps.setInt(2, sp.getRB());
        ps.setString(3, sp.getTipVakcine());
       
        
        ps.executeUpdate();
        ps.close();
    }

    public ArrayList<Prijava> vratiPrijave() {
        ArrayList<Prijava> lista = new ArrayList<>();
         String upit = "SELECT * FROM prijava p JOIN opstina o ON p.OpstinaID = o.OpstinaID";
        
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Opstina o = new Opstina(rs.getLong(11), rs.getInt(12), rs.getString(13));
                Prijava p = new Prijava(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8), new java.util.Date(rs.getDate(9).getTime()), o);
                lista.add(p);
                
            }
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lista;
    }

    public void obrisiPrijavu(Prijava p) {
        String upit = "DELETE FROM stavkaprijave WHERE PrijavaID="+p.getPrijavaID();
        try {
            PreparedStatement ps = konekcija.prepareStatement(upit);
            ps.executeUpdate();
            ps.close();
            commit();
        } catch (SQLException ex) {
            rollback();
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
                
                
     String upit2 = "DELETE FROM prijava WHERE PrijavaID="+p.getPrijavaID();
                
           try {
            PreparedStatement ps2 = konekcija.prepareStatement(upit2);
            ps2.executeUpdate();
            ps2.close();
            commit();
        } catch (SQLException ex) {
            rollback();
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }     
                
                
    }
}
