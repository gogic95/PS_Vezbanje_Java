/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forme;

import domen.Banka;
import domen.Zaposleni;
import java.util.ArrayList;
import kontroler.Kontroler;
import modeli.ModelTabaleZaposleni;
import niti.OsveziNit;
import niti.PokreniServerNit;

/**
 *
 * @author Gogic
 */
public class ServerskaForma extends javax.swing.JFrame {

    /**
     * Creates new form ServerskaForma
     */
    public ServerskaForma() {
        initComponents();
        PokreniServerNit psn = new PokreniServerNit();
        psn.start();
        srediKombo();
        
        srediTabelu();
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

        chkTip = new javax.swing.JCheckBox();
        chkBanka = new javax.swing.JCheckBox();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblZaposleni = new javax.swing.JTable();
        cmbBanka = new javax.swing.JComboBox();
        cmbTipKompanija = new javax.swing.JComboBox();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        chkTip.setText("Tip kompanije");

        chkBanka.setText("Banka:");

        tblZaposleni.setModel(new javax.swing.table.DefaultTableModel(
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
        jScrollPane1.setViewportView(tblZaposleni);

        cmbBanka.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        cmbTipKompanija.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(23, 23, 23)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(chkTip)
                            .addComponent(chkBanka))
                        .addGap(55, 55, 55)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(cmbBanka, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(cmbTipKompanija, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 821, Short.MAX_VALUE))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(19, 19, 19)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(chkTip)
                    .addComponent(cmbTipKompanija, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(chkBanka)
                    .addComponent(cmbBanka, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(32, 32, 32)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 185, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(51, Short.MAX_VALUE))
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
            java.util.logging.Logger.getLogger(ServerskaForma.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ServerskaForma.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ServerskaForma.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ServerskaForma.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ServerskaForma().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JCheckBox chkBanka;
    private javax.swing.JCheckBox chkTip;
    private javax.swing.JComboBox cmbBanka;
    private javax.swing.JComboBox cmbTipKompanija;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblZaposleni;
    // End of variables declaration//GEN-END:variables

    private void srediKombo() {
       cmbTipKompanija.removeAllItems();
        
        cmbTipKompanija.addItem("Akcionarsko drustvo");
        cmbTipKompanija.addItem("DOO");
        cmbTipKompanija.addItem("Ortacko drustvo");
        cmbTipKompanija.addItem("Komandno drustvo");
        cmbTipKompanija.addItem("Preduzetnik");
        
       
        cmbBanka.removeAllItems();
        ArrayList<Banka> listaB = (ArrayList<Banka>) Kontroler.getInstance().vratiBanke();
        
        for (Banka banka : listaB) {
            cmbBanka.addItem(banka);
        }
    }

    public void srediTabelu() {
        ModelTabaleZaposleni mtz = new ModelTabaleZaposleni();
        tblZaposleni.setModel(mtz);
        
        ArrayList<Zaposleni> listaZap = Kontroler.getInstance().vratiZaposlene();
        mtz.setListaZap(listaZap);
        
        ArrayList<Zaposleni> listaZap2 = new ArrayList<>();
        if(chkBanka.isSelected()){
            for (Zaposleni zaposleni : listaZap) {
                if(cmbBanka.getSelectedItem().equals(zaposleni.getBanka())){
                    listaZap2.add(zaposleni);
                }
            }
            mtz.setListaZap(listaZap2);
        }
        
        if(chkTip.isSelected()){
            for (Zaposleni zaposleni : listaZap) {
                if(cmbTipKompanija.getSelectedItem().equals(zaposleni.getKompanija().getTipKompanije())){
                    listaZap2.add(zaposleni);
                }
            }
            mtz.setListaZap(listaZap2);
        }
        
        if(chkBanka.isSelected() && chkTip.isSelected()){
            listaZap2 = new ArrayList<>();
            for (Zaposleni zaposleni : listaZap) {
                if(cmbTipKompanija.getSelectedItem().equals(zaposleni.getKompanija().getTipKompanije()) && cmbBanka.getSelectedItem().equals(zaposleni.getBanka())){
                    listaZap2.add(zaposleni);
                }
            }
            mtz.setListaZap(listaZap2);
        }
        
    }
}