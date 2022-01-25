/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forme;

import domen.Laborant;
import domen.Zahtev;
import java.awt.HeadlessException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.swing.JOptionPane;
import kom.Komunikacija;
import kons.Konstante;
import modeli.ModelTabeleZahtevi;
import transferObjekat.KlijentskiZahtev;

/**
 *
 * @author Gogic
 */
public class GlavnaKlijentskaForma extends javax.swing.JFrame {
    Laborant laborant;
    /**
     * Creates new form GlavnaKlijentskaForma
     */
    public GlavnaKlijentskaForma() {
        initComponents();
    }

    public GlavnaKlijentskaForma(Laborant laborant) throws HeadlessException {
        this.laborant = laborant;
        initComponents();
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

        jScrollPane1 = new javax.swing.JScrollPane();
        tblTestovi = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        btnIzmeni = new javax.swing.JButton();
        btnSacuvaj = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Klijentski program");

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

        jLabel1.setText("Republika Srbija institut BATUT");

        btnIzmeni.setText("Izmeni izabrani zahtev");
        btnIzmeni.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnIzmeniActionPerformed(evt);
            }
        });

        btnSacuvaj.setText("Sacuvaj obradjene zahteve");
        btnSacuvaj.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSacuvajActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 484, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(18, 18, 18)
                                .addComponent(jLabel1))
                            .addGroup(layout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(btnIzmeni)))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(btnSacuvaj)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(32, 32, 32)
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 179, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(btnIzmeni)
                .addGap(18, 18, 18)
                .addComponent(btnSacuvaj)
                .addGap(20, 20, 20))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnIzmeniActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnIzmeniActionPerformed
       if(tblTestovi.getSelectedRow() < 0){
           JOptionPane.showMessageDialog(this, "morate izabrati zahtev");
           return;
       }
        ModelTabeleZahtevi mtz = (ModelTabeleZahtevi) tblTestovi.getModel();
        ArrayList<Zahtev> listaZahteva = mtz.getListaZahteva();
        IzmeniZahtevForma izf = new IzmeniZahtevForma(this, true, listaZahteva.get(tblTestovi.getSelectedRow()));
        listaZahteva.get(tblTestovi.getSelectedRow()).setLaborant(laborant);
       
        listaZahteva.get(tblTestovi.getSelectedRow()).setDatumVremeRezultata(new Date());
        izf.setVisible(true);
        mtz.osvezi();
       
    }//GEN-LAST:event_btnIzmeniActionPerformed

    private void btnSacuvajActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSacuvajActionPerformed
        ModelTabeleZahtevi mtz = (ModelTabeleZahtevi) tblTestovi.getModel();
        ArrayList<Zahtev> listaSvihZahteva = mtz.getListaZahteva();
        ArrayList <Zahtev> listaObradjenih = new ArrayList<>();
        
        for (Zahtev zahtev : listaSvihZahteva) {
            if(zahtev.getStatus().equals("Obradjen")){
            
                listaObradjenih.add(zahtev);
            }
            
        }
        if(listaObradjenih.isEmpty()){
            JOptionPane.showMessageDialog(this, "niste obradili nijedan zahtev");
            return;
        }
        
          KlijentskiZahtev kz = new KlijentskiZahtev(Konstante.SACUVAJ_ZAHTEVE, listaObradjenih);
          Komunikacija.getInstance().posaljiZahtev(kz);
          
          boolean signal = (boolean) Komunikacija.getInstance().primiOdgovor().getOdgovor();
          if(signal){
             JOptionPane.showMessageDialog(this, "Uspesno sacuvano");
             srediTabelu();
          }else{
              JOptionPane.showMessageDialog(this, "Neuspesno sacuvano");
          }
        
    }//GEN-LAST:event_btnSacuvajActionPerformed

    /**
     * @param args the command line arguments
     */
   

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnIzmeni;
    private javax.swing.JButton btnSacuvaj;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblTestovi;
    // End of variables declaration//GEN-END:variables

    private void srediTabelu() {
        ModelTabeleZahtevi mtz = new ModelTabeleZahtevi();
        tblTestovi.setModel(mtz);
        
        KlijentskiZahtev kz = new KlijentskiZahtev(Konstante.VRATI_ZAHTEVE, null);
        Komunikacija.getInstance().posaljiZahtev(kz);
        
        ArrayList<Zahtev> listaZahteva = (ArrayList<Zahtev>) Komunikacija.getInstance().primiOdgovor().getOdgovor();
        
        mtz.setListaZahteva(listaZahteva);
    }
}
