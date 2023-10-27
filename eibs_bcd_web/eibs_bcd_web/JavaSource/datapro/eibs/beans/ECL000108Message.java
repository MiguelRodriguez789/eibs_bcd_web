package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECL000108 physical file definition.
* 
* File level identifier is 1100706173537.
* Record format level identifier is 27105FDAFE894.
*/

public class ECL000108Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H02USERID",
                                     "H02PROGRM",
                                     "H02TIMSYS",
                                     "H02SCRCOD",
                                     "H02OPECOD",
                                     "H02FLGMAS",
                                     "H02FLGWK1",
                                     "H02FLGWK2",
                                     "H02FLGWK3",
                                     "CUSIDN",
                                     "CUSCUN",
                                     "CUSCS2",
                                     "CUSCS3",
                                     "CUSCSY",
                                     "CUSCRT",
                                     "CUSREX",
                                     "CUSCON",
                                     "CUFD1M",
                                     "CUFD1D",
                                     "CUFD1Y",
                                     "CUFD2M",
                                     "CUFD2D",
                                     "CUFD2Y",
                                     "CUFD3M",
                                     "CUFD3D",
                                     "CUFD3Y",
                                     "CUFD4M",
                                     "CUFD4D",
                                     "CUFD4Y"
                                   };
  final static String tnames[] = {
                                   "H02USERID",
                                   "H02PROGRM",
                                   "H02TIMSYS",
                                   "H02SCRCOD",
                                   "H02OPECOD",
                                   "H02FLGMAS",
                                   "H02FLGWK1",
                                   "H02FLGWK2",
                                   "H02FLGWK3",
                                   "CUSIDN",
                                   "CUSCUN",
                                   "CUSCS2",
                                   "CUSCS3",
                                   "CUSCSY",
                                   "CUSCRT",
                                   "CUSREX",
                                   "CUSCON",
                                   "CUFD1M",
                                   "CUFD1D",
                                   "CUFD1Y",
                                   "CUFD2M",
                                   "CUFD2D",
                                   "CUFD2Y",
                                   "CUFD3M",
                                   "CUFD3D",
                                   "CUFD3Y",
                                   "CUFD4M",
                                   "CUFD4D",
                                   "CUFD4Y"
                                 };
  final static String fid = "1100706173537";
  final static String rid = "27105FDAFE894";
  final static String fmtname = "ECL000108";
  final int FIELDCOUNT = 29;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH02USERID = null;
  private CharacterField fieldH02PROGRM = null;
  private CharacterField fieldH02TIMSYS = null;
  private CharacterField fieldH02SCRCOD = null;
  private CharacterField fieldH02OPECOD = null;
  private CharacterField fieldH02FLGMAS = null;
  private CharacterField fieldH02FLGWK1 = null;
  private CharacterField fieldH02FLGWK2 = null;
  private CharacterField fieldH02FLGWK3 = null;
  private CharacterField fieldCUSIDN = null;
  private DecimalField fieldCUSCUN = null;
  private CharacterField fieldCUSCS2 = null;
  private CharacterField fieldCUSCS3 = null;
  private CharacterField fieldCUSCSY = null;
  private CharacterField fieldCUSCRT = null;
  private CharacterField fieldCUSREX = null;
  private CharacterField fieldCUSCON = null;
  private DecimalField fieldCUFD1M = null;
  private DecimalField fieldCUFD1D = null;
  private DecimalField fieldCUFD1Y = null;
  private DecimalField fieldCUFD2M = null;
  private DecimalField fieldCUFD2D = null;
  private DecimalField fieldCUFD2Y = null;
  private DecimalField fieldCUFD3M = null;
  private DecimalField fieldCUFD3D = null;
  private DecimalField fieldCUFD3Y = null;
  private DecimalField fieldCUFD4M = null;
  private DecimalField fieldCUFD4D = null;
  private DecimalField fieldCUFD4Y = null;

  /**
  * Constructor for ECL000108Message.
  */
  public ECL000108Message()
  {
    createFields();
    initialize();
  }

  /**
  * Create fields for this message.
  * This method implements the abstract method in the MessageRecord superclass.
  */
  protected void createFields()
  {
    recordsize = 145;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH02USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H02USERID");
    fields[1] = fieldH02PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H02PROGRM");
    fields[2] = fieldH02TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H02TIMSYS");
    fields[3] = fieldH02SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H02SCRCOD");
    fields[4] = fieldH02OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H02OPECOD");
    fields[5] = fieldH02FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H02FLGMAS");
    fields[6] = fieldH02FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H02FLGWK1");
    fields[7] = fieldH02FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H02FLGWK2");
    fields[8] = fieldH02FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H02FLGWK3");
    fields[9] = fieldCUSIDN =
    new CharacterField(message, HEADERSIZE + 42, 15, "CUSIDN");
    fields[10] = fieldCUSCUN =
    new DecimalField(message, HEADERSIZE + 57, 10, 0, "CUSCUN");
    fields[11] = fieldCUSCS2 =
    new CharacterField(message, HEADERSIZE + 67, 2, "CUSCS2");
    fields[12] = fieldCUSCS3 =
    new CharacterField(message, HEADERSIZE + 69, 2, "CUSCS3");
    fields[13] = fieldCUSCSY =
    new CharacterField(message, HEADERSIZE + 71, 4, "CUSCSY");
    fields[14] = fieldCUSCRT =
    new CharacterField(message, HEADERSIZE + 75, 2, "CUSCRT");
    fields[15] = fieldCUSREX =
    new CharacterField(message, HEADERSIZE + 77, 2, "CUSREX");
    fields[16] = fieldCUSCON =
    new CharacterField(message, HEADERSIZE + 79, 30, "CUSCON");
    fields[17] = fieldCUFD1M =
    new DecimalField(message, HEADERSIZE + 109, 3, 0, "CUFD1M");
    fields[18] = fieldCUFD1D =
    new DecimalField(message, HEADERSIZE + 112, 3, 0, "CUFD1D");
    fields[19] = fieldCUFD1Y =
    new DecimalField(message, HEADERSIZE + 115, 3, 0, "CUFD1Y");
    fields[20] = fieldCUFD2M =
    new DecimalField(message, HEADERSIZE + 118, 3, 0, "CUFD2M");
    fields[21] = fieldCUFD2D =
    new DecimalField(message, HEADERSIZE + 121, 3, 0, "CUFD2D");
    fields[22] = fieldCUFD2Y =
    new DecimalField(message, HEADERSIZE + 124, 3, 0, "CUFD2Y");
    fields[23] = fieldCUFD3M =
    new DecimalField(message, HEADERSIZE + 127, 3, 0, "CUFD3M");
    fields[24] = fieldCUFD3D =
    new DecimalField(message, HEADERSIZE + 130, 3, 0, "CUFD3D");
    fields[25] = fieldCUFD3Y =
    new DecimalField(message, HEADERSIZE + 133, 3, 0, "CUFD3Y");
    fields[26] = fieldCUFD4M =
    new DecimalField(message, HEADERSIZE + 136, 3, 0, "CUFD4M");
    fields[27] = fieldCUFD4D =
    new DecimalField(message, HEADERSIZE + 139, 3, 0, "CUFD4D");
    fields[28] = fieldCUFD4Y =
    new DecimalField(message, HEADERSIZE + 142, 3, 0, "CUFD4Y");

    synchronized (tlookup)
    {
      if (tlookup.isEmpty())
      {
        for (int i = 0; i < tnames.length; i++)
          tlookup.put(tnames[i], new Integer(i));
      }
    }

    taglookup = tlookup;
  }

  /**
  * Set field H02USERID using a String value.
  */
  public void setH02USERID(String newvalue)
  {
    fieldH02USERID.setString(newvalue);
  }

  /**
  * Get value of field H02USERID as a String.
  */
  public String getH02USERID()
  {
    return fieldH02USERID.getString();
  }

  /**
  * Set field H02PROGRM using a String value.
  */
  public void setH02PROGRM(String newvalue)
  {
    fieldH02PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H02PROGRM as a String.
  */
  public String getH02PROGRM()
  {
    return fieldH02PROGRM.getString();
  }

  /**
  * Set field H02TIMSYS using a String value.
  */
  public void setH02TIMSYS(String newvalue)
  {
    fieldH02TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H02TIMSYS as a String.
  */
  public String getH02TIMSYS()
  {
    return fieldH02TIMSYS.getString();
  }

  /**
  * Set field H02SCRCOD using a String value.
  */
  public void setH02SCRCOD(String newvalue)
  {
    fieldH02SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H02SCRCOD as a String.
  */
  public String getH02SCRCOD()
  {
    return fieldH02SCRCOD.getString();
  }

  /**
  * Set field H02OPECOD using a String value.
  */
  public void setH02OPECOD(String newvalue)
  {
    fieldH02OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H02OPECOD as a String.
  */
  public String getH02OPECOD()
  {
    return fieldH02OPECOD.getString();
  }

  /**
  * Set field H02FLGMAS using a String value.
  */
  public void setH02FLGMAS(String newvalue)
  {
    fieldH02FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H02FLGMAS as a String.
  */
  public String getH02FLGMAS()
  {
    return fieldH02FLGMAS.getString();
  }

  /**
  * Set field H02FLGWK1 using a String value.
  */
  public void setH02FLGWK1(String newvalue)
  {
    fieldH02FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK1 as a String.
  */
  public String getH02FLGWK1()
  {
    return fieldH02FLGWK1.getString();
  }

  /**
  * Set field H02FLGWK2 using a String value.
  */
  public void setH02FLGWK2(String newvalue)
  {
    fieldH02FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK2 as a String.
  */
  public String getH02FLGWK2()
  {
    return fieldH02FLGWK2.getString();
  }

  /**
  * Set field H02FLGWK3 using a String value.
  */
  public void setH02FLGWK3(String newvalue)
  {
    fieldH02FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK3 as a String.
  */
  public String getH02FLGWK3()
  {
    return fieldH02FLGWK3.getString();
  }

  /**
  * Set field CUSIDN using a String value.
  */
  public void setCUSIDN(String newvalue)
  {
    fieldCUSIDN.setString(newvalue);
  }

  /**
  * Get value of field CUSIDN as a String.
  */
  public String getCUSIDN()
  {
    return fieldCUSIDN.getString();
  }

  /**
  * Set field CUSCUN using a String value.
  */
  public void setCUSCUN(String newvalue)
  {
    fieldCUSCUN.setString(newvalue);
  }

  /**
  * Get value of field CUSCUN as a String.
  */
  public String getCUSCUN()
  {
    return fieldCUSCUN.getString();
  }

  /**
  * Set numeric field CUSCUN using a BigDecimal value.
  */
  public void setCUSCUN(BigDecimal newvalue)
  {
    fieldCUSCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUSCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUSCUN()
  {
    return fieldCUSCUN.getBigDecimal();
  }

  /**
  * Set field CUSCS2 using a String value.
  */
  public void setCUSCS2(String newvalue)
  {
    fieldCUSCS2.setString(newvalue);
  }

  /**
  * Get value of field CUSCS2 as a String.
  */
  public String getCUSCS2()
  {
    return fieldCUSCS2.getString();
  }

  /**
  * Set field CUSCS3 using a String value.
  */
  public void setCUSCS3(String newvalue)
  {
    fieldCUSCS3.setString(newvalue);
  }

  /**
  * Get value of field CUSCS3 as a String.
  */
  public String getCUSCS3()
  {
    return fieldCUSCS3.getString();
  }

  /**
  * Set field CUSCSY using a String value.
  */
  public void setCUSCSY(String newvalue)
  {
    fieldCUSCSY.setString(newvalue);
  }

  /**
  * Get value of field CUSCSY as a String.
  */
  public String getCUSCSY()
  {
    return fieldCUSCSY.getString();
  }

  /**
  * Set field CUSCRT using a String value.
  */
  public void setCUSCRT(String newvalue)
  {
    fieldCUSCRT.setString(newvalue);
  }

  /**
  * Get value of field CUSCRT as a String.
  */
  public String getCUSCRT()
  {
    return fieldCUSCRT.getString();
  }

  /**
  * Set field CUSREX using a String value.
  */
  public void setCUSREX(String newvalue)
  {
    fieldCUSREX.setString(newvalue);
  }

  /**
  * Get value of field CUSREX as a String.
  */
  public String getCUSREX()
  {
    return fieldCUSREX.getString();
  }

  /**
  * Set field CUSCON using a String value.
  */
  public void setCUSCON(String newvalue)
  {
    fieldCUSCON.setString(newvalue);
  }

  /**
  * Get value of field CUSCON as a String.
  */
  public String getCUSCON()
  {
    return fieldCUSCON.getString();
  }

  /**
  * Set field CUFD1M using a String value.
  */
  public void setCUFD1M(String newvalue)
  {
    fieldCUFD1M.setString(newvalue);
  }

  /**
  * Get value of field CUFD1M as a String.
  */
  public String getCUFD1M()
  {
    return fieldCUFD1M.getString();
  }

  /**
  * Set numeric field CUFD1M using a BigDecimal value.
  */
  public void setCUFD1M(BigDecimal newvalue)
  {
    fieldCUFD1M.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUFD1M as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUFD1M()
  {
    return fieldCUFD1M.getBigDecimal();
  }

  /**
  * Set field CUFD1D using a String value.
  */
  public void setCUFD1D(String newvalue)
  {
    fieldCUFD1D.setString(newvalue);
  }

  /**
  * Get value of field CUFD1D as a String.
  */
  public String getCUFD1D()
  {
    return fieldCUFD1D.getString();
  }

  /**
  * Set numeric field CUFD1D using a BigDecimal value.
  */
  public void setCUFD1D(BigDecimal newvalue)
  {
    fieldCUFD1D.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUFD1D as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUFD1D()
  {
    return fieldCUFD1D.getBigDecimal();
  }

  /**
  * Set field CUFD1Y using a String value.
  */
  public void setCUFD1Y(String newvalue)
  {
    fieldCUFD1Y.setString(newvalue);
  }

  /**
  * Get value of field CUFD1Y as a String.
  */
  public String getCUFD1Y()
  {
    return fieldCUFD1Y.getString();
  }

  /**
  * Set numeric field CUFD1Y using a BigDecimal value.
  */
  public void setCUFD1Y(BigDecimal newvalue)
  {
    fieldCUFD1Y.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUFD1Y as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUFD1Y()
  {
    return fieldCUFD1Y.getBigDecimal();
  }

  /**
  * Set field CUFD2M using a String value.
  */
  public void setCUFD2M(String newvalue)
  {
    fieldCUFD2M.setString(newvalue);
  }

  /**
  * Get value of field CUFD2M as a String.
  */
  public String getCUFD2M()
  {
    return fieldCUFD2M.getString();
  }

  /**
  * Set numeric field CUFD2M using a BigDecimal value.
  */
  public void setCUFD2M(BigDecimal newvalue)
  {
    fieldCUFD2M.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUFD2M as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUFD2M()
  {
    return fieldCUFD2M.getBigDecimal();
  }

  /**
  * Set field CUFD2D using a String value.
  */
  public void setCUFD2D(String newvalue)
  {
    fieldCUFD2D.setString(newvalue);
  }

  /**
  * Get value of field CUFD2D as a String.
  */
  public String getCUFD2D()
  {
    return fieldCUFD2D.getString();
  }

  /**
  * Set numeric field CUFD2D using a BigDecimal value.
  */
  public void setCUFD2D(BigDecimal newvalue)
  {
    fieldCUFD2D.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUFD2D as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUFD2D()
  {
    return fieldCUFD2D.getBigDecimal();
  }

  /**
  * Set field CUFD2Y using a String value.
  */
  public void setCUFD2Y(String newvalue)
  {
    fieldCUFD2Y.setString(newvalue);
  }

  /**
  * Get value of field CUFD2Y as a String.
  */
  public String getCUFD2Y()
  {
    return fieldCUFD2Y.getString();
  }

  /**
  * Set numeric field CUFD2Y using a BigDecimal value.
  */
  public void setCUFD2Y(BigDecimal newvalue)
  {
    fieldCUFD2Y.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUFD2Y as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUFD2Y()
  {
    return fieldCUFD2Y.getBigDecimal();
  }

  /**
  * Set field CUFD3M using a String value.
  */
  public void setCUFD3M(String newvalue)
  {
    fieldCUFD3M.setString(newvalue);
  }

  /**
  * Get value of field CUFD3M as a String.
  */
  public String getCUFD3M()
  {
    return fieldCUFD3M.getString();
  }

  /**
  * Set numeric field CUFD3M using a BigDecimal value.
  */
  public void setCUFD3M(BigDecimal newvalue)
  {
    fieldCUFD3M.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUFD3M as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUFD3M()
  {
    return fieldCUFD3M.getBigDecimal();
  }

  /**
  * Set field CUFD3D using a String value.
  */
  public void setCUFD3D(String newvalue)
  {
    fieldCUFD3D.setString(newvalue);
  }

  /**
  * Get value of field CUFD3D as a String.
  */
  public String getCUFD3D()
  {
    return fieldCUFD3D.getString();
  }

  /**
  * Set numeric field CUFD3D using a BigDecimal value.
  */
  public void setCUFD3D(BigDecimal newvalue)
  {
    fieldCUFD3D.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUFD3D as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUFD3D()
  {
    return fieldCUFD3D.getBigDecimal();
  }

  /**
  * Set field CUFD3Y using a String value.
  */
  public void setCUFD3Y(String newvalue)
  {
    fieldCUFD3Y.setString(newvalue);
  }

  /**
  * Get value of field CUFD3Y as a String.
  */
  public String getCUFD3Y()
  {
    return fieldCUFD3Y.getString();
  }

  /**
  * Set numeric field CUFD3Y using a BigDecimal value.
  */
  public void setCUFD3Y(BigDecimal newvalue)
  {
    fieldCUFD3Y.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUFD3Y as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUFD3Y()
  {
    return fieldCUFD3Y.getBigDecimal();
  }

  /**
  * Set field CUFD4M using a String value.
  */
  public void setCUFD4M(String newvalue)
  {
    fieldCUFD4M.setString(newvalue);
  }

  /**
  * Get value of field CUFD4M as a String.
  */
  public String getCUFD4M()
  {
    return fieldCUFD4M.getString();
  }

  /**
  * Set numeric field CUFD4M using a BigDecimal value.
  */
  public void setCUFD4M(BigDecimal newvalue)
  {
    fieldCUFD4M.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUFD4M as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUFD4M()
  {
    return fieldCUFD4M.getBigDecimal();
  }

  /**
  * Set field CUFD4D using a String value.
  */
  public void setCUFD4D(String newvalue)
  {
    fieldCUFD4D.setString(newvalue);
  }

  /**
  * Get value of field CUFD4D as a String.
  */
  public String getCUFD4D()
  {
    return fieldCUFD4D.getString();
  }

  /**
  * Set numeric field CUFD4D using a BigDecimal value.
  */
  public void setCUFD4D(BigDecimal newvalue)
  {
    fieldCUFD4D.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUFD4D as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUFD4D()
  {
    return fieldCUFD4D.getBigDecimal();
  }

  /**
  * Set field CUFD4Y using a String value.
  */
  public void setCUFD4Y(String newvalue)
  {
    fieldCUFD4Y.setString(newvalue);
  }

  /**
  * Get value of field CUFD4Y as a String.
  */
  public String getCUFD4Y()
  {
    return fieldCUFD4Y.getString();
  }

  /**
  * Set numeric field CUFD4Y using a BigDecimal value.
  */
  public void setCUFD4Y(BigDecimal newvalue)
  {
    fieldCUFD4Y.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CUFD4Y as a BigDecimal.
  */
  public BigDecimal getBigDecimalCUFD4Y()
  {
    return fieldCUFD4Y.getBigDecimal();
  }

}
