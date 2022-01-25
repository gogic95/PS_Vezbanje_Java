/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;


import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;
import pk.PomocnaKlasa;

/**
 *
 * @author Gogic
 */
public class ModelTabeleServer extends AbstractTableModel{
    ArrayList<PomocnaKlasa> listaPK = new ArrayList<>();
    
    String [] columnNames = {"Tip test", "Ukupno pozitivnih","Ukupno negativnih"};
    
    
    @Override
    public int getRowCount() {
        return listaPK.size();
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
        PomocnaKlasa pk = listaPK.get(rowIndex);
        
        switch(columnIndex){
            case 0: return pk.getTip();
            case 1: return pk.getBrojPozitivnih();
            case 2: return pk.getBrojNegativnih();
           
            
            default: return null;
        }
    }

    

    public void osvezi(){
        fireTableDataChanged();
    }
    
    public ArrayList<PomocnaKlasa> getListaPK() {
        return listaPK;
    }

    public void setListaPK(ArrayList<PomocnaKlasa> listaPK) {
        this.listaPK = listaPK;
        fireTableDataChanged();
    }
}
