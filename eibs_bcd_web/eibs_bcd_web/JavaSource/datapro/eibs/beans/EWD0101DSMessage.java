package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0101DS physical file definition.
* 
* File level identifier is 1130611113449.
* Record format level identifier is 625E916912B5C.
*/

public class EWD0101DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDSTY",
                                     "EWDCUN",
                                     "EWDTBL",
                                     "EWDTBK",
                                     "EWDTCY",
                                     "EWDTYP",
                                     "EWDDSC",
                                     "EWDCRF",
                                     "EWDCUS",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDSTY",
                                   "EWDCUN",
                                   "EWDTBL",
                                   "EWDTBK",
                                   "EWDTCY",
                                   "EWDTYP",
                                   "EWDDSC",
                                   "EWDCRF",
                                   "EWDCUS",
                                   "EWDOPE"
                                 };
  final static String fid = "1130611113449";
  final static String rid = "625E916912B5C";
  final static String fmtname = "EWD0101DS";
  final int FIELDCOUNT = 10;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDSTY = null;
  private DecimalField fieldEWDCUN = null;
  private CharacterField fieldEWDTBL = null;
  private CharacterField fieldEWDTBK = null;
  private CharacterField fieldEWDTCY = null;
  private CharacterField fieldEWDTYP = null;
  private CharacterField fieldEWDDSC = null;
  private CharacterField fieldEWDCRF = null;
  private CharacterField fieldEWDCUS = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0101DSMessage.
  */
  public EWD0101DSMessage()
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

    fields[0] = fieldEWDSTY =
    new CharacterField(message, HEADERSIZE + 0, 4, "EWDSTY");
    fields[1] = fieldEWDCUN =
    new DecimalField(message, HEADERSIZE + 4, 10, 0, "EWDCUN");
    fields[2] = fieldEWDTBL =
    new CharacterField(message, HEADERSIZE + 14, 2, "EWDTBL");
    fields[3] = fieldEWDTBK =
    new CharacterField(message, HEADERSIZE + 16, 2, "EWDTBK");
    fields[4] = fieldEWDTCY =
    new CharacterField(message, HEADERSIZE + 18, 3, "EWDTCY");
    fields[5] = fieldEWDTYP =
    new CharacterField(message, HEADERSIZE + 21, 4, "EWDTYP");
    fields[6] = fieldEWDDSC =
    new CharacterField(message, HEADERSIZE + 25, 60, "EWDDSC");
    fields[7] = fieldEWDCRF =
    new CharacterField(message, HEADERSIZE + 85, 1, "EWDCRF");
    fields[8] = fieldEWDCUS =
    new CharacterField(message, HEADERSIZE + 86, 9, "EWDCUS");
    fields[9] = fieldEWDOPE =
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
  * Set field EWDTCY using a String value.
  */
  public void setEWDTCY(String newvalue)
  {
    fieldEWDTCY.setString(newvalue);
  }

  /**
  * Get value of field EWDTCY as a String.
  */
  public String getEWDTCY()
  {
    return fieldEWDTCY.getString();
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
  * Set field EWDCRF using a String value.
  */
  public void setEWDCRF(String newvalue)
  {
    fieldEWDCRF.setString(newvalue);
  }

  /**
  * Get value of field EWDCRF as a String.
  */
  public String getEWDCRF()
  {
    return fieldEWDCRF.getString();
  }

  /**
  * Set field EWDCUS using a String value.
  */
  public void setEWDCUS(String newvalue)
  {
    fieldEWDCUS.setString(newvalue);
  }

  /**
  * Get value of field EWDCUS as a String.
  */
  public String getEWDCUS()
  {
    return fieldEWDCUS.getString();
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
