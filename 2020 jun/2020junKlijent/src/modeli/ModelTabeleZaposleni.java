/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.Zaposleni;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Gogic
 */
public class ModelTabeleZaposleni extends AbstractTableModel{
    ArrayList<Zaposleni> listaZap = new ArrayList<>();
    String [] columnNames = {"Ime","Prezime","JMBG","Banka","Ziro-racun"};
    
    @Override
    public int getRowCount() {
        return listaZap.size();
    }

    @Override
    public String getColumnName(int column) {
        return columnNames[column];
    }

    
    
    @Override
    public int getColumnCount() {
        return columnNames.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        Zaposleni z = listaZap.get(rowIndex);
        switch(columnIndex){
            case 0: return z.getIme();
            case 1: return z.getPrezime();
            case 2: return z.getJMBG();
            case 3: return z.getBanka().getNaziv();
            case 4: return z.getZiroRacun();
            default: return null;
        }
    }
    
    public void dodajUTabelu(Zaposleni z){
        
        listaZap.add(z);
        fireTableDataChanged();
    }
    public void obrisiIzTabele(int i){
        listaZap.remove(i);
        fireTableDataChanged();
    }

    public ArrayList<Zaposleni> getListaZap() {
        return listaZap;
    }

    public void setListaZap(ArrayList<Zaposleni> listaZap) {
        this.listaZap = listaZap;
    }
    
    public void resetuj(){
        listaZap = new ArrayList<>();
        fireTableDataChanged();
    }
}
