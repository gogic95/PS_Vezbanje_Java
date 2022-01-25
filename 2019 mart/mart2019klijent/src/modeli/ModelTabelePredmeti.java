/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.Predmet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Gogic
 */
public class ModelTabelePredmeti extends AbstractTableModel{

    ArrayList <Predmet> listaPredmeta;

    String [] columnNames = {"Advokat", "Klijent", "Datum", "Naziv predmeta"};
    SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
    
    public ModelTabelePredmeti() {
        listaPredmeta = new ArrayList<>();
    }
      
    @Override
    public int getRowCount() {
        return listaPredmeta.size();
    }

    @Override
    public int getColumnCount() {
        return columnNames.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        Predmet p = listaPredmeta.get(rowIndex);
        switch(columnIndex){
            case 0:
                return p.getAdvokat();
            case 1:
                return p.getKlijent();
            case 2:
                return sdf.format(p.getDatum());
            case 3:
                return p.getNaziv();
                
            default: return null;
        }
    }

    @Override
    public String getColumnName(int column) {
        return columnNames[column];
    }
    
    
    public void dodajUTabelu(Predmet p){
        listaPredmeta.add(p);
        fireTableDataChanged();
    }
    
    public void obrisiIzTabele(int indeks){
        listaPredmeta.remove(indeks);
        fireTableDataChanged();
    }

    public ArrayList<Predmet> getListaPredmeta() {
        return listaPredmeta;
    }

    public void ocistiTabelu() {
        listaPredmeta = new ArrayList<>();
        fireTableDataChanged();
    }
    
    
    
}
