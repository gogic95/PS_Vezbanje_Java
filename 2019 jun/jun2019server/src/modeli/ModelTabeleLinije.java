/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.Linija;
import domen.LinijaStanica;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Gogic
 */
public class ModelTabeleLinije extends AbstractTableModel{

    ArrayList<Linija> listaLinija;

    public ModelTabeleLinije(ArrayList<Linija> listaLinija) {
        this.listaLinija = listaLinija;
        fireTableDataChanged();
    }

    public void setListaLinija(ArrayList<Linija> listaLinija) {
        this.listaLinija = listaLinija;
        fireTableDataChanged();
    }
    

    
    
    
    
    @Override
    public int getRowCount() {
        return listaLinija.size();
    }

    @Override
    public int getColumnCount() {
        return 4;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        Linija linija = listaLinija.get(rowIndex);
        switch(columnIndex){
            case 0:
                return linija.getNazivLinije();
            case 1:
                return linija.getPocetnaStanica();
            case 2:
                return linija.getKrajnjaStanica();
            case 3:
                String medjustanice ="";
                for (LinijaStanica linijaStanica : linija.getListaMedjustanica()) {
                    if(medjustanice.isEmpty()){
                        medjustanice=linijaStanica.getStanica().getNazivStanice();
                    }else{
                    medjustanice = medjustanice+" ,"+linijaStanica.getStanica().getNazivStanice();
                    }
                 }
                return medjustanice;
                default: return null;
        }
    }

    @Override
    public String getColumnName(int column) {
        switch(column){
            case 0:
                return "Naziv";
            case 1:
                return "Pocetna stanica";
            case 2:
                return "Krajnja stanica";
            case 3:
                return "Medjustanice";
                default: return null;
        }
    }
    
    
    
}
