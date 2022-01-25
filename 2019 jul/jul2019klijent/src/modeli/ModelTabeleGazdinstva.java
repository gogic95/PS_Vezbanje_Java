/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.Stado;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Gogic
 */
public class ModelTabeleGazdinstva extends AbstractTableModel {
    
    String [] columnNames  ={"Zivotinja","Autohtona","Subvencija po grlu","Broj grla","Iznos subvencije"};
    ArrayList<Stado> listaStada;

    public ModelTabeleGazdinstva() {
        listaStada = new ArrayList<>();
    }
    
    

    @Override
    public int getRowCount() {
        return listaStada.size();
    }

    @Override
    public int getColumnCount() {
        return columnNames.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        Stado s = listaStada.get(rowIndex);
        switch(columnIndex){
            case 0:
                return s.getZivotinja().getNaziv();
            case 1:
                return s.getZivotinja().isAutohtonaVrsta();
            case 2:
                return s.getZivotinja().getSubvencijaPoGrlu();
            case 3:
                return s.getBrojGrla();
            case 4:
                return s.getIznosSubvencije();
              
            default: return null;
        }
    }

    @Override
    public String getColumnName(int column) {
        return columnNames[column];
    }
    
    public void dodajUlistu(Stado s){
        listaStada.add(s);
        fireTableDataChanged();
    }
    
    public void obrisiIzListe(int indeks){
        listaStada.remove(indeks);
        fireTableDataChanged();
    }

    public ArrayList<Stado> getListaStada() {
        return listaStada;
    }

    @Override
    public Class<?> getColumnClass(int columnIndex) {
        return getValueAt(0, columnIndex).getClass();
    }

     
    public double vratiUkupnuSubvenciju(){
        double vratiSub = 0;
        if(!listaStada.isEmpty()){
        for (Stado stado : listaStada) {
            vratiSub += stado.getIznosSubvencije();
        }
        }
        return vratiSub;
    }
    
    public void resetuj(){
        listaStada = new ArrayList<>();
        fireTableDataChanged();
    }
    
}
