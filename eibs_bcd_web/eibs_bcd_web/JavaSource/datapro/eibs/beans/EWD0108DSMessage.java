package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0108DS physical file definition.
* 
* File level identifier is 1130611113449.
* Record format level identifier is 62961395B2F92.
*/

public class EWD0108DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDSTY",
                                     "EWDTBL",
                                     "EWDACD",
                                     "EWDTBK",
                                     "EWDTYP",
                                     "EWDTCD",
                                     "EWDDSC",
                                     "EWDAMT",
                                     "EWDCUN",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDSTY",
                                   "EWDTBL",
                                   "EWDACD",
                                   "EWDTBK",
                                   "EWDTYP",
                                   "EWDTCD",
                                   "EWDDSC",
                                   "EWDAMT",
                                   "EWDCUN",
                                   "EWDOPE"
                                 };
  final static String fid = "1130611113449";
  final static String rid = "62961395B2F92";
  final static String fmtname = "EWD0108DS";
  final int FIELDCOUNT = 10;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDSTY = null;
  private CharacterField fieldEWDTBL = null;
  private CharacterField fieldEWDACD = null;
  private CharacterField fieldEWDTBK = null;
  private CharacterField fieldEWDTYP = null;
  private CharacterField fieldEWDTCD = null;
  private CharacterField fieldEWDDSC = null;
  private DecimalField fieldEWDAMT = null;
  private DecimalField fieldEWDCUN = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0108DSMessage.
  */
  public EWD0108DSMessage()
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
    recordsize = 104;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDSTY =
    new CharacterField(message, HEADERSIZE + 0, 4, "EWDSTY");
    fields[1] = fieldEWDTBL =
    new CharacterField(message, HEADERSIZE + 4, 2, "EWDTBL");
    fields[2] = fieldEWDACD =
    new CharacterField(message, HEADERSIZE + 6, 2, "EWDACD");
    fields[3] = fieldEWDTBK =
    new CharacterField(message, HEADERSIZE + 8, 2, "EWDTBK");
    fields[4] = fieldEWDTYP =
    new CharacterField(message, HEADERSIZE + 10, 4, "EWDTYP");
    fields[5] = fieldEWDTCD =
    new CharacterField(message, HEADERSIZE + 14, 2, "EWDTCD");
    fields[6] = fieldEWDDSC =
    new CharacterField(message, HEADERSIZE + 16, 60, "EWDDSC");
    fields[7] = fieldEWDAMT =
    new DecimalField(message, HEADERSIZE + 76, 17, 2, "EWDAMT");
    fields[8] = fieldEWDCUN =
    new DecimalField(message, HEADERSIZE + 93, 10, 0, "EWDCUN");
    fields[9] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 103, 1, "EWDOPE");

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
  * Set field EWDSTY using a String value.
  */
  public void setEWDSTY(String newvalue)
  {
    fieldEWDSTY.setString(newvalue);
  }

  /**
  * Get value of field EWDSTY as a String.
  */
  public String getEWDSTY()
  {
    return fieldEWDSTY.getString();
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
  * Set field EWDTBK using a String value.
  */
  public void setEWDTBK(String newvalue)
  {
    fieldEWDTBK.setString(newvalue);
  }

  /**
  * Get value of field EWDTBK as a String.
  */
  public String getEWDTBK()
  {
    return fieldEWDTBK.getString();
  }

  /**
  * Set field EWDTYP using a String value.
  */
  public void setEWDTYP(String newvalue)
  {
    fieldEWDTYP.setString(newvalue);
  }

  /**
  * Get value of field EWDTYP as a String.
  */
  public String getEWDTYP()
  {
    return fieldEWDTYP.getString();
  }

  /**
  * Set field EWDTCD using a String value.
  */
  public void setEWDTCD(String newvalue)
  {
    fieldEWDTCD.setString(newvalue);
  }

  /**
  * Get value of field EWDTCD as a String.
  */
  public String getEWDTCD()
  {
    return fieldEWDTCD.getString();
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
  * Set field EWDAMT using a String value.
  */
  public void setEWDAMT(String newvalue)
  {
    fieldEWDAMT.setString(newvalue);
  }

  /**
  * Get value of field EWDAMT as a String.
  */
  public String getEWDAMT()
  {
    return fieldEWDAMT.getString();
  }

  /**
  * Set numeric field EWDAMT using a BigDecimal value.
  */
  public void setEWDAMT(BigDecimal newvalue)
  {
    fieldEWDAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDAMT()
  {
    return fieldEWDAMT.getBigDecimal();
  }

  /**
  * Set field EWDCUN using a String value.
  */
  public void setEWDCUN(String newvalue)
  {
    fieldEWDCUN.setString(newvalue);
  }

  /**
  * Get value of field EWDCUN as a String.
  */
  public String getEWDCUN()
  {
    return fieldEWDCUN.getString();
  }

  /**
  * Set numeric field EWDCUN using a BigDecimal value.
  */
  public void setEWDCUN(BigDecimal newvalue)
  {
    fieldEWDCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDCUN()
  {
    return fieldEWDCUN.getBigDecimal();
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
