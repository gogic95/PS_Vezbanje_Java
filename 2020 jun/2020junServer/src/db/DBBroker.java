/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import com.mysql.cj.xdevapi.Result;
import domen.Banka;
import domen.Kompanija;
import domen.Korisnik;
import domen.Zaposleni;
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
            konekcija = DriverManager.getConnection("jdbc:mysql://localhost:3306/prosoftjun20", "root", "root");
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
                Korisnik k = new Korisnik(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                lista.add(k);
            }
            
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return lista;
    }

    public ArrayList<Banka> vratiBanke() {
        ArrayList<Banka> lista = new ArrayList<>();
        String upit = "SELECT * FROM banka";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Banka b = new Banka(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                lista.add(b);
            }
            
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return lista;
    }

    public long vratiIDKompanije() throws SQLException {
         String upit = "SELECT MAX(KompanijaID) FROM kompanija";
         long id = 0l;
         
          Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                id = rs.getLong(1);
                
            }
         return ++id;
    }

    public void sacuvajKompaniju(Kompanija komp) throws SQLException {
        String upit = "INSERT INTO kompanija VALUES(?,?,?,?,?,?,?,?)";
        PreparedStatement ps = konekcija.prepareStatement(upit);
        ps.setLong(1, komp.getKompanijaID());
        ps.setString(2, komp.getNaziv());
        ps.setString(3, komp.getTipKompanije());
        ps.setBoolean(4, komp.isPdvObveznik());
        ps.setString(5, komp.getMaticniBroj());
        ps.setTimestamp(6, new Timestamp(komp.getDatumVremeEvidentiranja().getTime()));
        ps.setInt(7, komp.getBrojZaposlenih());
        ps.setLong(8, komp.getKorisnik().getKorisnikID());
        
        ps.executeUpdate();
        ps.close();
    }

    public void sacuvajZaposlenog(Zaposleni zaposleni) throws SQLException {
        String upit = "INSERT INTO zaposleni(Ime,Prezime,JMBG,ZiroRacun,Iznos,KompanijaID,BankaID) VALUES(?,?,?,?,?,?,?)";
        PreparedStatement ps = konekcija.prepareStatement(upit);
        
        ps.setString(1, zaposleni.getIme());
        ps.setString(2, zaposleni.getPrezime());
        ps.setString(3, zaposleni.getJMBG());
        ps.setString(4, zaposleni.getZiroRacun());
        ps.setDouble(5, zaposleni.getIznos());
        ps.setLong(6, zaposleni.getKompanija().getKompanijaID());
        ps.setLong(7, zaposleni.getBanka().getBankaID());
        
        ps.executeUpdate();
        ps.close();
    }

    public long vratiIDZaposlenog() {
        String upit = "SELECT MAX(ZaposleniID) FROM zaposleni";
         long id = 0l;
         
          Statement s;
          
        try {
            s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                id = rs.getLong(1);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
            
         return id;
    }

    public boolean proveriMaticni(String maticni) {
        
            String upit = "SELECT MaticniBroj FROM kompanija WHERE MaticniBroj ='"+maticni+"'";
            boolean signal = false;
        try {    
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            if(!rs.next()) signal = true;
            
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        return signal;
    }

    public boolean proveriZiro(String ziroRacun) {
        
            String upit = "SELECT ZiroRacun FROM zaposleni WHERE ZiroRacun ='"+ziroRacun+"'";
            boolean signal = false;
        try {    
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            if(!rs.next()) signal = true;
            
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        return signal;
    }

    public boolean proveriJMBG(String JMBG) {
          String upit = "SELECT JMBG FROM zaposleni WHERE JMBG ='"+JMBG+"'";
            boolean signal = false;
        try {    
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            if(!rs.next()) signal = true;
            
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        return signal;
    }

    public ArrayList<Zaposleni> vratiZaposlene() {
        ArrayList<Zaposleni> lista = new ArrayList<>();
        String upit = "SELECT * FROM zaposleni z JOIN banka b ON z.BankaID = b.BankaID JOIN kompanija k ON k.KompanijaID = z.KompanijaID";
        try {
            Statement s = konekcija.createStatement();
            ResultSet rs = s.executeQuery(upit);
            while(rs.next()){
                Banka b = new Banka(rs.getLong("b.BankaID"), rs.getString("b.Naziv"), null, 0);
                Kompanija k = new Kompanija(rs.getLong("k.KompanijaID"), rs.getString("k.Naziv"), rs.getString("k.TipKompanije"), true, "", null, 0, null);
                Zaposleni z = new Zaposleni(rs.getLong("z.ZaposleniID"), rs.getString("z.Ime"), rs.getString("z.Prezime"), rs.getString("z.JMBG"), rs.getString("z.ZiroRacun"), rs.getDouble("z.Iznos"), k, b);
                lista.add(z);
            }
            
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBBroker.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return lista;
    }
}
