/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mtv;

import domen.Vest;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Gogic
 */
public class ModelTabeleVesti extends AbstractTableModel{
    ArrayList<Vest> listaVesti = new ArrayList<>();
    String [] columnNames = {"Publikacija","RB","Naslov","Tekst"};

    @Override
    public int getRowCount() {
        return listaVesti.size();
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
        Vest v = listaVesti.get(rowIndex);
        switch(columnIndex){
            case 0: return v.getIzdanje().getPublikacija().getNaziv();
            case 1: return v.getRB();
            case 2: return v.getNaslov();
            case 3: return v.getTekst();
            
            default: return null;
        
        }
    }
    
    public void dodajUTabelu(Vest vest){
        int rb = 0;
        if(listaVesti.isEmpty()){
            vest.setRB(1);
        }else{
            for (Vest vest1 : listaVesti) {
                if (vest1.getRB()> rb){
                    rb = vest1.getRB();
                }
            }
        }
        vest.setRB(rb+1);
        listaVesti.add(vest);
        fireTableDataChanged();
    }
    
    public void obrisiIzTabele(int indeks){
        listaVesti.remove(indeks);
        fireTableDataChanged();
    }

    public ArrayList<Vest> getListaVesti() {
        return listaVesti;
    }

    public void resetuj() {
        listaVesti = new ArrayList<>();
        fireTableDataChanged();
    }

    public void setListaVesti(ArrayList<Vest> listaVesti) {
        this.listaVesti = listaVesti;       
        fireTableDataChanged();

    }
    
}
