package com.datapro.eibs.security.bean;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 * Jdbc Bean Class<br>
 * <br>
 * Autogenerated on 03/27/2003 10:29:04<br>
 * &nbsp;&nbsp;&nbsp; table = "CNTRLDBABean"
*
* @author Generator
*/
public class CNTRLDBA implements java.io.Serializable {

   /**
    * The DBAUSR attribute.
   */
   protected java.lang.String DBAUSR = "";
   
   /**
    * Gets the DBAUSR value.
   */
   public java.lang.String getDBAUSR() {
      return DBAUSR.toUpperCase().trim();
   }
   
   /**
    * Sets the DBAUSR value.
   */
   public void setDBAUSR(java.lang.String DBAUSR) {
      this.DBAUSR = DBAUSR;
   }
   /**
    * The DBABNK attribute.
   */
   protected java.lang.String DBABNK = "";
   
   /**
    * Gets the DBABNK value.
   */
   public java.lang.String getDBABNK() {
      return DBABNK.toUpperCase().trim();
   }
   
   /**
    * Sets the DBABNK value.
   */
   public void setDBABNK(java.lang.String DBABNK) {
      this.DBABNK = DBABNK;
   }
   /**
    * The DBABRN attribute.
   */
   protected java.math.BigDecimal DBABRN = new BigDecimal("0");
   
   /**
    * Gets the DBABRN value.
   */
   public java.math.BigDecimal getDBABRN() {
      return DBABRN;
   }
   
   /**
    * Sets the DBABRN value.
   */
   public void setDBABRN(java.math.BigDecimal DBABRN) {
      this.DBABRN = DBABRN;
   }
   /**
    * The DBAALL attribute.
   */
   protected java.lang.String DBAALL = "";
   
   /**
    * Gets the DBAALL value.
   */
   public java.lang.String getDBAALL() {
      return DBAALL.toUpperCase().trim();
   }
   
   /**
    * Sets the DBAALL value.
   */
   public void setDBAALL(java.lang.String DBAALL) {
      this.DBAALL = DBAALL;
   }
   public String toString() {
      StringBuffer results = new StringBuffer();

      results.append(getClass().getName() + "\n");
      results.append("\tDBAUSR=" + DBAUSR + "\n");
      results.append("\tDBABNK=" + DBABNK + "\n");
      results.append("\tDBABRN=" + DBABRN + "\n");
      results.append("\tDBAALL=" + DBAALL + "\n");

      return results.toString();
   }

}