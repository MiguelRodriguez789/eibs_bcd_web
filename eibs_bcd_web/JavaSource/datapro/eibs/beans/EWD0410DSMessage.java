package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0410DS physical file definition.
* 
* File level identifier is 1130611113507.
* Record format level identifier is 3672066221624.
*/

public class EWD0410DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDTBL",
                                     "EWDCOD",
                                     "EWDDSC",
                                     "EWDREF",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDTBL",
                                   "EWDCOD",
                                   "EWDDSC",
                                   "EWDREF",
                                   "EWDOPE"
                                 };
  final static String fid = "1130611113507";
  final static String rid = "3672066221624";
  final static String fmtname = "EWD0410DS";
  final int FIELDCOUNT = 5;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDTBL = null;
  private CharacterField fieldEWDCOD = null;
  private CharacterField fieldEWDDSC = null;
  private CharacterField fieldEWDREF = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0410DSMessage.
  */
  public EWD0410DSMessage()
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
    recordsize = 61;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDTBL =
    new CharacterField(message, HEADERSIZE + 0, 2, "EWDTBL");
    fields[1] = fieldEWDCOD =
    new CharacterField(message, HEADERSIZE + 2, 4, "EWDCOD");
    fields[2] = fieldEWDDSC =
    new CharacterField(message, HEADERSIZE + 6, 45, "EWDDSC");
    fields[3] = fieldEWDREF =
    new CharacterField(message, HEADERSIZE + 51, 9, "EWDREF");
    fields[4] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 60, 1, "EWDOPE");

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
  * Set field EWDTBL using a String value.
  */
  public void setEWDTBL(String newvalue)
  {
    fieldEWDTBL.setString(newvalue);
  }

  /**
  * Get value of field EWDTBL as a String.
  */
  public String getEWDTBL()
  {
    return fieldEWDTBL.getString();
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
  * Set field EWDREF using a String value.
  */
  public void setEWDREF(String newvalue)
  {
    fieldEWDREF.setString(newvalue);
  }

  /**
  * Get value of field EWDREF as a String.
  */
  public String getEWDREF()
  {
    return fieldEWDREF.getString();
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