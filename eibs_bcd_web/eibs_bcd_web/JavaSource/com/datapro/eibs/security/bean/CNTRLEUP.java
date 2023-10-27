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
 * Autogenerated on 04/10/2003 03:29:29<br>
 * &nbsp;&nbsp;&nbsp; table = "CNTRLEUPBean"
*
* @author Generator
*/
public class CNTRLEUP implements java.io.Serializable {

   /**
    * The EUPUSR attribute.
   */
   protected java.lang.String EUPUSR = "";
   
   /**
    * Gets the EUPUSR value.
   */
   public java.lang.String getEUPUSR() {
      return EUPUSR.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPUSR value.
   */
   public void setEUPUSR(java.lang.String EUPUSR) {
      this.EUPUSR = EUPUSR;
   }
   /**
    * The EUPACP attribute.
   */
   protected java.lang.String EUPACP = "";
   
   /**
    * Gets the EUPACP value.
   */
   public java.lang.String getEUPACP() {
      return EUPACP.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPACP value.
   */
   public void setEUPACP(java.lang.String EUPACP) {
      this.EUPACP = EUPACP;
   }
   /**
    * The EUPOPR attribute.
   */
   protected java.lang.String EUPOPR = "";
   
   /**
    * Gets the EUPOPR value.
   */
   public java.lang.String getEUPOPR() {
      return EUPOPR.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPOPR value.
   */
   public void setEUPOPR(java.lang.String EUPOPR) {
      this.EUPOPR = EUPOPR;
   }
   /**
    * The EUPSTS attribute.
   */
   protected java.lang.String EUPSTS = "";
   
   /**
    * Gets the EUPSTS value.
   */
   public java.lang.String getEUPSTS() {
      return EUPSTS.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPSTS value.
   */
   public void setEUPSTS(java.lang.String EUPSTS) {
      this.EUPSTS = EUPSTS;
   }
   /**
    * The EUPLSU attribute.
   */
   protected java.lang.String EUPLSU = "";
   
   /**
    * Gets the EUPLSU value.
   */
   public java.lang.String getEUPLSU() {
      return EUPLSU.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPLSU value.
   */
   public void setEUPLSU(java.lang.String EUPLSU) {
      this.EUPLSU = EUPLSU;
   }
   /**
    * The EUPLSM attribute.
   */
   protected java.math.BigDecimal EUPLSM = new BigDecimal("0");
   
   /**
    * Gets the EUPLSM value.
   */
   public java.math.BigDecimal getEUPLSM() {
      return EUPLSM;
   }
   
   /**
    * Sets the EUPLSM value.
   */
   public void setEUPLSM(java.math.BigDecimal EUPLSM) {
      this.EUPLSM = EUPLSM;
   }
   /**
    * The EUPLSD attribute.
   */
   protected java.math.BigDecimal EUPLSD = new BigDecimal("0");
   
   /**
    * Gets the EUPLSD value.
   */
   public java.math.BigDecimal getEUPLSD() {
      return EUPLSD;
   }
   
   /**
    * Sets the EUPLSD value.
   */
   public void setEUPLSD(java.math.BigDecimal EUPLSD) {
      this.EUPLSD = EUPLSD;
   }
   /**
    * The EUPLSY attribute.
   */
   protected java.math.BigDecimal EUPLSY = new BigDecimal("0");
   
   /**
    * Gets the EUPLSY value.
   */
   public java.math.BigDecimal getEUPLSY() {
      return EUPLSY;
   }
   
   /**
    * Sets the EUPLSY value.
   */
   public void setEUPLSY(java.math.BigDecimal EUPLSY) {
      this.EUPLSY = EUPLSY;
   }
   /**
    * The EUPLST attribute.
   */
   protected java.math.BigDecimal EUPLST = new BigDecimal("0");
   
   /**
    * Gets the EUPLST value.
   */
   public java.math.BigDecimal getEUPLST() {
      return EUPLST;
   }
   
   /**
    * Sets the EUPLST value.
   */
   public void setEUPLST(java.math.BigDecimal EUPLST) {
      this.EUPLST = EUPLST;
   }
   /**
    * The EUPRSC attribute.
   */
   protected java.lang.String EUPRSC = "";
   
   /**
    * Gets the EUPRSC value.
   */
   public java.lang.String getEUPRSC() {
      return EUPRSC.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPRSC value.
   */
   public void setEUPRSC(java.lang.String EUPRSC) {
      this.EUPRSC = EUPRSC;
   }
   /**
    * The EUPOPM attribute.
   */
   protected java.math.BigDecimal EUPOPM = new BigDecimal("0");
   
   /**
    * Gets the EUPOPM value.
   */
   public java.math.BigDecimal getEUPOPM() {
      return EUPOPM;
   }
   
   /**
    * Sets the EUPOPM value.
   */
   public void setEUPOPM(java.math.BigDecimal EUPOPM) {
      this.EUPOPM = EUPOPM;
   }
   /**
    * The EUPOPD attribute.
   */
   protected java.math.BigDecimal EUPOPD = new BigDecimal("0");
   
   /**
    * Gets the EUPOPD value.
   */
   public java.math.BigDecimal getEUPOPD() {
      return EUPOPD;
   }
   
   /**
    * Sets the EUPOPD value.
   */
   public void setEUPOPD(java.math.BigDecimal EUPOPD) {
      this.EUPOPD = EUPOPD;
   }
   /**
    * The EUPOPY attribute.
   */
   protected java.math.BigDecimal EUPOPY = new BigDecimal("0");
   
   /**
    * Gets the EUPOPY value.
   */
   public java.math.BigDecimal getEUPOPY() {
      return EUPOPY;
   }
   
   /**
    * Sets the EUPOPY value.
   */
   public void setEUPOPY(java.math.BigDecimal EUPOPY) {
      this.EUPOPY = EUPOPY;
   }
   /**
    * The EUPSTM attribute.
   */
   protected java.math.BigDecimal EUPSTM = new BigDecimal("0");
   
   /**
    * Gets the EUPSTM value.
   */
   public java.math.BigDecimal getEUPSTM() {
      return EUPSTM;
   }
   
   /**
    * Sets the EUPSTM value.
   */
   public void setEUPSTM(java.math.BigDecimal EUPSTM) {
      this.EUPSTM = EUPSTM;
   }
   /**
    * The EUPSTD attribute.
   */
   protected java.math.BigDecimal EUPSTD = new BigDecimal("0");
   
   /**
    * Gets the EUPSTD value.
   */
   public java.math.BigDecimal getEUPSTD() {
      return EUPSTD;
   }
   
   /**
    * Sets the EUPSTD value.
   */
   public void setEUPSTD(java.math.BigDecimal EUPSTD) {
      this.EUPSTD = EUPSTD;
   }
   /**
    * The EUPSTY attribute.
   */
   protected java.math.BigDecimal EUPSTY = new BigDecimal("0");
   
   /**
    * Gets the EUPSTY value.
   */
   public java.math.BigDecimal getEUPSTY() {
      return EUPSTY;
   }
   
   /**
    * Sets the EUPSTY value.
   */
   public void setEUPSTY(java.math.BigDecimal EUPSTY) {
      this.EUPSTY = EUPSTY;
   }
   /**
    * The EUPLAM attribute.
   */
   protected java.math.BigDecimal EUPLAM = new BigDecimal("0");
   
   /**
    * Gets the EUPLAM value.
   */
   public java.math.BigDecimal getEUPLAM() {
      return EUPLAM;
   }
   
   /**
    * Sets the EUPLAM value.
   */
   public void setEUPLAM(java.math.BigDecimal EUPLAM) {
      this.EUPLAM = EUPLAM;
   }
   /**
    * The EUPLAD attribute.
   */
   protected java.math.BigDecimal EUPLAD = new BigDecimal("0");
   
   /**
    * Gets the EUPLAD value.
   */
   public java.math.BigDecimal getEUPLAD() {
      return EUPLAD;
   }
   
   /**
    * Sets the EUPLAD value.
   */
   public void setEUPLAD(java.math.BigDecimal EUPLAD) {
      this.EUPLAD = EUPLAD;
   }
   /**
    * The EUPLAY attribute.
   */
   protected java.math.BigDecimal EUPLAY = new BigDecimal("0");
   
   /**
    * Gets the EUPLAY value.
   */
   public java.math.BigDecimal getEUPLAY() {
      return EUPLAY;
   }
   
   /**
    * Sets the EUPLAY value.
   */
   public void setEUPLAY(java.math.BigDecimal EUPLAY) {
      this.EUPLAY = EUPLAY;
   }
   /**
    * The EUPLMU attribute.
   */
   protected java.lang.String EUPLMU = "";
   
   /**
    * Gets the EUPLMU value.
   */
   public java.lang.String getEUPLMU() {
      return EUPLMU.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPLMU value.
   */
   public void setEUPLMU(java.lang.String EUPLMU) {
      this.EUPLMU = EUPLMU;
   }
   /**
    * The EUPMAM attribute.
   */
   protected java.math.BigDecimal EUPMAM = new BigDecimal("0");
   
   /**
    * Gets the EUPMAM value.
   */
   public java.math.BigDecimal getEUPMAM() {
      return EUPMAM;
   }
   
   /**
    * Sets the EUPMAM value.
   */
   public void setEUPMAM(java.math.BigDecimal EUPMAM) {
      this.EUPMAM = EUPMAM;
   }
   /**
    * The EUPMAD attribute.
   */
   protected java.math.BigDecimal EUPMAD = new BigDecimal("0");
   
   /**
    * Gets the EUPMAD value.
   */
   public java.math.BigDecimal getEUPMAD() {
      return EUPMAD;
   }
   
   /**
    * Sets the EUPMAD value.
   */
   public void setEUPMAD(java.math.BigDecimal EUPMAD) {
      this.EUPMAD = EUPMAD;
   }
   /**
    * The EUPMAY attribute.
   */
   protected java.math.BigDecimal EUPMAY = new BigDecimal("0");
   
   /**
    * Gets the EUPMAY value.
   */
   public java.math.BigDecimal getEUPMAY() {
      return EUPMAY;
   }
   
   /**
    * Sets the EUPMAY value.
   */
   public void setEUPMAY(java.math.BigDecimal EUPMAY) {
      this.EUPMAY = EUPMAY;
   }
   /**
    * The EUPLPM attribute.
   */
   protected java.math.BigDecimal EUPLPM = new BigDecimal("0");
   
   /**
    * Gets the EUPLPM value.
   */
   public java.math.BigDecimal getEUPLPM() {
      return EUPLPM;
   }
   
   /**
    * Sets the EUPLPM value.
   */
   public void setEUPLPM(java.math.BigDecimal EUPLPM) {
      this.EUPLPM = EUPLPM;
   }
   /**
    * The EUPLPD attribute.
   */
   protected java.math.BigDecimal EUPLPD = new BigDecimal("0");
   
   /**
    * Gets the EUPLPD value.
   */
   public java.math.BigDecimal getEUPLPD() {
      return EUPLPD;
   }
   
   /**
    * Sets the EUPLPD value.
   */
   public void setEUPLPD(java.math.BigDecimal EUPLPD) {
      this.EUPLPD = EUPLPD;
   }
   /**
    * The EUPLPY attribute.
   */
   protected java.math.BigDecimal EUPLPY = new BigDecimal("0");
   
   /**
    * Gets the EUPLPY value.
   */
   public java.math.BigDecimal getEUPLPY() {
      return EUPLPY;
   }
   
   /**
    * Sets the EUPLPY value.
   */
   public void setEUPLPY(java.math.BigDecimal EUPLPY) {
      this.EUPLPY = EUPLPY;
   }
   /**
    * The EUPRJC attribute.
   */
   protected java.math.BigDecimal EUPRJC = new BigDecimal("0");
   
   /**
    * Gets the EUPRJC value.
   */
   public java.math.BigDecimal getEUPRJC() {
      return EUPRJC;
   }
   
   /**
    * Sets the EUPRJC value.
   */
   public void setEUPRJC(java.math.BigDecimal EUPRJC) {
      this.EUPRJC = EUPRJC;
   }
   /**
    * The EUPRJD attribute.
   */
   protected java.math.BigDecimal EUPRJD = new BigDecimal("0");
   
   /**
    * Gets the EUPRJD value.
   */
   public java.math.BigDecimal getEUPRJD() {
      return EUPRJD;
   }
   
   /**
    * Sets the EUPRJD value.
   */
   public void setEUPRJD(java.math.BigDecimal EUPRJD) {
      this.EUPRJD = EUPRJD;
   }
   /**
    * The EUPRLT attribute.
   */
   protected java.math.BigDecimal EUPRLT = new BigDecimal("0");
   
   /**
    * Gets the EUPRLT value.
   */
   public java.math.BigDecimal getEUPRLT() {
      return EUPRLT;
   }
   
   /**
    * Sets the EUPRLT value.
   */
   public void setEUPRLT(java.math.BigDecimal EUPRLT) {
      this.EUPRLT = EUPRLT;
   }
   /**
    * The EUPTRD attribute.
   */
   protected java.math.BigDecimal EUPTRD = new BigDecimal("0");
   
   /**
    * Gets the EUPTRD value.
   */
   public java.math.BigDecimal getEUPTRD() {
      return EUPTRD;
   }
   
   /**
    * Sets the EUPTRD value.
   */
   public void setEUPTRD(java.math.BigDecimal EUPTRD) {
      this.EUPTRD = EUPTRD;
   }
   /**
    * The EUPTDD attribute.
   */
   protected java.math.BigDecimal EUPTDD = new BigDecimal("0");
   
   /**
    * Gets the EUPTDD value.
   */
   public java.math.BigDecimal getEUPTDD() {
      return EUPTDD;
   }
   
   /**
    * Sets the EUPTDD value.
   */
   public void setEUPTDD(java.math.BigDecimal EUPTDD) {
      this.EUPTDD = EUPTDD;
   }
   /**
    * The EUPTRM attribute.
   */
   protected java.math.BigDecimal EUPTRM = new BigDecimal("0");
   
   /**
    * Gets the EUPTRM value.
   */
   public java.math.BigDecimal getEUPTRM() {
      return EUPTRM;
   }
   
   /**
    * Sets the EUPTRM value.
   */
   public void setEUPTRM(java.math.BigDecimal EUPTRM) {
      this.EUPTRM = EUPTRM;
   }
   /**
    * The EUPTDM attribute.
   */
   protected java.math.BigDecimal EUPTDM = new BigDecimal("0");
   
   /**
    * Gets the EUPTDM value.
   */
   public java.math.BigDecimal getEUPTDM() {
      return EUPTDM;
   }
   
   /**
    * Sets the EUPTDM value.
   */
   public void setEUPTDM(java.math.BigDecimal EUPTDM) {
      this.EUPTDM = EUPTDM;
   }
   /**
    * The EUPTRY attribute.
   */
   protected java.math.BigDecimal EUPTRY = new BigDecimal("0");
   
   /**
    * Gets the EUPTRY value.
   */
   public java.math.BigDecimal getEUPTRY() {
      return EUPTRY;
   }
   
   /**
    * Sets the EUPTRY value.
   */
   public void setEUPTRY(java.math.BigDecimal EUPTRY) {
      this.EUPTRY = EUPTRY;
   }
   /**
    * The EUPTDY attribute.
   */
   protected java.math.BigDecimal EUPTDY = new BigDecimal("0");
   
   /**
    * Gets the EUPTDY value.
   */
   public java.math.BigDecimal getEUPTDY() {
      return EUPTDY;
   }
   
   /**
    * Sets the EUPTDY value.
   */
   public void setEUPTDY(java.math.BigDecimal EUPTDY) {
      this.EUPTDY = EUPTDY;
   }
   /**
    * The EUPCHG attribute.
   */
   protected java.math.BigDecimal EUPCHG = new BigDecimal("0");
   
   /**
    * Gets the EUPCHG value.
   */
   public java.math.BigDecimal getEUPCHG() {
      return EUPCHG;
   }
   
   /**
    * Sets the EUPCHG value.
   */
   public void setEUPCHG(java.math.BigDecimal EUPCHG) {
      this.EUPCHG = EUPCHG;
   }
   /**
    * The EUPOFC attribute.
   */
   protected java.lang.String EUPOFC = "";
   
   /**
    * Gets the EUPOFC value.
   */
   public java.lang.String getEUPOFC() {
      return EUPOFC.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPOFC value.
   */
   public void setEUPOFC(java.lang.String EUPOFC) {
      this.EUPOFC = EUPOFC;
   }
   /**
    * The EUPCCN attribute.
   */
   protected java.math.BigDecimal EUPCCN = new BigDecimal("0");
   
   /**
    * Gets the EUPCCN value.
   */
   public java.math.BigDecimal getEUPCCN() {
      return EUPCCN;
   }
   
   /**
    * Sets the EUPCCN value.
   */
   public void setEUPCCN(java.math.BigDecimal EUPCCN) {
      this.EUPCCN = EUPCCN;
   }
   /**
    * The EUPUBK attribute.
   */
   protected java.lang.String EUPUBK = "";
   
   /**
    * Gets the EUPUBK value.
   */
   public java.lang.String getEUPUBK() {
      return EUPUBK.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPUBK value.
   */
   public void setEUPUBK(java.lang.String EUPUBK) {
      this.EUPUBK = EUPUBK;
   }
   /**
    * The EUPUBR attribute.
   */
   protected java.math.BigDecimal EUPUBR = new BigDecimal("0");
   
   /**
    * Gets the EUPUBR value.
   */
   public java.math.BigDecimal getEUPUBR() {
      return EUPUBR;
   }
   
   /**
    * Sets the EUPUBR value.
   */
   public void setEUPUBR(java.math.BigDecimal EUPUBR) {
      this.EUPUBR = EUPUBR;
   }
   /**
    * The EUPALM attribute.
   */
   protected java.math.BigDecimal EUPALM = new BigDecimal("0");
   
   /**
    * Gets the EUPALM value.
   */
   public java.math.BigDecimal getEUPALM() {
      return EUPALM;
   }
   
   /**
    * Sets the EUPALM value.
   */
   public void setEUPALM(java.math.BigDecimal EUPALM) {
      this.EUPALM = EUPALM;
   }
   /**
    * The EUPANG attribute.
   */
   protected java.math.BigDecimal EUPANG = new BigDecimal("0");
   
   /**
    * Gets the EUPANG value.
   */
   public java.math.BigDecimal getEUPANG() {
      return EUPANG;
   }
   
   /**
    * Sets the EUPANG value.
   */
   public void setEUPANG(java.math.BigDecimal EUPANG) {
      this.EUPANG = EUPANG;
   }
   /**
    * The EUPCCY attribute.
   */
   protected java.lang.String EUPCCY = "";
   
   /**
    * Gets the EUPCCY value.
   */
   public java.lang.String getEUPCCY() {
      return EUPCCY.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPCCY value.
   */
   public void setEUPCCY(java.lang.String EUPCCY) {
      this.EUPCCY = EUPCCY;
   }
   /**
    * The EUPLNA attribute.
   */
   protected java.lang.String EUPLNA = "";
   
   /**
    * Gets the EUPLNA value.
   */
   public java.lang.String getEUPLNA() {
      return EUPLNA.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPLNA value.
   */
   public void setEUPLNA(java.lang.String EUPLNA) {
      this.EUPLNA = EUPLNA;
   }
   /**
    * The EUPTAT attribute.
   */
   protected java.lang.String EUPTAT = "";
   
   /**
    * Gets the EUPTAT value.
   */
   public java.lang.String getEUPTAT() {
      return EUPTAT.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPTAT value.
   */
   public void setEUPTAT(java.lang.String EUPTAT) {
      this.EUPTAT = EUPTAT;
   }
   /**
    * The EUPAPL attribute.
   */
   protected java.lang.String EUPAPL = "";
   
   /**
    * Gets the EUPAPL value.
   */
   public java.lang.String getEUPAPL() {
      return EUPAPL.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPAPL value.
   */
   public void setEUPAPL(java.lang.String EUPAPL) {
      this.EUPAPL = EUPAPL;
   }
   /**
    * The EUPGRE attribute.
   */
   protected java.math.BigDecimal EUPGRE = new BigDecimal("0");
   
   /**
    * Gets the EUPGRE value.
   */
   public java.math.BigDecimal getEUPGRE() {
      return EUPGRE;
   }
   
   /**
    * Sets the EUPGRE value.
   */
   public void setEUPGRE(java.math.BigDecimal EUPGRE) {
      this.EUPGRE = EUPGRE;
   }
   /**
    * The EUPNUE attribute.
   */
   protected java.math.BigDecimal EUPNUE = new BigDecimal("0");
   
   /**
    * Gets the EUPNUE value.
   */
   public java.math.BigDecimal getEUPNUE() {
      return EUPNUE;
   }
   
   /**
    * Sets the EUPNUE value.
   */
   public void setEUPNUE(java.math.BigDecimal EUPNUE) {
      this.EUPNUE = EUPNUE;
   }
   /**
    * The EUPNME attribute.
   */
   protected java.lang.String EUPNME = "";
   
   /**
    * Gets the EUPNME value.
   */
   public java.lang.String getEUPNME() {
      return EUPNME.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPNME value.
   */
   public void setEUPNME(java.lang.String EUPNME) {
      this.EUPNME = EUPNME;
   }
   /**
    * The EUPIDN attribute.
   */
   protected java.lang.String EUPIDN = "";
   
   /**
    * Gets the EUPIDN value.
   */
   public java.lang.String getEUPIDN() {
      return EUPIDN.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPIDN value.
   */
   public void setEUPIDN(java.lang.String EUPIDN) {
      this.EUPIDN = EUPIDN;
   }
   /**
    * The EUPEML attribute.
   */
   protected java.lang.String EUPEML = "";
   
   /**
    * Gets the EUPEML value.
   */
   public java.lang.String getEUPEML() {
      return EUPEML.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPEML value.
   */
   public void setEUPEML(java.lang.String EUPEML) {
      this.EUPEML = EUPEML;
   }
   /**
    * The EUPPHN attribute.
   */
   protected java.math.BigDecimal EUPPHN = new BigDecimal("0");
   
   /**
    * Gets the EUPPHN value.
   */
   public java.math.BigDecimal getEUPPHN() {
      return EUPPHN;
   }
   
   /**
    * Sets the EUPPHN value.
   */
   public void setEUPPHN(java.math.BigDecimal EUPPHN) {
      this.EUPPHN = EUPPHN;
   }
   /**
    * The EUPPXT attribute.
   */
   protected java.math.BigDecimal EUPPXT = new BigDecimal("0");
   
   /**
    * Gets the EUPPXT value.
   */
   public java.math.BigDecimal getEUPPXT() {
      return EUPPXT;
   }
   
   /**
    * Sets the EUPPXT value.
   */
   public void setEUPPXT(java.math.BigDecimal EUPPXT) {
      this.EUPPXT = EUPPXT;
   }
   /**
    * The EUPSEG attribute.
   */
   protected java.lang.String EUPSEG = "";
   
   /**
    * Gets the EUPSEG value.
   */
   public java.lang.String getEUPSEG() {
      return EUPSEG.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPSEG value.
   */
   public void setEUPSEG(java.lang.String EUPSEG) {
      this.EUPSEG = EUPSEG;
   }
   /**
    * The EUPUC1 attribute.
   */
   protected java.lang.String EUPUC1 = "";
   
   /**
    * Gets the EUPUC1 value.
   */
   public java.lang.String getEUPUC1() {
      return EUPUC1.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPUC1 value.
   */
   public void setEUPUC1(java.lang.String EUPUC1) {
      this.EUPUC1 = EUPUC1;
   }
   /**
    * The EUPUC2 attribute.
   */
   protected java.lang.String EUPUC2 = "";
   
   /**
    * Gets the EUPUC2 value.
   */
   public java.lang.String getEUPUC2() {
      return EUPUC2.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPUC2 value.
   */
   public void setEUPUC2(java.lang.String EUPUC2) {
      this.EUPUC2 = EUPUC2;
   }
   /**
    * The EUPUC3 attribute.
   */
   protected java.lang.String EUPUC3 = "";
   
   /**
    * Gets the EUPUC3 value.
   */
   public java.lang.String getEUPUC3() {
      return EUPUC3.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPUC3 value.
   */
   public void setEUPUC3(java.lang.String EUPUC3) {
      this.EUPUC3 = EUPUC3;
   }
   /**
    * The EUPROT attribute.
   */
   protected java.lang.String EUPROT = "";
   
   /**
    * Gets the EUPROT value.
   */
   public java.lang.String getEUPROT() {
      return EUPROT.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPROT value.
   */
   public void setEUPROT(java.lang.String EUPROT) {
      this.EUPROT = EUPROT;
   }
   /**
    * The EUPAOF attribute.
   */
   protected java.lang.String EUPAOF = "";
   
   /**
    * Gets the EUPAOF value.
   */
   public java.lang.String getEUPAOF() {
      return EUPAOF.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPAOF value.
   */
   public void setEUPAOF(java.lang.String EUPAOF) {
      this.EUPAOF = EUPAOF;
   }
   /**
    * The EUPFRZ attribute.
   */
   protected java.lang.String EUPFRZ = "";
   
   /**
    * Gets the EUPFRZ value.
   */
   public java.lang.String getEUPFRZ() {
      return EUPFRZ.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPFRZ value.
   */
   public void setEUPFRZ(java.lang.String EUPFRZ) {
      this.EUPFRZ = EUPFRZ;
   }
   /**
    * The EUPF01 attribute.
   */
   protected java.lang.String EUPF01 = "";
   
   /**
    * Gets the EUPF01 value.
   */
   public java.lang.String getEUPF01() {
      return EUPF01.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPF01 value.
   */
   public void setEUPF01(java.lang.String EUPF01) {
      this.EUPF01 = EUPF01;
   }
   /**
    * The EUPF02 attribute.
   */
   protected java.lang.String EUPF02 = "";
   
   /**
    * Gets the EUPF02 value.
   */
   public java.lang.String getEUPF02() {
      return EUPF02.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPF02 value.
   */
   public void setEUPF02(java.lang.String EUPF02) {
      this.EUPF02 = EUPF02;
   }
   /**
    * The EUPF03 attribute.
   */
   protected java.lang.String EUPF03 = "";
   
   /**
    * Gets the EUPF03 value.
   */
   public java.lang.String getEUPF03() {
      return EUPF03.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPF03 value.
   */
   public void setEUPF03(java.lang.String EUPF03) {
      this.EUPF03 = EUPF03;
   }
   /**
    * The EUPF04 attribute.
   */
   protected java.lang.String EUPF04 = "";
   
   /**
    * Gets the EUPF04 value.
   */
   public java.lang.String getEUPF04() {
      return EUPF04.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPF04 value.
   */
   public void setEUPF04(java.lang.String EUPF04) {
      this.EUPF04 = EUPF04;
   }
   /**
    * The EUPF05 attribute.
   */
   protected java.lang.String EUPF05 = "";
   
   /**
    * Gets the EUPF05 value.
   */
   public java.lang.String getEUPF05() {
      return EUPF05.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPF05 value.
   */
   public void setEUPF05(java.lang.String EUPF05) {
      this.EUPF05 = EUPF05;
   }
   /**
    * The EUPF06 attribute.
   */
   protected java.lang.String EUPF06 = "";
   
   /**
    * Gets the EUPF06 value.
   */
   public java.lang.String getEUPF06() {
      return EUPF06.toUpperCase().trim();
   }
   
   /**
    * Sets the EUPF06 value.
   */
   public void setEUPF06(java.lang.String EUPF06) {
      this.EUPF06 = EUPF06;
   }
   public String toString() {
      StringBuffer results = new StringBuffer();

      results.append(getClass().getName() + "\n");
      results.append("\tEUPUSR=" + EUPUSR + "\n");
      results.append("\tEUPACP=" + EUPACP + "\n");
      results.append("\tEUPOPR=" + EUPOPR + "\n");
      results.append("\tEUPSTS=" + EUPSTS + "\n");
      results.append("\tEUPLSU=" + EUPLSU + "\n");
      results.append("\tEUPLSM=" + EUPLSM + "\n");
      results.append("\tEUPLSD=" + EUPLSD + "\n");
      results.append("\tEUPLSY=" + EUPLSY + "\n");
      results.append("\tEUPLST=" + EUPLST + "\n");
      results.append("\tEUPRSC=" + EUPRSC + "\n");
      results.append("\tEUPOPM=" + EUPOPM + "\n");
      results.append("\tEUPOPD=" + EUPOPD + "\n");
      results.append("\tEUPOPY=" + EUPOPY + "\n");
      results.append("\tEUPSTM=" + EUPSTM + "\n");
      results.append("\tEUPSTD=" + EUPSTD + "\n");
      results.append("\tEUPSTY=" + EUPSTY + "\n");
      results.append("\tEUPLAM=" + EUPLAM + "\n");
      results.append("\tEUPLAD=" + EUPLAD + "\n");
      results.append("\tEUPLAY=" + EUPLAY + "\n");
      results.append("\tEUPLMU=" + EUPLMU + "\n");
      results.append("\tEUPMAM=" + EUPMAM + "\n");
      results.append("\tEUPMAD=" + EUPMAD + "\n");
      results.append("\tEUPMAY=" + EUPMAY + "\n");
      results.append("\tEUPLPM=" + EUPLPM + "\n");
      results.append("\tEUPLPD=" + EUPLPD + "\n");
      results.append("\tEUPLPY=" + EUPLPY + "\n");
      results.append("\tEUPRJC=" + EUPRJC + "\n");
      results.append("\tEUPRJD=" + EUPRJD + "\n");
      results.append("\tEUPRLT=" + EUPRLT + "\n");
      results.append("\tEUPTRD=" + EUPTRD + "\n");
      results.append("\tEUPTDD=" + EUPTDD + "\n");
      results.append("\tEUPTRM=" + EUPTRM + "\n");
      results.append("\tEUPTDM=" + EUPTDM + "\n");
      results.append("\tEUPTRY=" + EUPTRY + "\n");
      results.append("\tEUPTDY=" + EUPTDY + "\n");
      results.append("\tEUPCHG=" + EUPCHG + "\n");
      results.append("\tEUPOFC=" + EUPOFC + "\n");
      results.append("\tEUPCCN=" + EUPCCN + "\n");
      results.append("\tEUPUBK=" + EUPUBK + "\n");
      results.append("\tEUPUBR=" + EUPUBR + "\n");
      results.append("\tEUPALM=" + EUPALM + "\n");
      results.append("\tEUPANG=" + EUPANG + "\n");
      results.append("\tEUPCCY=" + EUPCCY + "\n");
      results.append("\tEUPLNA=" + EUPLNA + "\n");
      results.append("\tEUPTAT=" + EUPTAT + "\n");
      results.append("\tEUPAPL=" + EUPAPL + "\n");
      results.append("\tEUPGRE=" + EUPGRE + "\n");
      results.append("\tEUPNUE=" + EUPNUE + "\n");
      results.append("\tEUPNME=" + EUPNME + "\n");
      results.append("\tEUPIDN=" + EUPIDN + "\n");
      results.append("\tEUPEML=" + EUPEML + "\n");
      results.append("\tEUPPHN=" + EUPPHN + "\n");
      results.append("\tEUPPXT=" + EUPPXT + "\n");
      results.append("\tEUPSEG=" + EUPSEG + "\n");
      results.append("\tEUPUC1=" + EUPUC1 + "\n");
      results.append("\tEUPUC2=" + EUPUC2 + "\n");
      results.append("\tEUPUC3=" + EUPUC3 + "\n");
      results.append("\tEUPROT=" + EUPROT + "\n");
      results.append("\tEUPAOF=" + EUPAOF + "\n");
      results.append("\tEUPFRZ=" + EUPFRZ + "\n");
      results.append("\tEUPF01=" + EUPF01 + "\n");
      results.append("\tEUPF02=" + EUPF02 + "\n");
      results.append("\tEUPF03=" + EUPF03 + "\n");
      results.append("\tEUPF04=" + EUPF04 + "\n");
      results.append("\tEUPF05=" + EUPF05 + "\n");
      results.append("\tEUPF06=" + EUPF06 + "\n");

      return results.toString();
   }

}