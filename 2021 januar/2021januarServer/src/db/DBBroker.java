/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import domen.Paket;
import domen.Pretplatnik;
import domen.Ugovor;
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
            konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/prosoftjan21", "root" , "root");
            System.out.println("povezan na bazu");
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

    public ArrayList<Paket> vratiPakete() {
        String upit = "SELECT * FROM paket";
        ArrayList<Paket> lista = new ArrayList<>();
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                Paket p = new Paket(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getBoolean(5));
                lista.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return lista;
    }

    public ArrayList<Pretplatnik> vratiPretplatnike() {
        String upit = "SELECT * FROM pretplatnik";
        ArrayList<Pretplatnik> lista = new ArrayList<>();
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                Pretplatnik p = new Pretplatnik(rs.getLong(1), rs.getString(2), rs.getString(3));
                lista.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return lista;
    }

    public void sacuvajUgovor(Ugovor u) throws SQLException {
        String upit = "INSERT INTO ugovor(DatumEvidentiranja,VrstaUgovora,DodatneUsluge,Cena,PaketID,PretplatnikID) VALUES (?,?,?,?,?,?)";
        
        PreparedStatement ps = konekcija.prepareStatement(upit);
        ps.setDate(1, new Date(u.getDatumEvidentiranja().getTime()));
        ps.setString(2, u.getVrstaUgovora());
        ps.setBoolean(3, u.isDodatneUsluge());
        ps.setDouble(4, u.getCena());
        ps.setLong(5, u.getPaket().getPaketID());
        ps.setLong(6, u.getPretplatnik().getPretplatnikID());
        
        
        
        ps.executeUpdate();
        ps.close();
    }

    public ArrayList<Ugovor> vratiUgovore() {
        String upit = "SELECT * FROM ugovor u JOIN pretplatnik p ON u.PretplatnikID=p.PretplatnikID JOIN paket pa ON u.PaketID=pa.PaketID";
        ArrayList<Ugovor> lista = new ArrayList<>();
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                Pretplatnik p = new Pretplatnik(rs.getLong(8), rs.getString(9), rs.getString(10));
                Paket pa = new Paket(rs.getLong(11), rs.getString(12), rs.getString(13), rs.getDouble(14), rs.getBoolean(15));
                Ugovor u = new Ugovor(rs.getLong(1), rs.getDate(2), rs.getString(3), rs.getBoolean(4), rs.getDouble(5), pa, p);
                lista.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return lista;
    }

    public void obrisiUgovor(Ugovor u) throws SQLException {
        String upit = "DELETE FROM ugovor WHERE UgovorID="+u.getUgovorID();
        
        PreparedStatement ps = konekcija.prepareStatement(upit);
        ps.executeUpdate();
        ps.close();
    }
}
