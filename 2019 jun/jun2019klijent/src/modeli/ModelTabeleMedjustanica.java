/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.Stanica;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Gogic
 */
public class ModelTabeleMedjustanica extends AbstractTableModel {

    ArrayList<Stanica> listaStanica;

    public void setListaStanica(ArrayList<Stanica> listaStanica) {
        this.listaStanica = listaStanica;
        fireTableDataChanged();
    }

    public ArrayList<Stanica> getListaStanica() {
        return listaStanica;
    }

    public ModelTabeleMedjustanica() {
        listaStanica = new ArrayList<>();
    }
    
    public void dodajUListu(Stanica stanica){
        listaStanica.add(stanica);
        fireTableDataChanged();
    }
    
    @Override
    public int getRowCount() {
        return listaStanica.size();
    }

    @Override
    public int getColumnCount() {
        return 1;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        Stanica stanica = listaStanica.get(rowIndex);
        switch(columnIndex){
            case 0:
                return stanica.getNazivStanice();
                default:return null;
        }
    }

    @Override
    public String getColumnName(int column) {
        return "Naziv medjustanice";
    }
    
    public void osveziNakonCuvanja(){
        listaStanica = new ArrayList<>();
        fireTableDataChanged();
    }
}
