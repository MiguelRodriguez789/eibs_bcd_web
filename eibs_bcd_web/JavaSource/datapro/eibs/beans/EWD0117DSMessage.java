package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0117DS physical file definition.
* 
* File level identifier is 1170810115755.
* Record format level identifier is 370E0612E4826.
*/

public class EWD0117DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDTGA",
                                     "EWDTPC",
                                     "EWDDGA",
                                     "EWDDPC",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDTGA",
                                   "EWDTPC",
                                   "EWDDGA",
                                   "EWDDPC",
                                   "EWDOPE"
                                 };
  final static String fid = "1170810115755";
  final static String rid = "370E0612E4826";
  final static String fmtname = "EWD0117DS";
  final int FIELDCOUNT = 5;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDTGA = null;
  private CharacterField fieldEWDTPC = null;
  private CharacterField fieldEWDDGA = null;
  private CharacterField fieldEWDDPC = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0117DSMessage.
  */
  public EWD0117DSMessage()
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
    recordsize = 76;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDTGA =
    new CharacterField(message, HEADERSIZE + 0, 4, "EWDTGA");
    fields[1] = fieldEWDTPC =
    new CharacterField(message, HEADERSIZE + 4, 1, "EWDTPC");
    fields[2] = fieldEWDDGA =
    new CharacterField(message, HEADERSIZE + 5, 35, "EWDDGA");
    fields[3] = fieldEWDDPC =
    new CharacterField(message, HEADERSIZE + 40, 35, "EWDDPC");
    fields[4] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 75, 1, "EWDOPE");

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
  * Set field EWDTGA using a String value.
  */
  public void setEWDTGA(String newvalue)
  {
    fieldEWDTGA.setString(newvalue);
  }

  /**
  * Get value of field EWDTGA as a String.
  */
  public String getEWDTGA()
  {
    return fieldEWDTGA.getString();
  }

  /**
  * Set field EWDTPC using a String value.
  */
  public void setEWDTPC(String newvalue)
  {
    fieldEWDTPC.setString(newvalue);
  }

  /**
  * Get value of field EWDTPC as a String.
  */
  public String getEWDTPC()
  {
    return fieldEWDTPC.getString();
  }

  /**
  * Set field EWDDGA using a String value.
  */
  public void setEWDDGA(String newvalue)
  {
    fieldEWDDGA.setString(newvalue);
  }

  /**
  * Get value of field EWDDGA as a String.
  */
  public String getEWDDGA()
  {
    return fieldEWDDGA.getString();
  }

  /**
  * Set field EWDDPC using a String value.
  */
  public void setEWDDPC(String newvalue)
  {
    fieldEWDDPC.setString(newvalue);
  }

  /**
  * Get value of field EWDDPC as a String.
  */
  public String getEWDDPC()
  {
    return fieldEWDDPC.getString();
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
