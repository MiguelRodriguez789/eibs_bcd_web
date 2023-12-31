package com.datapro.eibs.images.vo;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import com.datapro.eibs.access.VOSuper;


/**
 * Jdbc Bean Class<br>
 * <br>
 * Autogenerated on 01/20/2009 10:59:44<br>
 * &nbsp;&nbsp;&nbsp; table = "SCNDOCTBLBean"
*
* @author Generator
*/
public class SCNDOCTBL extends VOSuper {

   /**
    * The TBLTYP attribute.
   */
   protected java.lang.String TBLTYP = "";
   
   /**
    * Gets the TBLTYP value.
   */
   public java.lang.String getTBLTYP() {
      return TBLTYP.toUpperCase().trim();
   }
   
   /**
    * Sets the TBLTYP value.
   */
   public void setTBLTYP(java.lang.String TBLTYP) {
      this.TBLTYP = TBLTYP;
   }
   /**
    * The TBLNUM attribute.
   */
   protected java.math.BigDecimal TBLNUM = null;
   
   /**
    * Gets the TBLNUM value.
   */
   public java.math.BigDecimal getTBLNUM() {
      return TBLNUM;
   }
   
   /**
    * Sets the TBLNUM value.
   */
   public void setTBLNUM(java.math.BigDecimal TBLNUM) {
      this.TBLNUM = TBLNUM;
   }
   /**
    * The TBLTBN attribute.
   */
   protected java.lang.String TBLTBN = "";
   
   /**
    * Gets the TBLTBN value.
   */
   public java.lang.String getTBLTBN() {
      return TBLTBN.toUpperCase().trim();
   }
   
   /**
    * Sets the TBLTBN value.
   */
   public void setTBLTBN(java.lang.String TBLTBN) {
      this.TBLTBN = TBLTBN;
   }
   /**
    * The TBLSEQ attribute.
   */
   protected java.math.BigDecimal TBLSEQ = null;
   
   /**
    * Gets the TBLSEQ value.
   */
   public java.math.BigDecimal getTBLSEQ() {
      return TBLSEQ;
   }
   
   /**
    * Sets the TBLSEQ value.
   */
   public void setTBLSEQ(java.math.BigDecimal TBLSEQ) {
      this.TBLSEQ = TBLSEQ;
   }
   /**
    * The TBLSSQ attribute.
   */
   protected java.math.BigDecimal TBLSSQ = null;
   
   /**
    * Gets the TBLSSQ value.
   */
   public java.math.BigDecimal getTBLSSQ() {
      return TBLSSQ;
   }
   
   /**
    * Sets the TBLSSQ value.
   */
   public void setTBLSSQ(java.math.BigDecimal TBLSSQ) {
      this.TBLSSQ = TBLSSQ;
   }
   /**
    * The TBLPAG attribute.
   */
   protected java.math.BigDecimal TBLPAG = null;
   
   /**
    * Gets the TBLPAG value.
   */
   public java.math.BigDecimal getTBLPAG() {
      return TBLPAG;
   }
   
   /**
    * Sets the TBLPAG value.
   */
   public void setTBLPAG(java.math.BigDecimal TBLPAG) {
      this.TBLPAG = TBLPAG;
   }
   /**
    * The TBLUID attribute.
   */
   protected java.math.BigDecimal TBLUID = null;
   
   /**
    * Gets the TBLUID value.
   */
   public java.math.BigDecimal getTBLUID() {
      return TBLUID;
   }
   
   /**
    * Sets the TBLUID value.
   */
   public void setTBLUID(java.math.BigDecimal TBLUID) {
      this.TBLUID = TBLUID;
   }
   /**
    * The TBLDTY attribute.
   */
   protected java.lang.String TBLDTY = "";
   
   /**
    * Gets the TBLDTY value.
   */
   public java.lang.String getTBLDTY() {
      return TBLDTY.toUpperCase().trim();
   }
   
   /**
    * Sets the TBLDTY value.
   */
   public void setTBLDTY(java.lang.String TBLDTY) {
      this.TBLDTY = TBLDTY;
   }
   /**
    * The TBLDSC attribute.
   */
   protected java.lang.String TBLDSC = "";
   
   /**
    * Gets the TBLDSC value.
   */
   public java.lang.String getTBLDSC() {
      return TBLDSC.toUpperCase().trim();
   }
   
   /**
    * Sets the TBLDSC value.
   */
   public void setTBLDSC(java.lang.String TBLDSC) {
      this.TBLDSC = TBLDSC;
   }
   /**
    * The TBLTMS attribute.
   */
   protected Timestamp TBLTMS = null;
   
   /**
    * Gets the TBLTMS value.
   */
   public Timestamp getTBLTMS() {
      return TBLTMS;
   }
   
   /**
    * Sets the TBLTMS value.
   */
   public void setTBLTMS(Timestamp TBLTMS) {
      this.TBLTMS = TBLTMS;
   }
   /**
    * The TBLLMU attribute.
   */
   protected java.lang.String TBLLMU = "";
   
   /**
    * Gets the TBLLMU value.
   */
   public java.lang.String getTBLLMU() {
      return TBLLMU.toUpperCase().trim();
   }
   
   /**
    * Sets the TBLLMU value.
   */
   public void setTBLLMU(java.lang.String TBLLMU) {
      this.TBLLMU = TBLLMU;
   }
   /**
    * The TBLLMD attribute.
   */
   protected java.math.BigDecimal TBLLMD = null;
   
   /**
    * Gets the TBLLMD value.
   */
   public java.math.BigDecimal getTBLLMD() {
      return TBLLMD;
   }
   
   /**
    * Sets the TBLLMD value.
   */
   public void setTBLLMD(java.math.BigDecimal TBLLMD) {
      this.TBLLMD = TBLLMD;
   }
   /**
    * The TBLLMM attribute.
   */
   protected java.math.BigDecimal TBLLMM = null;
   
   /**
    * Gets the TBLLMM value.
   */
   public java.math.BigDecimal getTBLLMM() {
      return TBLLMM;
   }
   
   /**
    * Sets the TBLLMM value.
   */
   public void setTBLLMM(java.math.BigDecimal TBLLMM) {
      this.TBLLMM = TBLLMM;
   }
   /**
    * The TBLLMY attribute.
   */
   protected java.math.BigDecimal TBLLMY = null;
   
   /**
    * Gets the TBLLMY value.
   */
   public java.math.BigDecimal getTBLLMY() {
      return TBLLMY;
   }
   
   /**
    * Sets the TBLLMY value.
   */
   public void setTBLLMY(java.math.BigDecimal TBLLMY) {
      this.TBLLMY = TBLLMY;
   }
   /**
    * The TBLCND attribute.
   */
   protected java.lang.String TBLCND = "";
   
   /**
    * Gets the TBLCND value.
   */
   public java.lang.String getTBLCND() {
      return TBLCND.toUpperCase().trim();
   }
   
   /**
    * Sets the TBLCND value.
   */
   public void setTBLCND(java.lang.String TBLCND) {
      this.TBLCND = TBLCND;
   }

   /**
    * The TBLSTS attribute.
   */
   protected java.lang.String TBLSTS = "";
   
   public java.lang.String getTBLSTS() {
		return TBLSTS;
	}

	public void setTBLSTS(java.lang.String tblsts) {
		TBLSTS = tblsts;
	}

	/**
	    * The TBLRUL attribute.
	   */
	   protected java.lang.String TBLRUL = "";
	   
	   public java.lang.String getTBLRUL() {
			return TBLRUL;
		}

		public void setTBLRUL(java.lang.String tblrul) {
			TBLRUL = tblrul;
		}
		
		   /**
		    * The TBLIDT attribute.
		   */
		   protected java.lang.String TBLIDT = null;
		   
		   /**
		    * Gets the TBLIDT value.
		   */
		   public java.lang.String getTBLIDT() {
		      return TBLIDT;
		   }
		   
		   /**
		    * Sets the TBLIDT value.
		   */
		   public void setTBLIDT(java.lang.String TBLIDT) {
		      this.TBLIDT = TBLIDT;
		   }
		   /**
		    * The TBLEDT attribute.
		   */
		   protected java.lang.String TBLEDT = null;
		   
		   /**
		    * Gets the TBLEDT value.
		   */
		   public java.lang.String getTBLEDT() {
		      return TBLEDT;
		   }
		   
		   /**
		    * Sets the TBLEDT value.
		   */
		   public void setTBLEDT(java.lang.String TBLEDT) {
		      this.TBLEDT = TBLEDT;
		   }
		      
   public String toString() {
      StringBuffer results = new StringBuffer();

      results.append(getClass().getName() + "\n");
      results.append("\tTBLTYP=" + TBLTYP + "\n");
      results.append("\tTBLNUM=" + TBLNUM + "\n");
      results.append("\tTBLTBN=" + TBLTBN + "\n");
      results.append("\tTBLSEQ=" + TBLSEQ + "\n");
      results.append("\tTBLSSQ=" + TBLSSQ + "\n");
      results.append("\tTBLPAG=" + TBLPAG + "\n");
      results.append("\tTBLUID=" + TBLUID + "\n");
      results.append("\tTBLDTY=" + TBLDTY + "\n");
      results.append("\tTBLDSC=" + TBLDSC + "\n");
      results.append("\tTBLTMS=" + TBLTMS + "\n");
      results.append("\tTBLLMU=" + TBLLMU + "\n");
      results.append("\tTBLLMD=" + TBLLMD + "\n");
      results.append("\tTBLLMM=" + TBLLMM + "\n");
      results.append("\tTBLLMY=" + TBLLMY + "\n");
      results.append("\tTBLCND=" + TBLCND + "\n");
      results.append("\tTBLSTS=" + TBLSTS + "\n");
      results.append("\tTBLSTS=" + TBLRUL + "\n");
      results.append("\tTBLIDT=" + TBLIDT + "\n");
      results.append("\tTBLEDT=" + TBLEDT + "\n");

      return results.toString();
   }


}