package com.datapro.eibs.parameters.access.jdbc.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 * Jdbc Bean Class<br>
 * <br>
 * Autogenerated on 04/23/2003 11:31:48<br>
 * &nbsp;&nbsp;&nbsp; table = "CNOFCBean"
*
* @author Generator
*/
public class CNOFC {

   /**
    * The CNOCFL attribute.
   */
   protected java.lang.String CNOCFL = "";
   
   /**
    * Gets the CNOCFL value.
   */
   public java.lang.String getCNOCFL() {
      return CNOCFL.toUpperCase().trim();
   }
   
   /**
    * Sets the CNOCFL value.
   */
   public void setCNOCFL(java.lang.String CNOCFL) {
      this.CNOCFL = CNOCFL;
   }
   /**
    * The CNORCD attribute.
   */
   protected java.lang.String CNORCD = "";
   
   /**
    * Gets the CNORCD value.
   */
   public java.lang.String getCNORCD() {
      return CNORCD.toUpperCase().trim();
   }
   
   /**
    * Sets the CNORCD value.
   */
   public void setCNORCD(java.lang.String CNORCD) {
      this.CNORCD = CNORCD;
   }
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
    * The CNOFRP attribute.
   */
   protected java.math.BigDecimal CNOFRP = null;
   
   /**
    * Gets the CNOFRP value.
   */
   public java.math.BigDecimal getCNOFRP() {
      return CNOFRP;
   }
   
   /**
    * Sets the CNOFRP value.
   */
   public void setCNOFRP(java.math.BigDecimal CNOFRP) {
      this.CNOFRP = CNOFRP;
   }
   /**
    * The CNOCHG attribute.
   */
   protected java.math.BigDecimal CNOCHG = null;
   
   /**
    * Gets the CNOCHG value.
   */
   public java.math.BigDecimal getCNOCHG() {
      return CNOCHG;
   }
   
   /**
    * Sets the CNOCHG value.
   */
   public void setCNOCHG(java.math.BigDecimal CNOCHG) {
      this.CNOCHG = CNOCHG;
   }
   /**
    * The CNODCC attribute.
   */
   protected java.lang.String CNODCC = "";
   
   /**
    * Gets the CNODCC value.
   */
   public java.lang.String getCNODCC() {
      return CNODCC.toUpperCase().trim();
   }
   
   /**
    * Sets the CNODCC value.
   */
   public void setCNODCC(java.lang.String CNODCC) {
      this.CNODCC = CNODCC;
   }
   /**
    * The CNOPAF attribute.
   */
   protected java.lang.String CNOPAF = "";
   
   /**
    * Gets the CNOPAF value.
   */
   public java.lang.String getCNOPAF() {
      return CNOPAF.toUpperCase().trim();
   }
   
   /**
    * Sets the CNOPAF value.
   */
   public void setCNOPAF(java.lang.String CNOPAF) {
      this.CNOPAF = CNOPAF;
   }
   /**
    * The CNOADI attribute.
   */
   protected java.lang.String CNOADI = "";
   
   /**
    * Gets the CNOADI value.
   */
   public java.lang.String getCNOADI() {
      return CNOADI.toUpperCase().trim();
   }
   
   /**
    * Sets the CNOADI value.
   */
   public void setCNOADI(java.lang.String CNOADI) {
      this.CNOADI = CNOADI;
   }
   /**
    * The CNOAPC attribute.
   */
   protected java.lang.String CNOAPC = "";
   
   /**
    * Gets the CNOAPC value.
   */
   public java.lang.String getCNOAPC() {
      return CNOAPC.toUpperCase().trim();
   }
   
   /**
    * Sets the CNOAPC value.
   */
   public void setCNOAPC(java.lang.String CNOAPC) {
      this.CNOAPC = CNOAPC;
   }
   /**
    * The CNOCPF attribute.
   */
   protected java.lang.String CNOCPF = "";
   
   /**
    * Gets the CNOCPF value.
   */
   public java.lang.String getCNOCPF() {
      return CNOCPF.toUpperCase().trim();
   }
   
   /**
    * Sets the CNOCPF value.
   */
   public void setCNOCPF(java.lang.String CNOCPF) {
      this.CNOCPF = CNOCPF;
   }
   /**
    * The CNOF01 attribute.
   */
   protected java.lang.String CNOF01 = "";
   
   /**
    * Gets the CNOF01 value.
   */
   public java.lang.String getCNOF01() {
      return CNOF01.toUpperCase().trim();
   }
   
   /**
    * Sets the CNOF01 value.
   */
   public void setCNOF01(java.lang.String CNOF01) {
      this.CNOF01 = CNOF01;
   }
   /**
    * The CNODCB attribute.
   */
   protected java.lang.String CNODCB = "";
   
   /**
    * Gets the CNODCB value.
   */
   public java.lang.String getCNODCB() {
      return CNODCB.toUpperCase().trim();
   }
   
   /**
    * Sets the CNODCB value.
   */
   public void setCNODCB(java.lang.String CNODCB) {
      this.CNODCB = CNODCB;
   }
   /**
    * The CNOSCG attribute.
   */
   protected java.math.BigDecimal CNOSCG = null;
   
   /**
    * Gets the CNOSCG value.
   */
   public java.math.BigDecimal getCNOSCG() {
      return CNOSCG;
   }
   
   /**
    * Sets the CNOSCG value.
   */
   public void setCNOSCG(java.math.BigDecimal CNOSCG) {
      this.CNOSCG = CNOSCG;
   }
   /**
    * The CNOMID attribute.
   */
   protected java.lang.String CNOMID = "";
   
   /**
    * Gets the CNOMID value.
   */
   public java.lang.String getCNOMID() {
      return CNOMID.toUpperCase().trim();
   }
   
   /**
    * Sets the CNOMID value.
   */
   public void setCNOMID(java.lang.String CNOMID) {
      this.CNOMID = CNOMID;
   }
   /**
    * The CNOMIC attribute.
   */
   protected java.lang.String CNOMIC = "";
   
   /**
    * Gets the CNOMIC value.
   */
   public java.lang.String getCNOMIC() {
      return CNOMIC.toUpperCase().trim();
   }
   
   /**
    * Sets the CNOMIC value.
   */
   public void setCNOMIC(java.lang.String CNOMIC) {
      this.CNOMIC = CNOMIC;
   }
   /**
    * The CNOF02 attribute.
   */
   protected java.lang.String CNOF02 = "";
   
   /**
    * Gets the CNOF02 value.
   */
   public java.lang.String getCNOF02() {
      return CNOF02.toUpperCase().trim();
   }
   
   /**
    * Sets the CNOF02 value.
   */
   public void setCNOF02(java.lang.String CNOF02) {
      this.CNOF02 = CNOF02;
   }
   /**
    * The CNOCPC attribute.
   */
   protected java.lang.String CNOCPC = "";
   
   /**
    * Gets the CNOCPC value.
   */
   public java.lang.String getCNOCPC() {
      return CNOCPC.toUpperCase().trim();
   }
   
   /**
    * Sets the CNOCPC value.
   */
   public void setCNOCPC(java.lang.String CNOCPC) {
      this.CNOCPC = CNOCPC;
   }
   /**
    * The CNOTCF attribute.
   */
   protected java.lang.String CNOTCF = "";
   
   /**
    * Gets the CNOTCF value.
   */
   public java.lang.String getCNOTCF() {
      return CNOTCF.toUpperCase().trim();
   }
   
   /**
    * Sets the CNOTCF value.
   */
   public void setCNOTCF(java.lang.String CNOTCF) {
      this.CNOTCF = CNOTCF;
   }
   /**
    * The CNOMXC attribute.
   */
   protected java.math.BigDecimal CNOMXC = null;
   
   /**
    * Gets the CNOMXC value.
   */
   public java.math.BigDecimal getCNOMXC() {
      return CNOMXC;
   }
   
   /**
    * Sets the CNOMXC value.
   */
   public void setCNOMXC(java.math.BigDecimal CNOMXC) {
      this.CNOMXC = CNOMXC;
   }
   /**
    * The CNOMNC attribute.
   */
   protected java.math.BigDecimal CNOMNC = null;
   
   /**
    * Gets the CNOMNC value.
   */
   public java.math.BigDecimal getCNOMNC() {
      return CNOMNC;
   }
   
   /**
    * Sets the CNOMNC value.
   */
   public void setCNOMNC(java.math.BigDecimal CNOMNC) {
      this.CNOMNC = CNOMNC;
   }
   /**
    * The CNOIVA attribute.
   */
   protected java.lang.String CNOIVA = "";
   
   /**
    * Gets the CNOIVA value.
   */
   public java.lang.String getCNOIVA() {
      return CNOIVA.toUpperCase().trim();
   }
   
   /**
    * Sets the CNOIVA value.
   */
   public void setCNOIVA(java.lang.String CNOIVA) {
      this.CNOIVA = CNOIVA;
   }
   /**
    * The CNOCST attribute.
   */
   protected java.math.BigDecimal CNOCST = null;
   
   /**
    * Gets the CNOCST value.
   */
   public java.math.BigDecimal getCNOCST() {
      return CNOCST;
   }
   
   /**
    * Sets the CNOCST value.
   */
   public void setCNOCST(java.math.BigDecimal CNOCST) {
      this.CNOCST = CNOCST;
   }
   /**
    * The CNOF03 attribute.
   */
   protected java.lang.String CNOF03 = "";
   
   /**
    * Gets the CNOF03 value.
   */
   public java.lang.String getCNOF03() {
      return CNOF03.toUpperCase().trim();
   }
   
   /**
    * Sets the CNOF03 value.
   */
   public void setCNOF03(java.lang.String CNOF03) {
      this.CNOF03 = CNOF03;
   }
   /**
    * The CNOACD attribute.
   */
   protected java.lang.String CNOACD = "";
   
   /**
    * Gets the CNOACD value.
   */
   public java.lang.String getCNOACD() {
      return CNOACD.toUpperCase().trim();
   }
   
   /**
    * Sets the CNOACD value.
   */
   public void setCNOACD(java.lang.String CNOACD) {
      this.CNOACD = CNOACD;
   }
   /**
    * The CNOACS attribute.
   */
   protected java.math.BigDecimal CNOACS = null;
   
   /**
    * Gets the CNOACS value.
   */
   public java.math.BigDecimal getCNOACS() {
      return CNOACS;
   }
   
   /**
    * Sets the CNOACS value.
   */
   public void setCNOACS(java.math.BigDecimal CNOACS) {
      this.CNOACS = CNOACS;
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
   public String toString() {
      StringBuffer results = new StringBuffer();

      results.append(getClass().getName() + "\n");
      results.append("\tCNOCFL=" + CNOCFL + "\n");
      results.append("\tCNORCD=" + CNORCD + "\n");
      results.append("\tCNODSC=" + CNODSC + "\n");
      results.append("\tCNOFRP=" + CNOFRP + "\n");
      results.append("\tCNOCHG=" + CNOCHG + "\n");
      results.append("\tCNODCC=" + CNODCC + "\n");
      results.append("\tCNOPAF=" + CNOPAF + "\n");
      results.append("\tCNOADI=" + CNOADI + "\n");
      results.append("\tCNOAPC=" + CNOAPC + "\n");
      results.append("\tCNOCPF=" + CNOCPF + "\n");
      results.append("\tCNOF01=" + CNOF01 + "\n");
      results.append("\tCNODCB=" + CNODCB + "\n");
      results.append("\tCNOSCG=" + CNOSCG + "\n");
      results.append("\tCNOMID=" + CNOMID + "\n");
      results.append("\tCNOMIC=" + CNOMIC + "\n");
      results.append("\tCNOF02=" + CNOF02 + "\n");
      results.append("\tCNOCPC=" + CNOCPC + "\n");
      results.append("\tCNOTCF=" + CNOTCF + "\n");
      results.append("\tCNOMXC=" + CNOMXC + "\n");
      results.append("\tCNOMNC=" + CNOMNC + "\n");
      results.append("\tCNOIVA=" + CNOIVA + "\n");
      results.append("\tCNOCST=" + CNOCST + "\n");
      results.append("\tCNOF03=" + CNOF03 + "\n");
      results.append("\tCNOACD=" + CNOACD + "\n");
      results.append("\tCNOACS=" + CNOACS + "\n");
      results.append("\tCNOF04=" + CNOF04 + "\n");

      return results.toString();
   }

}