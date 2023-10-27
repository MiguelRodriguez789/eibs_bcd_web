package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0500DS physical file definition.
* 
* File level identifier is 1130611113508.
* Record format level identifier is 55810B87B6932.
*/

public class EWD0500DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDBNK",
                                     "EWDINS",
                                     "EWDCCY",
                                     "EWDDSC",
                                     "EWDEXP",
                                     "EWDEXS",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDBNK",
                                   "EWDINS",
                                   "EWDCCY",
                                   "EWDDSC",
                                   "EWDEXP",
                                   "EWDEXS",
                                   "EWDOPE"
                                 };
  final static String fid = "1130611113508";
  final static String rid = "55810B87B6932";
  final static String fmtname = "EWD0500DS";
  final int FIELDCOUNT = 7;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDBNK = null;
  private CharacterField fieldEWDINS = null;
  private CharacterField fieldEWDCCY = null;
  private CharacterField fieldEWDDSC = null;
  private DecimalField fieldEWDEXP = null;
  private DecimalField fieldEWDEXS = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0500DSMessage.
  */
  public EWD0500DSMessage()
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
    recordsize = 96;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDBNK =
    new CharacterField(message, HEADERSIZE + 0, 2, "EWDBNK");
    fields[1] = fieldEWDINS =
    new CharacterField(message, HEADERSIZE + 2, 4, "EWDINS");
    fields[2] = fieldEWDCCY =
    new CharacterField(message, HEADERSIZE + 6, 3, "EWDCCY");
    fields[3] = fieldEWDDSC =
    new CharacterField(message, HEADERSIZE + 9, 60, "EWDDSC");
    fields[4] = fieldEWDEXP =
    new DecimalField(message, HEADERSIZE + 69, 13, 6, "EWDEXP");
    fields[5] = fieldEWDEXS =
    new DecimalField(message, HEADERSIZE + 82, 13, 6, "EWDEXS");
    fields[6] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 95, 1, "EWDOPE");

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
  * Set field EWDINS using a String value.
  */
  public void setEWDINS(String newvalue)
  {
    fieldEWDINS.setString(newvalue);
  }

  /**
  * Get value of field EWDINS as a String.
  */
  public String getEWDINS()
  {
    return fieldEWDINS.getString();
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
  * Set field EWDEXP using a String value.
  */
  public void setEWDEXP(String newvalue)
  {
    fieldEWDEXP.setString(newvalue);
  }

  /**
  * Get value of field EWDEXP as a String.
  */
  public String getEWDEXP()
  {
    return fieldEWDEXP.getString();
  }

  /**
  * Set numeric field EWDEXP using a BigDecimal value.
  */
  public void setEWDEXP(BigDecimal newvalue)
  {
    fieldEWDEXP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDEXP as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDEXP()
  {
    return fieldEWDEXP.getBigDecimal();
  }

  /**
  * Set field EWDEXS using a String value.
  */
  public void setEWDEXS(String newvalue)
  {
    fieldEWDEXS.setString(newvalue);
  }

  /**
  * Get value of field EWDEXS as a String.
  */
  public String getEWDEXS()
  {
    return fieldEWDEXS.getString();
  }

  /**
  * Set numeric field EWDEXS using a BigDecimal value.
  */
  public void setEWDEXS(BigDecimal newvalue)
  {
    fieldEWDEXS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDEXS as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDEXS()
  {
    return fieldEWDEXS.getBigDecimal();
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
