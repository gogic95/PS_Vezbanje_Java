/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import domen.Korisnik;
import domen.Nastavnik;
import domen.PredajePredmet;
import domen.Predmet;
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
            konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/prosoftokt20","root","root");
            System.out.println("Povezan na bazu");
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

    public ArrayList<Korisnik> vratiKorisnike() {
        ArrayList<Korisnik> lista = new ArrayList<>();
        String upit = "SELECT * FROM korisnik";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                Korisnik k = new Korisnik(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                lista.add(k);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return  lista;
    }

    public ArrayList<Nastavnik> vratiNastavnike() {
        ArrayList<Nastavnik> lista = new ArrayList<>();
        String upit = "SELECT * FROM nastavnik";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                Nastavnik n = new Nastavnik(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                lista.add(n);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return  lista;
    }

    public ArrayList<Predmet> vratiPredmete() {
        ArrayList<Predmet> lista = new ArrayList<>();
        String upit = "SELECT * FROM predmet";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                Predmet p = new Predmet(rs.getInt(1), rs.getString(2), rs.getInt(3));
                lista.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return  lista;
    }

    public void sacuvajAngazman(PredajePredmet pp) throws SQLException{
        String upit = "INSERT INTO predajepredmet VALUES (?,?,?,?,?,?)";
        PreparedStatement ps = konekcija.prepareStatement(upit);
        ps.setInt(1, pp.getNastavnik().getNastavnikID());
        ps.setInt(2, pp.getPredmet().getPredmetID());
        ps.setInt(3, pp.getSemestar());
        ps.setString(4, pp.getStudijskiProgram());
        ps.setDate(5, new Date(pp.getDatumAngazovanja().getTime()));
        ps.setInt(6, pp.getKorisnik().getKorisnikID());
        
        ps.executeUpdate();
        ps.close();
    }

    public ArrayList<PredajePredmet> vratiPredajePredmete() {
        ArrayList<PredajePredmet> lista = new ArrayList<>();
        String upit = "SELECT * FROM nastavnik n JOIN  predajepredmet p ON n.NastavnikID=p.NastavnikID";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            
            while(rs.next()){
                Nastavnik n = new Nastavnik(rs.getInt("n.NastavnikID"), rs.getString("n.Ime"), rs.getString("n.Prezime"), rs.getString("n.Zvanje"));
                PredajePredmet pp = new PredajePredmet(n, null, rs.getInt("p.Semestar"), rs.getString("p.StudijskiProgram"), null, null);
                lista.add(pp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return  lista;
    }
}
