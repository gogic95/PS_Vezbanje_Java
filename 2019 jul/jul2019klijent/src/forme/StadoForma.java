/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forme;

import domen.Gazdinstvo;
import domen.Stado;
import domen.Zivotinja;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import komunikacija.KomunikacijaSaServerom;
import konstante.Konstante;
import modeli.ModelTabeleGazdinstva;
import transferObjekat.KlijentskiZahtev;

/**
 *
 * @author Gogic
 */
public class StadoForma extends javax.swing.JDialog {
    Stado s;
    /**
     * Creates new form StadoForma
     */
    public StadoForma(java.awt.Frame parent, boolean modal, Stado s) {
        super(parent, modal);
        initComponents();
        this.s = s;
        srediFormu();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        cmbZivotinja = new javax.swing.JComboBox();
        jLabel2 = new javax.swing.JLabel();
        txtBrojZivotinja = new javax.swing.JTextField();
        btnUbaci = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jLabel1.setText("Zivotinja:");

        cmbZivotinja.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        jLabel2.setText("Broj grla:");

        btnUbaci.setText("Ubaci");
        btnUbaci.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnUbaciActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(cmbZivotinja, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(txtBrojZivotinja)))
                .addContainerGap())
            .addGroup(layout.createSequentialGroup()
                .addGap(140, 140, 140)
                .addComponent(btnUbaci)
                .addContainerGap(187, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(cmbZivotinja, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(txtBrojZivotinja, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(btnUbaci)
                .addContainerGap(22, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnUbaciActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnUbaciActionPerformed
        if(txtBrojZivotinja.getText().isEmpty()){
            JOptionPane.showMessageDialog(this, "ne moze prazno");
            return;
        }
        
        
        Zivotinja z = (Zivotinja) cmbZivotinja.getSelectedItem();
        int brojGrla = Integer.parseInt(txtBrojZivotinja.getText());
        if(brojGrla <= 0){
            JOptionPane.showMessageDialog(this, "Mora imati bar jedno grlo");
            return;
        }
        double iznosSubvencije = brojGrla*z.getSubvencijaPoGrlu();
        
        s.setZivotinja(z);
        s.setBrojGrla(brojGrla);
        s.setIznosSubvencije(iznosSubvencije);
        
        this.dispose();
        
    }//GEN-LAST:event_btnUbaciActionPerformed

    /**
     * @param args the command line arguments
     */
 

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnUbaci;
    private javax.swing.JComboBox cmbZivotinja;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JTextField txtBrojZivotinja;
    // End of variables declaration//GEN-END:variables

    private void srediFormu() {
        cmbZivotinja.removeAllItems();
        ArrayList<Zivotinja> listaStada = new ArrayList();
        KlijentskiZahtev kz = new KlijentskiZahtev(Konstante.VRATI_SVE_ZIVOTINJE, null);
        KomunikacijaSaServerom.getInstance().posaljiZahtev(kz);
        listaStada = (ArrayList<Zivotinja>) KomunikacijaSaServerom.getInstance().primiOdgovor().getOdgovor();
        
        for (Zivotinja zivotinja : listaStada) {
            cmbZivotinja.addItem(zivotinja);
        }
        
    }
}