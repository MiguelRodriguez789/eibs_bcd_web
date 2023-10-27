package com.datapro.eibs.security.bean;

import com.datapro.eibs.security.bean.CNTRLPVL;

/**
 * @author ogarcia
 *
 */
public class CNTRLPVLNME extends CNTRLPVL {

   /**
    * The CNODSC attribute.
   */
   protected java.lang.String CNODSC = "";
   
   /**
    * Gets the CNODSC value.
   */
   public java.lang.String getCNODSC() {
      return CNODSC.toUpperCase().trim();
   }
   
   /**
    * Sets the CNODSC value.
   */
   public void setCNODSC(java.lang.String CNODSC) {
      this.CNODSC = CNODSC;
   }

   /**
    * The CNOF04 attribute.
   */
   protected java.lang.String CNOF04 = "";
   
   /**
    * Gets the CNOF04 value.
   */
   public java.lang.String getCNOF04() {
      return CNOF04.toUpperCase().trim();
   }
   
   /**
    * Sets the CNOF04 value.
   */
   public void setCNOF04(java.lang.String CNOF04) {
      this.CNOF04 = CNOF04;
   }

}
