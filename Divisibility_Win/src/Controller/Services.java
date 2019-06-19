/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Domain.Manage_Clips;

/**
 *
 * @author geovanny
 */
public class Services {
    
    private Manage_Clips manage_clips;
    
    

    public Services(Manage_Clips manage_clips) {
        this.manage_clips = manage_clips;
    }
    
    public String getNumbersDivisibility(int number) {
        return manage_clips.getAnswer(number);
    }
    
}
