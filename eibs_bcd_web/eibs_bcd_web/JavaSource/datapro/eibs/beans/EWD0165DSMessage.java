package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0165DS physical file definition.
* 
* File level identifier is 1130611113451.
* Record format level identifier is 313287984BA27.
*/

public class EWD0165DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDTNU",
                                     "EWDDSC",
                                     "EWDACT",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDTNU",
                                   "EWDDSC",
                                   "EWDACT",
                                   "EWDOPE"
                                 };
  final static String fid = "1130611113451";
  final static String rid = "313287984BA27";
  final static String fmtname = "EWD0165DS";
  final int FIELDCOUNT = 4;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDTNU = null;
  private CharacterField fieldEWDDSC = null;
  private CharacterField fieldEWDACT = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0165DSMessage.
  */
  public EWD0165DSMessage()
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

    fields[0] = fieldEWDTNU =
    new CharacterField(message, HEADERSIZE + 0, 2, "EWDTNU");
    fields[1] = fieldEWDDSC =
    new CharacterField(message, HEADERSIZE + 2, 45, "EWDDSC");
    fields[2] = fieldEWDACT =
    new CharacterField(message, HEADERSIZE + 47, 1, "EWDACT");
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
  * Set field EWDTNU using a String value.
  */
  public void setEWDTNU(String newvalue)
  {
    fieldEWDTNU.setString(newvalue);
  }

  /**
  * Get value of field EWDTNU as a String.
  */
  public String getEWDTNU()
  {
    return fieldEWDTNU.getString();
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
  * Set field EWDACT using a String value.
  */
  public void setEWDACT(String newvalue)
  {
    fieldEWDACT.setString(newvalue);
  }

  /**
  * Get value of field EWDACT as a String.
  */
  public String getEWDACT()
  {
    return fieldEWDACT.getString();
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
