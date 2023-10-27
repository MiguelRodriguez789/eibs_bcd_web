package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0390DS physical file definition.
* 
* File level identifier is 1151103115245.
* Record format level identifier is 2FC08774E67DC.
*/

public class EWD0390DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDACD",
                                     "EWDDSC",
                                     "EWDCLS",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDACD",
                                   "EWDDSC",
                                   "EWDCLS",
                                   "EWDOPE"
                                 };
  final static String fid = "1151103115245";
  final static String rid = "2FC08774E67DC";
  final static String fmtname = "EWD0390DS";
  final int FIELDCOUNT = 4;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDACD = null;
  private CharacterField fieldEWDDSC = null;
  private CharacterField fieldEWDCLS = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0390DSMessage.
  */
  public EWD0390DSMessage()
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
    recordsize = 49;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDACD =
    new CharacterField(message, HEADERSIZE + 0, 2, "EWDACD");
    fields[1] = fieldEWDDSC =
    new CharacterField(message, HEADERSIZE + 2, 45, "EWDDSC");
    fields[2] = fieldEWDCLS =
    new CharacterField(message, HEADERSIZE + 47, 1, "EWDCLS");
    fields[3] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 48, 1, "EWDOPE");

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
  * Set field EWDACD using a String value.
  */
  public void setEWDACD(String newvalue)
  {
    fieldEWDACD.setString(newvalue);
  }

  /**
  * Get value of field EWDACD as a String.
  */
  public String getEWDACD()
  {
    return fieldEWDACD.getString();
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
  * Set field EWDCLS using a String value.
  */
  public void setEWDCLS(String newvalue)
  {
    fieldEWDCLS.setString(newvalue);
  }

  /**
  * Get value of field EWDCLS as a String.
  */
  public String getEWDCLS()
  {
    return fieldEWDCLS.getString();
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