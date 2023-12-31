package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0015DS physical file definition.
* 
* File level identifier is 1160303135454.
* Record format level identifier is 33C6ECA3F1ED9.
*/

public class EWD0015DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDSCU",
                                     "EWDNUM",
                                     "EWDCCY",
                                     "EWDTYL",
                                     "EWDMT1",
                                     "EWDMT2",
                                     "EWDMT3",
                                     "EWDAMN",
                                     "EWDBAL",
                                     "EWDRCU",
                                     "EWDRNU",
                                     "EWDTYP",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDSCU",
                                   "EWDNUM",
                                   "EWDCCY",
                                   "EWDTYL",
                                   "EWDMT1",
                                   "EWDMT2",
                                   "EWDMT3",
                                   "EWDAMN",
                                   "EWDBAL",
                                   "EWDRCU",
                                   "EWDRNU",
                                   "EWDTYP",
                                   "EWDOPE"
                                 };
  final static String fid = "1160303135454";
  final static String rid = "33C6ECA3F1ED9";
  final static String fmtname = "EWD0015DS";
  final int FIELDCOUNT = 13;
  private static Hashtable tlookup = new Hashtable();
  private DecimalField fieldEWDSCU = null;
  private DecimalField fieldEWDNUM = null;
  private CharacterField fieldEWDCCY = null;
  private CharacterField fieldEWDTYL = null;
  private DecimalField fieldEWDMT1 = null;
  private DecimalField fieldEWDMT2 = null;
  private DecimalField fieldEWDMT3 = null;
  private DecimalField fieldEWDAMN = null;
  private DecimalField fieldEWDBAL = null;
  private DecimalField fieldEWDRCU = null;
  private DecimalField fieldEWDRNU = null;
  private CharacterField fieldEWDTYP = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0015DSMessage.
  */
  public EWD0015DSMessage()
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
    recordsize = 87;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDSCU =
    new DecimalField(message, HEADERSIZE + 0, 10, 0, "EWDSCU");
    fields[1] = fieldEWDNUM =
    new DecimalField(message, HEADERSIZE + 10, 5, 0, "EWDNUM");
    fields[2] = fieldEWDCCY =
    new CharacterField(message, HEADERSIZE + 15, 3, "EWDCCY");
    fields[3] = fieldEWDTYL =
    new CharacterField(message, HEADERSIZE + 18, 4, "EWDTYL");
    fields[4] = fieldEWDMT1 =
    new DecimalField(message, HEADERSIZE + 22, 3, 0, "EWDMT1");
    fields[5] = fieldEWDMT2 =
    new DecimalField(message, HEADERSIZE + 25, 3, 0, "EWDMT2");
    fields[6] = fieldEWDMT3 =
    new DecimalField(message, HEADERSIZE + 28, 5, 0, "EWDMT3");
    fields[7] = fieldEWDAMN =
    new DecimalField(message, HEADERSIZE + 33, 17, 2, "EWDAMN");
    fields[8] = fieldEWDBAL =
    new DecimalField(message, HEADERSIZE + 50, 17, 2, "EWDBAL");
    fields[9] = fieldEWDRCU =
    new DecimalField(message, HEADERSIZE + 67, 10, 0, "EWDRCU");
    fields[10] = fieldEWDRNU =
    new DecimalField(message, HEADERSIZE + 77, 5, 0, "EWDRNU");
    fields[11] = fieldEWDTYP =
    new CharacterField(message, HEADERSIZE + 82, 4, "EWDTYP");
    fields[12] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 86, 1, "EWDOPE");

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
  * Set field EWDSCU using a String value.
  */
  public void setEWDSCU(String newvalue)
  {
    fieldEWDSCU.setString(newvalue);
  }

  /**
  * Get value of field EWDSCU as a String.
  */
  public String getEWDSCU()
  {
    return fieldEWDSCU.getString();
  }

  /**
  * Set numeric field EWDSCU using a BigDecimal value.
  */
  public void setEWDSCU(BigDecimal newvalue)
  {
    fieldEWDSCU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDSCU as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDSCU()
  {
    return fieldEWDSCU.getBigDecimal();
  }

  /**
  * Set field EWDNUM using a String value.
  */
  public void setEWDNUM(String newvalue)
  {
    fieldEWDNUM.setString(newvalue);
  }

  /**
  * Get value of field EWDNUM as a String.
  */
  public String getEWDNUM()
  {
    return fieldEWDNUM.getString();
  }

  /**
  * Set numeric field EWDNUM using a BigDecimal value.
  */
  public void setEWDNUM(BigDecimal newvalue)
  {
    fieldEWDNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDNUM()
  {
    return fieldEWDNUM.getBigDecimal();
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
  * Set field EWDTYL using a String value.
  */
  public void setEWDTYL(String newvalue)
  {
    fieldEWDTYL.setString(newvalue);
  }

  /**
  * Get value of field EWDTYL as a String.
  */
  public String getEWDTYL()
  {
    return fieldEWDTYL.getString();
  }

  /**
  * Set field EWDMT1 using a String value.
  */
  public void setEWDMT1(String newvalue)
  {
    fieldEWDMT1.setString(newvalue);
  }

  /**
  * Get value of field EWDMT1 as a String.
  */
  public String getEWDMT1()
  {
    return fieldEWDMT1.getString();
  }

  /**
  * Set numeric field EWDMT1 using a BigDecimal value.
  */
  public void setEWDMT1(BigDecimal newvalue)
  {
    fieldEWDMT1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDMT1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDMT1()
  {
    return fieldEWDMT1.getBigDecimal();
  }

  /**
  * Set field EWDMT2 using a String value.
  */
  public void setEWDMT2(String newvalue)
  {
    fieldEWDMT2.setString(newvalue);
  }

  /**
  * Get value of field EWDMT2 as a String.
  */
  public String getEWDMT2()
  {
    return fieldEWDMT2.getString();
  }

  /**
  * Set numeric field EWDMT2 using a BigDecimal value.
  */
  public void setEWDMT2(BigDecimal newvalue)
  {
    fieldEWDMT2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDMT2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDMT2()
  {
    return fieldEWDMT2.getBigDecimal();
  }

  /**
  * Set field EWDMT3 using a String value.
  */
  public void setEWDMT3(String newvalue)
  {
    fieldEWDMT3.setString(newvalue);
  }

  /**
  * Get value of field EWDMT3 as a String.
  */
  public String getEWDMT3()
  {
    return fieldEWDMT3.getString();
  }

  /**
  * Set numeric field EWDMT3 using a BigDecimal value.
  */
  public void setEWDMT3(BigDecimal newvalue)
  {
    fieldEWDMT3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDMT3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDMT3()
  {
    return fieldEWDMT3.getBigDecimal();
  }

  /**
  * Set field EWDAMN using a String value.
  */
  public void setEWDAMN(String newvalue)
  {
    fieldEWDAMN.setString(newvalue);
  }

  /**
  * Get value of field EWDAMN as a String.
  */
  public String getEWDAMN()
  {
    return fieldEWDAMN.getString();
  }

  /**
  * Set numeric field EWDAMN using a BigDecimal value.
  */
  public void setEWDAMN(BigDecimal newvalue)
  {
    fieldEWDAMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDAMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDAMN()
  {
    return fieldEWDAMN.getBigDecimal();
  }

  /**
  * Set field EWDBAL using a String value.
  */
  public void setEWDBAL(String newvalue)
  {
    fieldEWDBAL.setString(newvalue);
  }

  /**
  * Get value of field EWDBAL as a String.
  */
  public String getEWDBAL()
  {
    return fieldEWDBAL.getString();
  }

  /**
  * Set numeric field EWDBAL using a BigDecimal value.
  */
  public void setEWDBAL(BigDecimal newvalue)
  {
    fieldEWDBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDBAL()
  {
    return fieldEWDBAL.getBigDecimal();
  }

  /**
  * Set field EWDRCU using a String value.
  */
  public void setEWDRCU(String newvalue)
  {
    fieldEWDRCU.setString(newvalue);
  }

  /**
  * Get value of field EWDRCU as a String.
  */
  public String getEWDRCU()
  {
    return fieldEWDRCU.getString();
  }

  /**
  * Set numeric field EWDRCU using a BigDecimal value.
  */
  public void setEWDRCU(BigDecimal newvalue)
  {
    fieldEWDRCU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDRCU as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDRCU()
  {
    return fieldEWDRCU.getBigDecimal();
  }

  /**
  * Set field EWDRNU using a String value.
  */
  public void setEWDRNU(String newvalue)
  {
    fieldEWDRNU.setString(newvalue);
  }

  /**
  * Get value of field EWDRNU as a String.
  */
  public String getEWDRNU()
  {
    return fieldEWDRNU.getString();
  }

  /**
  * Set numeric field EWDRNU using a BigDecimal value.
  */
  public void setEWDRNU(BigDecimal newvalue)
  {
    fieldEWDRNU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDRNU as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDRNU()
  {
    return fieldEWDRNU.getBigDecimal();
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
