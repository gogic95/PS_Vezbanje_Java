/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.Kandidat;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;
import pomoc.PomocnaKlasa;

/**
 *
 * @author Gogic
 */
public class ModelTabeleRegruter extends AbstractTableModel{
    ArrayList<PomocnaKlasa> listaPK = new ArrayList<>();
    String [] columnNames = {"Regruter","Ukupan broj kandidata","Imena kandidata"};
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
            case 0: return pk.getRegruter().getImePrezime();
            case 1: return pk.getListaK().size();
            case 2: 
                String imena = "";
                ArrayList<Kandidat> listaK = pk.getListaK();
                for (Kandidat kan : listaK) {
                    if(imena.isEmpty()){
                        imena+= kan.getImePrezime();
                    }else{
                        imena +=", "+kan.getImePrezime();
                    }
                }
                return imena;
            default: return null;
        }
    }

    public void setListaPK(ArrayList<PomocnaKlasa> listaPK) {
        this.listaPK = listaPK;
        fireTableDataChanged();
    }
    
    
    
}
