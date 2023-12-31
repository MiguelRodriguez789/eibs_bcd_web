package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0321DS physical file definition.
* 
* File level identifier is 1130611113453.
* Record format level identifier is 541526D9DE1B1.
*/

public class EWD0321DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "RWDUSR",
                                     "RWDTYP",
                                     "RWDFRC",
                                     "SWDDID",
                                     "SWDREF",
                                     "SWDCCY",
                                     "SWDTYP",
                                     "SWDSBT",
                                     "SWDVAL",
                                     "SWDCUN",
                                     "SWDAMN",
                                     "SWDDCY",
                                     "SWDEXR",
                                     "SWDDSC",
                                     "SWDREC",
                                     "SWDOPE"
                                   };
  final static String tnames[] = {
                                   "RWDUSR",
                                   "RWDTYP",
                                   "RWDFRC",
                                   "SWDDID",
                                   "SWDREF",
                                   "SWDCCY",
                                   "SWDTYP",
                                   "SWDSBT",
                                   "SWDVAL",
                                   "SWDCUN",
                                   "SWDAMN",
                                   "SWDDCY",
                                   "SWDEXR",
                                   "SWDDSC",
                                   "SWDREC",
                                   "SWDOPE"
                                 };
  final static String fid = "1130611113453";
  final static String rid = "541526D9DE1B1";
  final static String fmtname = "EWD0321DS";
  final int FIELDCOUNT = 16;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldRWDUSR = null;
  private CharacterField fieldRWDTYP = null;
  private DecimalField fieldRWDFRC = null;
  private CharacterField fieldSWDDID = null;
  private CharacterField fieldSWDREF = null;
  private CharacterField fieldSWDCCY = null;
  private CharacterField fieldSWDTYP = null;
  private CharacterField fieldSWDSBT = null;
  private DecimalField fieldSWDVAL = null;
  private DecimalField fieldSWDCUN = null;
  private DecimalField fieldSWDAMN = null;
  private CharacterField fieldSWDDCY = null;
  private DecimalField fieldSWDEXR = null;
  private CharacterField fieldSWDDSC = null;
  private DecimalField fieldSWDREC = null;
  private CharacterField fieldSWDOPE = null;

  /**
  * Constructor for EWD0321DSMessage.
  */
  public EWD0321DSMessage()
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
    recordsize = 173;
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
    fields[3] = fieldSWDDID =
    new CharacterField(message, HEADERSIZE + 19, 10, "SWDDID");
    fields[4] = fieldSWDREF =
    new CharacterField(message, HEADERSIZE + 29, 12, "SWDREF");
    fields[5] = fieldSWDCCY =
    new CharacterField(message, HEADERSIZE + 41, 3, "SWDCCY");
    fields[6] = fieldSWDTYP =
    new CharacterField(message, HEADERSIZE + 44, 4, "SWDTYP");
    fields[7] = fieldSWDSBT =
    new CharacterField(message, HEADERSIZE + 48, 4, "SWDSBT");
    fields[8] = fieldSWDVAL =
    new DecimalField(message, HEADERSIZE + 52, 9, 0, "SWDVAL");
    fields[9] = fieldSWDCUN =
    new DecimalField(message, HEADERSIZE + 61, 10, 0, "SWDCUN");
    fields[10] = fieldSWDAMN =
    new DecimalField(message, HEADERSIZE + 71, 17, 2, "SWDAMN");
    fields[11] = fieldSWDDCY =
    new CharacterField(message, HEADERSIZE + 88, 3, "SWDDCY");
    fields[12] = fieldSWDEXR =
    new DecimalField(message, HEADERSIZE + 91, 13, 6, "SWDEXR");
    fields[13] = fieldSWDDSC =
    new CharacterField(message, HEADERSIZE + 104, 60, "SWDDSC");
    fields[14] = fieldSWDREC =
    new DecimalField(message, HEADERSIZE + 164, 8, 0, "SWDREC");
    fields[15] = fieldSWDOPE =
    new CharacterField(message, HEADERSIZE + 172, 1, "SWDOPE");

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
  * Set field SWDDID using a String value.
  */
  public void setSWDDID(String newvalue)
  {
    fieldSWDDID.setString(newvalue);
  }

  /**
  * Get value of field SWDDID as a String.
  */
  public String getSWDDID()
  {
    return fieldSWDDID.getString();
  }

  /**
  * Set field SWDREF using a String value.
  */
  public void setSWDREF(String newvalue)
  {
    fieldSWDREF.setString(newvalue);
  }

  /**
  * Get value of field SWDREF as a String.
  */
  public String getSWDREF()
  {
    return fieldSWDREF.getString();
  }

  /**
  * Set field SWDCCY using a String value.
  */
  public void setSWDCCY(String newvalue)
  {
    fieldSWDCCY.setString(newvalue);
  }

  /**
  * Get value of field SWDCCY as a String.
  */
  public String getSWDCCY()
  {
    return fieldSWDCCY.getString();
  }

  /**
  * Set field SWDTYP using a String value.
  */
  public void setSWDTYP(String newvalue)
  {
    fieldSWDTYP.setString(newvalue);
  }

  /**
  * Get value of field SWDTYP as a String.
  */
  public String getSWDTYP()
  {
    return fieldSWDTYP.getString();
  }

  /**
  * Set field SWDSBT using a String value.
  */
  public void setSWDSBT(String newvalue)
  {
    fieldSWDSBT.setString(newvalue);
  }

  /**
  * Get value of field SWDSBT as a String.
  */
  public String getSWDSBT()
  {
    return fieldSWDSBT.getString();
  }

  /**
  * Set field SWDVAL using a String value.
  */
  public void setSWDVAL(String newvalue)
  {
    fieldSWDVAL.setString(newvalue);
  }

  /**
  * Get value of field SWDVAL as a String.
  */
  public String getSWDVAL()
  {
    return fieldSWDVAL.getString();
  }

  /**
  * Set numeric field SWDVAL using a BigDecimal value.
  */
  public void setSWDVAL(BigDecimal newvalue)
  {
    fieldSWDVAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDVAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDVAL()
  {
    return fieldSWDVAL.getBigDecimal();
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
  * Set field SWDAMN using a String value.
  */
  public void setSWDAMN(String newvalue)
  {
    fieldSWDAMN.setString(newvalue);
  }

  /**
  * Get value of field SWDAMN as a String.
  */
  public String getSWDAMN()
  {
    return fieldSWDAMN.getString();
  }

  /**
  * Set numeric field SWDAMN using a BigDecimal value.
  */
  public void setSWDAMN(BigDecimal newvalue)
  {
    fieldSWDAMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDAMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDAMN()
  {
    return fieldSWDAMN.getBigDecimal();
  }

  /**
  * Set field SWDDCY using a String value.
  */
  public void setSWDDCY(String newvalue)
  {
    fieldSWDDCY.setString(newvalue);
  }

  /**
  * Get value of field SWDDCY as a String.
  */
  public String getSWDDCY()
  {
    return fieldSWDDCY.getString();
  }

  /**
  * Set field SWDEXR using a String value.
  */
  public void setSWDEXR(String newvalue)
  {
    fieldSWDEXR.setString(newvalue);
  }

  /**
  * Get value of field SWDEXR as a String.
  */
  public String getSWDEXR()
  {
    return fieldSWDEXR.getString();
  }

  /**
  * Set numeric field SWDEXR using a BigDecimal value.
  */
  public void setSWDEXR(BigDecimal newvalue)
  {
    fieldSWDEXR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDEXR as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDEXR()
  {
    return fieldSWDEXR.getBigDecimal();
  }

  /**
  * Set field SWDDSC using a String value.
  */
  public void setSWDDSC(String newvalue)
  {
    fieldSWDDSC.setString(newvalue);
  }

  /**
  * Get value of field SWDDSC as a String.
  */
  public String getSWDDSC()
  {
    return fieldSWDDSC.getString();
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
