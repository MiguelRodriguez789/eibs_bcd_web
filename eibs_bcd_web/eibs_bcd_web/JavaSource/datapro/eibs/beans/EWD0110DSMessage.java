package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0110DS physical file definition.
* 
* File level identifier is 1130611113449.
* Record format level identifier is 37E598F0A0A44.
*/

public class EWD0110DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDCAU",
                                     "EWDCCY",
                                     "EWDDSC",
                                     "EWDFLG",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDCAU",
                                   "EWDCCY",
                                   "EWDDSC",
                                   "EWDFLG",
                                   "EWDOPE"
                                 };
  final static String fid = "1130611113449";
  final static String rid = "37E598F0A0A44";
  final static String fmtname = "EWD0110DS";
  final int FIELDCOUNT = 5;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDCAU = null;
  private CharacterField fieldEWDCCY = null;
  private CharacterField fieldEWDDSC = null;
  private CharacterField fieldEWDFLG = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0110DSMessage.
  */
  public EWD0110DSMessage()
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
    recordsize = 69;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDCAU =
    new CharacterField(message, HEADERSIZE + 0, 4, "EWDCAU");
    fields[1] = fieldEWDCCY =
    new CharacterField(message, HEADERSIZE + 4, 3, "EWDCCY");
    fields[2] = fieldEWDDSC =
    new CharacterField(message, HEADERSIZE + 7, 60, "EWDDSC");
    fields[3] = fieldEWDFLG =
    new CharacterField(message, HEADERSIZE + 67, 1, "EWDFLG");
    fields[4] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 68, 1, "EWDOPE");

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
  * Set field EWDCAU using a String value.
  */
  public void setEWDCAU(String newvalue)
  {
    fieldEWDCAU.setString(newvalue);
  }

  /**
  * Get value of field EWDCAU as a String.
  */
  public String getEWDCAU()
  {
    return fieldEWDCAU.getString();
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
  * Set field EWDDSC using a String value.
  */
  public void setEWDDSC(String newvalue)
  {
    fieldEWDDSC.setString(newvalue);
  }

  /**
  * Get value of field EWDDSC as a String.
  */
  public String getEWDDSC()
  {
    return fieldEWDDSC.getString();
  }

  /**
  * Set field EWDFLG using a String value.
  */
  public void setEWDFLG(String newvalue)
  {
    fieldEWDFLG.setString(newvalue);
  }

  /**
  * Get value of field EWDFLG as a String.
  */
  public String getEWDFLG()
  {
    return fieldEWDFLG.getString();
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
