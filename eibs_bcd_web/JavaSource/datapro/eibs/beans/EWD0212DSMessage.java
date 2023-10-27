package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0212DS physical file definition.
* 
* File level identifier is 1151117123434.
* Record format level identifier is 36CD1C1EB5296.
*/

public class EWD0212DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDCOD",
                                     "EWDDSC",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDCOD",
                                   "EWDDSC",
                                   "EWDOPE"
                                 };
  final static String fid = "1151117123434";
  final static String rid = "36CD1C1EB5296";
  final static String fmtname = "EWD0212DS";
  final int FIELDCOUNT = 3;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDCOD = null;
  private CharacterField fieldEWDDSC = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0212DSMessage.
  */
  public EWD0212DSMessage()
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
    recordsize = 48;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDCOD =
    new CharacterField(message, HEADERSIZE + 0, 2, "EWDCOD");
    fields[1] = fieldEWDDSC =
    new CharacterField(message, HEADERSIZE + 2, 45, "EWDDSC");
    fields[2] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 47, 1, "EWDOPE");

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
  * Set field EWDCOD using a String value.
  */
  public void setEWDCOD(String newvalue)
  {
    fieldEWDCOD.setString(newvalue);
  }

  /**
  * Get value of field EWDCOD as a String.
  */
  public String getEWDCOD()
  {
    return fieldEWDCOD.getString();
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
