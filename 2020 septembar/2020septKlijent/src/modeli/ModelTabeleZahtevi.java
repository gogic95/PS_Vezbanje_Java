/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.Zahtev;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Gogic
 */
public class ModelTabeleZahtevi extends AbstractTableModel{
    ArrayList<Zahtev> listaZahteva = new ArrayList<>();
    
    String [] columnNames = {"Datum i vreme test", "Hitno","Tip","Rezultat","Napomena","Status","Osigurano lice","Laboratorija", "Laborant"};
    
    
    @Override
    public int getRowCount() {
        return listaZahteva.size();
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
        Zahtev z = listaZahteva.get(rowIndex);
        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy hh.mm");
        switch(columnIndex){
            case 0: return sdf.format(z.getDatumVremeTestiranja());
            case 1: return z.isHitno();
            case 2: return z.getTip();
            case 3: return z.getRezultat();
            case 4: return z.getNapomena();
            case 5: return z.getStatus();
            case 6: return z.getOsiguranoLice();
            case 7: return z.getLaboratorija();
            case 8: return z.getLaborant();
            
            default: return null;
        }
    }

    @Override
    public Class<?> getColumnClass(int columnIndex) {
        if(getValueAt(0, columnIndex) == null){
            return Object.class;
        }
        return getValueAt(0, columnIndex).getClass();
    }

    public void osvezi(){
        fireTableDataChanged();
    }
    
    public ArrayList<Zahtev> getListaZahteva() {
        return listaZahteva;
    }

    public void setListaZahteva(ArrayList<Zahtev> listaZahteva) {
        this.listaZahteva = listaZahteva;
        fireTableDataChanged();
    }
    
    
    
}
