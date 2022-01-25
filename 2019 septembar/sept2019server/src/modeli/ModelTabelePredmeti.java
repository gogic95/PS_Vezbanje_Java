/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;
import pomoc.PomocnaKlasa;

/**
 *
 * @author Gogic
 */
public class ModelTabelePredmeti extends AbstractTableModel{
    ArrayList<PomocnaKlasa> lista = new ArrayList<>();
    String [] columnNames = {"Sud","Tip spora", "Broj predmeta"};
    
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
        PomocnaKlasa pk = lista.get(rowIndex);
        switch(columnIndex){
            case 0: return pk.getSud().getNaziv();
            case 1: return pk.getTipSpora().getNaziv();
            case 2: return pk.getBrojPredmeta();
            default: return null;
            
            
        }
    }

    public void setLista(ArrayList<PomocnaKlasa> lista) {
        this.lista = lista;
        fireTableDataChanged();
    }

    public ArrayList<PomocnaKlasa> getLista() {
        return lista;
    }
    
    public void osvezi(){
        fireTableDataChanged();
    }
    
    
    
    
}
