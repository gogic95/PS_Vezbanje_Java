/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;
import pomocna.KlasaPretraga;

/**
 *
 * @author Gogic
 */
public class ModelTabelePretraga extends AbstractTableModel{

    ArrayList<KlasaPretraga> listaPretrage;

    public ModelTabelePretraga() {
        listaPretrage = new ArrayList<>();
    }

    public void setListaPretrage(ArrayList<KlasaPretraga> listaPretrage) {
        this.listaPretrage = listaPretrage;
        fireTableDataChanged();
    }

    
    
    
    
    @Override
    public int getRowCount() {
        return listaPretrage.size();
    }

    @Override
    public int getColumnCount() {
        return 2;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        KlasaPretraga pretraga = listaPretrage.get(rowIndex);
        
        switch(columnIndex){
            case 0:
                return pretraga.getImePrezime();
            case 1:
                return pretraga.getBrojPredmeta();
                default: return null;
        }
    }

    @Override
    public String getColumnName(int column) {
        switch (column){
            case 0: return "Ime i prezime advokata";
            case 1: return "Broj predmeta";
            default: return null;
        }
    }
    
    
    
    
    
}
