/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.PrognozaRegion;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;
import pomoc.PomocnaKlasa;

/**
 *
 * @author Gogic
 */
public class ModelTabelePrognoza extends AbstractTableModel{
    String [] columnNames = {"Meteorolog","Dan","Prognoza za regione"};
    ArrayList<PomocnaKlasa> lista = new ArrayList<>();

    public ArrayList<PomocnaKlasa> getLista() {
        return lista;
    }

    public void setLista(ArrayList<PomocnaKlasa> lista) {
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
        PomocnaKlasa pk = lista.get(rowIndex);
        switch(columnIndex){
            case 0: return pk.getPrognoza().getMeteorolog();
            case 1: 
                SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
                return sdf.format(pk.getPrognoza().getDan());
            case 2: 
                String tekst = "";
                ArrayList<PrognozaRegion> listaPr = pk.getListaPR();
                for (PrognozaRegion pr : listaPr) {
                    tekst += pr.getRegion().getNaziv()+": "+pr.getTemperatura()+" ("+pr.getMeteoAlarm()+", "+pr.getPojava()+"); ";
                }
                return tekst;
            
            
            default: return null;
        }
    }
    
    
  
 
    
    public void resetuj(){
        lista = new ArrayList<>();
        fireTableDataChanged();
    }
}

