/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.Nastavnik;
import domen.PredajePredmet;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Gogic
 */
public class ModelTabeleIzvestaj extends  AbstractTableModel{
    ArrayList<PredajePredmet> lista = new ArrayList<>();
    ArrayList<Nastavnik> listaNastavnika = kontroler.Kontroler.getInstance().vratiNastavnike();
    
    String [] columnNames = {"Ime i prezime nastavnika","Broj predmeta"};
    
    @Override
    public int getRowCount() {
        return listaNastavnika.size();
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
        Nastavnik n = listaNastavnika.get(rowIndex);
        switch(columnIndex){
            case 0: return n.toString();
            case 1: 
                int broj = 0;
                for (PredajePredmet predajePredmet : lista) {
                    if(predajePredmet.getNastavnik().equals(n)) broj++;
                }
                return broj;
            
            
            default: return null;
        }
    }

    public ArrayList<PredajePredmet> getLista() {
        return lista;
    }

    public void setLista(ArrayList<PredajePredmet> lista) {
        this.lista = lista;
        fireTableDataChanged();
    }
    


    
    public void resetuj(){
        lista = new ArrayList<>();
        fireTableDataChanged();
    }
}
