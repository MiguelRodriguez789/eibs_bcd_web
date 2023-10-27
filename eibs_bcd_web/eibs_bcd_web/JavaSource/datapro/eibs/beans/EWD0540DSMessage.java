package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0540DS physical file definition.
* 
* File level identifier is 1130611161305.
* Record format level identifier is 4D6266387D741.
*/

public class EWD0540DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDSBK",
                                     "EWDSCY",
                                     "EWDSTY",
                                     "EWDBRN",
                                     "EWDNME",
                                     "EWDBC1",
                                     "EWDBD1",
                                     "EWDBC2",
                                     "EWDBD2",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDSBK",
                                   "EWDSCY",
                                   "EWDSTY",
                                   "EWDBRN",
                                   "EWDNME",
                                   "EWDBC1",
                                   "EWDBD1",
                                   "EWDBC2",
                                   "EWDBD2",
                                   "EWDOPE"
                                 };
  final static String fid = "1130611161305";
  final static String rid = "4D6266387D741";
  final static String fmtname = "EWD0540DS";
  final int FIELDCOUNT = 10;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDSBK = null;
  private CharacterField fieldEWDSCY = null;
  private CharacterField fieldEWDSTY = null;
  private DecimalField fieldEWDBRN = null;
  private CharacterField fieldEWDNME = null;
  private CharacterField fieldEWDBC1 = null;
  private CharacterField fieldEWDBD1 = null;
  private CharacterField fieldEWDBC2 = null;
  private CharacterField fieldEWDBD2 = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0540DSMessage.
  */
  public EWD0540DSMessage()
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
    recordsize = 156;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDSBK =
    new CharacterField(message, HEADERSIZE + 0, 2, "EWDSBK");
    fields[1] = fieldEWDSCY =
    new CharacterField(message, HEADERSIZE + 2, 3, "EWDSCY");
    fields[2] = fieldEWDSTY =
    new CharacterField(message, HEADERSIZE + 5, 2, "EWDSTY");
    fields[3] = fieldEWDBRN =
    new DecimalField(message, HEADERSIZE + 7, 5, 0, "EWDBRN");
    fields[4] = fieldEWDNME =
    new CharacterField(message, HEADERSIZE + 12, 45, "EWDNME");
    fields[5] = fieldEWDBC1 =
    new CharacterField(message, HEADERSIZE + 57, 4, "EWDBC1");
    fields[6] = fieldEWDBD1 =
    new CharacterField(message, HEADERSIZE + 61, 45, "EWDBD1");
    fields[7] = fieldEWDBC2 =
    new CharacterField(message, HEADERSIZE + 106, 4, "EWDBC2");
    fields[8] = fieldEWDBD2 =
    new CharacterField(message, HEADERSIZE + 110, 45, "EWDBD2");
    fields[9] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 155, 1, "EWDOPE");

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
  * Set field EWDSBK using a String value.
  */
  public void setEWDSBK(String newvalue)
  {
    fieldEWDSBK.setString(newvalue);
  }

  /**
  * Get value of field EWDSBK as a String.
  */
  public String getEWDSBK()
  {
    return fieldEWDSBK.getString();
  }

  /**
  * Set field EWDSCY using a String value.
  */
  public void setEWDSCY(String newvalue)
  {
    fieldEWDSCY.setString(newvalue);
  }

  /**
  * Get value of field EWDSCY as a String.
  */
  public String getEWDSCY()
  {
    return fieldEWDSCY.getString();
  }

  /**
  * Set field EWDSTY using a String value.
  */
  public void setEWDSTY(String newvalue)
  {
    fieldEWDSTY.setString(newvalue);
  }

  /**
  * Get value of field EWDSTY as a String.
  */
  public String getEWDSTY()
  {
    return fieldEWDSTY.getString();
  }

  /**
  * Set field EWDBRN using a String value.
  */
  public void setEWDBRN(String newvalue)
  {
    fieldEWDBRN.setString(newvalue);
  }

  /**
  * Get value of field EWDBRN as a String.
  */
  public String getEWDBRN()
  {
    return fieldEWDBRN.getString();
  }

  /**
  * Set numeric field EWDBRN using a BigDecimal value.
  */
  public void setEWDBRN(BigDecimal newvalue)
  {
    fieldEWDBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDBRN()
  {
    return fieldEWDBRN.getBigDecimal();
  }

  /**
  * Set field EWDNME using a String value.
  */
  public void setEWDNME(String newvalue)
  {
    fieldEWDNME.setString(newvalue);
  }

  /**
  * Get value of field EWDNME as a String.
  */
  public String getEWDNME()
  {
    return fieldEWDNME.getString();
  }

  /**
  * Set field EWDBC1 using a String value.
  */
  public void setEWDBC1(String newvalue)
  {
    fieldEWDBC1.setString(newvalue);
  }

  /**
  * Get value of field EWDBC1 as a String.
  */
  public String getEWDBC1()
  {
    return fieldEWDBC1.getString();
  }

  /**
  * Set field EWDBD1 using a String value.
  */
  public void setEWDBD1(String newvalue)
  {
    fieldEWDBD1.setString(newvalue);
  }

  /**
  * Get value of field EWDBD1 as a String.
  */
  public String getEWDBD1()
  {
    return fieldEWDBD1.getString();
  }

  /**
  * Set field EWDBC2 using a String value.
  */
  public void setEWDBC2(String newvalue)
  {
    fieldEWDBC2.setString(newvalue);
  }

  /**
  * Get value of field EWDBC2 as a String.
  */
  public String getEWDBC2()
  {
    return fieldEWDBC2.getString();
  }

  /**
  * Set field EWDBD2 using a String value.
  */
  public void setEWDBD2(String newvalue)
  {
    fieldEWDBD2.setString(newvalue);
  }

  /**
  * Get value of field EWDBD2 as a String.
  */
  public String getEWDBD2()
  {
    return fieldEWDBD2.getString();
  }

  /**
  * Set field EWDOPE using a String value.
  */
  public void setEWDOPE(String newvalue)
  {
    fieldEWDOPE.setString(newvalue);
  }

  /**
  * Get value of field EWDOPE as a String.
  */
  public String getEWDOPE()
  {
    return fieldEWDOPE.getString();
  }

}