/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package divisibility;

import Controller.Services;
import Domain.Manage_Clips;
import View.ViewDivisibility;

/**
 *
 * @author geovanny
 */
public class Divisibility {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Manage_Clips manage_Clips = new Manage_Clips();
        Services services = new Services(manage_Clips);
        ViewDivisibility interfaz = new ViewDivisibility(manage_Clips, services);
    }
    
}
