/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forme;

import domen.PredajePredmet;
import java.util.ArrayList;
import modeli.ModelTabeleIzvestaj;
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
        PokreniServerNit ps = new PokreniServerNit();
        ps.start();
        this.setLocationRelativeTo(null);
        srediTabelu();
        srediCombo();
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
        tblIzvestaj = new javax.swing.JTable();
        chkSemestar = new javax.swing.JCheckBox();
        chkStudijskiProgream = new javax.swing.JCheckBox();
        txtSemestar = new javax.swing.JTextField();
        cmbSmer = new javax.swing.JComboBox();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        tblIzvestaj.setModel(new javax.swing.table.DefaultTableModel(
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
        jScrollPane1.setViewportView(tblIzvestaj);

        chkSemestar.setText("Semestar");

        chkStudijskiProgream.setText("Studijski program");

        cmbSmer.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 1009, Short.MAX_VALUE)
                .addContainerGap())
            .addGroup(layout.createSequentialGroup()
                .addGap(33, 33, 33)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(chkSemestar)
                    .addComponent(chkStudijskiProgream))
                .addGap(86, 86, 86)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(txtSemestar)
                    .addComponent(cmbSmer, 0, 238, Short.MAX_VALUE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(35, 35, 35)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(chkSemestar)
                    .addComponent(txtSemestar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(40, 40, 40)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(chkStudijskiProgream)
                    .addComponent(cmbSmer, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 110, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 190, javax.swing.GroupLayout.PREFERRED_SIZE)
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

    
    public void srediTabelu(){
        ModelTabeleIzvestaj mti = new ModelTabeleIzvestaj();
        tblIzvestaj.setModel(mti);
        
        ArrayList<PredajePredmet> lista = kontroler.Kontroler.getInstance().vratiPredajePredmet();
        mti.setLista(lista);
        
        
        if(chkStudijskiProgream.isSelected()){
            ArrayList<PredajePredmet> listaSmer = new ArrayList<>();
            for (PredajePredmet predajePredmet : lista) {
                if(predajePredmet.getStudijskiProgram().equals(cmbSmer.getSelectedItem())){
                    listaSmer.add(predajePredmet);
                }
            }
            mti.setLista(listaSmer);
        }
        
        if(chkSemestar.isSelected()){
            ArrayList<PredajePredmet> listaSemestar = new ArrayList<>();
            for (PredajePredmet predajePredmet : lista) {
                if(predajePredmet.getSemestar()== Integer.parseInt(txtSemestar.getText())){
                    listaSemestar.add(predajePredmet);
                }
            }
            mti.setLista(listaSemestar);
        }
        
        if(chkStudijskiProgream.isSelected() &&chkSemestar.isSelected()){
            
            
             ArrayList<PredajePredmet> listaOba = new ArrayList<>();
            for (PredajePredmet predajePredmet : lista) {
                if(predajePredmet.getSemestar()== Integer.parseInt(txtSemestar.getText()) && predajePredmet.getStudijskiProgram().equals(cmbSmer.getSelectedItem()) ){
                    listaOba.add(predajePredmet);
                }
            }
            mti.setLista(listaOba);
            
            
            
            
            
            
        }
        
        
        
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JCheckBox chkSemestar;
    private javax.swing.JCheckBox chkStudijskiProgream;
    private javax.swing.JComboBox cmbSmer;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblIzvestaj;
    private javax.swing.JTextField txtSemestar;
    // End of variables declaration//GEN-END:variables

    private void srediCombo() {
        cmbSmer.removeAllItems();
       cmbSmer.addItem("ISIT");
        cmbSmer.addItem("MEN");
        cmbSmer.addItem("OM");
        cmbSmer.addItem("UK");
    }
}