/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeli;

import domen.Stado;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.swing.table.AbstractTableModel;
import pomocna.PomocnaKlasa;

/**
 *
 * @author Gogic
 */
public class ModelTabeleGazdinstvo extends AbstractTableModel {
    ArrayList<PomocnaKlasa> listaPomocne = new ArrayList<>();
    String [] columnNames = {"Gazdinstvo", "Datum registracije", "Ukupno subvencije","Ukupno grla","Stado"};

    @Override
    public int getRowCount() {
        return listaPomocne.size();
    }

    @Override
    public int getColumnCount() {
        return columnNames.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        PomocnaKlasa pk = listaPomocne.get(rowIndex);
        
        ArrayList<Stado> listaS = pk.getListaStada();
        int brojGrla = 0;
        for (Stado stado : listaS) {
            brojGrla += stado.getBrojGrla();
        }
        
        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
        switch(columnIndex){
            case 0:
                return pk.getGazdinstvo().getNaziv();
            case 1:
                return sdf.format(pk.getGazdinstvo().getDatumRegistracije());
            case 2:
                return pk.getGazdinstvo().getUkupnoSubvencija();
            case 3:
                return brojGrla;
            case 4:
                String tekst = "";
                for (Stado stado : listaS) {
                    tekst += stado.getZivotinja().getNaziv()+": "+stado.getBrojGrla()+", ";
                }
                return tekst;
            default: return null;
        }
    }

    @Override
    public String getColumnName(int column) {
        return columnNames[column];
    }

    public void setListaPomocne(ArrayList<PomocnaKlasa> listaPomocne) {
        this.listaPomocne = listaPomocne;
        fireTableDataChanged();
    }
    
    
    
}
