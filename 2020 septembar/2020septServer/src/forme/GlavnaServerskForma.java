/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forme;

import domen.Laboratorija;
import domen.Zahtev;
import java.util.ArrayList;
import kontroler.Kontroler;
import modeli.ModelTabeleServer;
import niti.OsveziNit;
import niti.PokreniServerNit;
import pk.PomocnaKlasa;

/**
 *
 * @author Gogic
 */
public class GlavnaServerskForma extends javax.swing.JFrame {

    /**
     * Creates new form GlavnaServerskForma
     */
    public GlavnaServerskForma() {
        initComponents();
        PokreniServerNit psn = new PokreniServerNit();
        psn.start();
        this.setLocationRelativeTo(null);
        srediKombo();
        OsveziNit os = new OsveziNit(this);
        os.start();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        tblTestovi = new javax.swing.JTable();
        cmbLaboratorija = new javax.swing.JComboBox();
        chkLaboratorija = new javax.swing.JCheckBox();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Serverska forma");

        tblTestovi.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(tblTestovi);

        cmbLaboratorija.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        chkLaboratorija.setText("Laboratorija");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 835, Short.MAX_VALUE)
                .addContainerGap())
            .addGroup(layout.createSequentialGroup()
                .addGap(31, 31, 31)
                .addComponent(chkLaboratorija)
                .addGap(87, 87, 87)
                .addComponent(cmbLaboratorija, javax.swing.GroupLayout.PREFERRED_SIZE, 384, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(41, 41, 41)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cmbLaboratorija, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(chkLaboratorija))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 58, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 323, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(GlavnaServerskForma.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(GlavnaServerskForma.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(GlavnaServerskForma.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(GlavnaServerskForma.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new GlavnaServerskForma().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JCheckBox chkLaboratorija;
    private javax.swing.JComboBox cmbLaboratorija;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblTestovi;
    // End of variables declaration//GEN-END:variables

    public void srediTabelu() {
        ModelTabeleServer mts = new ModelTabeleServer();
        tblTestovi.setModel(mts);
        
        ArrayList<Zahtev> listaZahteva = Kontroler.getInstance().vratiZahteveObradjene();
        
        int PCRpozitivni = 0;
        int PCRnegativni = 0;
        
        int seroloskiPozitivni = 0;
        int seroloskiNegativni = 0;
        
        int antitelaPozivitni = 0;
        int antitelaNegativni = 0;
        
        for (Zahtev zahtev : listaZahteva) {
            if(chkLaboratorija.isSelected()){
            
                Laboratorija lab = (Laboratorija) cmbLaboratorija.getSelectedItem();
            
                if(zahtev.getLaboratorija().equals(lab)){
        
                    if(zahtev.getTip().equals("PCR")){
                        if(zahtev.getRezultat().equals("Pozitivan")) PCRpozitivni++;
                        if(zahtev.getRezultat().equals("Negativan")) PCRnegativni++;
                    }
                    if(zahtev.getTip().equals("Antitela")){
                        if(zahtev.getRezultat().equals("Pozitivan")) antitelaPozivitni++;
                        if(zahtev.getRezultat().equals("Negativan")) antitelaNegativni++;
                    }
                    if(zahtev.getTip().equals("Seroloski")){
                        if(zahtev.getRezultat().equals("Pozitivan")) seroloskiPozitivni++;
                        if(zahtev.getRezultat().equals("Negativan")) seroloskiNegativni++;
                    }
                }   
            }else{
                if(zahtev.getTip().equals("PCR")){
                        if(zahtev.getRezultat().equals("Pozitivan")) PCRpozitivni++;
                        if(zahtev.getRezultat().equals("Negativan")) PCRnegativni++;
                    }
                    if(zahtev.getTip().equals("Antitela")){
                        if(zahtev.getRezultat().equals("Pozitivan")) antitelaPozivitni++;
                        if(zahtev.getRezultat().equals("Negativan")) antitelaNegativni++;
                    }
                    if(zahtev.getTip().equals("Seroloski")){
                        if(zahtev.getRezultat().equals("Pozitivan")) seroloskiPozitivni++;
                        if(zahtev.getRezultat().equals("Negativan")) seroloskiNegativni++;
                    }
            }
        }
        
        
        PomocnaKlasa pkP = new PomocnaKlasa("PCR", PCRpozitivni, PCRnegativni);
        PomocnaKlasa pkA = new PomocnaKlasa("Antitela", antitelaPozivitni, antitelaNegativni);
        PomocnaKlasa pkS = new PomocnaKlasa("Seroloski", seroloskiPozitivni, seroloskiNegativni);
        
        ArrayList<PomocnaKlasa> listaPomocne = new ArrayList<>();
        listaPomocne.add(pkS);
        listaPomocne.add(pkP);
        listaPomocne.add(pkA);
        
        mts.setListaPK(listaPomocne);
        
        
        
        
    }

    private void srediKombo() {
        cmbLaboratorija.removeAllItems();
        ArrayList<Laboratorija> lista = Kontroler.getInstance().vratiLaboratorije();
        for (Laboratorija laboratorija : lista) {
            cmbLaboratorija.addItem(laboratorija);
        }
    }
}