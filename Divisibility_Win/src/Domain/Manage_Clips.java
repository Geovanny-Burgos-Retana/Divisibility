/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

import net.sf.clipsrules.jni.Environment;
import net.sf.clipsrules.jni.PrimitiveValue;

/**
 *
 * @author geovanny
 */
public class Manage_Clips {
    private Environment clips = new Environment();
    private String file = "Divisibility.CLP";

    public Manage_Clips() {
        this.clips.load(file);
    }    
    
    /**
     * @return the clips
     */
    public Environment getClips() {
        return clips;
    }

    /**
     * @param clips the clips to set
     */
    public void setClips(Environment clips) {
        this.clips = clips;
    }

    /**
     * @return the file
     */
    public String getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(String file) {
        this.file = file;
        this.clips.load(file);
    }
    
    public String getAnswer(int number) {
        System.out.println("(assert(value " + number + "))");
        
        this.clips.eval("(assert(value " + number + "))");
        
        this.clips.run();

        this.clips.reset();
        
        return "";
    }
    
}
