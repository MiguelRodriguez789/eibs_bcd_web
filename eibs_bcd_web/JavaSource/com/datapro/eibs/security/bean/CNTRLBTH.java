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
 * Autogenerated on 09/09/2003 04:53:52<br>
 * &nbsp;&nbsp;&nbsp; table = "CNTRLBTHBean"
*
* @author Generator
*/
public class CNTRLBTH implements java.io.Serializable {

   /**
    * The BTHKEY attribute.
   */
   protected java.lang.String BTHKEY = "";
   
   /**
    * Gets the BTHKEY value.
   */
   public java.lang.String getBTHKEY() {
      return BTHKEY.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHKEY value.
   */
   public void setBTHKEY(java.lang.String BTHKEY) {
      this.BTHKEY = BTHKEY;
   }
   /**
    * The BTHF01 attribute.
   */
   protected java.lang.String BTHF01 = "";
   
   /**
    * Gets the BTHF01 value.
   */
   public java.lang.String getBTHF01() {
      return BTHF01.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHF01 value.
   */
   public void setBTHF01(java.lang.String BTHF01) {
      this.BTHF01 = BTHF01;
   }
   /**
    * The BTHFB1 attribute.
   */
   protected java.math.BigDecimal BTHFB1 = new BigDecimal("0");
   
   /**
    * Gets the BTHFB1 value.
   */
   public java.math.BigDecimal getBTHFB1() {
      return BTHFB1;
   }
   
   /**
    * Sets the BTHFB1 value.
   */
   public void setBTHFB1(java.math.BigDecimal BTHFB1) {
      this.BTHFB1 = BTHFB1;
   }
   /**
    * The BTHTB1 attribute.
   */
   protected java.math.BigDecimal BTHTB1 = new BigDecimal("0");
   
   /**
    * Gets the BTHTB1 value.
   */
   public java.math.BigDecimal getBTHTB1() {
      return BTHTB1;
   }
   
   /**
    * Sets the BTHTB1 value.
   */
   public void setBTHTB1(java.math.BigDecimal BTHTB1) {
      this.BTHTB1 = BTHTB1;
   }
   /**
    * The BTHFB2 attribute.
   */
   protected java.math.BigDecimal BTHFB2 = new BigDecimal("0");
   
   /**
    * Gets the BTHFB2 value.
   */
   public java.math.BigDecimal getBTHFB2() {
      return BTHFB2;
   }
   
   /**
    * Sets the BTHFB2 value.
   */
   public void setBTHFB2(java.math.BigDecimal BTHFB2) {
      this.BTHFB2 = BTHFB2;
   }
   /**
    * The BTHTB2 attribute.
   */
   protected java.math.BigDecimal BTHTB2 = new BigDecimal("0");
   
   /**
    * Gets the BTHTB2 value.
   */
   public java.math.BigDecimal getBTHTB2() {
      return BTHTB2;
   }
   
   /**
    * Sets the BTHTB2 value.
   */
   public void setBTHTB2(java.math.BigDecimal BTHTB2) {
      this.BTHTB2 = BTHTB2;
   }
   /**
    * The BTHF02 attribute.
   */
   protected java.lang.String BTHF02 = "";
   
   /**
    * Gets the BTHF02 value.
   */
   public java.lang.String getBTHF02() {
      return BTHF02.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHF02 value.
   */
   public void setBTHF02(java.lang.String BTHF02) {
      this.BTHF02 = BTHF02;
   }
   /**
    * The BTHFB3 attribute.
   */
   protected java.math.BigDecimal BTHFB3 = new BigDecimal("0");
   
   /**
    * Gets the BTHFB3 value.
   */
   public java.math.BigDecimal getBTHFB3() {
      return BTHFB3;
   }
   
   /**
    * Sets the BTHFB3 value.
   */
   public void setBTHFB3(java.math.BigDecimal BTHFB3) {
      this.BTHFB3 = BTHFB3;
   }
   /**
    * The BTHTB3 attribute.
   */
   protected java.math.BigDecimal BTHTB3 = new BigDecimal("0");
   
   /**
    * Gets the BTHTB3 value.
   */
   public java.math.BigDecimal getBTHTB3() {
      return BTHTB3;
   }
   
   /**
    * Sets the BTHTB3 value.
   */
   public void setBTHTB3(java.math.BigDecimal BTHTB3) {
      this.BTHTB3 = BTHTB3;
   }
   /**
    * The BTHF03 attribute.
   */
   protected java.lang.String BTHF03 = "";
   
   /**
    * Gets the BTHF03 value.
   */
   public java.lang.String getBTHF03() {
      return BTHF03.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHF03 value.
   */
   public void setBTHF03(java.lang.String BTHF03) {
      this.BTHF03 = BTHF03;
   }
   /**
    * The BTHOPR attribute.
   */
   protected java.lang.String BTHOPR = "";
   
   /**
    * Gets the BTHOPR value.
   */
   public java.lang.String getBTHOPR() {
      return BTHOPR.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHOPR value.
   */
   public void setBTHOPR(java.lang.String BTHOPR) {
      this.BTHOPR = BTHOPR;
   }
   /**
    * The BTHAUT attribute.
   */
   protected java.lang.String BTHAUT = "";
   
   /**
    * Gets the BTHAUT value.
   */
   public java.lang.String getBTHAUT() {
      return BTHAUT.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHAUT value.
   */
   public void setBTHAUT(java.lang.String BTHAUT) {
      this.BTHAUT = BTHAUT;
   }
   /**
    * The BTHPSW attribute.
   */
   protected java.lang.String BTHPSW = "";
   
   /**
    * Gets the BTHPSW value.
   */
   public java.lang.String getBTHPSW() {
      return BTHPSW.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHPSW value.
   */
   public void setBTHPSW(java.lang.String BTHPSW) {
      this.BTHPSW = BTHPSW;
   }
   /**
    * The BTHCCU attribute.
   */
   protected java.lang.String BTHCCU = "";
   
   /**
    * Gets the BTHCCU value.
   */
   public java.lang.String getBTHCCU() {
      return BTHCCU.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHCCU value.
   */
   public void setBTHCCU(java.lang.String BTHCCU) {
      this.BTHCCU = BTHCCU;
   }
   /**
    * The BTHCAC attribute.
   */
   protected java.lang.String BTHCAC = "";
   
   /**
    * Gets the BTHCAC value.
   */
   public java.lang.String getBTHCAC() {
      return BTHCAC.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHCAC value.
   */
   public void setBTHCAC(java.lang.String BTHCAC) {
      this.BTHCAC = BTHCAC;
   }
   /**
    * The BTHCHL attribute.
   */
   protected java.lang.String BTHCHL = "";
   
   /**
    * Gets the BTHCHL value.
   */
   public java.lang.String getBTHCHL() {
      return BTHCHL.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHCHL value.
   */
   public void setBTHCHL(java.lang.String BTHCHL) {
      this.BTHCHL = BTHCHL;
   }
   /**
    * The BTHCGL attribute.
   */
   protected java.lang.String BTHCGL = "";
   
   /**
    * Gets the BTHCGL value.
   */
   public java.lang.String getBTHCGL() {
      return BTHCGL.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHCGL value.
   */
   public void setBTHCGL(java.lang.String BTHCGL) {
      this.BTHCGL = BTHCGL;
   }
   /**
    * The BTHPRB attribute.
   */
   protected java.math.BigDecimal BTHPRB = new BigDecimal("0");
   
   /**
    * Gets the BTHPRB value.
   */
   public java.math.BigDecimal getBTHPRB() {
      return BTHPRB;
   }
   
   /**
    * Sets the BTHPRB value.
   */
   public void setBTHPRB(java.math.BigDecimal BTHPRB) {
      this.BTHPRB = BTHPRB;
   }
   /**
    * The BTHDIB attribute.
   */
   protected java.math.BigDecimal BTHDIB = new BigDecimal("0");
   
   /**
    * Gets the BTHDIB value.
   */
   public java.math.BigDecimal getBTHDIB() {
      return BTHDIB;
   }
   
   /**
    * Sets the BTHDIB value.
   */
   public void setBTHDIB(java.math.BigDecimal BTHDIB) {
      this.BTHDIB = BTHDIB;
   }
   /**
    * The BTHCDA attribute.
   */
   protected java.lang.String BTHCDA = "";
   
   /**
    * Gets the BTHCDA value.
   */
   public java.lang.String getBTHCDA() {
      return BTHCDA.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHCDA value.
   */
   public void setBTHCDA(java.lang.String BTHCDA) {
      this.BTHCDA = BTHCDA;
   }
   /**
    * The BTHLNA attribute.
   */
   protected java.lang.String BTHLNA = "";
   
   /**
    * Gets the BTHLNA value.
   */
   public java.lang.String getBTHLNA() {
      return BTHLNA.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHLNA value.
   */
   public void setBTHLNA(java.lang.String BTHLNA) {
      this.BTHLNA = BTHLNA;
   }
   /**
    * The BTHAOP attribute.
   */
   protected java.lang.String BTHAOP = "";
   
   /**
    * Gets the BTHAOP value.
   */
   public java.lang.String getBTHAOP() {
      return BTHAOP.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHAOP value.
   */
   public void setBTHAOP(java.lang.String BTHAOP) {
      this.BTHAOP = BTHAOP;
   }
   /**
    * The BTHUBK attribute.
   */
   protected java.lang.String BTHUBK = "";
   
   /**
    * Gets the BTHUBK value.
   */
   public java.lang.String getBTHUBK() {
      return BTHUBK.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHUBK value.
   */
   public void setBTHUBK(java.lang.String BTHUBK) {
      this.BTHUBK = BTHUBK;
   }
   /**
    * The BTHUBR attribute.
   */
   protected java.math.BigDecimal BTHUBR = new BigDecimal("0");
   
   /**
    * Gets the BTHUBR value.
   */
   public java.math.BigDecimal getBTHUBR() {
      return BTHUBR;
   }
   
   /**
    * Sets the BTHUBR value.
   */
   public void setBTHUBR(java.math.BigDecimal BTHUBR) {
      this.BTHUBR = BTHUBR;
   }
   /**
    * The BTHODL attribute.
   */
   protected java.lang.String BTHODL = "";
   
   /**
    * Gets the BTHODL value.
   */
   public java.lang.String getBTHODL() {
      return BTHODL.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHODL value.
   */
   public void setBTHODL(java.lang.String BTHODL) {
      this.BTHODL = BTHODL;
   }
   /**
    * The BTHRTL attribute.
   */
   protected java.lang.String BTHRTL = "";
   
   /**
    * Gets the BTHRTL value.
   */
   public java.lang.String getBTHRTL() {
      return BTHRTL.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHRTL value.
   */
   public void setBTHRTL(java.lang.String BTHRTL) {
      this.BTHRTL = BTHRTL;
   }
   /**
    * The BTHASS attribute.
   */
   protected java.lang.String BTHASS = "";
   
   /**
    * Gets the BTHASS value.
   */
   public java.lang.String getBTHASS() {
      return BTHASS.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHASS value.
   */
   public void setBTHASS(java.lang.String BTHASS) {
      this.BTHASS = BTHASS;
   }
   /**
    * The BTHLIB attribute.
   */
   protected java.lang.String BTHLIB = "";
   
   /**
    * Gets the BTHLIB value.
   */
   public java.lang.String getBTHLIB() {
      return BTHLIB.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHLIB value.
   */
   public void setBTHLIB(java.lang.String BTHLIB) {
      this.BTHLIB = BTHLIB;
   }
   /**
    * The BTHLCR attribute.
   */
   protected java.lang.String BTHLCR = "";
   
   /**
    * Gets the BTHLCR value.
   */
   public java.lang.String getBTHLCR() {
      return BTHLCR.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHLCR value.
   */
   public void setBTHLCR(java.lang.String BTHLCR) {
      this.BTHLCR = BTHLCR;
   }
   /**
    * The BTHRBM attribute.
   */
   protected java.lang.String BTHRBM = "";
   
   /**
    * Gets the BTHRBM value.
   */
   public java.lang.String getBTHRBM() {
      return BTHRBM.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHRBM value.
   */
   public void setBTHRBM(java.lang.String BTHRBM) {
      this.BTHRBM = BTHRBM;
   }
   /**
    * The BTHOTH attribute.
   */
   protected java.lang.String BTHOTH = "";
   
   /**
    * Gets the BTHOTH value.
   */
   public java.lang.String getBTHOTH() {
      return BTHOTH.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHOTH value.
   */
   public void setBTHOTH(java.lang.String BTHOTH) {
      this.BTHOTH = BTHOTH;
   }
   /**
    * The BTHCLP attribute.
   */
   protected java.lang.String BTHCLP = "";
   
   /**
    * Gets the BTHCLP value.
   */
   public java.lang.String getBTHCLP() {
      return BTHCLP.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHCLP value.
   */
   public void setBTHCLP(java.lang.String BTHCLP) {
      this.BTHCLP = BTHCLP;
   }
   /**
    * The BTHLEC attribute.
   */
   protected java.lang.String BTHLEC = "";
   
   /**
    * Gets the BTHLEC value.
   */
   public java.lang.String getBTHLEC() {
      return BTHLEC.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHLEC value.
   */
   public void setBTHLEC(java.lang.String BTHLEC) {
      this.BTHLEC = BTHLEC;
   }
   /**
    * The BTHLIC attribute.
   */
   protected java.lang.String BTHLIC = "";
   
   /**
    * Gets the BTHLIC value.
   */
   public java.lang.String getBTHLIC() {
      return BTHLIC.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHLIC value.
   */
   public void setBTHLIC(java.lang.String BTHLIC) {
      this.BTHLIC = BTHLIC;
   }
   /**
    * The BTHMLF attribute.
   */
   protected java.lang.String BTHMLF = "";
   
   /**
    * Gets the BTHMLF value.
   */
   public java.lang.String getBTHMLF() {
      return BTHMLF.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHMLF value.
   */
   public void setBTHMLF(java.lang.String BTHMLF) {
      this.BTHMLF = BTHMLF;
   }
   /**
    * The BTHBCH attribute.
   */
   protected java.math.BigDecimal BTHBCH = new BigDecimal("0");
   
   /**
    * Gets the BTHBCH value.
   */
   public java.math.BigDecimal getBTHBCH() {
      return BTHBCH;
   }
   
   /**
    * Sets the BTHBCH value.
   */
   public void setBTHBCH(java.math.BigDecimal BTHBCH) {
      this.BTHBCH = BTHBCH;
   }
   /**
    * The BTHILF attribute.
   */
   protected java.lang.String BTHILF = "";
   
   /**
    * Gets the BTHILF value.
   */
   public java.lang.String getBTHILF() {
      return BTHILF.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHILF value.
   */
   public void setBTHILF(java.lang.String BTHILF) {
      this.BTHILF = BTHILF;
   }
   /**
    * The BTHALM attribute.
   */
   protected java.math.BigDecimal BTHALM = new BigDecimal("0");
   
   /**
    * Gets the BTHALM value.
   */
   public java.math.BigDecimal getBTHALM() {
      return BTHALM;
   }
   
   /**
    * Sets the BTHALM value.
   */
   public void setBTHALM(java.math.BigDecimal BTHALM) {
      this.BTHALM = BTHALM;
   }
   /**
    * The BTHCCY attribute.
   */
   protected java.lang.String BTHCCY = "";
   
   /**
    * Gets the BTHCCY value.
   */
   public java.lang.String getBTHCCY() {
      return BTHCCY.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHCCY value.
   */
   public void setBTHCCY(java.lang.String BTHCCY) {
      this.BTHCCY = BTHCCY;
   }
   /**
    * The BTHCUN attribute.
   */
   protected java.math.BigDecimal BTHCUN = new BigDecimal("0");
   
   /**
    * Gets the BTHCUN value.
   */
   public java.math.BigDecimal getBTHCUN() {
      return BTHCUN;
   }
   
   /**
    * Sets the BTHCUN value.
   */
   public void setBTHCUN(java.math.BigDecimal BTHCUN) {
      this.BTHCUN = BTHCUN;
   }
   /**
    * The BTHINL attribute.
   */
   protected java.math.BigDecimal BTHINL = new BigDecimal("0");
   
   /**
    * Gets the BTHINL value.
   */
   public java.math.BigDecimal getBTHINL() {
      return BTHINL;
   }
   
   /**
    * Sets the BTHINL value.
   */
   public void setBTHINL(java.math.BigDecimal BTHINL) {
      this.BTHINL = BTHINL;
   }
   /**
    * The BTHACL attribute.
   */
   protected java.math.BigDecimal BTHACL = new BigDecimal("0");
   
   /**
    * Gets the BTHACL value.
   */
   public java.math.BigDecimal getBTHACL() {
      return BTHACL;
   }
   
   /**
    * Sets the BTHACL value.
   */
   public void setBTHACL(java.math.BigDecimal BTHACL) {
      this.BTHACL = BTHACL;
   }
   /**
    * The BTHAFE attribute.
   */
   protected java.lang.String BTHAFE = "";
   
   /**
    * Gets the BTHAFE value.
   */
   public java.lang.String getBTHAFE() {
      return BTHAFE.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHAFE value.
   */
   public void setBTHAFE(java.lang.String BTHAFE) {
      this.BTHAFE = BTHAFE;
   }
   /**
    * The BTHASF attribute.
   */
   protected java.lang.String BTHASF = "";
   
   /**
    * Gets the BTHASF value.
   */
   public java.lang.String getBTHASF() {
      return BTHASF.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHASF value.
   */
   public void setBTHASF(java.lang.String BTHASF) {
      this.BTHASF = BTHASF;
   }
   /**
    * The BTHPRT attribute.
   */
   protected java.math.BigDecimal BTHPRT = new BigDecimal("0");
   
   /**
    * Gets the BTHPRT value.
   */
   public java.math.BigDecimal getBTHPRT() {
      return BTHPRT;
   }
   
   /**
    * Sets the BTHPRT value.
   */
   public void setBTHPRT(java.math.BigDecimal BTHPRT) {
      this.BTHPRT = BTHPRT;
   }
   /**
    * The BTHCBE attribute.
   */
   protected java.lang.String BTHCBE = "";
   
   /**
    * Gets the BTHCBE value.
   */
   public java.lang.String getBTHCBE() {
      return BTHCBE.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHCBE value.
   */
   public void setBTHCBE(java.lang.String BTHCBE) {
      this.BTHCBE = BTHCBE;
   }
   /**
    * The BTHFL1 attribute.
   */
   protected java.lang.String BTHFL1 = "";
   
   /**
    * Gets the BTHFL1 value.
   */
   public java.lang.String getBTHFL1() {
      return BTHFL1.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHFL1 value.
   */
   public void setBTHFL1(java.lang.String BTHFL1) {
      this.BTHFL1 = BTHFL1;
   }
   /**
    * The BTHFL2 attribute.
   */
   protected java.lang.String BTHFL2 = "";
   
   /**
    * Gets the BTHFL2 value.
   */
   public java.lang.String getBTHFL2() {
      return BTHFL2.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHFL2 value.
   */
   public void setBTHFL2(java.lang.String BTHFL2) {
      this.BTHFL2 = BTHFL2;
   }
   /**
    * The BTHFL3 attribute.
   */
   protected java.lang.String BTHFL3 = "";
   
   /**
    * Gets the BTHFL3 value.
   */
   public java.lang.String getBTHFL3() {
      return BTHFL3.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHFL3 value.
   */
   public void setBTHFL3(java.lang.String BTHFL3) {
      this.BTHFL3 = BTHFL3;
   }
   /**
    * The BTHFL4 attribute.
   */
   protected java.lang.String BTHFL4 = "";
   
   /**
    * Gets the BTHFL4 value.
   */
   public java.lang.String getBTHFL4() {
      return BTHFL4.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHFL4 value.
   */
   public void setBTHFL4(java.lang.String BTHFL4) {
      this.BTHFL4 = BTHFL4;
   }
   /**
    * The BTHFL5 attribute.
   */
   protected java.lang.String BTHFL5 = "";
   
   /**
    * Gets the BTHFL5 value.
   */
   public java.lang.String getBTHFL5() {
      return BTHFL5.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHFL5 value.
   */
   public void setBTHFL5(java.lang.String BTHFL5) {
      this.BTHFL5 = BTHFL5;
   }
   /**
    * The BTHFL6 attribute.
   */
   protected java.lang.String BTHFL6 = "";
   
   /**
    * Gets the BTHFL6 value.
   */
   public java.lang.String getBTHFL6() {
      return BTHFL6.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHFL6 value.
   */
   public void setBTHFL6(java.lang.String BTHFL6) {
      this.BTHFL6 = BTHFL6;
   }
   /**
    * The BTHFL7 attribute.
   */
   protected java.lang.String BTHFL7 = "";
   
   /**
    * Gets the BTHFL7 value.
   */
   public java.lang.String getBTHFL7() {
      return BTHFL7.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHFL7 value.
   */
   public void setBTHFL7(java.lang.String BTHFL7) {
      this.BTHFL7 = BTHFL7;
   }
   /**
    * The BTHFL8 attribute.
   */
   protected java.lang.String BTHFL8 = "";
   
   /**
    * Gets the BTHFL8 value.
   */
   public java.lang.String getBTHFL8() {
      return BTHFL8.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHFL8 value.
   */
   public void setBTHFL8(java.lang.String BTHFL8) {
      this.BTHFL8 = BTHFL8;
   }
   /**
    * The BTHFL9 attribute.
   */
   protected java.lang.String BTHFL9 = "";
   
   /**
    * Gets the BTHFL9 value.
   */
   public java.lang.String getBTHFL9() {
      return BTHFL9.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHFL9 value.
   */
   public void setBTHFL9(java.lang.String BTHFL9) {
      this.BTHFL9 = BTHFL9;
   }
   /**
    * The BTHCCN attribute.
   */
   protected java.math.BigDecimal BTHCCN = new BigDecimal("0");
   
   /**
    * Gets the BTHCCN value.
   */
   public java.math.BigDecimal getBTHCCN() {
      return BTHCCN;
   }
   
   /**
    * Sets the BTHCCN value.
   */
   public void setBTHCCN(java.math.BigDecimal BTHCCN) {
      this.BTHCCN = BTHCCN;
   }
   /**
    * The BTHCAF attribute.
   */
   protected java.lang.String BTHCAF = "";
   
   /**
    * Gets the BTHCAF value.
   */
   public java.lang.String getBTHCAF() {
      return BTHCAF.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHCAF value.
   */
   public void setBTHCAF(java.lang.String BTHCAF) {
      this.BTHCAF = BTHCAF;
   }
   /**
    * The BTHLAN attribute.
   */
   protected java.lang.String BTHLAN = "";
   
   /**
    * Gets the BTHLAN value.
   */
   public java.lang.String getBTHLAN() {
      return BTHLAN.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHLAN value.
   */
   public void setBTHLAN(java.lang.String BTHLAN) {
      this.BTHLAN = BTHLAN;
   }
   /**
    * The BTHTFL attribute.
   */
   protected java.lang.String BTHTFL = "";
   
   /**
    * Gets the BTHTFL value.
   */
   public java.lang.String getBTHTFL() {
      return BTHTFL.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHTFL value.
   */
   public void setBTHTFL(java.lang.String BTHTFL) {
      this.BTHTFL = BTHTFL;
   }
   /**
    * The BTHOFC attribute.
   */
   protected java.lang.String BTHOFC = "";
   
   /**
    * Gets the BTHOFC value.
   */
   public java.lang.String getBTHOFC() {
      return BTHOFC.toUpperCase().trim();
   }
   
   /**
    * Sets the BTHOFC value.
   */
   public void setBTHOFC(java.lang.String BTHOFC) {
      this.BTHOFC = BTHOFC;
   }
   public String toString() {
      StringBuffer results = new StringBuffer();

      results.append(getClass().getName() + "\n");
      results.append("\tBTHKEY=" + BTHKEY + "\n");
      results.append("\tBTHF01=" + BTHF01 + "\n");
      results.append("\tBTHFB1=" + BTHFB1 + "\n");
      results.append("\tBTHTB1=" + BTHTB1 + "\n");
      results.append("\tBTHFB2=" + BTHFB2 + "\n");
      results.append("\tBTHTB2=" + BTHTB2 + "\n");
      results.append("\tBTHF02=" + BTHF02 + "\n");
      results.append("\tBTHFB3=" + BTHFB3 + "\n");
      results.append("\tBTHTB3=" + BTHTB3 + "\n");
      results.append("\tBTHF03=" + BTHF03 + "\n");
      results.append("\tBTHOPR=" + BTHOPR + "\n");
      results.append("\tBTHAUT=" + BTHAUT + "\n");
      results.append("\tBTHPSW=" + BTHPSW + "\n");
      results.append("\tBTHCCU=" + BTHCCU + "\n");
      results.append("\tBTHCAC=" + BTHCAC + "\n");
      results.append("\tBTHCHL=" + BTHCHL + "\n");
      results.append("\tBTHCGL=" + BTHCGL + "\n");
      results.append("\tBTHPRB=" + BTHPRB + "\n");
      results.append("\tBTHDIB=" + BTHDIB + "\n");
      results.append("\tBTHCDA=" + BTHCDA + "\n");
      results.append("\tBTHLNA=" + BTHLNA + "\n");
      results.append("\tBTHAOP=" + BTHAOP + "\n");
      results.append("\tBTHUBK=" + BTHUBK + "\n");
      results.append("\tBTHUBR=" + BTHUBR + "\n");
      results.append("\tBTHODL=" + BTHODL + "\n");
      results.append("\tBTHRTL=" + BTHRTL + "\n");
      results.append("\tBTHASS=" + BTHASS + "\n");
      results.append("\tBTHLIB=" + BTHLIB + "\n");
      results.append("\tBTHLCR=" + BTHLCR + "\n");
      results.append("\tBTHRBM=" + BTHRBM + "\n");
      results.append("\tBTHOTH=" + BTHOTH + "\n");
      results.append("\tBTHCLP=" + BTHCLP + "\n");
      results.append("\tBTHLEC=" + BTHLEC + "\n");
      results.append("\tBTHLIC=" + BTHLIC + "\n");
      results.append("\tBTHMLF=" + BTHMLF + "\n");
      results.append("\tBTHBCH=" + BTHBCH + "\n");
      results.append("\tBTHILF=" + BTHILF + "\n");
      results.append("\tBTHALM=" + BTHALM + "\n");
      results.append("\tBTHCCY=" + BTHCCY + "\n");
      results.append("\tBTHCUN=" + BTHCUN + "\n");
      results.append("\tBTHINL=" + BTHINL + "\n");
      results.append("\tBTHACL=" + BTHACL + "\n");
      results.append("\tBTHAFE=" + BTHAFE + "\n");
      results.append("\tBTHASF=" + BTHASF + "\n");
      results.append("\tBTHPRT=" + BTHPRT + "\n");
      results.append("\tBTHCBE=" + BTHCBE + "\n");
      results.append("\tBTHFL1=" + BTHFL1 + "\n");
      results.append("\tBTHFL2=" + BTHFL2 + "\n");
      results.append("\tBTHFL3=" + BTHFL3 + "\n");
      results.append("\tBTHFL4=" + BTHFL4 + "\n");
      results.append("\tBTHFL5=" + BTHFL5 + "\n");
      results.append("\tBTHFL6=" + BTHFL6 + "\n");
      results.append("\tBTHFL7=" + BTHFL7 + "\n");
      results.append("\tBTHFL8=" + BTHFL8 + "\n");
      results.append("\tBTHFL9=" + BTHFL9 + "\n");
      results.append("\tBTHCCN=" + BTHCCN + "\n");
      results.append("\tBTHCAF=" + BTHCAF + "\n");
      results.append("\tBTHLAN=" + BTHLAN + "\n");
      results.append("\tBTHTFL=" + BTHTFL + "\n");
      results.append("\tBTHOFC=" + BTHOFC + "\n");

      return results.toString();
   }

}