/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forme;

import java.awt.event.ActionEvent;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.DatePicker;
import javax.swing.JOptionPane;

/**
 * FXML Controller class
 *
 * @author Gogic
 */
public class DatumController implements Initializable {

    @FXML
    private DatePicker dpDatum;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    } 
    
    private void sacuvajDatum (ActionEvent event){
        LocalDate datum = dpDatum.getValue();
        System.out.println(datum.toString());
    }
    
}
