package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0330DS physical file definition.
* 
* File level identifier is 1130611113453.
* Record format level identifier is 2DB858EE997E0.
*/

public class EWD0330DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "RWDUSR",
                                     "RWDTYP",
                                     "RWDFRC",
                                     "SWDBNK",
                                     "SWDBRN",
                                     "SWDDID",
                                     "SWDNME",
                                     "SWDOFC",
                                     "SWDCCN",
                                     "SWDSTS",
                                     "SWDREC",
                                     "SWDOPE"
                                   };
  final static String tnames[] = {
                                   "RWDUSR",
                                   "RWDTYP",
                                   "RWDFRC",
                                   "SWDBNK",
                                   "SWDBRN",
                                   "SWDDID",
                                   "SWDNME",
                                   "SWDOFC",
                                   "SWDCCN",
                                   "SWDSTS",
                                   "SWDREC",
                                   "SWDOPE"
                                 };
  final static String fid = "1130611113453";
  final static String rid = "2DB858EE997E0";
  final static String fmtname = "EWD0330DS";
  final int FIELDCOUNT = 12;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldRWDUSR = null;
  private CharacterField fieldRWDTYP = null;
  private DecimalField fieldRWDFRC = null;
  private CharacterField fieldSWDBNK = null;
  private DecimalField fieldSWDBRN = null;
  private CharacterField fieldSWDDID = null;
  private CharacterField fieldSWDNME = null;
  private CharacterField fieldSWDOFC = null;
  private DecimalField fieldSWDCCN = null;
  private CharacterField fieldSWDSTS = null;
  private DecimalField fieldSWDREC = null;
  private CharacterField fieldSWDOPE = null;

  /**
  * Constructor for EWD0330DSMessage.
  */
  public EWD0330DSMessage()
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
    recordsize = 104;
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
    fields[3] = fieldSWDBNK =
    new CharacterField(message, HEADERSIZE + 19, 2, "SWDBNK");
    fields[4] = fieldSWDBRN =
    new DecimalField(message, HEADERSIZE + 21, 5, 0, "SWDBRN");
    fields[5] = fieldSWDDID =
    new CharacterField(message, HEADERSIZE + 26, 10, "SWDDID");
    fields[6] = fieldSWDNME =
    new CharacterField(message, HEADERSIZE + 36, 45, "SWDNME");
    fields[7] = fieldSWDOFC =
    new CharacterField(message, HEADERSIZE + 81, 4, "SWDOFC");
    fields[8] = fieldSWDCCN =
    new DecimalField(message, HEADERSIZE + 85, 9, 0, "SWDCCN");
    fields[9] = fieldSWDSTS =
    new CharacterField(message, HEADERSIZE + 94, 1, "SWDSTS");
    fields[10] = fieldSWDREC =
    new DecimalField(message, HEADERSIZE + 95, 8, 0, "SWDREC");
    fields[11] = fieldSWDOPE =
    new CharacterField(message, HEADERSIZE + 103, 1, "SWDOPE");

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
  * Set field SWDBNK using a String value.
  */
  public void setSWDBNK(String newvalue)
  {
    fieldSWDBNK.setString(newvalue);
  }

  /**
  * Get value of field SWDBNK as a String.
  */
  public String getSWDBNK()
  {
    return fieldSWDBNK.getString();
  }

  /**
  * Set field SWDBRN using a String value.
  */
  public void setSWDBRN(String newvalue)
  {
    fieldSWDBRN.setString(newvalue);
  }

  /**
  * Get value of field SWDBRN as a String.
  */
  public String getSWDBRN()
  {
    return fieldSWDBRN.getString();
  }

  /**
  * Set numeric field SWDBRN using a BigDecimal value.
  */
  public void setSWDBRN(BigDecimal newvalue)
  {
    fieldSWDBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDBRN()
  {
    return fieldSWDBRN.getBigDecimal();
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
  * Set field SWDNME using a String value.
  */
  public void setSWDNME(String newvalue)
  {
    fieldSWDNME.setString(newvalue);
  }

  /**
  * Get value of field SWDNME as a String.
  */
  public String getSWDNME()
  {
    return fieldSWDNME.getString();
  }

  /**
  * Set field SWDOFC using a String value.
  */
  public void setSWDOFC(String newvalue)
  {
    fieldSWDOFC.setString(newvalue);
  }

  /**
  * Get value of field SWDOFC as a String.
  */
  public String getSWDOFC()
  {
    return fieldSWDOFC.getString();
  }

  /**
  * Set field SWDCCN using a String value.
  */
  public void setSWDCCN(String newvalue)
  {
    fieldSWDCCN.setString(newvalue);
  }

  /**
  * Get value of field SWDCCN as a String.
  */
  public String getSWDCCN()
  {
    return fieldSWDCCN.getString();
  }

  /**
  * Set numeric field SWDCCN using a BigDecimal value.
  */
  public void setSWDCCN(BigDecimal newvalue)
  {
    fieldSWDCCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SWDCCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalSWDCCN()
  {
    return fieldSWDCCN.getBigDecimal();
  }

  /**
  * Set field SWDSTS using a String value.
  */
  public void setSWDSTS(String newvalue)
  {
    fieldSWDSTS.setString(newvalue);
  }

  /**
  * Get value of field SWDSTS as a String.
  */
  public String getSWDSTS()
  {
    return fieldSWDSTS.getString();
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
