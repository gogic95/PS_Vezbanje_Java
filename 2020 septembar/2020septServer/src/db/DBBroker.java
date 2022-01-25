/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import domen.Laborant;
import domen.Laboratorija;
import domen.OsiguranoLice;
import domen.Zahtev;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
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
            konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/prosoftsept2020", "root", "root");
            konekcija.setAutoCommit(false);
            System.out.println("Otvorena konekcija sa bazom");
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

    public ArrayList<Laborant> vratiLaborante() {
        ArrayList<Laborant> lista = new  ArrayList<>();
        String upit = "SELECT * FROM laborant lab JOIN laboratorija lb ON lab.LaboratorijaID = lb.LaboratorijaID";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Laboratorija lab = new Laboratorija(rs.getInt(7), rs.getString(8), rs.getInt(9), rs.getString(10));
                Laborant l = new Laborant(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), lab);
                lista.add(l);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return lista;
    }

    public ArrayList<Zahtev> vratiZahteve() {
        ArrayList<Zahtev> lista = new  ArrayList<>();
        String upit = "SELECT * FROM zahtev z JOIN laboratorija lb ON z.LaboratorijaID = lb.LaboratorijaID JOIN osiguranolice ol ON z.OsiguranoLiceID = ol.OsiguranoLiceID WHERE z.Status='Neobradjen'";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Laboratorija lab = new Laboratorija(rs.getInt("lb.LaboratorijaID"), rs.getString("lb.Naziv"), rs.getInt("lb.DnevniKapacitetTestova"), rs.getString("lb.Grad"));
                OsiguranoLice ol = new OsiguranoLice(rs.getInt("ol.OsiguranoLiceID"), rs.getString("ol.Ime"), rs.getString("ol.Prezime"), rs.getString("ol.LBO"), rs.getString("ol.KrvnaGrupa"));
                Zahtev z = new Zahtev(rs.getInt(1), new Date(rs.getTimestamp(2).getTime()), rs.getBoolean(3), "", "", null, "", rs.getString("z.Status"), ol, lab, null);
                lista.add(z);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return lista;
    }

    public void sacuvajZahtev(Zahtev zahtev) throws SQLException {
        String upit = "UPDATE zahtev SET Tip=?,Rezultat = ?, DatumVremeRezultata =?, Napomena = ?, Status = ?, LaborantID = ? WHERE ZahtevID="+zahtev.getZahtevID();
        
        PreparedStatement ps = konekcija.prepareStatement(upit);
        ps.setString(1, zahtev.getTip());
        ps.setString(2, zahtev.getRezultat());
        ps.setTimestamp(3, new Timestamp(zahtev.getDatumVremeRezultata().getTime()));
        ps.setString(4, zahtev.getNapomena());
        ps.setString(5, zahtev.getStatus());
        ps.setInt(6, zahtev.getLaborant().getLaborantID());
        
        ps.executeUpdate();
        ps.close();
    }

    public ArrayList<Zahtev> vratiZahteveObradjene() {
        ArrayList<Zahtev> lista = new  ArrayList<>();
        String upit = "SELECT * FROM zahtev z JOIN laboratorija lb ON z.LaboratorijaID = lb.LaboratorijaID JOIN osiguranolice ol ON z.OsiguranoLiceID = ol.OsiguranoLiceID WHERE z.Status='Obradjen'";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Laboratorija lab = new Laboratorija(rs.getInt("lb.LaboratorijaID"), rs.getString("lb.Naziv"), rs.getInt("lb.DnevniKapacitetTestova"), rs.getString("lb.Grad"));
                OsiguranoLice ol = new OsiguranoLice(rs.getInt("ol.OsiguranoLiceID"), rs.getString("ol.Ime"), rs.getString("ol.Prezime"), rs.getString("ol.LBO"), rs.getString("ol.KrvnaGrupa"));
                Zahtev z = new Zahtev(rs.getInt(1), new Date(rs.getTimestamp(2).getTime()), rs.getBoolean(3), rs.getString("Tip"), rs.getString("Rezultat"),null, "", rs.getString("z.Status"), ol, lab, null);
                lista.add(z);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return lista;
    }

    public ArrayList<Laboratorija> vratiLaboratorija() {
        ArrayList<Laboratorija> lista = new  ArrayList<>();
        String upit = "SELECT * FROM laboratorija";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Laboratorija l = new Laboratorija(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4));
                
                lista.add(l);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return lista;
    }
}
