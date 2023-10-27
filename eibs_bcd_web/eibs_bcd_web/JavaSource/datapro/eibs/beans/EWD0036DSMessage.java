package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0036DS physical file definition.
* 
* File level identifier is 1130611113448.
* Record format level identifier is 5BD985DEC186F.
*/

public class EWD0036DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDBNK",
                                     "EWDACD",
                                     "EWDOPC",
                                     "EWDDSC",
                                     "EWDGLN",
                                     "EWDSOU",
                                     "EWDDIB",
                                     "EWDUCD",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDBNK",
                                   "EWDACD",
                                   "EWDOPC",
                                   "EWDDSC",
                                   "EWDGLN",
                                   "EWDSOU",
                                   "EWDDIB",
                                   "EWDUCD",
                                   "EWDOPE"
                                 };
  final static String fid = "1130611113448";
  final static String rid = "5BD985DEC186F";
  final static String fmtname = "EWD0036DS";
  final int FIELDCOUNT = 9;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDBNK = null;
  private CharacterField fieldEWDACD = null;
  private CharacterField fieldEWDOPC = null;
  private CharacterField fieldEWDDSC = null;
  private DecimalField fieldEWDGLN = null;
  private CharacterField fieldEWDSOU = null;
  private CharacterField fieldEWDDIB = null;
  private DecimalField fieldEWDUCD = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0036DSMessage.
  */
  public EWD0036DSMessage()
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
    recordsize = 91;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDBNK =
    new CharacterField(message, HEADERSIZE + 0, 2, "EWDBNK");
    fields[1] = fieldEWDACD =
    new CharacterField(message, HEADERSIZE + 2, 2, "EWDACD");
    fields[2] = fieldEWDOPC =
    new CharacterField(message, HEADERSIZE + 4, 2, "EWDOPC");
    fields[3] = fieldEWDDSC =
    new CharacterField(message, HEADERSIZE + 6, 60, "EWDDSC");
    fields[4] = fieldEWDGLN =
    new DecimalField(message, HEADERSIZE + 66, 17, 0, "EWDGLN");
    fields[5] = fieldEWDSOU =
    new CharacterField(message, HEADERSIZE + 83, 2, "EWDSOU");
    fields[6] = fieldEWDDIB =
    new CharacterField(message, HEADERSIZE + 85, 2, "EWDDIB");
    fields[7] = fieldEWDUCD =
    new DecimalField(message, HEADERSIZE + 87, 3, 0, "EWDUCD");
    fields[8] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 90, 1, "EWDOPE");

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
  * Set field EWDBNK using a String value.
  */
  public void setEWDBNK(String newvalue)
  {
    fieldEWDBNK.setString(newvalue);
  }

  /**
  * Get value of field EWDBNK as a String.
  */
  public String getEWDBNK()
  {
    return fieldEWDBNK.getString();
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
  * Set field EWDOPC using a String value.
  */
  public void setEWDOPC(String newvalue)
  {
    fieldEWDOPC.setString(newvalue);
  }

  /**
  * Get value of field EWDOPC as a String.
  */
  public String getEWDOPC()
  {
    return fieldEWDOPC.getString();
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
  * Set field EWDGLN using a String value.
  */
  public void setEWDGLN(String newvalue)
  {
    fieldEWDGLN.setString(newvalue);
  }

  /**
  * Get value of field EWDGLN as a String.
  */
  public String getEWDGLN()
  {
    return fieldEWDGLN.getString();
  }

  /**
  * Set numeric field EWDGLN using a BigDecimal value.
  */
  public void setEWDGLN(BigDecimal newvalue)
  {
    fieldEWDGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDGLN()
  {
    return fieldEWDGLN.getBigDecimal();
  }

  /**
  * Set field EWDSOU using a String value.
  */
  public void setEWDSOU(String newvalue)
  {
    fieldEWDSOU.setString(newvalue);
  }

  /**
  * Get value of field EWDSOU as a String.
  */
  public String getEWDSOU()
  {
    return fieldEWDSOU.getString();
  }

  /**
  * Set field EWDDIB using a String value.
  */
  public void setEWDDIB(String newvalue)
  {
    fieldEWDDIB.setString(newvalue);
  }

  /**
  * Get value of field EWDDIB as a String.
  */
  public String getEWDDIB()
  {
    return fieldEWDDIB.getString();
  }

  /**
  * Set field EWDUCD using a String value.
  */
  public void setEWDUCD(String newvalue)
  {
    fieldEWDUCD.setString(newvalue);
  }

  /**
  * Get value of field EWDUCD as a String.
  */
  public String getEWDUCD()
  {
    return fieldEWDUCD.getString();
  }

  /**
  * Set numeric field EWDUCD using a BigDecimal value.
  */
  public void setEWDUCD(BigDecimal newvalue)
  {
    fieldEWDUCD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDUCD as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDUCD()
  {
    return fieldEWDUCD.getBigDecimal();
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
