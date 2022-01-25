/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.Prijava;
import domen.StavkaPrijave;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Gogic
 */
public class ModelTabelePrijave extends AbstractTableModel{
    ArrayList<Prijava> lista = new ArrayList<>();
    String [] columnNames = {"Ime i prezime","JMBG","Drzavljanstvo","Opstina","Email","Mobilni","Specificna oboljenja"};
    
    
    
    @Override
    public int getRowCount() {
        return lista.size();
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
        Prijava p = lista.get(rowIndex);
        switch(columnIndex){
            case 0: return p.getIme()+" "+p.getPrezime();
            case 1: return p.getJMBG();
            case 2: return p.getDrzavljanstvo();
            case 3: return p.getOpstina().getNaziv();
            case 4: return p.getEmail();
            case 5: return p.getMobilniTelefon();
            case 6: return p.isSpecificnaOboljenja();
            
            
            default: return null;
        }
    }
    
  @Override
    public Class<?> getColumnClass(int columnIndex) {
        if(lista.isEmpty()){
            return Object.class;
        }
        return getValueAt(0, columnIndex).getClass();
    }
    
    public void obrisiIzTabele(int indeks){
        lista.remove(indeks);
        fireTableDataChanged();
    }
    
    public void resetujTabelu(){
        lista = new ArrayList<>();
        fireTableDataChanged();
    }

    public ArrayList<Prijava> getLista() {
        return lista;
    }

    public void setLista(ArrayList<Prijava> lista) {
        this.lista = lista;
        fireTableDataChanged();
    }

    
}
