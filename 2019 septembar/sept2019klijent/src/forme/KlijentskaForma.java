/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forme;

import domen.Podnesak;
import domen.Predmet;
import domen.Sud;
import domen.TipSpora;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import komunikacija.KomunikacijaSaServerom;
import konstante.Konstante;
import modeli.ModelTabelePodnesak;
import transferObjekat.KlijentskiZahtev;
import transferObjekat.ServerskiOdgovor;

/**
 *
 * @author Gogic
 */
public class KlijentskaForma extends javax.swing.JFrame {

    /**
     * Creates new form KlijentskaForma
     */
    public KlijentskaForma() {
        initComponents();
        srediFormu();
        srediTabelu();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        rbnGrupa = new javax.swing.ButtonGroup();
        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        txtBrojPredmeta = new javax.swing.JTextField();
        txtDatumPrijema = new javax.swing.JTextField();
        txtTuzilac = new javax.swing.JTextField();
        txtTuzeni = new javax.swing.JTextField();
        cmbSud = new javax.swing.JComboBox();
        cmbTipSpora = new javax.swing.JComboBox();
        rbnDa = new javax.swing.JRadioButton();
        jLabel7 = new javax.swing.JLabel();
        rbnNe = new javax.swing.JRadioButton();
        btnDodaj = new javax.swing.JButton();
        brnObrisi = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblPodnesci = new javax.swing.JTable();
        btnSacuvaj = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Unos premdeta Klijent");

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder("Unos predmeta"));

        jLabel1.setText("Sud:");

        jLabel2.setText("Tip spora:");

        jLabel3.setText("Broj predmeta:");

        jLabel4.setText("Datum prijema:");

        jLabel5.setText("Tuzilac:");

        jLabel6.setText("Tuzeni:");

        cmbSud.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        cmbTipSpora.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        rbnGrupa.add(rbnDa);
        rbnDa.setSelected(true);
        rbnDa.setText("Da");

        jLabel7.setText("Placena taksa:");

        rbnGrupa.add(rbnNe);
        rbnNe.setText("Ne");

        btnDodaj.setText("Dodaj podnesak");
        btnDodaj.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDodajActionPerformed(evt);
            }
        });

        brnObrisi.setText("Obrisi podnesak");
        brnObrisi.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                brnObrisiActionPerformed(evt);
            }
        });

        tblPodnesci.setModel(new javax.swing.table.DefaultTableModel(
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
        jScrollPane1.setViewportView(tblPodnesci);

        btnSacuvaj.setText("Sacuvaj predmet");
        btnSacuvaj.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSacuvajActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(10, 10, 10)
                        .addComponent(btnDodaj)
                        .addGap(18, 18, 18)
                        .addComponent(brnObrisi)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 461, Short.MAX_VALUE)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel4)
                                    .addComponent(jLabel5)
                                    .addComponent(jLabel3)
                                    .addComponent(jLabel6)
                                    .addComponent(jLabel1)
                                    .addComponent(jLabel2)
                                    .addComponent(jLabel7))
                                .addGap(18, 18, 18)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(jPanel1Layout.createSequentialGroup()
                                        .addComponent(rbnDa)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addComponent(rbnNe)
                                        .addGap(0, 0, Short.MAX_VALUE))
                                    .addComponent(cmbSud, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(cmbTipSpora, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(txtBrojPredmeta)
                                    .addComponent(txtDatumPrijema)
                                    .addComponent(txtTuzilac)
                                    .addComponent(txtTuzeni))))
                        .addContainerGap())))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(btnSacuvaj)
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(cmbSud, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(21, 21, 21)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(cmbTipSpora, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3)
                    .addComponent(txtBrojPredmeta, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4)
                    .addComponent(txtDatumPrijema, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(txtTuzilac, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6)
                    .addComponent(txtTuzeni, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(rbnDa)
                    .addComponent(jLabel7)
                    .addComponent(rbnNe))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnDodaj)
                    .addComponent(brnObrisi))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 145, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(btnSacuvaj)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void brnObrisiActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_brnObrisiActionPerformed
        ModelTabelePodnesak mtp = (ModelTabelePodnesak) tblPodnesci.getModel();
        int indeks;
        if((indeks = tblPodnesci.getSelectedRow()) != -1){
            mtp.obrisiIzTabele(indeks);
        }else{
            JOptionPane.showMessageDialog(this, "Nije izabran nijedan podnesak");
        }
    }//GEN-LAST:event_brnObrisiActionPerformed

    private void btnDodajActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDodajActionPerformed
       
            if(txtDatumPrijema.getText().isEmpty() || txtBrojPredmeta.getText().isEmpty() || txtTuzeni.getText().isEmpty() || txtTuzilac.getText().isEmpty()){
                JOptionPane.showMessageDialog(this, "Prvo popunite polja iznad");
                return;
            }
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
            Date datum = sdf.parse(txtDatumPrijema.getText());
            Podnesak p = new Podnesak();
            DodajPodnesakForma dpf = new DodajPodnesakForma(this,true,p,datum);
            dpf.setVisible(true);
            ModelTabelePodnesak mtp = (ModelTabelePodnesak) tblPodnesci.getModel();
            mtp.dodajUTabelu(p);
        } catch (ParseException ex) {
              JOptionPane.showMessageDialog(this, "Datum nije u odgovarajucem formatu");
            Logger.getLogger(KlijentskaForma.class.getName()).log(Level.SEVERE, null, ex);
            return;
        }
    }//GEN-LAST:event_btnDodajActionPerformed

    private void btnSacuvajActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSacuvajActionPerformed
       if(txtDatumPrijema.getText().isEmpty() || txtBrojPredmeta.getText().isEmpty() || txtTuzeni.getText().isEmpty() || txtTuzilac.getText().isEmpty()){
            JOptionPane.showMessageDialog(this, "Sva polja su obavezna");
            return;
        }
       ModelTabelePodnesak mtp = (ModelTabelePodnesak) tblPodnesci.getModel();
       ArrayList<Podnesak> listaP = mtp.getListaPodneska();
       if(listaP.isEmpty()){
           JOptionPane.showMessageDialog(this, "Mora imati bar jedan podnesak");
            return;
       }
       
       String brojPredmeta = txtBrojPredmeta.getText();
       KlijentskiZahtev kz1 = new KlijentskiZahtev(Konstante.DA_LI_JE_BROJ_VALIDAN, brojPredmeta.trim());
       KomunikacijaSaServerom.getInstance().posaljiZahtev(kz1);
       boolean sig = (boolean) KomunikacijaSaServerom.getInstance().primiOdgovor().getOdgovor();
       if(!sig){
           JOptionPane.showMessageDialog(this, "Broj predmeta vec postoji");
            return;
       }
       
       
        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
        Predmet p = new Predmet();
        p.setBrojPredmeta(txtBrojPredmeta.getText());
        try {
            p.setDatumPredmeta(sdf.parse(txtDatumPrijema.getText()));
        } catch (ParseException ex) {
            Logger.getLogger(KlijentskaForma.class.getName()).log(Level.SEVERE, null, ex);
            return;
        }
        p.setTuzeni(txtTuzeni.getText());
        p.setTuzilac(txtTuzilac.getText());
        
        p.setPlacenaSudskaTaksa(rbnDa.isSelected());
        
        p.setSud((Sud) cmbSud.getSelectedItem());
        p.setTipSpora((TipSpora) cmbTipSpora.getSelectedItem());
        p.setStatus("neresen");
       
        for (Podnesak podnesak : listaP) {
            podnesak.setPredmet(p);
        }
        
        KlijentskiZahtev kz = new KlijentskiZahtev(Konstante.SACUVAJ_PREDMET, listaP);
        KomunikacijaSaServerom.getInstance().posaljiZahtev(kz);
        
        ServerskiOdgovor so = KomunikacijaSaServerom.getInstance().primiOdgovor();
        boolean signal = (boolean) so.getOdgovor();
        String poruka = so.getPoruka();
        
        if(signal){
            JOptionPane.showMessageDialog(this, poruka);
            mtp.resetuj();
            return;
        }else{
            JOptionPane.showMessageDialog(this, poruka);
            return;
        }
    }//GEN-LAST:event_btnSacuvajActionPerformed

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
            java.util.logging.Logger.getLogger(KlijentskaForma.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(KlijentskaForma.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(KlijentskaForma.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(KlijentskaForma.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new KlijentskaForma().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton brnObrisi;
    private javax.swing.JButton btnDodaj;
    private javax.swing.JButton btnSacuvaj;
    private javax.swing.JComboBox cmbSud;
    private javax.swing.JComboBox cmbTipSpora;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JRadioButton rbnDa;
    private javax.swing.ButtonGroup rbnGrupa;
    private javax.swing.JRadioButton rbnNe;
    private javax.swing.JTable tblPodnesci;
    private javax.swing.JTextField txtBrojPredmeta;
    private javax.swing.JTextField txtDatumPrijema;
    private javax.swing.JTextField txtTuzeni;
    private javax.swing.JTextField txtTuzilac;
    // End of variables declaration//GEN-END:variables

    private void srediFormu() {
        srediSudove();
        srediTipSpora();
    }

    private void srediSudove() {
        cmbSud.removeAllItems();
        
        KlijentskiZahtev kz = new KlijentskiZahtev(Konstante.VRATI_SUDOVE, null);
        KomunikacijaSaServerom.getInstance().posaljiZahtev(kz);
        ArrayList<Sud> listaSudova = (ArrayList<Sud>) KomunikacijaSaServerom.getInstance().primiOdgovor().getOdgovor();
        
        for (Sud sud : listaSudova) {
            cmbSud.addItem(sud);
        }
    }

    private void srediTipSpora() {
        cmbTipSpora.removeAllItems();
        
        KlijentskiZahtev kz = new KlijentskiZahtev(Konstante.VRATI_TIPOVE_SPOROVA, null);
        KomunikacijaSaServerom.getInstance().posaljiZahtev(kz);
        ArrayList<TipSpora> listaTS = (ArrayList<TipSpora>) KomunikacijaSaServerom.getInstance().primiOdgovor().getOdgovor();
        
        for (TipSpora tip : listaTS) {
            cmbTipSpora.addItem(tip);
        }
    }

    private void srediTabelu() {
        ModelTabelePodnesak mtp = new ModelTabelePodnesak();
        tblPodnesci.setModel(mtp);
    }
}