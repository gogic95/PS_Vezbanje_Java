/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import domen.Linija;
import domen.LinijaStanica;
import domen.Stanica;
import java.sql.Connection;
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
            konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/prosoftjun19", "root", "root");
            konekcija.setAutoCommit(false);
            System.out.println("Otvorena konekcija sa bazom");
        } catch (SQLException ex) {
            System.out.println("Greska prilikom otvaranja konekcije sa bazom");
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

    public ArrayList<Stanica> vratiSveStanice() {
        String upit = "SELECT * FROM stanica";
        ArrayList<Stanica> lista = new ArrayList<>();
        
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Stanica stanica = new Stanica(rs.getInt("StanicaID"), rs.getString("NazivStanice"));
                lista.add(stanica);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return lista;
    }

    public int vratiID() {
        String upit = "SELECT MAX(LinijaID) as max FROM linija";
        int id = 0;
        
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                id = rs.getInt("max");
            }
            System.out.println("Uzeo ID");
            s.close();
        } catch (SQLException ex) {
            System.out.println("nije uzeo ID");
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return id;
    }

    public void sacuvajLiniju(Linija linija) throws SQLException {
        
        String upit = "INSERT INTO linija VALUES(?,?,?,?)";
        System.out.println("stigao do sacuvaj liniju");
        PreparedStatement ps = konekcija.prepareStatement(upit);
        ps.setInt(1, linija.getLinijaID());
        ps.setString(2, linija.getNazivLinije());
        ps.setInt(3, linija.getPocetnaStanica().getStanicaID());
        ps.setInt(4, linija.getKrajnjaStanica().getStanicaID());
        ps.executeUpdate();
        
        ps.close();
        
        ArrayList<LinijaStanica> lista = linija.getListaMedjustanica();
        for (LinijaStanica linijaStanica : lista) {
            sacuvajMedjustanicu(linijaStanica);
        }
        
        
    }
    
    public void sacuvajMedjustanicu(LinijaStanica medjustanica) throws SQLException{
        String upit = "INSERT INTO linijastanica VALUES(?,?)";
        
        PreparedStatement ps = konekcija.prepareStatement(upit);
        ps.setInt(1, medjustanica.getLinija().getLinijaID());
        ps.setInt(2, medjustanica.getStanica().getStanicaID());
        
        ps.executeUpdate();
        ps.close();
    }

    public ArrayList<Linija> vratiSveLinije() {
        String upit = "SELECT * FROM linija l JOIN stanica s ON l.PocetnaStanica = s.StanicaID JOIN stanica d ON l.KrajnjaStanica = d.StanicaID";
        ArrayList<Linija> lista = new ArrayList<>();
        
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Stanica pocetna = new Stanica(rs.getInt("PocetnaStanica"), rs.getString(6));
                Stanica krajnja = new Stanica(rs.getInt("KrajnjaStanica"), rs.getString(8));
                Linija linija = new Linija(rs.getInt("LinijaID"), rs.getString("NazivLinije"), pocetna, krajnja, null);
                ArrayList<LinijaStanica> listaS = vratiMedjustanice(linija);
                linija.setListaMedjustanica(listaS);
                lista.add(linija);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return lista;
    }

    private ArrayList<LinijaStanica> vratiMedjustanice(Linija linija) {
        int id = linija.getLinijaID();
        ArrayList<LinijaStanica> lista = new ArrayList<>();
        String upit = "SELECT * FROM linijastanica l  JOIN stanica s ON l.StanicaID = s.StanicaID WHERE LinijaID ="+id;
        
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                LinijaStanica ls = new LinijaStanica(linija, new Stanica(rs.getInt("StanicaID"), rs.getString("NazivStanice")));
                lista.add(ls);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lista;
    }

    public ArrayList<Linija> vratiSveLinije(String filter) {
        String upit = "SELECT * \n" +
"FROM linija l \n" +
"JOIN stanica s ON l.PocetnaStanica = s.StanicaID \n" +
"JOIN stanica d ON l.KrajnjaStanica = d.StanicaID \n" +
"JOIN linijastanica ls ON l.LinijaID=ls.LinijaID \n" +
"JOIN stanica k ON k.StanicaID=ls.StanicaID\n" +
"WHERE s.NazivStanice LIKE '%"+filter+"%' \n" +
"OR d.NazivStanice LIKE '%"+filter+"%' \n" +
"OR k.NazivStanice LIKE '%"+filter+"%'";
        ArrayList<Linija> lista = new ArrayList<>();
        
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Stanica pocetna = new Stanica(rs.getInt("PocetnaStanica"), rs.getString(6));
                Stanica krajnja = new Stanica(rs.getInt("KrajnjaStanica"), rs.getString(8));
                Linija linija = new Linija(rs.getInt("LinijaID"), rs.getString("NazivLinije"), pocetna, krajnja, null);
                ArrayList<LinijaStanica> listaS = vratiMedjustanice(linija);
                if(!lista.contains(linija)){
                linija.setListaMedjustanica(listaS);
                lista.add(linija);
                }
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return lista;
    }
}
