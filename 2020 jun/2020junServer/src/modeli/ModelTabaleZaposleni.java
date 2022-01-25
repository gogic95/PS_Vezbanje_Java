/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.Zaposleni;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Gogic
 */
public class ModelTabaleZaposleni extends AbstractTableModel{
     ArrayList<Zaposleni> listaZap = new ArrayList<>();
    String [] columnNames = {"Kompanija","Tip","Ime i Prezime","Ziro racun","Banka","Iznos"};
    
    @Override
    public int getRowCount() {
        return listaZap.size();
    }

    @Override
    public String getColumnName(int column) {
        return columnNames[column];
    }

    
    
    @Override
    public int getColumnCount() {
        return columnNames.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        Zaposleni z = listaZap.get(rowIndex);
        switch(columnIndex){
            case 0: return z.getKompanija().getNaziv();
            case 1: return z.getKompanija().getTipKompanije();
            case 2: return z.getIme()+" "+z.getPrezime();
            case 3: return z.getZiroRacun();
            case 4: return z.getBanka().getNaziv();
            case 5: return z.getIznos();
            
            default: return null;
        }
    }
    
    

    public ArrayList<Zaposleni> getListaZap() {
        return listaZap;
    }

    public void setListaZap(ArrayList<Zaposleni> listaZap) {
        this.listaZap = listaZap;
        fireTableDataChanged();
    }
    
    public void resetuj(){
        listaZap = new ArrayList<>();
        fireTableDataChanged();
    }
}
