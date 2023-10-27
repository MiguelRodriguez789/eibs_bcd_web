package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0028DS physical file definition.
* 
* File level identifier is 1130611113448.
* Record format level identifier is 3F3A040B3950B.
*/

public class EWD0028DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDSID",
                                     "EWDTID",
                                     "EWDCCY",
                                     "EWDTYP",
                                     "EWDCLF",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDSID",
                                   "EWDTID",
                                   "EWDCCY",
                                   "EWDTYP",
                                   "EWDCLF",
                                   "EWDOPE"
                                 };
  final static String fid = "1130611113448";
  final static String rid = "3F3A040B3950B";
  final static String fmtname = "EWD0028DS";
  final int FIELDCOUNT = 6;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDSID = null;
  private CharacterField fieldEWDTID = null;
  private CharacterField fieldEWDCCY = null;
  private CharacterField fieldEWDTYP = null;
  private CharacterField fieldEWDCLF = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0028DSMessage.
  */
  public EWD0028DSMessage()
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
    recordsize = 26;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDSID =
    new CharacterField(message, HEADERSIZE + 0, 10, "EWDSID");
    fields[1] = fieldEWDTID =
    new CharacterField(message, HEADERSIZE + 10, 10, "EWDTID");
    fields[2] = fieldEWDCCY =
    new CharacterField(message, HEADERSIZE + 20, 3, "EWDCCY");
    fields[3] = fieldEWDTYP =
    new CharacterField(message, HEADERSIZE + 23, 1, "EWDTYP");
    fields[4] = fieldEWDCLF =
    new CharacterField(message, HEADERSIZE + 24, 1, "EWDCLF");
    fields[5] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 25, 1, "EWDOPE");

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
  * Set field EWDSID using a String value.
  */
  public void setEWDSID(String newvalue)
  {
    fieldEWDSID.setString(newvalue);
  }

  /**
  * Get value of field EWDSID as a String.
  */
  public String getEWDSID()
  {
    return fieldEWDSID.getString();
  }

  /**
  * Set field EWDTID using a String value.
  */
  public void setEWDTID(String newvalue)
  {
    fieldEWDTID.setString(newvalue);
  }

  /**
  * Get value of field EWDTID as a String.
  */
  public String getEWDTID()
  {
    return fieldEWDTID.getString();
  }

  /**
  * Set field EWDCCY using a String value.
  */
  public void setEWDCCY(String newvalue)
  {
    fieldEWDCCY.setString(newvalue);
  }

  /**
  * Get value of field EWDCCY as a String.
  */
  public String getEWDCCY()
  {
    return fieldEWDCCY.getString();
  }

  /**
  * Set field EWDTYP using a String value.
  */
  public void setEWDTYP(String newvalue)
  {
    fieldEWDTYP.setString(newvalue);
  }

  /**
  * Get value of field EWDTYP as a String.
  */
  public String getEWDTYP()
  {
    return fieldEWDTYP.getString();
  }

  /**
  * Set field EWDCLF using a String value.
  */
  public void setEWDCLF(String newvalue)
  {
    fieldEWDCLF.setString(newvalue);
  }

  /**
  * Get value of field EWDCLF as a String.
  */
  public String getEWDCLF()
  {
    return fieldEWDCLF.getString();
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
