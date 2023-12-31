package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0317DS physical file definition.
* 
* File level identifier is 1130611113452.
* Record format level identifier is 440A006BC3BED.
*/

public class EWD0317DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "RWDUSR",
                                     "RWDTYP",
                                     "RWDFRC",
                                     "SWDORDCUN",
                                     "SWDCUSNME",
                                     "SWDORDST1",
                                     "SWDORDST2",
                                     "SWDORDST3",
                                     "SWDORDHBK",
                                     "SWDORDHBR",
                                     "SWDORDHCY",
                                     "SWDORDHGL",
                                     "SWDORDHAC",
                                     "SWDORDHCC",
                                     "SWDUNCFLG",
                                     "SWDFLDDSC",
                                     "SWDUNCAMN",
                                     "SWDUNCREF",
                                     "SWDUNCF02",
                                     "SWDUNCDYS",
                                     "SWDUNCRD1",
                                     "SWDUNCRD2",
                                     "SWDUNCRD3",
                                     "SWDUNCMD1",
                                     "SWDUNCMD2",
                                     "SWDUNCMD3",
                                     "SWDUNCRSN",
                                     "SWDUNCF01",
                                     "SWDUNCSTA",
                                     "SWDSTSDSC",
                                     "SWDUNCCON",
                                     "SWDSETBAL",
                                     "SWDTOTHLD",
                                     "SWDTOTUNC",
                                     "SWDTOTFUT",
                                     "SWDREC",
                                     "SWDOPE"
                                   };
  final static String tnames[] = {
                                   "RWDUSR",
                                   "RWDTYP",
                                   "RWDFRC",
                                   "SWDORDCUN",
                                   "SWDCUSNME",
                                   "SWDORDST1",
                                   "SWDORDST2",
                                   "SWDORDST3",
                                   "SWDORDHBK",
                                   "SWDORDHBR",
                                   "SWDORDHCY",
                                   "SWDORDHGL",
                                   "SWDORDHAC",
                                   "SWDORDHCC",
                                   "SWDUNCFLG",
                                   "SWDFLDDSC",
                                   "SWDUNCAMN",
                                   "SWDUNCREF",
                                   "SWDUNCF02",
                                   "SWDUNCDYS",
                                   "SWDUNCRD1",
                                   "SWDUNCRD2",
                                   "SWDUNCRD3",
                                   "SWDUNCMD1",
                                   "SWDUNCMD2",
                                   "SWDUNCMD3",
                                   "SWDUNCRSN",
                                   "SWDUNCF01",
                                   "SWDUNCSTA",
                                   "SWDSTSDSC",
                                   "SWDUNCCON",
                                   "SWDSETBAL",
                                   "SWDTOTHLD",
                                   "SWDTOTUNC",
                                   "SWDTOTFUT",
                                   "SWDREC",
                                   "SWDOPE"
                                 };
  final static String fid = "1130611113452";
  final static String rid = "440A006BC3BED";
  final static String fmtname = "EWD0317DS";
  final int FIELDCOUNT = 37;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldRWDUSR = null;
  private CharacterField fieldRWDTYP = null;
  private DecimalField fieldRWDFRC = null;
  private DecimalField fieldSWDORDCUN = null;
  private CharacterField fieldSWDCUSNME = null;
  private DecimalField fieldSWDORDST1 = null;
  private DecimalField fieldSWDORDST2 = null;
  private DecimalField fieldSWDORDST3 = null;
  private CharacterField fieldSWDORDHBK = null;
  private DecimalField fieldSWDORDHBR = null;
  private CharacterField fieldSWDORDHCY = null;
  private DecimalField fieldSWDORDHGL = null;
  private DecimalField fieldSWDORDHAC = null;
  private DecimalField fieldSWDORDHCC = null;
  private CharacterField fieldSWDUNCFLG = null;
  private CharacterField fieldSWDFLDDSC = null;
  private DecimalField fieldSWDUNCAMN = null;
  private DecimalField fieldSWDUNCREF = null;
  private CharacterField fieldSWDUNCF02 = null;
  private DecimalField fieldSWDUNCDYS = null;
  private DecimalField fieldSWDUNCRD1 = null;
  private DecimalField fieldSWDUNCRD2 = null;
  private DecimalField fieldSWDUNCRD3 = null;
  private DecimalField fieldSWDUNCMD1 = null;
  private DecimalField fieldSWDUNCMD2 = null;
  private DecimalField fieldSWDUNCMD3 = null;
  private CharacterField fieldSWDUNCRSN = null;
  private CharacterField fieldSWDUNCF01 = null;
  private CharacterField fieldSWDUNCSTA = null;
  private CharacterField fieldSWDSTSDSC = null;
  private CharacterField fieldSWDUNCCON = null;
  private DecimalField fieldSWDSETBAL = null;
  private DecimalField fieldSWDTOTHLD = null;
  private DecimalField fieldSWDTOTUNC = null;
  private DecimalField fieldSWDTOTFUT = null;
  private DecimalField fieldSWDREC = null;
  private CharacterField fieldSWDOPE = null;

  /**
  * Constructor for EWD0317DSMessage.
  */
  public EWD0317DSMessage()
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
    recordsize = 409;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldRWDUSR =
    new CharacterField(message, HEADERSIZE + 0, 10, "RWDUSR");
    fields[1] = fieldRWDTYP =
    new CharacterField(message, HEADERSIZE + 10, 1, "RWDTYP");
    fields[2] = fieldRWDFRC =
    new DecimalField(message, HEADERSIZE + 11, 8, 0, "RWDFRC");
    fields[3] = fieldSWDORDCUN =
    new DecimalField(message, HEADERSIZE + 19, 10, 0, "SWDORDCUN");
    fields[4] = fieldSWDCUSNME =
    new CharacterField(message, HEADERSIZE + 29, 45, "SWDCUSNME");
    fields[5] = fieldSWDORDST1 =
    new DecimalField(message, HEADERSIZE + 74, 3, 0, "SWDORDST1");
    fields[6] = fieldSWDORDST2 =
    new DecimalField(message, HEADERSIZE + 77, 3, 0, "SWDORDST2");
    fields[7] = fieldSWDORDST3 =
    new DecimalField(message, HEADERSIZE + 80, 5, 0, "SWDORDST3");
    fields[8] = fieldSWDORDHBK =
    new CharacterField(message, HEADERSIZE + 85, 2, "SWDORDHBK");
    fields[9] = fieldSWDORDHBR =
    new DecimalField(message, HEADERSIZE + 87, 5, 0, "SWDORDHBR");
    fields[10] = fieldSWDORDHCY =
    new CharacterField(message, HEADERSIZE + 92, 3, "SWDORDHCY");
    fields[11] = fieldSWDORDHGL =
    new DecimalField(message, HEADERSIZE + 95, 17, 0, "SWDORDHGL");
    fields[12] = fieldSWDORDHAC =
    new DecimalField(message, HEADERSIZE + 112, 13, 0, "SWDORDHAC");
    fields[13] = fieldSWDORDHCC =
    new DecimalField(message, HEADERSIZE + 125, 9, 0, "SWDORDHCC");
    fields[14] = fieldSWDUNCFLG =
    new CharacterField(message, HEADERSIZE + 134, 1, "SWDUNCFLG");
    fields[15] = fieldSWDFLDDSC =
    new CharacterField(message, HEADERSIZE + 135, 45, "SWDFLDDSC");
    fields[16] = fieldSWDUNCAMN =
    new DecimalField(message, HEADERSIZE + 180, 17, 2, "SWDUNCAMN");
    fields[17] = fieldSWDUNCREF =
    new DecimalField(message, HEADERSIZE + 197, 10, 0, "SWDUNCREF");
    fields[18] = fieldSWDUNCF02 =
    new CharacterField(message, HEADERSIZE + 207, 1, "SWDUNCF02");
    fields[19] = fieldSWDUNCDYS =
    new DecimalField(message, HEADERSIZE + 208, 5, 0, "SWDUNCDYS");
    fields[20] = fieldSWDUNCRD1 =
    new DecimalField(message, HEADERSIZE + 213, 3, 0, "SWDUNCRD1");
    fields[21] = fieldSWDUNCRD2 =
    new DecimalField(message, HEADERSIZE + 216, 3, 0, "SWDUNCRD2");
    fields[22] = fieldSWDUNCRD3 =
    new DecimalField(message, HEADERSIZE + 219, 5, 0, "SWDUNCRD3");
    fields[23] = fieldSWDUNCMD1 =
    new DecimalField(message, HEADERSIZE + 224, 3, 0, "SWDUNCMD1");
    fields[24] = fieldSWDUNCMD2 =
    new DecimalField(message, HEADERSIZE + 227, 3, 0, "SWDUNCMD2");
    fields[25] = fieldSWDUNCMD3 =
    new DecimalField(message, HEADERSIZE + 230, 5, 0, "SWDUNCMD3");
    fields[26] = fieldSWDUNCRSN =
    new CharacterField(message, HEADERSIZE + 235, 45, "SWDUNCRSN");
    fields[27] = fieldSWDUNCF01 =
    new CharacterField(message, HEADERSIZE + 280, 2, "SWDUNCF01");
    fields[28] = fieldSWDUNCSTA =
    new CharacterField(message, HEADERSIZE + 282, 1, "SWDUNCSTA");
    fields[29] = fieldSWDSTSDSC =
    new CharacterField(message, HEADERSIZE + 283, 45, "SWDSTSDSC");
    fields[30] = fieldSWDUNCCON =
    new CharacterField(message, HEADERSIZE + 328, 4, "SWDUNCCON");
    fields[31] = fieldSWDSETBAL =
    new DecimalField(message, HEADERSIZE + 332, 17, 2, "SWDSETBAL");
    fields[32] = fieldSWDTOTHLD =
    new DecimalField(message, HEADERSIZE + 349, 17, 2, "SWDTOTHLD");
    fields[33] = fieldSWDTOTUNC =
    new DecimalField(message, HEADERSIZE + 366, 17, 2, "SWDTOTUNC");
    fields[34] = fieldSWDTOTFUT =
    new DecimalField(message, HEADERSIZE + 383, 17, 2, "SWDTOTFUT");
    fields[35] = fieldSWDREC =
    new DecimalField(message, HEADERSIZE + 400, 8, 0, "SWDREC");
    fields[36] = fieldSWDOPE =
    new CharacterField(message, HEADERSIZE + 408, 1, "SWDOPE");

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
  * Set field RWDUSR using a String value.
  */
  public void setRWDUSR(String newvalue)
  {
    fieldRWDUSR.setString(newvalue);
  }

  /**
  * Get value of field RWDUSR as a String.
  */
  public String getRWDUSR()
  {
    return fieldRWDUSR.getString();
  }

  /**
  * Set field RWDTYP using a String value.
  */
  public void setRWDTYP(String newvalue)
  {
    fieldRWDTYP.setString(newvalue);
  }

  /**
  * Get value of field RWDTYP as a String.
  */
  public String getRWDTYP()
  {
    return fieldRWDTYP.getString();
  }

  /**
  * Set field RWDFRC using a String value.
  */
  public void setRWDFRC(String newvalue)
  {
    fieldRWDFRC.setString(newvalue);
  }

  /**
  * Get value of field RWDFRC as a String.
  */
  public String getRWDFRC()
  {
    return fieldRWDFRC.getString();
  }

  /**
  * Set numeric field RWDFRC using a BigDecimal value.
  */
  public void setRWDFRC(BigDecimal newvalue)
  {
    fieldRWDFRC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field RWDFRC as a BigDecimal.
  */
  public BigDecimal getBigDecimalRWDFRC()
  {
    return fieldRWDFRC.getBigDecimal();
  }

  /**
  * Set field SWDORDCUN using a String value.
  */
  public void setSWDORDCUN(String newvalue)
  {
    fieldSWDORDCUN.setString(newvalue);
  }

  /**
  * Get value of field SWDORDCUN as a String.
  */
  public String getSWDORDCUN()
  {
    return fieldSWDORDCUN.getString();
  }

  /**
  * Set numeric field SWDORDCUN using a BigDecimal value.
  */
  public void setSWDORDCUN(BigDecimal newvalue)
  {
    fieldSWDORDCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDORDCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDORDCUN()
  {
    return fieldSWDORDCUN.getBigDecimal();
  }

  /**
  * Set field SWDCUSNME using a String value.
  */
  public void setSWDCUSNME(String newvalue)
  {
    fieldSWDCUSNME.setString(newvalue);
  }

  /**
  * Get value of field SWDCUSNME as a String.
  */
  public String getSWDCUSNME()
  {
    return fieldSWDCUSNME.getString();
  }

  /**
  * Set field SWDORDST1 using a String value.
  */
  public void setSWDORDST1(String newvalue)
  {
    fieldSWDORDST1.setString(newvalue);
  }

  /**
  * Get value of field SWDORDST1 as a String.
  */
  public String getSWDORDST1()
  {
    return fieldSWDORDST1.getString();
  }

  /**
  * Set numeric field SWDORDST1 using a BigDecimal value.
  */
  public void setSWDORDST1(BigDecimal newvalue)
  {
    fieldSWDORDST1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDORDST1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDORDST1()
  {
    return fieldSWDORDST1.getBigDecimal();
  }

  /**
  * Set field SWDORDST2 using a String value.
  */
  public void setSWDORDST2(String newvalue)
  {
    fieldSWDORDST2.setString(newvalue);
  }

  /**
  * Get value of field SWDORDST2 as a String.
  */
  public String getSWDORDST2()
  {
    return fieldSWDORDST2.getString();
  }

  /**
  * Set numeric field SWDORDST2 using a BigDecimal value.
  */
  public void setSWDORDST2(BigDecimal newvalue)
  {
    fieldSWDORDST2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDORDST2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDORDST2()
  {
    return fieldSWDORDST2.getBigDecimal();
  }

  /**
  * Set field SWDORDST3 using a String value.
  */
  public void setSWDORDST3(String newvalue)
  {
    fieldSWDORDST3.setString(newvalue);
  }

  /**
  * Get value of field SWDORDST3 as a String.
  */
  public String getSWDORDST3()
  {
    return fieldSWDORDST3.getString();
  }

  /**
  * Set numeric field SWDORDST3 using a BigDecimal value.
  */
  public void setSWDORDST3(BigDecimal newvalue)
  {
    fieldSWDORDST3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDORDST3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDORDST3()
  {
    return fieldSWDORDST3.getBigDecimal();
  }

  /**
  * Set field SWDORDHBK using a String value.
  */
  public void setSWDORDHBK(String newvalue)
  {
    fieldSWDORDHBK.setString(newvalue);
  }

  /**
  * Get value of field SWDORDHBK as a String.
  */
  public String getSWDORDHBK()
  {
    return fieldSWDORDHBK.getString();
  }

  /**
  * Set field SWDORDHBR using a String value.
  */
  public void setSWDORDHBR(String newvalue)
  {
    fieldSWDORDHBR.setString(newvalue);
  }

  /**
  * Get value of field SWDORDHBR as a String.
  */
  public String getSWDORDHBR()
  {
    return fieldSWDORDHBR.getString();
  }

  /**
  * Set numeric field SWDORDHBR using a BigDecimal value.
  */
  public void setSWDORDHBR(BigDecimal newvalue)
  {
    fieldSWDORDHBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDORDHBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDORDHBR()
  {
    return fieldSWDORDHBR.getBigDecimal();
  }

  /**
  * Set field SWDORDHCY using a String value.
  */
  public void setSWDORDHCY(String newvalue)
  {
    fieldSWDORDHCY.setString(newvalue);
  }

  /**
  * Get value of field SWDORDHCY as a String.
  */
  public String getSWDORDHCY()
  {
    return fieldSWDORDHCY.getString();
  }

  /**
  * Set field SWDORDHGL using a String value.
  */
  public void setSWDORDHGL(String newvalue)
  {
    fieldSWDORDHGL.setString(newvalue);
  }

  /**
  * Get value of field SWDORDHGL as a String.
  */
  public String getSWDORDHGL()
  {
    return fieldSWDORDHGL.getString();
  }

  /**
  * Set numeric field SWDORDHGL using a BigDecimal value.
  */
  public void setSWDORDHGL(BigDecimal newvalue)
  {
    fieldSWDORDHGL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDORDHGL as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDORDHGL()
  {
    return fieldSWDORDHGL.getBigDecimal();
  }

  /**
  * Set field SWDORDHAC using a String value.
  */
  public void setSWDORDHAC(String newvalue)
  {
    fieldSWDORDHAC.setString(newvalue);
  }

  /**
  * Get value of field SWDORDHAC as a String.
  */
  public String getSWDORDHAC()
  {
    return fieldSWDORDHAC.getString();
  }

  /**
  * Set numeric field SWDORDHAC using a BigDecimal value.
  */
  public void setSWDORDHAC(BigDecimal newvalue)
  {
    fieldSWDORDHAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDORDHAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDORDHAC()
  {
    return fieldSWDORDHAC.getBigDecimal();
  }

  /**
  * Set field SWDORDHCC using a String value.
  */
  public void setSWDORDHCC(String newvalue)
  {
    fieldSWDORDHCC.setString(newvalue);
  }

  /**
  * Get value of field SWDORDHCC as a String.
  */
  public String getSWDORDHCC()
  {
    return fieldSWDORDHCC.getString();
  }

  /**
  * Set numeric field SWDORDHCC using a BigDecimal value.
  */
  public void setSWDORDHCC(BigDecimal newvalue)
  {
    fieldSWDORDHCC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDORDHCC as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDORDHCC()
  {
    return fieldSWDORDHCC.getBigDecimal();
  }

  /**
  * Set field SWDUNCFLG using a String value.
  */
  public void setSWDUNCFLG(String newvalue)
  {
    fieldSWDUNCFLG.setString(newvalue);
  }

  /**
  * Get value of field SWDUNCFLG as a String.
  */
  public String getSWDUNCFLG()
  {
    return fieldSWDUNCFLG.getString();
  }

  /**
  * Set field SWDFLDDSC using a String value.
  */
  public void setSWDFLDDSC(String newvalue)
  {
    fieldSWDFLDDSC.setString(newvalue);
  }

  /**
  * Get value of field SWDFLDDSC as a String.
  */
  public String getSWDFLDDSC()
  {
    return fieldSWDFLDDSC.getString();
  }

  /**
  * Set field SWDUNCAMN using a String value.
  */
  public void setSWDUNCAMN(String newvalue)
  {
    fieldSWDUNCAMN.setString(newvalue);
  }

  /**
  * Get value of field SWDUNCAMN as a String.
  */
  public String getSWDUNCAMN()
  {
    return fieldSWDUNCAMN.getString();
  }

  /**
  * Set numeric field SWDUNCAMN using a BigDecimal value.
  */
  public void setSWDUNCAMN(BigDecimal newvalue)
  {
    fieldSWDUNCAMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDUNCAMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDUNCAMN()
  {
    return fieldSWDUNCAMN.getBigDecimal();
  }

  /**
  * Set field SWDUNCREF using a String value.
  */
  public void setSWDUNCREF(String newvalue)
  {
    fieldSWDUNCREF.setString(newvalue);
  }

  /**
  * Get value of field SWDUNCREF as a String.
  */
  public String getSWDUNCREF()
  {
    return fieldSWDUNCREF.getString();
  }

  /**
  * Set numeric field SWDUNCREF using a BigDecimal value.
  */
  public void setSWDUNCREF(BigDecimal newvalue)
  {
    fieldSWDUNCREF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDUNCREF as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDUNCREF()
  {
    return fieldSWDUNCREF.getBigDecimal();
  }

  /**
  * Set field SWDUNCF02 using a String value.
  */
  public void setSWDUNCF02(String newvalue)
  {
    fieldSWDUNCF02.setString(newvalue);
  }

  /**
  * Get value of field SWDUNCF02 as a String.
  */
  public String getSWDUNCF02()
  {
    return fieldSWDUNCF02.getString();
  }

  /**
  * Set field SWDUNCDYS using a String value.
  */
  public void setSWDUNCDYS(String newvalue)
  {
    fieldSWDUNCDYS.setString(newvalue);
  }

  /**
  * Get value of field SWDUNCDYS as a String.
  */
  public String getSWDUNCDYS()
  {
    return fieldSWDUNCDYS.getString();
  }

  /**
  * Set numeric field SWDUNCDYS using a BigDecimal value.
  */
  public void setSWDUNCDYS(BigDecimal newvalue)
  {
    fieldSWDUNCDYS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDUNCDYS as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDUNCDYS()
  {
    return fieldSWDUNCDYS.getBigDecimal();
  }

  /**
  * Set field SWDUNCRD1 using a String value.
  */
  public void setSWDUNCRD1(String newvalue)
  {
    fieldSWDUNCRD1.setString(newvalue);
  }

  /**
  * Get value of field SWDUNCRD1 as a String.
  */
  public String getSWDUNCRD1()
  {
    return fieldSWDUNCRD1.getString();
  }

  /**
  * Set numeric field SWDUNCRD1 using a BigDecimal value.
  */
  public void setSWDUNCRD1(BigDecimal newvalue)
  {
    fieldSWDUNCRD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDUNCRD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDUNCRD1()
  {
    return fieldSWDUNCRD1.getBigDecimal();
  }

  /**
  * Set field SWDUNCRD2 using a String value.
  */
  public void setSWDUNCRD2(String newvalue)
  {
    fieldSWDUNCRD2.setString(newvalue);
  }

  /**
  * Get value of field SWDUNCRD2 as a String.
  */
  public String getSWDUNCRD2()
  {
    return fieldSWDUNCRD2.getString();
  }

  /**
  * Set numeric field SWDUNCRD2 using a BigDecimal value.
  */
  public void setSWDUNCRD2(BigDecimal newvalue)
  {
    fieldSWDUNCRD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDUNCRD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDUNCRD2()
  {
    return fieldSWDUNCRD2.getBigDecimal();
  }

  /**
  * Set field SWDUNCRD3 using a String value.
  */
  public void setSWDUNCRD3(String newvalue)
  {
    fieldSWDUNCRD3.setString(newvalue);
  }

  /**
  * Get value of field SWDUNCRD3 as a String.
  */
  public String getSWDUNCRD3()
  {
    return fieldSWDUNCRD3.getString();
  }

  /**
  * Set numeric field SWDUNCRD3 using a BigDecimal value.
  */
  public void setSWDUNCRD3(BigDecimal newvalue)
  {
    fieldSWDUNCRD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDUNCRD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDUNCRD3()
  {
    return fieldSWDUNCRD3.getBigDecimal();
  }

  /**
  * Set field SWDUNCMD1 using a String value.
  */
  public void setSWDUNCMD1(String newvalue)
  {
    fieldSWDUNCMD1.setString(newvalue);
  }

  /**
  * Get value of field SWDUNCMD1 as a String.
  */
  public String getSWDUNCMD1()
  {
    return fieldSWDUNCMD1.getString();
  }

  /**
  * Set numeric field SWDUNCMD1 using a BigDecimal value.
  */
  public void setSWDUNCMD1(BigDecimal newvalue)
  {
    fieldSWDUNCMD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDUNCMD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDUNCMD1()
  {
    return fieldSWDUNCMD1.getBigDecimal();
  }

  /**
  * Set field SWDUNCMD2 using a String value.
  */
  public void setSWDUNCMD2(String newvalue)
  {
    fieldSWDUNCMD2.setString(newvalue);
  }

  /**
  * Get value of field SWDUNCMD2 as a String.
  */
  public String getSWDUNCMD2()
  {
    return fieldSWDUNCMD2.getString();
  }

  /**
  * Set numeric field SWDUNCMD2 using a BigDecimal value.
  */
  public void setSWDUNCMD2(BigDecimal newvalue)
  {
    fieldSWDUNCMD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDUNCMD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDUNCMD2()
  {
    return fieldSWDUNCMD2.getBigDecimal();
  }

  /**
  * Set field SWDUNCMD3 using a String value.
  */
  public void setSWDUNCMD3(String newvalue)
  {
    fieldSWDUNCMD3.setString(newvalue);
  }

  /**
  * Get value of field SWDUNCMD3 as a String.
  */
  public String getSWDUNCMD3()
  {
    return fieldSWDUNCMD3.getString();
  }

  /**
  * Set numeric field SWDUNCMD3 using a BigDecimal value.
  */
  public void setSWDUNCMD3(BigDecimal newvalue)
  {
    fieldSWDUNCMD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDUNCMD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDUNCMD3()
  {
    return fieldSWDUNCMD3.getBigDecimal();
  }

  /**
  * Set field SWDUNCRSN using a String value.
  */
  public void setSWDUNCRSN(String newvalue)
  {
    fieldSWDUNCRSN.setString(newvalue);
  }

  /**
  * Get value of field SWDUNCRSN as a String.
  */
  public String getSWDUNCRSN()
  {
    return fieldSWDUNCRSN.getString();
  }

  /**
  * Set field SWDUNCF01 using a String value.
  */
  public void setSWDUNCF01(String newvalue)
  {
    fieldSWDUNCF01.setString(newvalue);
  }

  /**
  * Get value of field SWDUNCF01 as a String.
  */
  public String getSWDUNCF01()
  {
    return fieldSWDUNCF01.getString();
  }

  /**
  * Set field SWDUNCSTA using a String value.
  */
  public void setSWDUNCSTA(String newvalue)
  {
    fieldSWDUNCSTA.setString(newvalue);
  }

  /**
  * Get value of field SWDUNCSTA as a String.
  */
  public String getSWDUNCSTA()
  {
    return fieldSWDUNCSTA.getString();
  }

  /**
  * Set field SWDSTSDSC using a String value.
  */
  public void setSWDSTSDSC(String newvalue)
  {
    fieldSWDSTSDSC.setString(newvalue);
  }

  /**
  * Get value of field SWDSTSDSC as a String.
  */
  public String getSWDSTSDSC()
  {
    return fieldSWDSTSDSC.getString();
  }

  /**
  * Set field SWDUNCCON using a String value.
  */
  public void setSWDUNCCON(String newvalue)
  {
    fieldSWDUNCCON.setString(newvalue);
  }

  /**
  * Get value of field SWDUNCCON as a String.
  */
  public String getSWDUNCCON()
  {
    return fieldSWDUNCCON.getString();
  }

  /**
  * Set field SWDSETBAL using a String value.
  */
  public void setSWDSETBAL(String newvalue)
  {
    fieldSWDSETBAL.setString(newvalue);
  }

  /**
  * Get value of field SWDSETBAL as a String.
  */
  public String getSWDSETBAL()
  {
    return fieldSWDSETBAL.getString();
  }

  /**
  * Set numeric field SWDSETBAL using a BigDecimal value.
  */
  public void setSWDSETBAL(BigDecimal newvalue)
  {
    fieldSWDSETBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDSETBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDSETBAL()
  {
    return fieldSWDSETBAL.getBigDecimal();
  }

  /**
  * Set field SWDTOTHLD using a String value.
  */
  public void setSWDTOTHLD(String newvalue)
  {
    fieldSWDTOTHLD.setString(newvalue);
  }

  /**
  * Get value of field SWDTOTHLD as a String.
  */
  public String getSWDTOTHLD()
  {
    return fieldSWDTOTHLD.getString();
  }

  /**
  * Set numeric field SWDTOTHLD using a BigDecimal value.
  */
  public void setSWDTOTHLD(BigDecimal newvalue)
  {
    fieldSWDTOTHLD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDTOTHLD as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDTOTHLD()
  {
    return fieldSWDTOTHLD.getBigDecimal();
  }

  /**
  * Set field SWDTOTUNC using a String value.
  */
  public void setSWDTOTUNC(String newvalue)
  {
    fieldSWDTOTUNC.setString(newvalue);
  }

  /**
  * Get value of field SWDTOTUNC as a String.
  */
  public String getSWDTOTUNC()
  {
    return fieldSWDTOTUNC.getString();
  }

  /**
  * Set numeric field SWDTOTUNC using a BigDecimal value.
  */
  public void setSWDTOTUNC(BigDecimal newvalue)
  {
    fieldSWDTOTUNC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDTOTUNC as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDTOTUNC()
  {
    return fieldSWDTOTUNC.getBigDecimal();
  }

  /**
  * Set field SWDTOTFUT using a String value.
  */
  public void setSWDTOTFUT(String newvalue)
  {
    fieldSWDTOTFUT.setString(newvalue);
  }

  /**
  * Get value of field SWDTOTFUT as a String.
  */
  public String getSWDTOTFUT()
  {
    return fieldSWDTOTFUT.getString();
  }

  /**
  * Set numeric field SWDTOTFUT using a BigDecimal value.
  */
  public void setSWDTOTFUT(BigDecimal newvalue)
  {
    fieldSWDTOTFUT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDTOTFUT as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDTOTFUT()
  {
    return fieldSWDTOTFUT.getBigDecimal();
  }

  /**
  * Set field SWDREC using a String value.
  */
  public void setSWDREC(String newvalue)
  {
    fieldSWDREC.setString(newvalue);
  }

  /**
  * Get value of field SWDREC as a String.
  */
  public String getSWDREC()
  {
    return fieldSWDREC.getString();
  }

  /**
  * Set numeric field SWDREC using a BigDecimal value.
  */
  public void setSWDREC(BigDecimal newvalue)
  {
    fieldSWDREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDREC()
  {
    return fieldSWDREC.getBigDecimal();
  }

  /**
  * Set field SWDOPE using a String value.
  */
  public void setSWDOPE(String newvalue)
  {
    fieldSWDOPE.setString(newvalue);
  }

  /**
  * Get value of field SWDOPE as a String.
  */
  public String getSWDOPE()
  {
    return fieldSWDOPE.getString();
  }

}
