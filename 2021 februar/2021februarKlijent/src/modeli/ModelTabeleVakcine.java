/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.StavkaPrijave;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Gogic
 */
public class ModelTabeleVakcine extends AbstractTableModel{
    ArrayList<StavkaPrijave> listaStavki = new ArrayList<>();
    String [] columnNames = {"RB","Tip vakcine"};
    
    
    
    @Override
    public int getRowCount() {
        return listaStavki.size();
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
        StavkaPrijave sp = listaStavki.get(rowIndex);
        switch(columnIndex){
            case 0: return sp.getRB();
            case 1: return sp.getTipVakcine();
            
            
            default: return null;
        }
    }
    
    public void dodajUTabelu(StavkaPrijave sp){
        int rb = 0;
        for (StavkaPrijave stavkaPrijave : listaStavki) {
            if(stavkaPrijave.getRB() > rb){
                rb = stavkaPrijave.getRB();
            }
        }
        rb++;
        sp.setRB(rb);
        listaStavki.add(sp);
        fireTableDataChanged();
    }
    
    public void obrisiIzTabele(int indeks){
        listaStavki.remove(indeks);
        fireTableDataChanged();
    }
    
    public void resetujTabelu(){
        listaStavki = new ArrayList<>();
        fireTableDataChanged();
    }

    public void setListaStavki(ArrayList<StavkaPrijave> listaStavki) {
        this.listaStavki = listaStavki;
            fireTableDataChanged();
    }

    public ArrayList<StavkaPrijave> getListaStavki() {
        return listaStavki;
    }
    
    
}
