/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.Podnesak;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Gogic
 */
public class ModelTabelePodnesak extends AbstractTableModel{
    ArrayList<Podnesak> listaPodneska;
    String [] columnNames = {"RB","Datum prijema","Opis","Vrsta podneska"};

    public ModelTabelePodnesak() {
        listaPodneska = new ArrayList<>();
    }
    
    
    
    @Override
    public int getRowCount() {
        return  listaPodneska.size();
    }

    @Override
    public int getColumnCount() {
        return columnNames.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        Podnesak p = listaPodneska.get(rowIndex);
        switch(columnIndex){
            case 0:
                return p.getRB();
            
            case 1:
                return p.getDatumPrijema();
            
            case 2:
                return p.getOpis();
            
            case 3:
                return p.getVrstaPodneska();
            
            default: return null;
        }
    }

    @Override
    public String getColumnName(int column) {
        return columnNames[column];
    }
    
    public void dodajUTabelu(Podnesak p){
        int rb = 1;
        if(!listaPodneska.isEmpty()){
            for (Podnesak podnesak : listaPodneska) {
               
                if(podnesak.getRB() >= rb){
                    rb = podnesak.getRB()+1;
                   
                }
            }
        }
        p.setRB(rb);
        
        listaPodneska.add(p);
        fireTableDataChanged();
    }
    
    public void obrisiIzTabele(int index){
        listaPodneska.remove(index);
        fireTableDataChanged();
    }

    public ArrayList<Podnesak> getListaPodneska() {
        return listaPodneska;
    }

    public void setListaPodneska(ArrayList<Podnesak> listaPodneska) {
        this.listaPodneska = listaPodneska;
        fireTableDataChanged();
    }

    public void resetuj() {
        listaPodneska = new ArrayList<>();
        fireTableDataChanged();
    }
    
    
    
}
