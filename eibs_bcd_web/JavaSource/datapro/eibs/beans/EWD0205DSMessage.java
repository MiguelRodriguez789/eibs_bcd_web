package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0205DS physical file definition.
* 
* File level identifier is 1130611113451.
* Record format level identifier is 5784C82EAD001.
*/

public class EWD0205DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDCDE",
                                     "EWDNUM",
                                     "EWDRCY",
                                     "EWDCUN",
                                     "EWDDES",
                                     "EWDFEM",
                                     "EWDFED",
                                     "EWDFEY",
                                     "EWDSTA",
                                     "EWDOFC",
                                     "EWDBRN",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDCDE",
                                   "EWDNUM",
                                   "EWDRCY",
                                   "EWDCUN",
                                   "EWDDES",
                                   "EWDFEM",
                                   "EWDFED",
                                   "EWDFEY",
                                   "EWDSTA",
                                   "EWDOFC",
                                   "EWDBRN",
                                   "EWDOPE"
                                 };
  final static String fid = "1130611113451";
  final static String rid = "5784C82EAD001";
  final static String fmtname = "EWD0205DS";
  final int FIELDCOUNT = 12;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDCDE = null;
  private DecimalField fieldEWDNUM = null;
  private CharacterField fieldEWDRCY = null;
  private DecimalField fieldEWDCUN = null;
  private CharacterField fieldEWDDES = null;
  private DecimalField fieldEWDFEM = null;
  private DecimalField fieldEWDFED = null;
  private DecimalField fieldEWDFEY = null;
  private CharacterField fieldEWDSTA = null;
  private CharacterField fieldEWDOFC = null;
  private DecimalField fieldEWDBRN = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0205DSMessage.
  */
  public EWD0205DSMessage()
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
    recordsize = 97;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDCDE =
    new CharacterField(message, HEADERSIZE + 0, 4, "EWDCDE");
    fields[1] = fieldEWDNUM =
    new DecimalField(message, HEADERSIZE + 4, 13, 0, "EWDNUM");
    fields[2] = fieldEWDRCY =
    new CharacterField(message, HEADERSIZE + 17, 3, "EWDRCY");
    fields[3] = fieldEWDCUN =
    new DecimalField(message, HEADERSIZE + 20, 10, 0, "EWDCUN");
    fields[4] = fieldEWDDES =
    new CharacterField(message, HEADERSIZE + 30, 45, "EWDDES");
    fields[5] = fieldEWDFEM =
    new DecimalField(message, HEADERSIZE + 75, 3, 0, "EWDFEM");
    fields[6] = fieldEWDFED =
    new DecimalField(message, HEADERSIZE + 78, 3, 0, "EWDFED");
    fields[7] = fieldEWDFEY =
    new DecimalField(message, HEADERSIZE + 81, 5, 0, "EWDFEY");
    fields[8] = fieldEWDSTA =
    new CharacterField(message, HEADERSIZE + 86, 1, "EWDSTA");
    fields[9] = fieldEWDOFC =
    new CharacterField(message, HEADERSIZE + 87, 4, "EWDOFC");
    fields[10] = fieldEWDBRN =
    new DecimalField(message, HEADERSIZE + 91, 5, 0, "EWDBRN");
    fields[11] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 96, 1, "EWDOPE");

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
  * Set field EWDCDE using a String value.
  */
  public void setEWDCDE(String newvalue)
  {
    fieldEWDCDE.setString(newvalue);
  }

  /**
  * Get value of field EWDCDE as a String.
  */
  public String getEWDCDE()
  {
    return fieldEWDCDE.getString();
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
  * Set field EWDRCY using a String value.
  */
  public void setEWDRCY(String newvalue)
  {
    fieldEWDRCY.setString(newvalue);
  }

  /**
  * Get value of field EWDRCY as a String.
  */
  public String getEWDRCY()
  {
    return fieldEWDRCY.getString();
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
  * Set field EWDDES using a String value.
  */
  public void setEWDDES(String newvalue)
  {
    fieldEWDDES.setString(newvalue);
  }

  /**
  * Get value of field EWDDES as a String.
  */
  public String getEWDDES()
  {
    return fieldEWDDES.getString();
  }

  /**
  * Set field EWDFEM using a String value.
  */
  public void setEWDFEM(String newvalue)
  {
    fieldEWDFEM.setString(newvalue);
  }

  /**
  * Get value of field EWDFEM as a String.
  */
  public String getEWDFEM()
  {
    return fieldEWDFEM.getString();
  }

  /**
  * Set numeric field EWDFEM using a BigDecimal value.
  */
  public void setEWDFEM(BigDecimal newvalue)
  {
    fieldEWDFEM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDFEM as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDFEM()
  {
    return fieldEWDFEM.getBigDecimal();
  }

  /**
  * Set field EWDFED using a String value.
  */
  public void setEWDFED(String newvalue)
  {
    fieldEWDFED.setString(newvalue);
  }

  /**
  * Get value of field EWDFED as a String.
  */
  public String getEWDFED()
  {
    return fieldEWDFED.getString();
  }

  /**
  * Set numeric field EWDFED using a BigDecimal value.
  */
  public void setEWDFED(BigDecimal newvalue)
  {
    fieldEWDFED.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDFED as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDFED()
  {
    return fieldEWDFED.getBigDecimal();
  }

  /**
  * Set field EWDFEY using a String value.
  */
  public void setEWDFEY(String newvalue)
  {
    fieldEWDFEY.setString(newvalue);
  }

  /**
  * Get value of field EWDFEY as a String.
  */
  public String getEWDFEY()
  {
    return fieldEWDFEY.getString();
  }

  /**
  * Set numeric field EWDFEY using a BigDecimal value.
  */
  public void setEWDFEY(BigDecimal newvalue)
  {
    fieldEWDFEY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDFEY as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDFEY()
  {
    return fieldEWDFEY.getBigDecimal();
  }

  /**
  * Set field EWDSTA using a String value.
  */
  public void setEWDSTA(String newvalue)
  {
    fieldEWDSTA.setString(newvalue);
  }

  /**
  * Get value of field EWDSTA as a String.
  */
  public String getEWDSTA()
  {
    return fieldEWDSTA.getString();
  }

  /**
  * Set field EWDOFC using a String value.
  */
  public void setEWDOFC(String newvalue)
  {
    fieldEWDOFC.setString(newvalue);
  }

  /**
  * Get value of field EWDOFC as a String.
  */
  public String getEWDOFC()
  {
    return fieldEWDOFC.getString();
  }

  /**
  * Set field EWDBRN using a String value.
  */
  public void setEWDBRN(String newvalue)
  {
    fieldEWDBRN.setString(newvalue);
  }

  /**
  * Get value of field EWDBRN as a String.
  */
  public String getEWDBRN()
  {
    return fieldEWDBRN.getString();
  }

  /**
  * Set numeric field EWDBRN using a BigDecimal value.
  */
  public void setEWDBRN(BigDecimal newvalue)
  {
    fieldEWDBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDBRN()
  {
    return fieldEWDBRN.getBigDecimal();
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
