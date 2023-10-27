package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0360DS physical file definition.
* 
* File level identifier is 1130611113506.
* Record format level identifier is 52E8D1AC8E5F0.
*/

public class EWD0360DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "RWDUSR",
                                     "RWDTYP",
                                     "RWDNME",
                                     "RWDFRC",
                                     "SWDCDE",
                                     "SWDNME",
                                     "SWDTYP",
                                     "SWDSTE",
                                     "SWDCIT",
                                     "SWDREC",
                                     "SWDOPE"
                                   };
  final static String tnames[] = {
                                   "RWDUSR",
                                   "RWDTYP",
                                   "RWDNME",
                                   "RWDFRC",
                                   "SWDCDE",
                                   "SWDNME",
                                   "SWDTYP",
                                   "SWDSTE",
                                   "SWDCIT",
                                   "SWDREC",
                                   "SWDOPE"
                                 };
  final static String fid = "1130611113506";
  final static String rid = "52E8D1AC8E5F0";
  final static String fmtname = "EWD0360DS";
  final int FIELDCOUNT = 11;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldRWDUSR = null;
  private CharacterField fieldRWDTYP = null;
  private CharacterField fieldRWDNME = null;
  private DecimalField fieldRWDFRC = null;
  private CharacterField fieldSWDCDE = null;
  private CharacterField fieldSWDNME = null;
  private CharacterField fieldSWDTYP = null;
  private CharacterField fieldSWDSTE = null;
  private CharacterField fieldSWDCIT = null;
  private DecimalField fieldSWDREC = null;
  private CharacterField fieldSWDOPE = null;

  /**
  * Constructor for EWD0360DSMessage.
  */
  public EWD0360DSMessage()
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
    recordsize = 116;
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
    fields[2] = fieldRWDNME =
    new CharacterField(message, HEADERSIZE + 11, 30, "RWDNME");
    fields[3] = fieldRWDFRC =
    new DecimalField(message, HEADERSIZE + 41, 8, 0, "RWDFRC");
    fields[4] = fieldSWDCDE =
    new CharacterField(message, HEADERSIZE + 49, 10, "SWDCDE");
    fields[5] = fieldSWDNME =
    new CharacterField(message, HEADERSIZE + 59, 30, "SWDNME");
    fields[6] = fieldSWDTYP =
    new CharacterField(message, HEADERSIZE + 89, 1, "SWDTYP");
    fields[7] = fieldSWDSTE =
    new CharacterField(message, HEADERSIZE + 90, 2, "SWDSTE");
    fields[8] = fieldSWDCIT =
    new CharacterField(message, HEADERSIZE + 92, 15, "SWDCIT");
    fields[9] = fieldSWDREC =
    new DecimalField(message, HEADERSIZE + 107, 8, 0, "SWDREC");
    fields[10] = fieldSWDOPE =
    new CharacterField(message, HEADERSIZE + 115, 1, "SWDOPE");

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
  * Set field RWDNME using a String value.
  */
  public void setRWDNME(String newvalue)
  {
    fieldRWDNME.setString(newvalue);
  }

  /**
  * Get value of field RWDNME as a String.
  */
  public String getRWDNME()
  {
    return fieldRWDNME.getString();
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
  * Set field SWDCDE using a String value.
  */
  public void setSWDCDE(String newvalue)
  {
    fieldSWDCDE.setString(newvalue);
  }

  /**
  * Get value of field SWDCDE as a String.
  */
  public String getSWDCDE()
  {
    return fieldSWDCDE.getString();
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
  * Set field SWDSTE using a String value.
  */
  public void setSWDSTE(String newvalue)
  {
    fieldSWDSTE.setString(newvalue);
  }

  /**
  * Get value of field SWDSTE as a String.
  */
  public String getSWDSTE()
  {
    return fieldSWDSTE.getString();
  }

  /**
  * Set field SWDCIT using a String value.
  */
  public void setSWDCIT(String newvalue)
  {
    fieldSWDCIT.setString(newvalue);
  }

  /**
  * Get value of field SWDCIT as a String.
  */
  public String getSWDCIT()
  {
    return fieldSWDCIT.getString();
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
