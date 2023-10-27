package com.datapro.eibs.parameters.loans.access.jdbc.bean;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.math.BigDecimal;

/**
 * Jdbc Bean Class<br>
 * <br>
 * Autogenerated on 09/15/2003 04:36:13<br>
 * &nbsp;&nbsp;&nbsp; table = "CNTRLDLSBean"
*
* @author Generator
*/
public class CNTRLDLS implements java.io.Serializable {

   /**
    * The DLSKEY attribute.
   */
   protected java.lang.String DLSKEY = "";
   
   /**
    * Gets the DLSKEY value.
   */
   public java.lang.String getDLSKEY() {
      return DLSKEY.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSKEY value.
   */
   public void setDLSKEY(java.lang.String DLSKEY) {
      this.DLSKEY = DLSKEY;
   }
   /**
    * The DLSDSC attribute.
   */
   protected java.lang.String DLSDSC = "";
   
   /**
    * Gets the DLSDSC value.
   */
   public java.lang.String getDLSDSC() {
      return DLSDSC.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSDSC value.
   */
   public void setDLSDSC(java.lang.String DLSDSC) {
      this.DLSDSC = DLSDSC;
   }
   /**
    * The DLSMAX attribute.
   */
   protected java.math.BigDecimal DLSMAX = new BigDecimal("0");
   
   /**
    * Gets the DLSMAX value.
   */
   public java.math.BigDecimal getDLSMAX() {
      return DLSMAX;
   }
   
   /**
    * Sets the DLSMAX value.
   */
   public void setDLSMAX(java.math.BigDecimal DLSMAX) {
      this.DLSMAX = DLSMAX;
   }
   /**
    * The DLSMIN attribute.
   */
   protected java.math.BigDecimal DLSMIN = new BigDecimal("0");
   
   /**
    * Gets the DLSMIN value.
   */
   public java.math.BigDecimal getDLSMIN() {
      return DLSMIN;
   }
   
   /**
    * Sets the DLSMIN value.
   */
   public void setDLSMIN(java.math.BigDecimal DLSMIN) {
      this.DLSMIN = DLSMIN;
   }
   /**
    * The DLSMMT attribute.
   */
   protected java.lang.String DLSMMT = "";
   
   /**
    * Gets the DLSMMT value.
   */
   public java.lang.String getDLSMMT() {
      return DLSMMT.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSMMT value.
   */
   public void setDLSMMT(java.lang.String DLSMMT) {
      this.DLSMMT = DLSMMT;
   }
   /**
    * The DLSRTF attribute.
   */
   protected java.math.BigDecimal DLSRTF = new BigDecimal("0");
   
   /**
    * Gets the DLSRTF value.
   */
   public java.math.BigDecimal getDLSRTF() {
      return DLSRTF;
   }
   
   /**
    * Sets the DLSRTF value.
   */
   public void setDLSRTF(java.math.BigDecimal DLSRTF) {
      this.DLSRTF = DLSRTF;
   }
   /**
    * The DLSRFT attribute.
   */
   protected java.lang.String DLSRFT = "";
   
   /**
    * Gets the DLSRFT value.
   */
   public java.lang.String getDLSRFT() {
      return DLSRFT.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSRFT value.
   */
   public void setDLSRFT(java.lang.String DLSRFT) {
      this.DLSRFT = DLSRFT;
   }
   /**
    * The DLSICT attribute.
   */
   protected java.lang.String DLSICT = "";
   
   /**
    * Gets the DLSICT value.
   */
   public java.lang.String getDLSICT() {
      return DLSICT.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSICT value.
   */
   public void setDLSICT(java.lang.String DLSICT) {
      this.DLSICT = DLSICT;
   }
   /**
    * The DLSDAB attribute.
   */
   protected java.math.BigDecimal DLSDAB = new BigDecimal("0");
   
   /**
    * Gets the DLSDAB value.
   */
   public java.math.BigDecimal getDLSDAB() {
      return DLSDAB;
   }
   
   /**
    * Sets the DLSDAB value.
   */
   public void setDLSDAB(java.math.BigDecimal DLSDAB) {
      this.DLSDAB = DLSDAB;
   }
   /**
    * The DLSCUP attribute.
   */
   protected java.math.BigDecimal DLSCUP = new BigDecimal("0");
   
   /**
    * Gets the DLSCUP value.
   */
   public java.math.BigDecimal getDLSCUP() {
      return DLSCUP;
   }
   
   /**
    * Sets the DLSCUP value.
   */
   public void setDLSCUP(java.math.BigDecimal DLSCUP) {
      this.DLSCUP = DLSCUP;
   }
   /**
    * The DLSPL1 attribute.
   */
   protected java.math.BigDecimal DLSPL1 = new BigDecimal("0");
   
   /**
    * Gets the DLSPL1 value.
   */
   public java.math.BigDecimal getDLSPL1() {
      return DLSPL1;
   }
   
   /**
    * Sets the DLSPL1 value.
   */
   public void setDLSPL1(java.math.BigDecimal DLSPL1) {
      this.DLSPL1 = DLSPL1;
   }
   /**
    * The DLSPL2 attribute.
   */
   protected java.math.BigDecimal DLSPL2 = new BigDecimal("0");
   
   /**
    * Gets the DLSPL2 value.
   */
   public java.math.BigDecimal getDLSPL2() {
      return DLSPL2;
   }
   
   /**
    * Sets the DLSPL2 value.
   */
   public void setDLSPL2(java.math.BigDecimal DLSPL2) {
      this.DLSPL2 = DLSPL2;
   }
   /**
    * The DLSPL3 attribute.
   */
   protected java.math.BigDecimal DLSPL3 = new BigDecimal("0");
   
   /**
    * Gets the DLSPL3 value.
   */
   public java.math.BigDecimal getDLSPL3() {
      return DLSPL3;
   }
   
   /**
    * Sets the DLSPL3 value.
   */
   public void setDLSPL3(java.math.BigDecimal DLSPL3) {
      this.DLSPL3 = DLSPL3;
   }
   /**
    * The DLSPL4 attribute.
   */
   protected java.math.BigDecimal DLSPL4 = new BigDecimal("0");
   
   /**
    * Gets the DLSPL4 value.
   */
   public java.math.BigDecimal getDLSPL4() {
      return DLSPL4;
   }
   
   /**
    * Sets the DLSPL4 value.
   */
   public void setDLSPL4(java.math.BigDecimal DLSPL4) {
      this.DLSPL4 = DLSPL4;
   }
   /**
    * The DLSPL5 attribute.
   */
   protected java.math.BigDecimal DLSPL5 = new BigDecimal("0");
   
   /**
    * Gets the DLSPL5 value.
   */
   public java.math.BigDecimal getDLSPL5() {
      return DLSPL5;
   }
   
   /**
    * Sets the DLSPL5 value.
   */
   public void setDLSPL5(java.math.BigDecimal DLSPL5) {
      this.DLSPL5 = DLSPL5;
   }
   /**
    * The DLSPL6 attribute.
   */
   protected java.math.BigDecimal DLSPL6 = new BigDecimal("0");
   
   /**
    * Gets the DLSPL6 value.
   */
   public java.math.BigDecimal getDLSPL6() {
      return DLSPL6;
   }
   
   /**
    * Sets the DLSPL6 value.
   */
   public void setDLSPL6(java.math.BigDecimal DLSPL6) {
      this.DLSPL6 = DLSPL6;
   }
   /**
    * The DLSTCG attribute.
   */
   protected java.lang.String DLSTCG = "";
   
   /**
    * Gets the DLSTCG value.
   */
   public java.lang.String getDLSTCG() {
      return DLSTCG.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSTCG value.
   */
   public void setDLSTCG(java.lang.String DLSTCG) {
      this.DLSTCG = DLSTCG;
   }
   /**
    * The DLSPPR attribute.
   */
   protected java.lang.String DLSPPR = "";
   
   /**
    * Gets the DLSPPR value.
   */
   public java.lang.String getDLSPPR() {
      return DLSPPR.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSPPR value.
   */
   public void setDLSPPR(java.lang.String DLSPPR) {
      this.DLSPPR = DLSPPR;
   }
   /**
    * The DLSUS1 attribute.
   */
   protected java.lang.String DLSUS1 = "";
   
   /**
    * Gets the DLSUS1 value.
   */
   public java.lang.String getDLSUS1() {
      return DLSUS1.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSUS1 value.
   */
   public void setDLSUS1(java.lang.String DLSUS1) {
      this.DLSUS1 = DLSUS1;
   }
   /**
    * The DLSUS2 attribute.
   */
   protected java.lang.String DLSUS2 = "";
   
   /**
    * Gets the DLSUS2 value.
   */
   public java.lang.String getDLSUS2() {
      return DLSUS2.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSUS2 value.
   */
   public void setDLSUS2(java.lang.String DLSUS2) {
      this.DLSUS2 = DLSUS2;
   }
   /**
    * The DLSWPR attribute.
   */
   protected java.math.BigDecimal DLSWPR = new BigDecimal("0");
   
   /**
    * Gets the DLSWPR value.
   */
   public java.math.BigDecimal getDLSWPR() {
      return DLSWPR;
   }
   
   /**
    * Sets the DLSWPR value.
   */
   public void setDLSWPR(java.math.BigDecimal DLSWPR) {
      this.DLSWPR = DLSWPR;
   }
   /**
    * The DLSPBS attribute.
   */
   protected java.math.BigDecimal DLSPBS = new BigDecimal("0");
   
   /**
    * Gets the DLSPBS value.
   */
   public java.math.BigDecimal getDLSPBS() {
      return DLSPBS;
   }
   
   /**
    * Sets the DLSPBS value.
   */
   public void setDLSPBS(java.math.BigDecimal DLSPBS) {
      this.DLSPBS = DLSPBS;
   }
   /**
    * The DLSFCO attribute.
   */
   protected java.lang.String DLSFCO = "";
   
   /**
    * Gets the DLSFCO value.
   */
   public java.lang.String getDLSFCO() {
      return DLSFCO.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSFCO value.
   */
   public void setDLSFCO(java.lang.String DLSFCO) {
      this.DLSFCO = DLSFCO;
   }
   /**
    * The DLSFL1 attribute.
   */
   protected java.lang.String DLSFL1 = "";
   
   /**
    * Gets the DLSFL1 value.
   */
   public java.lang.String getDLSFL1() {
      return DLSFL1.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSFL1 value.
   */
   public void setDLSFL1(java.lang.String DLSFL1) {
      this.DLSFL1 = DLSFL1;
   }
   /**
    * The DLSFL2 attribute.
   */
   protected java.lang.String DLSFL2 = "";
   
   /**
    * Gets the DLSFL2 value.
   */
   public java.lang.String getDLSFL2() {
      return DLSFL2.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSFL2 value.
   */
   public void setDLSFL2(java.lang.String DLSFL2) {
      this.DLSFL2 = DLSFL2;
   }
   /**
    * The DLSPP1 attribute.
   */
   protected java.lang.String DLSPP1 = "";
   
   /**
    * Gets the DLSPP1 value.
   */
   public java.lang.String getDLSPP1() {
      return DLSPP1.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSPP1 value.
   */
   public void setDLSPP1(java.lang.String DLSPP1) {
      this.DLSPP1 = DLSPP1;
   }
   /**
    * The DLSPP2 attribute.
   */
   protected java.lang.String DLSPP2 = "";
   
   /**
    * Gets the DLSPP2 value.
   */
   public java.lang.String getDLSPP2() {
      return DLSPP2.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSPP2 value.
   */
   public void setDLSPP2(java.lang.String DLSPP2) {
      this.DLSPP2 = DLSPP2;
   }
   /**
    * The DLSPP3 attribute.
   */
   protected java.lang.String DLSPP3 = "";
   
   /**
    * Gets the DLSPP3 value.
   */
   public java.lang.String getDLSPP3() {
      return DLSPP3.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSPP3 value.
   */
   public void setDLSPP3(java.lang.String DLSPP3) {
      this.DLSPP3 = DLSPP3;
   }
   /**
    * The DLSPP4 attribute.
   */
   protected java.lang.String DLSPP4 = "";
   
   /**
    * Gets the DLSPP4 value.
   */
   public java.lang.String getDLSPP4() {
      return DLSPP4.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSPP4 value.
   */
   public void setDLSPP4(java.lang.String DLSPP4) {
      this.DLSPP4 = DLSPP4;
   }
   /**
    * The DLSPP5 attribute.
   */
   protected java.lang.String DLSPP5 = "";
   
   /**
    * Gets the DLSPP5 value.
   */
   public java.lang.String getDLSPP5() {
      return DLSPP5.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSPP5 value.
   */
   public void setDLSPP5(java.lang.String DLSPP5) {
      this.DLSPP5 = DLSPP5;
   }
   /**
    * The DLSPP6 attribute.
   */
   protected java.lang.String DLSPP6 = "";
   
   /**
    * Gets the DLSPP6 value.
   */
   public java.lang.String getDLSPP6() {
      return DLSPP6.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSPP6 value.
   */
   public void setDLSPP6(java.lang.String DLSPP6) {
      this.DLSPP6 = DLSPP6;
   }
   /**
    * The DLSMPA attribute.
   */
   protected java.math.BigDecimal DLSMPA = new BigDecimal("0");
   
   /**
    * Gets the DLSMPA value.
   */
   public java.math.BigDecimal getDLSMPA() {
      return DLSMPA;
   }
   
   /**
    * Sets the DLSMPA value.
   */
   public void setDLSMPA(java.math.BigDecimal DLSMPA) {
      this.DLSMPA = DLSMPA;
   }
   /**
    * The DLSPR1 attribute.
   */
   protected java.math.BigDecimal DLSPR1 = new BigDecimal("0");
   
   /**
    * Gets the DLSPR1 value.
   */
   public java.math.BigDecimal getDLSPR1() {
      return DLSPR1;
   }
   
   /**
    * Sets the DLSPR1 value.
   */
   public void setDLSPR1(java.math.BigDecimal DLSPR1) {
      this.DLSPR1 = DLSPR1;
   }
   /**
    * The DLSPR2 attribute.
   */
   protected java.math.BigDecimal DLSPR2 = new BigDecimal("0");
   
   /**
    * Gets the DLSPR2 value.
   */
   public java.math.BigDecimal getDLSPR2() {
      return DLSPR2;
   }
   
   /**
    * Sets the DLSPR2 value.
   */
   public void setDLSPR2(java.math.BigDecimal DLSPR2) {
      this.DLSPR2 = DLSPR2;
   }
   /**
    * The DLSPR3 attribute.
   */
   protected java.math.BigDecimal DLSPR3 = new BigDecimal("0");
   
   /**
    * Gets the DLSPR3 value.
   */
   public java.math.BigDecimal getDLSPR3() {
      return DLSPR3;
   }
   
   /**
    * Sets the DLSPR3 value.
   */
   public void setDLSPR3(java.math.BigDecimal DLSPR3) {
      this.DLSPR3 = DLSPR3;
   }
   /**
    * The DLSPR4 attribute.
   */
   protected java.math.BigDecimal DLSPR4 = new BigDecimal("0");
   
   /**
    * Gets the DLSPR4 value.
   */
   public java.math.BigDecimal getDLSPR4() {
      return DLSPR4;
   }
   
   /**
    * Sets the DLSPR4 value.
   */
   public void setDLSPR4(java.math.BigDecimal DLSPR4) {
      this.DLSPR4 = DLSPR4;
   }
   /**
    * The DLSPR5 attribute.
   */
   protected java.math.BigDecimal DLSPR5 = new BigDecimal("0");
   
   /**
    * Gets the DLSPR5 value.
   */
   public java.math.BigDecimal getDLSPR5() {
      return DLSPR5;
   }
   
   /**
    * Sets the DLSPR5 value.
   */
   public void setDLSPR5(java.math.BigDecimal DLSPR5) {
      this.DLSPR5 = DLSPR5;
   }
   /**
    * The DLSPR6 attribute.
   */
   protected java.math.BigDecimal DLSPR6 = new BigDecimal("0");
   
   /**
    * Gets the DLSPR6 value.
   */
   public java.math.BigDecimal getDLSPR6() {
      return DLSPR6;
   }
   
   /**
    * Sets the DLSPR6 value.
   */
   public void setDLSPR6(java.math.BigDecimal DLSPR6) {
      this.DLSPR6 = DLSPR6;
   }
   /**
    * The DLSCCR attribute.
   */
   protected java.lang.String DLSCCR = "";
   
   /**
    * Gets the DLSCCR value.
   */
   public java.lang.String getDLSCCR() {
      return DLSCCR.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSCCR value.
   */
   public void setDLSCCR(java.lang.String DLSCCR) {
      this.DLSCCR = DLSCCR;
   }
   /**
    * The DLSIR1 attribute.
   */
   protected java.math.BigDecimal DLSIR1 = new BigDecimal("0");
   
   /**
    * Gets the DLSIR1 value.
   */
   public java.math.BigDecimal getDLSIR1() {
      return DLSIR1;
   }
   
   /**
    * Sets the DLSIR1 value.
   */
   public void setDLSIR1(java.math.BigDecimal DLSIR1) {
      this.DLSIR1 = DLSIR1;
   }
   /**
    * The DLSIR2 attribute.
   */
   protected java.math.BigDecimal DLSIR2 = new BigDecimal("0");
   
   /**
    * Gets the DLSIR2 value.
   */
   public java.math.BigDecimal getDLSIR2() {
      return DLSIR2;
   }
   
   /**
    * Sets the DLSIR2 value.
   */
   public void setDLSIR2(java.math.BigDecimal DLSIR2) {
      this.DLSIR2 = DLSIR2;
   }
   /**
    * The DLSIR3 attribute.
   */
   protected java.math.BigDecimal DLSIR3 = new BigDecimal("0");
   
   /**
    * Gets the DLSIR3 value.
   */
   public java.math.BigDecimal getDLSIR3() {
      return DLSIR3;
   }
   
   /**
    * Sets the DLSIR3 value.
   */
   public void setDLSIR3(java.math.BigDecimal DLSIR3) {
      this.DLSIR3 = DLSIR3;
   }
   /**
    * The DLSER1 attribute.
   */
   protected java.math.BigDecimal DLSER1 = new BigDecimal("0");
   
   /**
    * Gets the DLSER1 value.
   */
   public java.math.BigDecimal getDLSER1() {
      return DLSER1;
   }
   
   /**
    * Sets the DLSER1 value.
   */
   public void setDLSER1(java.math.BigDecimal DLSER1) {
      this.DLSER1 = DLSER1;
   }
   /**
    * The DLSER2 attribute.
   */
   protected java.math.BigDecimal DLSER2 = new BigDecimal("0");
   
   /**
    * Gets the DLSER2 value.
   */
   public java.math.BigDecimal getDLSER2() {
      return DLSER2;
   }
   
   /**
    * Sets the DLSER2 value.
   */
   public void setDLSER2(java.math.BigDecimal DLSER2) {
      this.DLSER2 = DLSER2;
   }
   /**
    * The DLSER3 attribute.
   */
   protected java.math.BigDecimal DLSER3 = new BigDecimal("0");
   
   /**
    * Gets the DLSER3 value.
   */
   public java.math.BigDecimal getDLSER3() {
      return DLSER3;
   }
   
   /**
    * Sets the DLSER3 value.
   */
   public void setDLSER3(java.math.BigDecimal DLSER3) {
      this.DLSER3 = DLSER3;
   }
   /**
    * The DLSPT1 attribute.
   */
   protected java.math.BigDecimal DLSPT1 = new BigDecimal("0");
   
   /**
    * Gets the DLSPT1 value.
   */
   public java.math.BigDecimal getDLSPT1() {
      return DLSPT1;
   }
   
   /**
    * Sets the DLSPT1 value.
   */
   public void setDLSPT1(java.math.BigDecimal DLSPT1) {
      this.DLSPT1 = DLSPT1;
   }
   /**
    * The DLSPT2 attribute.
   */
   protected java.math.BigDecimal DLSPT2 = new BigDecimal("0");
   
   /**
    * Gets the DLSPT2 value.
   */
   public java.math.BigDecimal getDLSPT2() {
      return DLSPT2;
   }
   
   /**
    * Sets the DLSPT2 value.
   */
   public void setDLSPT2(java.math.BigDecimal DLSPT2) {
      this.DLSPT2 = DLSPT2;
   }
   /**
    * The DLSPT3 attribute.
   */
   protected java.math.BigDecimal DLSPT3 = new BigDecimal("0");
   
   /**
    * Gets the DLSPT3 value.
   */
   public java.math.BigDecimal getDLSPT3() {
      return DLSPT3;
   }
   
   /**
    * Sets the DLSPT3 value.
   */
   public void setDLSPT3(java.math.BigDecimal DLSPT3) {
      this.DLSPT3 = DLSPT3;
   }
   /**
    * The DLSGR1 attribute.
   */
   protected java.math.BigDecimal DLSGR1 = new BigDecimal("0");
   
   /**
    * Gets the DLSGR1 value.
   */
   public java.math.BigDecimal getDLSGR1() {
      return DLSGR1;
   }
   
   /**
    * Sets the DLSGR1 value.
   */
   public void setDLSGR1(java.math.BigDecimal DLSGR1) {
      this.DLSGR1 = DLSGR1;
   }
   /**
    * The DLSGR2 attribute.
   */
   protected java.math.BigDecimal DLSGR2 = new BigDecimal("0");
   
   /**
    * Gets the DLSGR2 value.
   */
   public java.math.BigDecimal getDLSGR2() {
      return DLSGR2;
   }
   
   /**
    * Sets the DLSGR2 value.
   */
   public void setDLSGR2(java.math.BigDecimal DLSGR2) {
      this.DLSGR2 = DLSGR2;
   }
   /**
    * The DLSGR3 attribute.
   */
   protected java.math.BigDecimal DLSGR3 = new BigDecimal("0");
   
   /**
    * Gets the DLSGR3 value.
   */
   public java.math.BigDecimal getDLSGR3() {
      return DLSGR3;
   }
   
   /**
    * Sets the DLSGR3 value.
   */
   public void setDLSGR3(java.math.BigDecimal DLSGR3) {
      this.DLSGR3 = DLSGR3;
   }
   /**
    * The DLSPMD attribute.
   */
   protected java.math.BigDecimal DLSPMD = new BigDecimal("0");
   
   /**
    * Gets the DLSPMD value.
   */
   public java.math.BigDecimal getDLSPMD() {
      return DLSPMD;
   }
   
   /**
    * Sets the DLSPMD value.
   */
   public void setDLSPMD(java.math.BigDecimal DLSPMD) {
      this.DLSPMD = DLSPMD;
   }
   /**
    * The DLSPC1 attribute.
   */
   protected java.math.BigDecimal DLSPC1 = new BigDecimal("0");
   
   /**
    * Gets the DLSPC1 value.
   */
   public java.math.BigDecimal getDLSPC1() {
      return DLSPC1;
   }
   
   /**
    * Sets the DLSPC1 value.
   */
   public void setDLSPC1(java.math.BigDecimal DLSPC1) {
      this.DLSPC1 = DLSPC1;
   }
   /**
    * The DLSPC2 attribute.
   */
   protected java.math.BigDecimal DLSPC2 = new BigDecimal("0");
   
   /**
    * Gets the DLSPC2 value.
   */
   public java.math.BigDecimal getDLSPC2() {
      return DLSPC2;
   }
   
   /**
    * Sets the DLSPC2 value.
   */
   public void setDLSPC2(java.math.BigDecimal DLSPC2) {
      this.DLSPC2 = DLSPC2;
   }
   public String toString() {
      StringBuffer results = new StringBuffer();

      results.append(getClass().getName() + "\n");
      results.append("\tDLSKEY=" + DLSKEY + "\n");
      results.append("\tDLSDSC=" + DLSDSC + "\n");
      results.append("\tDLSMAX=" + DLSMAX + "\n");
      results.append("\tDLSMIN=" + DLSMIN + "\n");
      results.append("\tDLSMMT=" + DLSMMT + "\n");
      results.append("\tDLSRTF=" + DLSRTF + "\n");
      results.append("\tDLSRFT=" + DLSRFT + "\n");
      results.append("\tDLSICT=" + DLSICT + "\n");
      results.append("\tDLSDAB=" + DLSDAB + "\n");
      results.append("\tDLSCUP=" + DLSCUP + "\n");
      results.append("\tDLSPL1=" + DLSPL1 + "\n");
      results.append("\tDLSPL2=" + DLSPL2 + "\n");
      results.append("\tDLSPL3=" + DLSPL3 + "\n");
      results.append("\tDLSPL4=" + DLSPL4 + "\n");
      results.append("\tDLSPL5=" + DLSPL5 + "\n");
      results.append("\tDLSPL6=" + DLSPL6 + "\n");
      results.append("\tDLSTCG=" + DLSTCG + "\n");
      results.append("\tDLSPPR=" + DLSPPR + "\n");
      results.append("\tDLSUS1=" + DLSUS1 + "\n");
      results.append("\tDLSUS2=" + DLSUS2 + "\n");
      results.append("\tDLSWPR=" + DLSWPR + "\n");
      results.append("\tDLSPBS=" + DLSPBS + "\n");
      results.append("\tDLSFCO=" + DLSFCO + "\n");
      results.append("\tDLSFL1=" + DLSFL1 + "\n");
      results.append("\tDLSFL2=" + DLSFL2 + "\n");
      results.append("\tDLSPP1=" + DLSPP1 + "\n");
      results.append("\tDLSPP2=" + DLSPP2 + "\n");
      results.append("\tDLSPP3=" + DLSPP3 + "\n");
      results.append("\tDLSPP4=" + DLSPP4 + "\n");
      results.append("\tDLSPP5=" + DLSPP5 + "\n");
      results.append("\tDLSPP6=" + DLSPP6 + "\n");
      results.append("\tDLSMPA=" + DLSMPA + "\n");
      results.append("\tDLSPR1=" + DLSPR1 + "\n");
      results.append("\tDLSPR2=" + DLSPR2 + "\n");
      results.append("\tDLSPR3=" + DLSPR3 + "\n");
      results.append("\tDLSPR4=" + DLSPR4 + "\n");
      results.append("\tDLSPR5=" + DLSPR5 + "\n");
      results.append("\tDLSPR6=" + DLSPR6 + "\n");
      results.append("\tDLSCCR=" + DLSCCR + "\n");
      results.append("\tDLSIR1=" + DLSIR1 + "\n");
      results.append("\tDLSIR2=" + DLSIR2 + "\n");
      results.append("\tDLSIR3=" + DLSIR3 + "\n");
      results.append("\tDLSER1=" + DLSER1 + "\n");
      results.append("\tDLSER2=" + DLSER2 + "\n");
      results.append("\tDLSER3=" + DLSER3 + "\n");
      results.append("\tDLSPT1=" + DLSPT1 + "\n");
      results.append("\tDLSPT2=" + DLSPT2 + "\n");
      results.append("\tDLSPT3=" + DLSPT3 + "\n");
      results.append("\tDLSGR1=" + DLSGR1 + "\n");
      results.append("\tDLSGR2=" + DLSGR2 + "\n");
      results.append("\tDLSGR3=" + DLSGR3 + "\n");
      results.append("\tDLSPMD=" + DLSPMD + "\n");
      results.append("\tDLSPC1=" + DLSPC1 + "\n");
      results.append("\tDLSPC2=" + DLSPC2 + "\n");

      return results.toString();
   }

}