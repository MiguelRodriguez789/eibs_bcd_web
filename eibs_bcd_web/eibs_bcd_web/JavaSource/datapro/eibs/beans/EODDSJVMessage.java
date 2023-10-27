package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EODDSJV physical file definition.
* 
* File level identifier is 1130611113240.
* Record format level identifier is 392939C577E2E.
*/

public class EODDSJVMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EODFLG",
                                     "EODRDM",
                                     "EODRDD",
                                     "EODRDY",
                                     "EODADM",
                                     "EODADD",
                                     "EODADY"
                                   };
  final static String tnames[] = {
                                   "EODFLG",
                                   "EODRDM",
                                   "EODRDD",
                                   "EODRDY",
                                   "EODADM",
                                   "EODADD",
                                   "EODADY"
                                 };
  final static String fid = "1130611113240";
  final static String rid = "392939C577E2E";
  final static String fmtname = "EODDSJV";
  final int FIELDCOUNT = 7;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEODFLG = null;
  private DecimalField fieldEODRDM = null;
  private DecimalField fieldEODRDD = null;
  private DecimalField fieldEODRDY = null;
  private DecimalField fieldEODADM = null;
  private DecimalField fieldEODADD = null;
  private DecimalField fieldEODADY = null;

  /**
  * Constructor for EODDSJVMessage.
  */
  public EODDSJVMessage()
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
    recordsize = 23;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEODFLG =
    new CharacterField(message, HEADERSIZE + 0, 1, "EODFLG");
    fields[1] = fieldEODRDM =
    new DecimalField(message, HEADERSIZE + 1, 3, 0, "EODRDM");
    fields[2] = fieldEODRDD =
    new DecimalField(message, HEADERSIZE + 4, 3, 0, "EODRDD");
    fields[3] = fieldEODRDY =
    new DecimalField(message, HEADERSIZE + 7, 5, 0, "EODRDY");
    fields[4] = fieldEODADM =
    new DecimalField(message, HEADERSIZE + 12, 3, 0, "EODADM");
    fields[5] = fieldEODADD =
    new DecimalField(message, HEADERSIZE + 15, 3, 0, "EODADD");
    fields[6] = fieldEODADY =
    new DecimalField(message, HEADERSIZE + 18, 5, 0, "EODADY");

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
  * Set field EODFLG using a String value.
  */
  public void setEODFLG(String newvalue)
  {
    fieldEODFLG.setString(newvalue);
  }

  /**
  * Get value of field EODFLG as a String.
  */
  public String getEODFLG()
  {
    return fieldEODFLG.getString();
  }

  /**
  * Set field EODRDM using a String value.
  */
  public void setEODRDM(String newvalue)
  {
    fieldEODRDM.setString(newvalue);
  }

  /**
  * Get value of field EODRDM as a String.
  */
  public String getEODRDM()
  {
    return fieldEODRDM.getString();
  }

  /**
  * Set numeric field EODRDM using a BigDecimal value.
  */
  public void setEODRDM(BigDecimal newvalue)
  {
    fieldEODRDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EODRDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalEODRDM()
  {
    return fieldEODRDM.getBigDecimal();
  }

  /**
  * Set field EODRDD using a String value.
  */
  public void setEODRDD(String newvalue)
  {
    fieldEODRDD.setString(newvalue);
  }

  /**
  * Get value of field EODRDD as a String.
  */
  public String getEODRDD()
  {
    return fieldEODRDD.getString();
  }

  /**
  * Set numeric field EODRDD using a BigDecimal value.
  */
  public void setEODRDD(BigDecimal newvalue)
  {
    fieldEODRDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EODRDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalEODRDD()
  {
    return fieldEODRDD.getBigDecimal();
  }

  /**
  * Set field EODRDY using a String value.
  */
  public void setEODRDY(String newvalue)
  {
    fieldEODRDY.setString(newvalue);
  }

  /**
  * Get value of field EODRDY as a String.
  */
  public String getEODRDY()
  {
    return fieldEODRDY.getString();
  }

  /**
  * Set numeric field EODRDY using a BigDecimal value.
  */
  public void setEODRDY(BigDecimal newvalue)
  {
    fieldEODRDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EODRDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalEODRDY()
  {
    return fieldEODRDY.getBigDecimal();
  }

  /**
  * Set field EODADM using a String value.
  */
  public void setEODADM(String newvalue)
  {
    fieldEODADM.setString(newvalue);
  }

  /**
  * Get value of field EODADM as a String.
  */
  public String getEODADM()
  {
    return fieldEODADM.getString();
  }

  /**
  * Set numeric field EODADM using a BigDecimal value.
  */
  public void setEODADM(BigDecimal newvalue)
  {
    fieldEODADM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EODADM as a BigDecimal.
  */
  public BigDecimal getBigDecimalEODADM()
  {
    return fieldEODADM.getBigDecimal();
  }

  /**
  * Set field EODADD using a String value.
  */
  public void setEODADD(String newvalue)
  {
    fieldEODADD.setString(newvalue);
  }

  /**
  * Get value of field EODADD as a String.
  */
  public String getEODADD()
  {
    return fieldEODADD.getString();
  }

  /**
  * Set numeric field EODADD using a BigDecimal value.
  */
  public void setEODADD(BigDecimal newvalue)
  {
    fieldEODADD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EODADD as a BigDecimal.
  */
  public BigDecimal getBigDecimalEODADD()
  {
    return fieldEODADD.getBigDecimal();
  }

  /**
  * Set field EODADY using a String value.
  */
  public void setEODADY(String newvalue)
  {
    fieldEODADY.setString(newvalue);
  }

  /**
  * Get value of field EODADY as a String.
  */
  public String getEODADY()
  {
    return fieldEODADY.getString();
  }

  /**
  * Set numeric field EODADY using a BigDecimal value.
  */
  public void setEODADY(BigDecimal newvalue)
  {
    fieldEODADY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EODADY as a BigDecimal.
  */
  public BigDecimal getBigDecimalEODADY()
  {
    return fieldEODADY.getBigDecimal();
  }

}