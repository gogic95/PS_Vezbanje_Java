/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forme;

import domen.Opstina;
import domen.Prijava;
import domen.StavkaPrijave;
import java.util.ArrayList;
import java.util.Date;
import javax.swing.JOptionPane;
import kom.Komunikacija;
import kons.Konstante;
import modeli.ModelTabeleVakcine;
import transferObjekat.KlijentskiZahtev;

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
        srediDrzavljanstvo();
        srediOpstine();
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

        buttonGroup1 = new javax.swing.ButtonGroup();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblVakcine = new javax.swing.JTable();
        btnSacuvaj = new javax.swing.JButton();
        btnDodaj = new javax.swing.JButton();
        btnObrisi = new javax.swing.JButton();
        jPanel1 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        cmbDrzavljanstvo = new javax.swing.JComboBox();
        cmbOpstina = new javax.swing.JComboBox();
        txtJMBG = new javax.swing.JTextField();
        txtIme = new javax.swing.JTextField();
        txtEmail = new javax.swing.JTextField();
        txtPrezime = new javax.swing.JTextField();
        txtMobilniBroj = new javax.swing.JTextField();
        rbnDa = new javax.swing.JRadioButton();
        rbnNe = new javax.swing.JRadioButton();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Klijentska forma");

        tblVakcine.setModel(new javax.swing.table.DefaultTableModel(
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
        jScrollPane1.setViewportView(tblVakcine);

        btnSacuvaj.setText("Sacuvaj prijavu");
        btnSacuvaj.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSacuvajActionPerformed(evt);
            }
        });

        btnDodaj.setText("Dodaj tip vakcine");
        btnDodaj.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDodajActionPerformed(evt);
            }
        });

        btnObrisi.setText("Obrisi tip vakcine");
        btnObrisi.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnObrisiActionPerformed(evt);
            }
        });

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder("Unos prijave"));

        jLabel2.setText("Drzavljanstvo");

        jLabel3.setText("JMBG");

        jLabel4.setText("Ime");

        jLabel5.setText("Email");

        jLabel6.setText("Prezime");

        jLabel7.setText("Mobilni telefon");

        jLabel8.setText("Specificna oboljenja");

        jLabel9.setText("Opstina");

        cmbDrzavljanstvo.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        cmbOpstina.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        buttonGroup1.add(rbnDa);
        rbnDa.setSelected(true);
        rbnDa.setText("Da");

        buttonGroup1.add(rbnNe);
        rbnNe.setText("Ne");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel4, javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jLabel3, javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jLabel6, javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jLabel5, javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jLabel7, javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jLabel2, javax.swing.GroupLayout.Alignment.TRAILING))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel9)
                            .addComponent(jLabel8))
                        .addGap(53, 53, 53)))
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(rbnDa)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(rbnNe))
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                .addComponent(cmbOpstina, javax.swing.GroupLayout.Alignment.TRAILING, 0, 551, Short.MAX_VALUE)
                                .addComponent(cmbDrzavljanstvo, javax.swing.GroupLayout.Alignment.TRAILING, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(txtIme)
                                .addComponent(txtPrezime)
                                .addComponent(txtEmail)
                                .addComponent(txtMobilniBroj)))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(txtJMBG, javax.swing.GroupLayout.PREFERRED_SIZE, 551, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap())))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(cmbDrzavljanstvo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtJMBG, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 10, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtIme, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtPrezime, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel6))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtEmail, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel5))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtMobilniBroj, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel7))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel8)
                            .addComponent(rbnDa)
                            .addComponent(rbnNe))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel9))
                    .addComponent(cmbOpstina, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
        );

        jLabel1.setText("FON");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jScrollPane1))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(76, 76, 76)
                        .addComponent(btnSacuvaj)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(28, 28, 28)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(btnDodaj)
                                .addGap(58, 58, 58)
                                .addComponent(btnObrisi)
                                .addGap(0, 0, Short.MAX_VALUE)))))
                .addContainerGap())
            .addGroup(layout.createSequentialGroup()
                .addGap(137, 137, 137)
                .addComponent(jLabel1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(16, 16, 16)
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnDodaj)
                    .addComponent(btnObrisi))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 98, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnSacuvaj)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnObrisiActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnObrisiActionPerformed
        int indeks = tblVakcine.getSelectedRow();
        if(indeks != -1){
            ModelTabeleVakcine mtv = (ModelTabeleVakcine) tblVakcine.getModel();
            mtv.obrisiIzTabele(indeks);
        }else{
            JOptionPane.showMessageDialog(this, "niste izabrali nista");
            return;
        }
    }//GEN-LAST:event_btnObrisiActionPerformed

    private void btnDodajActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDodajActionPerformed
        String JMBG = txtJMBG.getText();
        String ime = txtIme.getText();
        String prezime = txtPrezime.getText();
        String email = txtEmail.getText();
        String mobilniTelefon = txtMobilniBroj.getText();
        
        if(JMBG.isEmpty() || ime.isEmpty() || prezime.isEmpty() || email.isEmpty() || mobilniTelefon.isEmpty()){
            JOptionPane.showMessageDialog(this, "Sva polja moraju biti popunjena");
            return;
        }
        
        if(JMBG.length() != 13){
             JOptionPane.showMessageDialog(this, "JMBG treba da ima 13 karaktera");
            return;
        }
        
        if(!email.contains("@") || !email.contains(".")){
             JOptionPane.showMessageDialog(this, "neispravan format emaila");
            return;
        }
        
        Prijava p = new Prijava();
        p.setPrijavaID(1l);
        p.setIme(ime);
        p.setPrezime(prezime);
        p.setJMBG(JMBG);
        p.setEmail(email);
        p.setMobilniTelefon(mobilniTelefon);
        p.setDatumPrijave(new Date());
        p.setDrzavljanstvo((String) cmbDrzavljanstvo.getSelectedItem());
        p.setOpstina((Opstina) cmbOpstina.getSelectedItem());
        p.setSpecificnaOboljenja(rbnDa.isSelected());
        
        StavkaPrijave sp = new StavkaPrijave();
        sp.setPrijava(p);
        sp.setRB(0);
        DodajForma df = new DodajForma(this, true, sp);
        df.setVisible(true);
        
        ModelTabeleVakcine mtv = (ModelTabeleVakcine) tblVakcine.getModel();
        ArrayList<StavkaPrijave> listaSt = mtv.getListaStavki();
        for (StavkaPrijave stavkaPrijave : listaSt) {
            if(stavkaPrijave.getTipVakcine().equals(sp.getTipVakcine())){
                JOptionPane.showMessageDialog(this, "ne mozete uneti isti tip dva puta");
            return;
            }
        }
        
        mtv.dodajUTabelu(sp);
        
        cmbDrzavljanstvo.setEnabled(false);
        cmbOpstina.setEnabled(false);
        txtEmail.setEnabled(false);
        txtIme.setEnabled(false);
        txtJMBG.setEnabled(false);
        txtMobilniBroj.setEnabled(false);
        txtPrezime.setEnabled(false);
        rbnDa.setEnabled(false);
        rbnNe.setEnabled(false);
               
    }//GEN-LAST:event_btnDodajActionPerformed

    private void btnSacuvajActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSacuvajActionPerformed
        ModelTabeleVakcine mtv = (ModelTabeleVakcine) tblVakcine.getModel();
        
        ArrayList<StavkaPrijave> lista = mtv.getListaStavki();
        if(lista.isEmpty()){
            JOptionPane.showMessageDialog(this, "morate uneti bar jedan tip");
            return;
        }
        
        KlijentskiZahtev kz = new KlijentskiZahtev(Konstante.SACUVAJ_PRIJAVU, lista);
        Komunikacija.getInstance().posaljiZahtev(kz);
        
        boolean signal = (boolean) Komunikacija.getInstance().primiOdgovor().getOdgovor();
        
        if(signal){
            JOptionPane.showMessageDialog(this, "Uspesno sacuvano");
            mtv.resetujTabelu();
            cmbDrzavljanstvo.setEnabled(true);
            cmbOpstina.setEnabled(true);
            txtEmail.setEnabled(true);
            txtIme.setEnabled(true);
            txtJMBG.setEnabled(true);
            txtMobilniBroj.setEnabled(true);
            txtPrezime.setEnabled(true);
            rbnDa.setEnabled(true);
            rbnNe.setEnabled(true);
            return;
        }else{
            JOptionPane.showMessageDialog(this, "Neuspesno sacuvano");
            mtv.resetujTabelu();
            cmbDrzavljanstvo.setEnabled(true);
            cmbOpstina.setEnabled(true);
            txtEmail.setEnabled(true);
            txtIme.setEnabled(true);
            txtJMBG.setEnabled(true);
            txtMobilniBroj.setEnabled(true);
            txtPrezime.setEnabled(true);
            rbnDa.setEnabled(true);
            rbnNe.setEnabled(true);
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
    private javax.swing.JButton btnDodaj;
    private javax.swing.JButton btnObrisi;
    private javax.swing.JButton btnSacuvaj;
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.JComboBox cmbDrzavljanstvo;
    private javax.swing.JComboBox cmbOpstina;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JRadioButton rbnDa;
    private javax.swing.JRadioButton rbnNe;
    private javax.swing.JTable tblVakcine;
    private javax.swing.JTextField txtEmail;
    private javax.swing.JTextField txtIme;
    private javax.swing.JTextField txtJMBG;
    private javax.swing.JTextField txtMobilniBroj;
    private javax.swing.JTextField txtPrezime;
    // End of variables declaration//GEN-END:variables

    private void srediDrzavljanstvo() {
        cmbDrzavljanstvo.removeAllItems();
        cmbDrzavljanstvo.addItem("Drzavljanin Republike Srbije");
        cmbDrzavljanstvo.addItem("Strani drzavljanin sa boravkom u RS");
        cmbDrzavljanstvo.addItem("Strani drzavljanin bez bortavka u RS");
    }

    private void srediOpstine() {
        cmbOpstina.removeAllItems();
        KlijentskiZahtev kz = new KlijentskiZahtev(Konstante.VRATI_OPSTINE, null);
        Komunikacija.getInstance().posaljiZahtev(kz);
        
        ArrayList<Opstina> lista = (ArrayList<Opstina>) Komunikacija.getInstance().primiOdgovor().getOdgovor();
        for (Opstina opstina : lista) {
            cmbOpstina.addItem(opstina);
        }
    }

    private void srediTabelu() {
        ModelTabeleVakcine mtv = new ModelTabeleVakcine();
        tblVakcine.setModel(mtv);
    }
}
