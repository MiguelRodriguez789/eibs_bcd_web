package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0091DS physical file definition.
* 
* File level identifier is 1130611113449.
* Record format level identifier is 3753D75432572.
*/

public class EWD0091DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDTBL",
                                     "EWDCOD",
                                     "EWDDSC",
                                     "EWDREC",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDTBL",
                                   "EWDCOD",
                                   "EWDDSC",
                                   "EWDREC",
                                   "EWDOPE"
                                 };
  final static String fid = "1130611113449";
  final static String rid = "3753D75432572";
  final static String fmtname = "EWD0091DS";
  final int FIELDCOUNT = 5;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDTBL = null;
  private CharacterField fieldEWDCOD = null;
  private CharacterField fieldEWDDSC = null;
  private DecimalField fieldEWDREC = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0091DSMessage.
  */
  public EWD0091DSMessage()
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
    recordsize = 77;
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
    new CharacterField(message, HEADERSIZE + 2, 6, "EWDCOD");
    fields[2] = fieldEWDDSC =
    new CharacterField(message, HEADERSIZE + 8, 60, "EWDDSC");
    fields[3] = fieldEWDREC =
    new DecimalField(message, HEADERSIZE + 68, 8, 0, "EWDREC");
    fields[4] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 76, 1, "EWDOPE");

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
  * Set field EWDREC using a String value.
  */
  public void setEWDREC(String newvalue)
  {
    fieldEWDREC.setString(newvalue);
  }

  /**
  * Get value of field EWDREC as a String.
  */
  public String getEWDREC()
  {
    return fieldEWDREC.getString();
  }

  /**
  * Set numeric field EWDREC using a BigDecimal value.
  */
  public void setEWDREC(BigDecimal newvalue)
  {
    fieldEWDREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDREC()
  {
    return fieldEWDREC.getBigDecimal();
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
