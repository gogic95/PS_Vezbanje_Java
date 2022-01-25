/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.Intervju;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Gogic
 */
public class ModelTabeleIntervju extends AbstractTableModel{
    ArrayList<Intervju> listaI = new ArrayList<>();
    
    String [] columnNames = {"Kandidat", "Datum","Broj poena","Vozacka dozvola","Prethodno iskustvo"};
    
    
    @Override
    public int getRowCount() {
        return  listaI.size();
    }

    @Override
    public int getColumnCount() {
        return  columnNames.length;
    }

    @Override
    public String getColumnName(int column) {
        return columnNames[column];
    }
    
    

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        Intervju i = listaI.get(rowIndex);
        
        switch(columnIndex){
            case 0: return i.getKandidat();
            case 1: return i.getDatum();
            case 2: return i.getBrojPoenaTest();
            case 3: return i.getVozacka();
            case 4: return i.isPrethodnoIskustvo();
            default: return null;
        }
    }

    @Override
    public Class<?> getColumnClass(int columnIndex) {
        return getValueAt(0, columnIndex).getClass();
    }

    public void setListaI(ArrayList<Intervju> listaI) {
        this.listaI = listaI;
        fireTableDataChanged();
    }

    public ArrayList<Intervju> getListaI() {
        return listaI;
    }
    
   
    public void dodajUListu(Intervju i){
        listaI.add(i);
        fireTableDataChanged();
    }
    
    public void obrisiIzListe(int indeks){
        listaI.remove(indeks);
        fireTableDataChanged();
    }
    
    public void resetuj(){
        listaI = new ArrayList<>();
        fireTableDataChanged();
    }
    
}
