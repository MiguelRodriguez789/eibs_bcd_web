package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESWF30001 physical file definition.
* 
* File level identifier is 1130611113408.
* Record format level identifier is 4EDA133B80410.
*/

public class ESWF30001Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "ESW1SWI",
                                     "ESW1FTM",
                                     "ESW1TPN",
                                     "ESW1TXT",
                                     "ESW1OPE"
                                   };
  final static String tnames[] = {
                                   "ESW1SWI",
                                   "ESW1FTM",
                                   "ESW1TPN",
                                   "ESW1TXT",
                                   "ESW1OPE"
                                 };
  final static String fid = "1130611113408";
  final static String rid = "4EDA133B80410";
  final static String fmtname = "ESWF30001";
  final int FIELDCOUNT = 5;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldESW1SWI = null;
  private DecimalField fieldESW1FTM = null;
  private DecimalField fieldESW1TPN = null;
  private CharacterField fieldESW1TXT = null;
  private CharacterField fieldESW1OPE = null;

  /**
  * Constructor for ESWF30001Message.
  */
  public ESWF30001Message()
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
    recordsize = 90;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldESW1SWI =
    new CharacterField(message, HEADERSIZE + 0, 25, "ESW1SWI");
    fields[1] = fieldESW1FTM =
    new DecimalField(message, HEADERSIZE + 25, 4, 0, "ESW1FTM");
    fields[2] = fieldESW1TPN =
    new DecimalField(message, HEADERSIZE + 29, 10, 0, "ESW1TPN");
    fields[3] = fieldESW1TXT =
    new CharacterField(message, HEADERSIZE + 39, 50, "ESW1TXT");
    fields[4] = fieldESW1OPE =
    new CharacterField(message, HEADERSIZE + 89, 1, "ESW1OPE");

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
  * Set field ESW1SWI using a String value.
  */
  public void setESW1SWI(String newvalue)
  {
    fieldESW1SWI.setString(newvalue);
  }

  /**
  * Get value of field ESW1SWI as a String.
  */
  public String getESW1SWI()
  {
    return fieldESW1SWI.getString();
  }

  /**
  * Set field ESW1FTM using a String value.
  */
  public void setESW1FTM(String newvalue)
  {
    fieldESW1FTM.setString(newvalue);
  }

  /**
  * Get value of field ESW1FTM as a String.
  */
  public String getESW1FTM()
  {
    return fieldESW1FTM.getString();
  }

  /**
  * Set numeric field ESW1FTM using a BigDecimal value.
  */
  public void setESW1FTM(BigDecimal newvalue)
  {
    fieldESW1FTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ESW1FTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalESW1FTM()
  {
    return fieldESW1FTM.getBigDecimal();
  }

  /**
  * Set field ESW1TPN using a String value.
  */
  public void setESW1TPN(String newvalue)
  {
    fieldESW1TPN.setString(newvalue);
  }

  /**
  * Get value of field ESW1TPN as a String.
  */
  public String getESW1TPN()
  {
    return fieldESW1TPN.getString();
  }

  /**
  * Set numeric field ESW1TPN using a BigDecimal value.
  */
  public void setESW1TPN(BigDecimal newvalue)
  {
    fieldESW1TPN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ESW1TPN as a BigDecimal.
  */
  public BigDecimal getBigDecimalESW1TPN()
  {
    return fieldESW1TPN.getBigDecimal();
  }

  /**
  * Set field ESW1TXT using a String value.
  */
  public void setESW1TXT(String newvalue)
  {
    fieldESW1TXT.setString(newvalue);
  }

  /**
  * Get value of field ESW1TXT as a String.
  */
  public String getESW1TXT()
  {
    return fieldESW1TXT.getString();
  }

  /**
  * Set field ESW1OPE using a String value.
  */
  public void setESW1OPE(String newvalue)
  {
    fieldESW1OPE.setString(newvalue);
  }

  /**
  * Get value of field ESW1OPE as a String.
  */
  public String getESW1OPE()
  {
    return fieldESW1OPE.getString();
  }

}