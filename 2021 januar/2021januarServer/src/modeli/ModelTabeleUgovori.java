/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.Ugovor;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Gogic
 */
public class ModelTabeleUgovori extends AbstractTableModel{
    ArrayList<Ugovor> listaUgovora = new ArrayList<>();
    String [] columnNames = {"Pretplatnik","Paket","Vrsta ugovora", "Dodatne usluge", "Datum evidentiranja","Cena"};
   
    
    @Override
    public int getRowCount() {
        return listaUgovora.size();
    }

    @Override
    public int getColumnCount() {
        return columnNames.length;
    }

    

    @Override
    public String getColumnName(int column) {
        return columnNames[column];
    }
    
    
    
    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        Ugovor u = listaUgovora.get(rowIndex);
        switch(columnIndex){
            case 0: return u.getPretplatnik();
            case 1: return u.getPaket().getNaziv();
            case 2: return u.getVrstaUgovora();
            case 3: return u.isDodatneUsluge();
            case 4: 
                SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
                return sdf.format(u.getDatumEvidentiranja());
            case 5: return u.getCena();
            
            default: return null;
            
        }
    }
    
    @Override
    public Class<?> getColumnClass(int columnIndex) {
        return getValueAt(0, columnIndex).getClass();
    }

    public ArrayList<Ugovor> getListaUgovora() {
        return listaUgovora;
    }

    public void setListaUgovora(ArrayList<Ugovor> listaUgovora) {
        this.listaUgovora = listaUgovora;
        fireTableDataChanged();
    }
    
    public void dodajUTabelu(Ugovor u ){
        listaUgovora.add(u);
        fireTableDataChanged();
    }
    
    public void obrisiIzTabele(int indeks){
        listaUgovora.remove(indeks);
        fireTableDataChanged();
    }
    
    public void resetujTabelu(){
        listaUgovora = new ArrayList<>();
        fireTableDataChanged();
    }
    
}
