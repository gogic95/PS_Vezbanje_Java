/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.PrognozaRegion;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Gogic
 */
public class ModelTabelePrognoza extends AbstractTableModel{
    String [] columnNames = {"Temperatura","Region","Meteo alarm","Pojava"};
    ArrayList<PrognozaRegion> lista = new ArrayList<>();

    public ArrayList<PrognozaRegion> getLista() {
        return lista;
    }

    public void setLista(ArrayList<PrognozaRegion> lista) {
        this.lista = lista;
        fireTableDataChanged();
    }
    
    
    
    @Override
    public int getRowCount() {
        return lista.size();
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
        PrognozaRegion pr = lista.get(rowIndex);
        switch(columnIndex){
            case 0: return pr.getTemperatura();
            case 1: return pr.getRegion().getNaziv();
            case 2: return pr.getMeteoAlarm();
            case 3: return pr.getPojava();
            
            default: return null;
        }
    }
    
    
    public void dodajUTabelu(PrognozaRegion pr){
        int id = 0;
        for (PrognozaRegion pr1 : lista) {
            if(pr1.getRB() >= id){
                id = pr1.getRB();
            }
        }
        pr.setRB(++id);
        lista.add(pr);
        fireTableDataChanged();
    }
    
    public void obrisiIzTabele(int indeks){
        lista.remove(indeks);
        fireTableDataChanged();
    }
    
    public void resetuj(){
        lista = new ArrayList<>();
        fireTableDataChanged();
    }
}
