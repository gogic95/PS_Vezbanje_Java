/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import domen.Gazdinstvo;
import domen.Poljoprivrednik;
import domen.Stado;
import domen.Zivotinja;
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
            konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/prosoftjul19","root","root");
            konekcija.setAutoCommit(false);
        } catch (SQLException ex) {
            System.out.println("Nije povezan sa bazom");
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

    public ArrayList<Poljoprivrednik> vratiSvePoljoprivrednike() {
        String upit = "SELECT * FROM poljoprivrednik";
        ArrayList<Poljoprivrednik> listap = new ArrayList<>();
        
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Poljoprivrednik p = new Poljoprivrednik(rs.getInt("PoljoprivrednikID"), rs.getString("Ime"), rs.getString("Prezime"), rs.getString("KorisnickoIme"), rs.getString("Lozinka"));
                listap.add(p);
            }
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listap;
    }

    public int vratiID() {
        int id = 0;
        String upit = "SELECT max(GazdinstvoID) as max FROM gazdinstvo";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                id = rs.getInt("max");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ++id;
    }

    public boolean napraviGazdinstvo(Gazdinstvo g) {
        boolean signal = false;
        String upit = "INSERT INTO gazdinstvo(GazdinstvoID) VALUES(?)";
        int id = g.getGazdinstvoID();
        
        try {
            PreparedStatement ps = konekcija.prepareStatement(upit);
            ps.setInt(1, id);
            ps.executeUpdate();
            signal = true;
            commit();
            ps.close();
        } catch (SQLException ex) {
            rollback();
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return signal;
    }

    public ArrayList<Zivotinja> vratiSveZivotinje() {
        String upit = "SELECT * FROM zivotinja";
        ArrayList<Zivotinja> listaz = new ArrayList<>();
        
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Zivotinja z = new Zivotinja(rs.getInt("ZivotinjaID"), rs.getString("Naziv"), rs.getBoolean("AutohtonaVrsta"), rs.getDouble("SubvencijaPoGrlu"));
                listaz.add(z);
            }
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listaz;
    }

    public boolean updateGazdinstvo(Gazdinstvo gaz) {
        boolean signal1 = false;
        int gazID = gaz.getGazdinstvoID();
        String naziv = gaz.getNaziv();
        Date sqlDatume = new Date(gaz.getDatumRegistracije().getTime());
        double ukupnoSubvencija = gaz.getUkupnoSubvencija();
        int poljID = gaz.getPoljoprivrednik().getPoljoprivrednikID();
        String upit = "UPDATE gazdinstvo SET Naziv = ?, DatumRegistracije = ?, UkupnoSubvencija = ?, PoljoprivrednikID = ? WHERE GazdinstvoID = "+gazID;
        
        try {
            PreparedStatement ps = konekcija.prepareStatement(upit);
            ps.setString(1, naziv);
            ps.setDate(2, sqlDatume);
            ps.setDouble(3, ukupnoSubvencija);
            ps.setInt(4, poljID);
            ps.executeUpdate();
            
            ps.close();
            signal1= true;
            commit();
        } catch (SQLException ex) {
            rollback();
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return signal1;
    }

    public void sacuvajStado(Stado stado) throws SQLException {
        String upit = "INSERT INTO stado VALUES(?,?,?,?,?)";

            PreparedStatement ps = konekcija.prepareStatement(upit);
            ps.setInt(1, stado.getGazdinstvo().getGazdinstvoID());
            ps.setInt(2, stado.getStadoID());
            ps.setInt(3, stado.getBrojGrla());
            ps.setDouble(4, stado.getIznosSubvencije());
            ps.setInt(5, stado.getZivotinja().getZivotinjaID());
            ps.executeUpdate();
          
            
            ps.close();
       
    }

    public ArrayList<Gazdinstvo> vratiSvaGazdinstva() {
        String upit = "SELECT * FROM gazdinstvo";
        ArrayList<Gazdinstvo> listaG = new ArrayList<>();
        
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Gazdinstvo g = new Gazdinstvo(rs.getInt("GazdinstvoID"), rs.getString("Naziv"), new java.util.Date(rs.getDate("DatumRegistracije").getTime()), rs.getDouble("UkupnoSubvencija"),null);
                listaG.add(g);
            }
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listaG;
    }

    public ArrayList<Stado> vratiListuStada(int gazID) {
        String upit = "SELECT * FROM stado s JOIN zivotinja z ON s.ZivotinjaID=z.ZivotinjaID WHERE s.GazdinstvoID="+gazID;
        ArrayList<Stado> listaS = new ArrayList<>();
        
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Zivotinja ziv = new Zivotinja(rs.getInt("ZivotinjaID"), rs.getString("Naziv"), true, 0);
                Stado stad = new Stado(null, rs.getInt("StadoID"), rs.getInt("BrojGrla"), 0, ziv);
                listaS.add(stad);
            }
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listaS;
    }
}
