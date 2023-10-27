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
 * Autogenerated on 09/15/2003 04:30:08<br>
 * &nbsp;&nbsp;&nbsp; table = "DLSFEBean"
*
* @author Generator
*/
public class DLSFE implements java.io.Serializable {

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
    * The DLSCUN attribute.
   */
   protected java.math.BigDecimal DLSCUN = new BigDecimal("0");
   
   /**
    * Gets the DLSCUN value.
   */
   public java.math.BigDecimal getDLSCUN() {
      return DLSCUN;
   }
   
   /**
    * Sets the DLSCUN value.
   */
   public void setDLSCUN(java.math.BigDecimal DLSCUN) {
      this.DLSCUN = DLSCUN;
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
    * The DLSDE1 attribute.
   */
   protected java.lang.String DLSDE1 = "";
   
   /**
    * Gets the DLSDE1 value.
   */
   public java.lang.String getDLSDE1() {
      return DLSDE1.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSDE1 value.
   */
   public void setDLSDE1(java.lang.String DLSDE1) {
      this.DLSDE1 = DLSDE1;
   }
   /**
    * The DLSAM1 attribute.
   */
   protected java.math.BigDecimal DLSAM1 = new BigDecimal("0");
   
   /**
    * Gets the DLSAM1 value.
   */
   public java.math.BigDecimal getDLSAM1() {
      return DLSAM1;
   }
   
   /**
    * Sets the DLSAM1 value.
   */
   public void setDLSAM1(java.math.BigDecimal DLSAM1) {
      this.DLSAM1 = DLSAM1;
   }
   /**
    * The DLSFA1 attribute.
   */
   protected java.lang.String DLSFA1 = "";
   
   /**
    * Gets the DLSFA1 value.
   */
   public java.lang.String getDLSFA1() {
      return DLSFA1.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSFA1 value.
   */
   public void setDLSFA1(java.lang.String DLSFA1) {
      this.DLSFA1 = DLSFA1;
   }
   /**
    * The DLSMX1 attribute.
   */
   protected java.math.BigDecimal DLSMX1 = new BigDecimal("0");
   
   /**
    * Gets the DLSMX1 value.
   */
   public java.math.BigDecimal getDLSMX1() {
      return DLSMX1;
   }
   
   /**
    * Sets the DLSMX1 value.
   */
   public void setDLSMX1(java.math.BigDecimal DLSMX1) {
      this.DLSMX1 = DLSMX1;
   }
   /**
    * The DLSMN1 attribute.
   */
   protected java.math.BigDecimal DLSMN1 = new BigDecimal("0");
   
   /**
    * Gets the DLSMN1 value.
   */
   public java.math.BigDecimal getDLSMN1() {
      return DLSMN1;
   }
   
   /**
    * Sets the DLSMN1 value.
   */
   public void setDLSMN1(java.math.BigDecimal DLSMN1) {
      this.DLSMN1 = DLSMN1;
   }
   /**
    * The DLSGL1 attribute.
   */
   protected java.math.BigDecimal DLSGL1 = new BigDecimal("0");
   
   /**
    * Gets the DLSGL1 value.
   */
   public java.math.BigDecimal getDLSGL1() {
      return DLSGL1;
   }
   
   /**
    * Sets the DLSGL1 value.
   */
   public void setDLSGL1(java.math.BigDecimal DLSGL1) {
      this.DLSGL1 = DLSGL1;
   }
   /**
    * The DLSGB1 attribute.
   */
   protected java.lang.String DLSGB1 = "";
   
   /**
    * Gets the DLSGB1 value.
   */
   public java.lang.String getDLSGB1() {
      return DLSGB1.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSGB1 value.
   */
   public void setDLSGB1(java.lang.String DLSGB1) {
      this.DLSGB1 = DLSGB1;
   }
   /**
    * The DLSAP1 attribute.
   */
   protected java.lang.String DLSAP1 = "";
   
   /**
    * Gets the DLSAP1 value.
   */
   public java.lang.String getDLSAP1() {
      return DLSAP1.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSAP1 value.
   */
   public void setDLSAP1(java.lang.String DLSAP1) {
      this.DLSAP1 = DLSAP1;
   }
   /**
    * The DLSWH1 attribute.
   */
   protected java.lang.String DLSWH1 = "";
   
   /**
    * Gets the DLSWH1 value.
   */
   public java.lang.String getDLSWH1() {
      return DLSWH1.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSWH1 value.
   */
   public void setDLSWH1(java.lang.String DLSWH1) {
      this.DLSWH1 = DLSWH1;
   }
   /**
    * The DLSDE2 attribute.
   */
   protected java.lang.String DLSDE2 = "";
   
   /**
    * Gets the DLSDE2 value.
   */
   public java.lang.String getDLSDE2() {
      return DLSDE2.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSDE2 value.
   */
   public void setDLSDE2(java.lang.String DLSDE2) {
      this.DLSDE2 = DLSDE2;
   }
   /**
    * The DLSAM2 attribute.
   */
   protected java.math.BigDecimal DLSAM2 = new BigDecimal("0");
   
   /**
    * Gets the DLSAM2 value.
   */
   public java.math.BigDecimal getDLSAM2() {
      return DLSAM2;
   }
   
   /**
    * Sets the DLSAM2 value.
   */
   public void setDLSAM2(java.math.BigDecimal DLSAM2) {
      this.DLSAM2 = DLSAM2;
   }
   /**
    * The DLSFA2 attribute.
   */
   protected java.lang.String DLSFA2 = "";
   
   /**
    * Gets the DLSFA2 value.
   */
   public java.lang.String getDLSFA2() {
      return DLSFA2.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSFA2 value.
   */
   public void setDLSFA2(java.lang.String DLSFA2) {
      this.DLSFA2 = DLSFA2;
   }
   /**
    * The DLSMX2 attribute.
   */
   protected java.math.BigDecimal DLSMX2 = new BigDecimal("0");
   
   /**
    * Gets the DLSMX2 value.
   */
   public java.math.BigDecimal getDLSMX2() {
      return DLSMX2;
   }
   
   /**
    * Sets the DLSMX2 value.
   */
   public void setDLSMX2(java.math.BigDecimal DLSMX2) {
      this.DLSMX2 = DLSMX2;
   }
   /**
    * The DLSMN2 attribute.
   */
   protected java.math.BigDecimal DLSMN2 = new BigDecimal("0");
   
   /**
    * Gets the DLSMN2 value.
   */
   public java.math.BigDecimal getDLSMN2() {
      return DLSMN2;
   }
   
   /**
    * Sets the DLSMN2 value.
   */
   public void setDLSMN2(java.math.BigDecimal DLSMN2) {
      this.DLSMN2 = DLSMN2;
   }
   /**
    * The DLSGL2 attribute.
   */
   protected java.math.BigDecimal DLSGL2 = new BigDecimal("0");
   
   /**
    * Gets the DLSGL2 value.
   */
   public java.math.BigDecimal getDLSGL2() {
      return DLSGL2;
   }
   
   /**
    * Sets the DLSGL2 value.
   */
   public void setDLSGL2(java.math.BigDecimal DLSGL2) {
      this.DLSGL2 = DLSGL2;
   }
   /**
    * The DLSGB2 attribute.
   */
   protected java.lang.String DLSGB2 = "";
   
   /**
    * Gets the DLSGB2 value.
   */
   public java.lang.String getDLSGB2() {
      return DLSGB2.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSGB2 value.
   */
   public void setDLSGB2(java.lang.String DLSGB2) {
      this.DLSGB2 = DLSGB2;
   }
   /**
    * The DLSAP2 attribute.
   */
   protected java.lang.String DLSAP2 = "";
   
   /**
    * Gets the DLSAP2 value.
   */
   public java.lang.String getDLSAP2() {
      return DLSAP2.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSAP2 value.
   */
   public void setDLSAP2(java.lang.String DLSAP2) {
      this.DLSAP2 = DLSAP2;
   }
   /**
    * The DLSWH2 attribute.
   */
   protected java.lang.String DLSWH2 = "";
   
   /**
    * Gets the DLSWH2 value.
   */
   public java.lang.String getDLSWH2() {
      return DLSWH2.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSWH2 value.
   */
   public void setDLSWH2(java.lang.String DLSWH2) {
      this.DLSWH2 = DLSWH2;
   }
   /**
    * The DLSDE3 attribute.
   */
   protected java.lang.String DLSDE3 = "";
   
   /**
    * Gets the DLSDE3 value.
   */
   public java.lang.String getDLSDE3() {
      return DLSDE3.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSDE3 value.
   */
   public void setDLSDE3(java.lang.String DLSDE3) {
      this.DLSDE3 = DLSDE3;
   }
   /**
    * The DLSAM3 attribute.
   */
   protected java.math.BigDecimal DLSAM3 = new BigDecimal("0");
   
   /**
    * Gets the DLSAM3 value.
   */
   public java.math.BigDecimal getDLSAM3() {
      return DLSAM3;
   }
   
   /**
    * Sets the DLSAM3 value.
   */
   public void setDLSAM3(java.math.BigDecimal DLSAM3) {
      this.DLSAM3 = DLSAM3;
   }
   /**
    * The DLSFA3 attribute.
   */
   protected java.lang.String DLSFA3 = "";
   
   /**
    * Gets the DLSFA3 value.
   */
   public java.lang.String getDLSFA3() {
      return DLSFA3.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSFA3 value.
   */
   public void setDLSFA3(java.lang.String DLSFA3) {
      this.DLSFA3 = DLSFA3;
   }
   /**
    * The DLSMX3 attribute.
   */
   protected java.math.BigDecimal DLSMX3 = new BigDecimal("0");
   
   /**
    * Gets the DLSMX3 value.
   */
   public java.math.BigDecimal getDLSMX3() {
      return DLSMX3;
   }
   
   /**
    * Sets the DLSMX3 value.
   */
   public void setDLSMX3(java.math.BigDecimal DLSMX3) {
      this.DLSMX3 = DLSMX3;
   }
   /**
    * The DLSMN3 attribute.
   */
   protected java.math.BigDecimal DLSMN3 = new BigDecimal("0");
   
   /**
    * Gets the DLSMN3 value.
   */
   public java.math.BigDecimal getDLSMN3() {
      return DLSMN3;
   }
   
   /**
    * Sets the DLSMN3 value.
   */
   public void setDLSMN3(java.math.BigDecimal DLSMN3) {
      this.DLSMN3 = DLSMN3;
   }
   /**
    * The DLSGL3 attribute.
   */
   protected java.math.BigDecimal DLSGL3 = new BigDecimal("0");
   
   /**
    * Gets the DLSGL3 value.
   */
   public java.math.BigDecimal getDLSGL3() {
      return DLSGL3;
   }
   
   /**
    * Sets the DLSGL3 value.
   */
   public void setDLSGL3(java.math.BigDecimal DLSGL3) {
      this.DLSGL3 = DLSGL3;
   }
   /**
    * The DLSGB3 attribute.
   */
   protected java.lang.String DLSGB3 = "";
   
   /**
    * Gets the DLSGB3 value.
   */
   public java.lang.String getDLSGB3() {
      return DLSGB3.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSGB3 value.
   */
   public void setDLSGB3(java.lang.String DLSGB3) {
      this.DLSGB3 = DLSGB3;
   }
   /**
    * The DLSAP3 attribute.
   */
   protected java.lang.String DLSAP3 = "";
   
   /**
    * Gets the DLSAP3 value.
   */
   public java.lang.String getDLSAP3() {
      return DLSAP3.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSAP3 value.
   */
   public void setDLSAP3(java.lang.String DLSAP3) {
      this.DLSAP3 = DLSAP3;
   }
   /**
    * The DLSWH3 attribute.
   */
   protected java.lang.String DLSWH3 = "";
   
   /**
    * Gets the DLSWH3 value.
   */
   public java.lang.String getDLSWH3() {
      return DLSWH3.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSWH3 value.
   */
   public void setDLSWH3(java.lang.String DLSWH3) {
      this.DLSWH3 = DLSWH3;
   }
   /**
    * The DLSDE4 attribute.
   */
   protected java.lang.String DLSDE4 = "";
   
   /**
    * Gets the DLSDE4 value.
   */
   public java.lang.String getDLSDE4() {
      return DLSDE4.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSDE4 value.
   */
   public void setDLSDE4(java.lang.String DLSDE4) {
      this.DLSDE4 = DLSDE4;
   }
   /**
    * The DLSAM4 attribute.
   */
   protected java.math.BigDecimal DLSAM4 = new BigDecimal("0");
   
   /**
    * Gets the DLSAM4 value.
   */
   public java.math.BigDecimal getDLSAM4() {
      return DLSAM4;
   }
   
   /**
    * Sets the DLSAM4 value.
   */
   public void setDLSAM4(java.math.BigDecimal DLSAM4) {
      this.DLSAM4 = DLSAM4;
   }
   /**
    * The DLSFA4 attribute.
   */
   protected java.lang.String DLSFA4 = "";
   
   /**
    * Gets the DLSFA4 value.
   */
   public java.lang.String getDLSFA4() {
      return DLSFA4.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSFA4 value.
   */
   public void setDLSFA4(java.lang.String DLSFA4) {
      this.DLSFA4 = DLSFA4;
   }
   /**
    * The DLSMX4 attribute.
   */
   protected java.math.BigDecimal DLSMX4 = new BigDecimal("0");
   
   /**
    * Gets the DLSMX4 value.
   */
   public java.math.BigDecimal getDLSMX4() {
      return DLSMX4;
   }
   
   /**
    * Sets the DLSMX4 value.
   */
   public void setDLSMX4(java.math.BigDecimal DLSMX4) {
      this.DLSMX4 = DLSMX4;
   }
   /**
    * The DLSMN4 attribute.
   */
   protected java.math.BigDecimal DLSMN4 = new BigDecimal("0");
   
   /**
    * Gets the DLSMN4 value.
   */
   public java.math.BigDecimal getDLSMN4() {
      return DLSMN4;
   }
   
   /**
    * Sets the DLSMN4 value.
   */
   public void setDLSMN4(java.math.BigDecimal DLSMN4) {
      this.DLSMN4 = DLSMN4;
   }
   /**
    * The DLSGL4 attribute.
   */
   protected java.math.BigDecimal DLSGL4 = new BigDecimal("0");
   
   /**
    * Gets the DLSGL4 value.
   */
   public java.math.BigDecimal getDLSGL4() {
      return DLSGL4;
   }
   
   /**
    * Sets the DLSGL4 value.
   */
   public void setDLSGL4(java.math.BigDecimal DLSGL4) {
      this.DLSGL4 = DLSGL4;
   }
   /**
    * The DLSGB4 attribute.
   */
   protected java.lang.String DLSGB4 = "";
   
   /**
    * Gets the DLSGB4 value.
   */
   public java.lang.String getDLSGB4() {
      return DLSGB4.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSGB4 value.
   */
   public void setDLSGB4(java.lang.String DLSGB4) {
      this.DLSGB4 = DLSGB4;
   }
   /**
    * The DLSAP4 attribute.
   */
   protected java.lang.String DLSAP4 = "";
   
   /**
    * Gets the DLSAP4 value.
   */
   public java.lang.String getDLSAP4() {
      return DLSAP4.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSAP4 value.
   */
   public void setDLSAP4(java.lang.String DLSAP4) {
      this.DLSAP4 = DLSAP4;
   }
   /**
    * The DLSWH4 attribute.
   */
   protected java.lang.String DLSWH4 = "";
   
   /**
    * Gets the DLSWH4 value.
   */
   public java.lang.String getDLSWH4() {
      return DLSWH4.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSWH4 value.
   */
   public void setDLSWH4(java.lang.String DLSWH4) {
      this.DLSWH4 = DLSWH4;
   }
   /**
    * The DLSDE5 attribute.
   */
   protected java.lang.String DLSDE5 = "";
   
   /**
    * Gets the DLSDE5 value.
   */
   public java.lang.String getDLSDE5() {
      return DLSDE5.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSDE5 value.
   */
   public void setDLSDE5(java.lang.String DLSDE5) {
      this.DLSDE5 = DLSDE5;
   }
   /**
    * The DLSAM5 attribute.
   */
   protected java.math.BigDecimal DLSAM5 = new BigDecimal("0");
   
   /**
    * Gets the DLSAM5 value.
   */
   public java.math.BigDecimal getDLSAM5() {
      return DLSAM5;
   }
   
   /**
    * Sets the DLSAM5 value.
   */
   public void setDLSAM5(java.math.BigDecimal DLSAM5) {
      this.DLSAM5 = DLSAM5;
   }
   /**
    * The DLSFA5 attribute.
   */
   protected java.lang.String DLSFA5 = "";
   
   /**
    * Gets the DLSFA5 value.
   */
   public java.lang.String getDLSFA5() {
      return DLSFA5.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSFA5 value.
   */
   public void setDLSFA5(java.lang.String DLSFA5) {
      this.DLSFA5 = DLSFA5;
   }
   /**
    * The DLSMX5 attribute.
   */
   protected java.math.BigDecimal DLSMX5 = new BigDecimal("0");
   
   /**
    * Gets the DLSMX5 value.
   */
   public java.math.BigDecimal getDLSMX5() {
      return DLSMX5;
   }
   
   /**
    * Sets the DLSMX5 value.
   */
   public void setDLSMX5(java.math.BigDecimal DLSMX5) {
      this.DLSMX5 = DLSMX5;
   }
   /**
    * The DLSMN5 attribute.
   */
   protected java.math.BigDecimal DLSMN5 = new BigDecimal("0");
   
   /**
    * Gets the DLSMN5 value.
   */
   public java.math.BigDecimal getDLSMN5() {
      return DLSMN5;
   }
   
   /**
    * Sets the DLSMN5 value.
   */
   public void setDLSMN5(java.math.BigDecimal DLSMN5) {
      this.DLSMN5 = DLSMN5;
   }
   /**
    * The DLSGL5 attribute.
   */
   protected java.math.BigDecimal DLSGL5 = new BigDecimal("0");
   
   /**
    * Gets the DLSGL5 value.
   */
   public java.math.BigDecimal getDLSGL5() {
      return DLSGL5;
   }
   
   /**
    * Sets the DLSGL5 value.
   */
   public void setDLSGL5(java.math.BigDecimal DLSGL5) {
      this.DLSGL5 = DLSGL5;
   }
   /**
    * The DLSGB5 attribute.
   */
   protected java.lang.String DLSGB5 = "";
   
   /**
    * Gets the DLSGB5 value.
   */
   public java.lang.String getDLSGB5() {
      return DLSGB5.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSGB5 value.
   */
   public void setDLSGB5(java.lang.String DLSGB5) {
      this.DLSGB5 = DLSGB5;
   }
   /**
    * The DLSAP5 attribute.
   */
   protected java.lang.String DLSAP5 = "";
   
   /**
    * Gets the DLSAP5 value.
   */
   public java.lang.String getDLSAP5() {
      return DLSAP5.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSAP5 value.
   */
   public void setDLSAP5(java.lang.String DLSAP5) {
      this.DLSAP5 = DLSAP5;
   }
   /**
    * The DLSWH5 attribute.
   */
   protected java.lang.String DLSWH5 = "";
   
   /**
    * Gets the DLSWH5 value.
   */
   public java.lang.String getDLSWH5() {
      return DLSWH5.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSWH5 value.
   */
   public void setDLSWH5(java.lang.String DLSWH5) {
      this.DLSWH5 = DLSWH5;
   }
   /**
    * The DLSDE6 attribute.
   */
   protected java.lang.String DLSDE6 = "";
   
   /**
    * Gets the DLSDE6 value.
   */
   public java.lang.String getDLSDE6() {
      return DLSDE6.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSDE6 value.
   */
   public void setDLSDE6(java.lang.String DLSDE6) {
      this.DLSDE6 = DLSDE6;
   }
   /**
    * The DLSAM6 attribute.
   */
   protected java.math.BigDecimal DLSAM6 = new BigDecimal("0");
   
   /**
    * Gets the DLSAM6 value.
   */
   public java.math.BigDecimal getDLSAM6() {
      return DLSAM6;
   }
   
   /**
    * Sets the DLSAM6 value.
   */
   public void setDLSAM6(java.math.BigDecimal DLSAM6) {
      this.DLSAM6 = DLSAM6;
   }
   /**
    * The DLSFA6 attribute.
   */
   protected java.lang.String DLSFA6 = "";
   
   /**
    * Gets the DLSFA6 value.
   */
   public java.lang.String getDLSFA6() {
      return DLSFA6.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSFA6 value.
   */
   public void setDLSFA6(java.lang.String DLSFA6) {
      this.DLSFA6 = DLSFA6;
   }
   /**
    * The DLSMX6 attribute.
   */
   protected java.math.BigDecimal DLSMX6 = new BigDecimal("0");
   
   /**
    * Gets the DLSMX6 value.
   */
   public java.math.BigDecimal getDLSMX6() {
      return DLSMX6;
   }
   
   /**
    * Sets the DLSMX6 value.
   */
   public void setDLSMX6(java.math.BigDecimal DLSMX6) {
      this.DLSMX6 = DLSMX6;
   }
   /**
    * The DLSMN6 attribute.
   */
   protected java.math.BigDecimal DLSMN6 = new BigDecimal("0");
   
   /**
    * Gets the DLSMN6 value.
   */
   public java.math.BigDecimal getDLSMN6() {
      return DLSMN6;
   }
   
   /**
    * Sets the DLSMN6 value.
   */
   public void setDLSMN6(java.math.BigDecimal DLSMN6) {
      this.DLSMN6 = DLSMN6;
   }
   /**
    * The DLSGL6 attribute.
   */
   protected java.math.BigDecimal DLSGL6 = new BigDecimal("0");
   
   /**
    * Gets the DLSGL6 value.
   */
   public java.math.BigDecimal getDLSGL6() {
      return DLSGL6;
   }
   
   /**
    * Sets the DLSGL6 value.
   */
   public void setDLSGL6(java.math.BigDecimal DLSGL6) {
      this.DLSGL6 = DLSGL6;
   }
   /**
    * The DLSGB6 attribute.
   */
   protected java.lang.String DLSGB6 = "";
   
   /**
    * Gets the DLSGB6 value.
   */
   public java.lang.String getDLSGB6() {
      return DLSGB6.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSGB6 value.
   */
   public void setDLSGB6(java.lang.String DLSGB6) {
      this.DLSGB6 = DLSGB6;
   }
   /**
    * The DLSAP6 attribute.
   */
   protected java.lang.String DLSAP6 = "";
   
   /**
    * Gets the DLSAP6 value.
   */
   public java.lang.String getDLSAP6() {
      return DLSAP6.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSAP6 value.
   */
   public void setDLSAP6(java.lang.String DLSAP6) {
      this.DLSAP6 = DLSAP6;
   }
   /**
    * The DLSWH6 attribute.
   */
   protected java.lang.String DLSWH6 = "";
   
   /**
    * Gets the DLSWH6 value.
   */
   public java.lang.String getDLSWH6() {
      return DLSWH6.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSWH6 value.
   */
   public void setDLSWH6(java.lang.String DLSWH6) {
      this.DLSWH6 = DLSWH6;
   }
   /**
    * The DLSDE7 attribute.
   */
   protected java.lang.String DLSDE7 = "";
   
   /**
    * Gets the DLSDE7 value.
   */
   public java.lang.String getDLSDE7() {
      return DLSDE7.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSDE7 value.
   */
   public void setDLSDE7(java.lang.String DLSDE7) {
      this.DLSDE7 = DLSDE7;
   }
   /**
    * The DLSAM7 attribute.
   */
   protected java.math.BigDecimal DLSAM7 = new BigDecimal("0");
   
   /**
    * Gets the DLSAM7 value.
   */
   public java.math.BigDecimal getDLSAM7() {
      return DLSAM7;
   }
   
   /**
    * Sets the DLSAM7 value.
   */
   public void setDLSAM7(java.math.BigDecimal DLSAM7) {
      this.DLSAM7 = DLSAM7;
   }
   /**
    * The DLSFA7 attribute.
   */
   protected java.lang.String DLSFA7 = "";
   
   /**
    * Gets the DLSFA7 value.
   */
   public java.lang.String getDLSFA7() {
      return DLSFA7.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSFA7 value.
   */
   public void setDLSFA7(java.lang.String DLSFA7) {
      this.DLSFA7 = DLSFA7;
   }
   /**
    * The DLSMX7 attribute.
   */
   protected java.math.BigDecimal DLSMX7 = new BigDecimal("0");
   
   /**
    * Gets the DLSMX7 value.
   */
   public java.math.BigDecimal getDLSMX7() {
      return DLSMX7;
   }
   
   /**
    * Sets the DLSMX7 value.
   */
   public void setDLSMX7(java.math.BigDecimal DLSMX7) {
      this.DLSMX7 = DLSMX7;
   }
   /**
    * The DLSMN7 attribute.
   */
   protected java.math.BigDecimal DLSMN7 = new BigDecimal("0");
   
   /**
    * Gets the DLSMN7 value.
   */
   public java.math.BigDecimal getDLSMN7() {
      return DLSMN7;
   }
   
   /**
    * Sets the DLSMN7 value.
   */
   public void setDLSMN7(java.math.BigDecimal DLSMN7) {
      this.DLSMN7 = DLSMN7;
   }
   /**
    * The DLSGL7 attribute.
   */
   protected java.math.BigDecimal DLSGL7 = new BigDecimal("0");
   
   /**
    * Gets the DLSGL7 value.
   */
   public java.math.BigDecimal getDLSGL7() {
      return DLSGL7;
   }
   
   /**
    * Sets the DLSGL7 value.
   */
   public void setDLSGL7(java.math.BigDecimal DLSGL7) {
      this.DLSGL7 = DLSGL7;
   }
   /**
    * The DLSGB7 attribute.
   */
   protected java.lang.String DLSGB7 = "";
   
   /**
    * Gets the DLSGB7 value.
   */
   public java.lang.String getDLSGB7() {
      return DLSGB7.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSGB7 value.
   */
   public void setDLSGB7(java.lang.String DLSGB7) {
      this.DLSGB7 = DLSGB7;
   }
   /**
    * The DLSAP7 attribute.
   */
   protected java.lang.String DLSAP7 = "";
   
   /**
    * Gets the DLSAP7 value.
   */
   public java.lang.String getDLSAP7() {
      return DLSAP7.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSAP7 value.
   */
   public void setDLSAP7(java.lang.String DLSAP7) {
      this.DLSAP7 = DLSAP7;
   }
   /**
    * The DLSWH7 attribute.
   */
   protected java.lang.String DLSWH7 = "";
   
   /**
    * Gets the DLSWH7 value.
   */
   public java.lang.String getDLSWH7() {
      return DLSWH7.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSWH7 value.
   */
   public void setDLSWH7(java.lang.String DLSWH7) {
      this.DLSWH7 = DLSWH7;
   }
   /**
    * The DLSDE8 attribute.
   */
   protected java.lang.String DLSDE8 = "";
   
   /**
    * Gets the DLSDE8 value.
   */
   public java.lang.String getDLSDE8() {
      return DLSDE8.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSDE8 value.
   */
   public void setDLSDE8(java.lang.String DLSDE8) {
      this.DLSDE8 = DLSDE8;
   }
   /**
    * The DLSAM8 attribute.
   */
   protected java.math.BigDecimal DLSAM8 = new BigDecimal("0");
   
   /**
    * Gets the DLSAM8 value.
   */
   public java.math.BigDecimal getDLSAM8() {
      return DLSAM8;
   }
   
   /**
    * Sets the DLSAM8 value.
   */
   public void setDLSAM8(java.math.BigDecimal DLSAM8) {
      this.DLSAM8 = DLSAM8;
   }
   /**
    * The DLSFA8 attribute.
   */
   protected java.lang.String DLSFA8 = "";
   
   /**
    * Gets the DLSFA8 value.
   */
   public java.lang.String getDLSFA8() {
      return DLSFA8.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSFA8 value.
   */
   public void setDLSFA8(java.lang.String DLSFA8) {
      this.DLSFA8 = DLSFA8;
   }
   /**
    * The DLSMX8 attribute.
   */
   protected java.math.BigDecimal DLSMX8 = new BigDecimal("0");
   
   /**
    * Gets the DLSMX8 value.
   */
   public java.math.BigDecimal getDLSMX8() {
      return DLSMX8;
   }
   
   /**
    * Sets the DLSMX8 value.
   */
   public void setDLSMX8(java.math.BigDecimal DLSMX8) {
      this.DLSMX8 = DLSMX8;
   }
   /**
    * The DLSMN8 attribute.
   */
   protected java.math.BigDecimal DLSMN8 = new BigDecimal("0");
   
   /**
    * Gets the DLSMN8 value.
   */
   public java.math.BigDecimal getDLSMN8() {
      return DLSMN8;
   }
   
   /**
    * Sets the DLSMN8 value.
   */
   public void setDLSMN8(java.math.BigDecimal DLSMN8) {
      this.DLSMN8 = DLSMN8;
   }
   /**
    * The DLSGL8 attribute.
   */
   protected java.math.BigDecimal DLSGL8 = new BigDecimal("0");
   
   /**
    * Gets the DLSGL8 value.
   */
   public java.math.BigDecimal getDLSGL8() {
      return DLSGL8;
   }
   
   /**
    * Sets the DLSGL8 value.
   */
   public void setDLSGL8(java.math.BigDecimal DLSGL8) {
      this.DLSGL8 = DLSGL8;
   }
   /**
    * The DLSGB8 attribute.
   */
   protected java.lang.String DLSGB8 = "";
   
   /**
    * Gets the DLSGB8 value.
   */
   public java.lang.String getDLSGB8() {
      return DLSGB8.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSGB8 value.
   */
   public void setDLSGB8(java.lang.String DLSGB8) {
      this.DLSGB8 = DLSGB8;
   }
   /**
    * The DLSAP8 attribute.
   */
   protected java.lang.String DLSAP8 = "";
   
   /**
    * Gets the DLSAP8 value.
   */
   public java.lang.String getDLSAP8() {
      return DLSAP8.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSAP8 value.
   */
   public void setDLSAP8(java.lang.String DLSAP8) {
      this.DLSAP8 = DLSAP8;
   }
   /**
    * The DLSWH8 attribute.
   */
   protected java.lang.String DLSWH8 = "";
   
   /**
    * Gets the DLSWH8 value.
   */
   public java.lang.String getDLSWH8() {
      return DLSWH8.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSWH8 value.
   */
   public void setDLSWH8(java.lang.String DLSWH8) {
      this.DLSWH8 = DLSWH8;
   }
   /**
    * The DLSDE9 attribute.
   */
   protected java.lang.String DLSDE9 = "";
   
   /**
    * Gets the DLSDE9 value.
   */
   public java.lang.String getDLSDE9() {
      return DLSDE9.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSDE9 value.
   */
   public void setDLSDE9(java.lang.String DLSDE9) {
      this.DLSDE9 = DLSDE9;
   }
   /**
    * The DLSAM9 attribute.
   */
   protected java.math.BigDecimal DLSAM9 = new BigDecimal("0");
   
   /**
    * Gets the DLSAM9 value.
   */
   public java.math.BigDecimal getDLSAM9() {
      return DLSAM9;
   }
   
   /**
    * Sets the DLSAM9 value.
   */
   public void setDLSAM9(java.math.BigDecimal DLSAM9) {
      this.DLSAM9 = DLSAM9;
   }
   /**
    * The DLSFA9 attribute.
   */
   protected java.lang.String DLSFA9 = "";
   
   /**
    * Gets the DLSFA9 value.
   */
   public java.lang.String getDLSFA9() {
      return DLSFA9.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSFA9 value.
   */
   public void setDLSFA9(java.lang.String DLSFA9) {
      this.DLSFA9 = DLSFA9;
   }
   /**
    * The DLSMX9 attribute.
   */
   protected java.math.BigDecimal DLSMX9 = new BigDecimal("0");
   
   /**
    * Gets the DLSMX9 value.
   */
   public java.math.BigDecimal getDLSMX9() {
      return DLSMX9;
   }
   
   /**
    * Sets the DLSMX9 value.
   */
   public void setDLSMX9(java.math.BigDecimal DLSMX9) {
      this.DLSMX9 = DLSMX9;
   }
   /**
    * The DLSMN9 attribute.
   */
   protected java.math.BigDecimal DLSMN9 = new BigDecimal("0");
   
   /**
    * Gets the DLSMN9 value.
   */
   public java.math.BigDecimal getDLSMN9() {
      return DLSMN9;
   }
   
   /**
    * Sets the DLSMN9 value.
   */
   public void setDLSMN9(java.math.BigDecimal DLSMN9) {
      this.DLSMN9 = DLSMN9;
   }
   /**
    * The DLSGL9 attribute.
   */
   protected java.math.BigDecimal DLSGL9 = new BigDecimal("0");
   
   /**
    * Gets the DLSGL9 value.
   */
   public java.math.BigDecimal getDLSGL9() {
      return DLSGL9;
   }
   
   /**
    * Sets the DLSGL9 value.
   */
   public void setDLSGL9(java.math.BigDecimal DLSGL9) {
      this.DLSGL9 = DLSGL9;
   }
   /**
    * The DLSGB9 attribute.
   */
   protected java.lang.String DLSGB9 = "";
   
   /**
    * Gets the DLSGB9 value.
   */
   public java.lang.String getDLSGB9() {
      return DLSGB9.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSGB9 value.
   */
   public void setDLSGB9(java.lang.String DLSGB9) {
      this.DLSGB9 = DLSGB9;
   }
   /**
    * The DLSAP9 attribute.
   */
   protected java.lang.String DLSAP9 = "";
   
   /**
    * Gets the DLSAP9 value.
   */
   public java.lang.String getDLSAP9() {
      return DLSAP9.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSAP9 value.
   */
   public void setDLSAP9(java.lang.String DLSAP9) {
      this.DLSAP9 = DLSAP9;
   }
   /**
    * The DLSWH9 attribute.
   */
   protected java.lang.String DLSWH9 = "";
   
   /**
    * Gets the DLSWH9 value.
   */
   public java.lang.String getDLSWH9() {
      return DLSWH9.toUpperCase().trim();
   }
   
   /**
    * Sets the DLSWH9 value.
   */
   public void setDLSWH9(java.lang.String DLSWH9) {
      this.DLSWH9 = DLSWH9;
   }
   /**
    * The DLSMAM attribute.
   */
   protected java.math.BigDecimal DLSMAM = new BigDecimal("0");
   
   /**
    * Gets the DLSMAM value.
   */
   public java.math.BigDecimal getDLSMAM() {
      return DLSMAM;
   }
   
   /**
    * Sets the DLSMAM value.
   */
   public void setDLSMAM(java.math.BigDecimal DLSMAM) {
      this.DLSMAM = DLSMAM;
   }
   /**
    * The DLSMAD attribute.
   */
   protected java.math.BigDecimal DLSMAD = new BigDecimal("0");
   
   /**
    * Gets the DLSMAD value.
   */
   public java.math.BigDecimal getDLSMAD() {
      return DLSMAD;
   }
   
   /**
    * Sets the DLSMAD value.
   */
   public void setDLSMAD(java.math.BigDecimal DLSMAD) {
      this.DLSMAD = DLSMAD;
   }
   /**
    * The DLSMAY attribute.
   */
   protected java.math.BigDecimal DLSMAY = new BigDecimal("0");
   
   /**
    * Gets the DLSMAY value.
   */
   public java.math.BigDecimal getDLSMAY() {
      return DLSMAY;
   }
   
   /**
    * Sets the DLSMAY value.
   */
   public void setDLSMAY(java.math.BigDecimal DLSMAY) {
      this.DLSMAY = DLSMAY;
   }
   public String toString() {
      StringBuffer results = new StringBuffer();

      results.append(getClass().getName() + "\n");
      results.append("\tDLSKEY=" + DLSKEY + "\n");
      results.append("\tDLSCUN=" + DLSCUN + "\n");
      results.append("\tDLSDSC=" + DLSDSC + "\n");
      results.append("\tDLSDE1=" + DLSDE1 + "\n");
      results.append("\tDLSAM1=" + DLSAM1 + "\n");
      results.append("\tDLSFA1=" + DLSFA1 + "\n");
      results.append("\tDLSMX1=" + DLSMX1 + "\n");
      results.append("\tDLSMN1=" + DLSMN1 + "\n");
      results.append("\tDLSGL1=" + DLSGL1 + "\n");
      results.append("\tDLSGB1=" + DLSGB1 + "\n");
      results.append("\tDLSAP1=" + DLSAP1 + "\n");
      results.append("\tDLSWH1=" + DLSWH1 + "\n");
      results.append("\tDLSDE2=" + DLSDE2 + "\n");
      results.append("\tDLSAM2=" + DLSAM2 + "\n");
      results.append("\tDLSFA2=" + DLSFA2 + "\n");
      results.append("\tDLSMX2=" + DLSMX2 + "\n");
      results.append("\tDLSMN2=" + DLSMN2 + "\n");
      results.append("\tDLSGL2=" + DLSGL2 + "\n");
      results.append("\tDLSGB2=" + DLSGB2 + "\n");
      results.append("\tDLSAP2=" + DLSAP2 + "\n");
      results.append("\tDLSWH2=" + DLSWH2 + "\n");
      results.append("\tDLSDE3=" + DLSDE3 + "\n");
      results.append("\tDLSAM3=" + DLSAM3 + "\n");
      results.append("\tDLSFA3=" + DLSFA3 + "\n");
      results.append("\tDLSMX3=" + DLSMX3 + "\n");
      results.append("\tDLSMN3=" + DLSMN3 + "\n");
      results.append("\tDLSGL3=" + DLSGL3 + "\n");
      results.append("\tDLSGB3=" + DLSGB3 + "\n");
      results.append("\tDLSAP3=" + DLSAP3 + "\n");
      results.append("\tDLSWH3=" + DLSWH3 + "\n");
      results.append("\tDLSDE4=" + DLSDE4 + "\n");
      results.append("\tDLSAM4=" + DLSAM4 + "\n");
      results.append("\tDLSFA4=" + DLSFA4 + "\n");
      results.append("\tDLSMX4=" + DLSMX4 + "\n");
      results.append("\tDLSMN4=" + DLSMN4 + "\n");
      results.append("\tDLSGL4=" + DLSGL4 + "\n");
      results.append("\tDLSGB4=" + DLSGB4 + "\n");
      results.append("\tDLSAP4=" + DLSAP4 + "\n");
      results.append("\tDLSWH4=" + DLSWH4 + "\n");
      results.append("\tDLSDE5=" + DLSDE5 + "\n");
      results.append("\tDLSAM5=" + DLSAM5 + "\n");
      results.append("\tDLSFA5=" + DLSFA5 + "\n");
      results.append("\tDLSMX5=" + DLSMX5 + "\n");
      results.append("\tDLSMN5=" + DLSMN5 + "\n");
      results.append("\tDLSGL5=" + DLSGL5 + "\n");
      results.append("\tDLSGB5=" + DLSGB5 + "\n");
      results.append("\tDLSAP5=" + DLSAP5 + "\n");
      results.append("\tDLSWH5=" + DLSWH5 + "\n");
      results.append("\tDLSDE6=" + DLSDE6 + "\n");
      results.append("\tDLSAM6=" + DLSAM6 + "\n");
      results.append("\tDLSFA6=" + DLSFA6 + "\n");
      results.append("\tDLSMX6=" + DLSMX6 + "\n");
      results.append("\tDLSMN6=" + DLSMN6 + "\n");
      results.append("\tDLSGL6=" + DLSGL6 + "\n");
      results.append("\tDLSGB6=" + DLSGB6 + "\n");
      results.append("\tDLSAP6=" + DLSAP6 + "\n");
      results.append("\tDLSWH6=" + DLSWH6 + "\n");
      results.append("\tDLSDE7=" + DLSDE7 + "\n");
      results.append("\tDLSAM7=" + DLSAM7 + "\n");
      results.append("\tDLSFA7=" + DLSFA7 + "\n");
      results.append("\tDLSMX7=" + DLSMX7 + "\n");
      results.append("\tDLSMN7=" + DLSMN7 + "\n");
      results.append("\tDLSGL7=" + DLSGL7 + "\n");
      results.append("\tDLSGB7=" + DLSGB7 + "\n");
      results.append("\tDLSAP7=" + DLSAP7 + "\n");
      results.append("\tDLSWH7=" + DLSWH7 + "\n");
      results.append("\tDLSDE8=" + DLSDE8 + "\n");
      results.append("\tDLSAM8=" + DLSAM8 + "\n");
      results.append("\tDLSFA8=" + DLSFA8 + "\n");
      results.append("\tDLSMX8=" + DLSMX8 + "\n");
      results.append("\tDLSMN8=" + DLSMN8 + "\n");
      results.append("\tDLSGL8=" + DLSGL8 + "\n");
      results.append("\tDLSGB8=" + DLSGB8 + "\n");
      results.append("\tDLSAP8=" + DLSAP8 + "\n");
      results.append("\tDLSWH8=" + DLSWH8 + "\n");
      results.append("\tDLSDE9=" + DLSDE9 + "\n");
      results.append("\tDLSAM9=" + DLSAM9 + "\n");
      results.append("\tDLSFA9=" + DLSFA9 + "\n");
      results.append("\tDLSMX9=" + DLSMX9 + "\n");
      results.append("\tDLSMN9=" + DLSMN9 + "\n");
      results.append("\tDLSGL9=" + DLSGL9 + "\n");
      results.append("\tDLSGB9=" + DLSGB9 + "\n");
      results.append("\tDLSAP9=" + DLSAP9 + "\n");
      results.append("\tDLSWH9=" + DLSWH9 + "\n");
      results.append("\tDLSMAM=" + DLSMAM + "\n");
      results.append("\tDLSMAD=" + DLSMAD + "\n");
      results.append("\tDLSMAY=" + DLSMAY + "\n");

      return results.toString();
   }

}