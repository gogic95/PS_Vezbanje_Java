/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.PredajePredmet;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Gogic
 */
public class ModelTabeleAngazman extends AbstractTableModel{
    ArrayList<PredajePredmet> lista = new ArrayList<>();
    String [] columnNames = {"Predmet", "Nastavnik","Studijski program","Semestar"};
    
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
        PredajePredmet pp = lista.get(rowIndex);
        switch(columnIndex){
            case 0: return pp.getPredmet().getNaziv();
            case 1: return pp.getNastavnik();
            case 2: return pp.getStudijskiProgram();
            case 3: return pp.getSemestar();
            
            default: return null;
        }
    }

    public ArrayList<PredajePredmet> getLista() {
        return lista;
    }

    public void setLista(ArrayList<PredajePredmet> lista) {
        this.lista = lista;
        fireTableDataChanged();
    }
    
    public void obrisiIzTabele(int indeks){
        lista.remove(indeks);
        fireTableDataChanged();
    }
    
    public void dodajUTabelu(PredajePredmet pp){
        lista.add(pp);
        fireTableDataChanged();
    }
    
    public void resetuj(){
        lista = new ArrayList<>();
        fireTableDataChanged();
    }
}
