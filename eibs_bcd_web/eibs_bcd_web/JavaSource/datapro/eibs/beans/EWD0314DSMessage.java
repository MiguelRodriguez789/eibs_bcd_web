package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0314DS physical file definition.
* 
* File level identifier is 1130611113452.
* Record format level identifier is 3C6D339F172FF.
*/

public class EWD0314DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "RWDUSR",
                                     "RWDTYP",
                                     "RWDFRC",
                                     "SWDCUN",
                                     "SWDNA1",
                                     "SWDNUM",
                                     "SWDDS1",
                                     "SWDHBK",
                                     "SWDHBR",
                                     "SWDHCY",
                                     "SWDHGL",
                                     "SWDHAC",
                                     "SWDHCC",
                                     "SWDBAL",
                                     "SWDREC",
                                     "SWDOPE"
                                   };
  final static String tnames[] = {
                                   "RWDUSR",
                                   "RWDTYP",
                                   "RWDFRC",
                                   "SWDCUN",
                                   "SWDNA1",
                                   "SWDNUM",
                                   "SWDDS1",
                                   "SWDHBK",
                                   "SWDHBR",
                                   "SWDHCY",
                                   "SWDHGL",
                                   "SWDHAC",
                                   "SWDHCC",
                                   "SWDBAL",
                                   "SWDREC",
                                   "SWDOPE"
                                 };
  final static String fid = "1130611113452";
  final static String rid = "3C6D339F172FF";
  final static String fmtname = "EWD0314DS";
  final int FIELDCOUNT = 16;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldRWDUSR = null;
  private CharacterField fieldRWDTYP = null;
  private DecimalField fieldRWDFRC = null;
  private DecimalField fieldSWDCUN = null;
  private CharacterField fieldSWDNA1 = null;
  private DecimalField fieldSWDNUM = null;
  private CharacterField fieldSWDDS1 = null;
  private CharacterField fieldSWDHBK = null;
  private DecimalField fieldSWDHBR = null;
  private CharacterField fieldSWDHCY = null;
  private DecimalField fieldSWDHGL = null;
  private DecimalField fieldSWDHAC = null;
  private DecimalField fieldSWDHCC = null;
  private DecimalField fieldSWDBAL = null;
  private DecimalField fieldSWDREC = null;
  private CharacterField fieldSWDOPE = null;

  /**
  * Constructor for EWD0314DSMessage.
  */
  public EWD0314DSMessage()
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
    recordsize = 235;
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
    fields[3] = fieldSWDCUN =
    new DecimalField(message, HEADERSIZE + 19, 10, 0, "SWDCUN");
    fields[4] = fieldSWDNA1 =
    new CharacterField(message, HEADERSIZE + 29, 60, "SWDNA1");
    fields[5] = fieldSWDNUM =
    new DecimalField(message, HEADERSIZE + 89, 13, 0, "SWDNUM");
    fields[6] = fieldSWDDS1 =
    new CharacterField(message, HEADERSIZE + 102, 60, "SWDDS1");
    fields[7] = fieldSWDHBK =
    new CharacterField(message, HEADERSIZE + 162, 2, "SWDHBK");
    fields[8] = fieldSWDHBR =
    new DecimalField(message, HEADERSIZE + 164, 5, 0, "SWDHBR");
    fields[9] = fieldSWDHCY =
    new CharacterField(message, HEADERSIZE + 169, 3, "SWDHCY");
    fields[10] = fieldSWDHGL =
    new DecimalField(message, HEADERSIZE + 172, 17, 0, "SWDHGL");
    fields[11] = fieldSWDHAC =
    new DecimalField(message, HEADERSIZE + 189, 13, 0, "SWDHAC");
    fields[12] = fieldSWDHCC =
    new DecimalField(message, HEADERSIZE + 202, 9, 0, "SWDHCC");
    fields[13] = fieldSWDBAL =
    new DecimalField(message, HEADERSIZE + 211, 15, 2, "SWDBAL");
    fields[14] = fieldSWDREC =
    new DecimalField(message, HEADERSIZE + 226, 8, 0, "SWDREC");
    fields[15] = fieldSWDOPE =
    new CharacterField(message, HEADERSIZE + 234, 1, "SWDOPE");

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
  * Set field SWDCUN using a String value.
  */
  public void setSWDCUN(String newvalue)
  {
    fieldSWDCUN.setString(newvalue);
  }

  /**
  * Get value of field SWDCUN as a String.
  */
  public String getSWDCUN()
  {
    return fieldSWDCUN.getString();
  }

  /**
  * Set numeric field SWDCUN using a BigDecimal value.
  */
  public void setSWDCUN(BigDecimal newvalue)
  {
    fieldSWDCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDCUN()
  {
    return fieldSWDCUN.getBigDecimal();
  }

  /**
  * Set field SWDNA1 using a String value.
  */
  public void setSWDNA1(String newvalue)
  {
    fieldSWDNA1.setString(newvalue);
  }

  /**
  * Get value of field SWDNA1 as a String.
  */
  public String getSWDNA1()
  {
    return fieldSWDNA1.getString();
  }

  /**
  * Set field SWDNUM using a String value.
  */
  public void setSWDNUM(String newvalue)
  {
    fieldSWDNUM.setString(newvalue);
  }

  /**
  * Get value of field SWDNUM as a String.
  */
  public String getSWDNUM()
  {
    return fieldSWDNUM.getString();
  }

  /**
  * Set numeric field SWDNUM using a BigDecimal value.
  */
  public void setSWDNUM(BigDecimal newvalue)
  {
    fieldSWDNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDNUM()
  {
    return fieldSWDNUM.getBigDecimal();
  }

  /**
  * Set field SWDDS1 using a String value.
  */
  public void setSWDDS1(String newvalue)
  {
    fieldSWDDS1.setString(newvalue);
  }

  /**
  * Get value of field SWDDS1 as a String.
  */
  public String getSWDDS1()
  {
    return fieldSWDDS1.getString();
  }

  /**
  * Set field SWDHBK using a String value.
  */
  public void setSWDHBK(String newvalue)
  {
    fieldSWDHBK.setString(newvalue);
  }

  /**
  * Get value of field SWDHBK as a String.
  */
  public String getSWDHBK()
  {
    return fieldSWDHBK.getString();
  }

  /**
  * Set field SWDHBR using a String value.
  */
  public void setSWDHBR(String newvalue)
  {
    fieldSWDHBR.setString(newvalue);
  }

  /**
  * Get value of field SWDHBR as a String.
  */
  public String getSWDHBR()
  {
    return fieldSWDHBR.getString();
  }

  /**
  * Set numeric field SWDHBR using a BigDecimal value.
  */
  public void setSWDHBR(BigDecimal newvalue)
  {
    fieldSWDHBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDHBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDHBR()
  {
    return fieldSWDHBR.getBigDecimal();
  }

  /**
  * Set field SWDHCY using a String value.
  */
  public void setSWDHCY(String newvalue)
  {
    fieldSWDHCY.setString(newvalue);
  }

  /**
  * Get value of field SWDHCY as a String.
  */
  public String getSWDHCY()
  {
    return fieldSWDHCY.getString();
  }

  /**
  * Set field SWDHGL using a String value.
  */
  public void setSWDHGL(String newvalue)
  {
    fieldSWDHGL.setString(newvalue);
  }

  /**
  * Get value of field SWDHGL as a String.
  */
  public String getSWDHGL()
  {
    return fieldSWDHGL.getString();
  }

  /**
  * Set numeric field SWDHGL using a BigDecimal value.
  */
  public void setSWDHGL(BigDecimal newvalue)
  {
    fieldSWDHGL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDHGL as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDHGL()
  {
    return fieldSWDHGL.getBigDecimal();
  }

  /**
  * Set field SWDHAC using a String value.
  */
  public void setSWDHAC(String newvalue)
  {
    fieldSWDHAC.setString(newvalue);
  }

  /**
  * Get value of field SWDHAC as a String.
  */
  public String getSWDHAC()
  {
    return fieldSWDHAC.getString();
  }

  /**
  * Set numeric field SWDHAC using a BigDecimal value.
  */
  public void setSWDHAC(BigDecimal newvalue)
  {
    fieldSWDHAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDHAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDHAC()
  {
    return fieldSWDHAC.getBigDecimal();
  }

  /**
  * Set field SWDHCC using a String value.
  */
  public void setSWDHCC(String newvalue)
  {
    fieldSWDHCC.setString(newvalue);
  }

  /**
  * Get value of field SWDHCC as a String.
  */
  public String getSWDHCC()
  {
    return fieldSWDHCC.getString();
  }

  /**
  * Set numeric field SWDHCC using a BigDecimal value.
  */
  public void setSWDHCC(BigDecimal newvalue)
  {
    fieldSWDHCC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDHCC as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDHCC()
  {
    return fieldSWDHCC.getBigDecimal();
  }

  /**
  * Set field SWDBAL using a String value.
  */
  public void setSWDBAL(String newvalue)
  {
    fieldSWDBAL.setString(newvalue);
  }

  /**
  * Get value of field SWDBAL as a String.
  */
  public String getSWDBAL()
  {
    return fieldSWDBAL.getString();
  }

  /**
  * Set numeric field SWDBAL using a BigDecimal value.
  */
  public void setSWDBAL(BigDecimal newvalue)
  {
    fieldSWDBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDBAL()
  {
    return fieldSWDBAL.getBigDecimal();
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