package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0770DS physical file definition.
* 
* File level identifier is 1130611161312.
* Record format level identifier is 3A45F6A5DF65D.
*/

public class EWD0770DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDCUN",
                                     "EWDACC",
                                     "EWDPRD",
                                     "EWDDSC",
                                     "EWDAMT",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDCUN",
                                   "EWDACC",
                                   "EWDPRD",
                                   "EWDDSC",
                                   "EWDAMT",
                                   "EWDOPE"
                                 };
  final static String fid = "1130611161312";
  final static String rid = "3A45F6A5DF65D";
  final static String fmtname = "EWD0770DS";
  final int FIELDCOUNT = 6;
  private static Hashtable tlookup = new Hashtable();
  private DecimalField fieldEWDCUN = null;
  private DecimalField fieldEWDACC = null;
  private CharacterField fieldEWDPRD = null;
  private CharacterField fieldEWDDSC = null;
  private DecimalField fieldEWDAMT = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0770DSMessage.
  */
  public EWD0770DSMessage()
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

    fields[0] = fieldEWDCUN =
    new DecimalField(message, HEADERSIZE + 0, 10, 0, "EWDCUN");
    fields[1] = fieldEWDACC =
    new DecimalField(message, HEADERSIZE + 10, 13, 0, "EWDACC");
    fields[2] = fieldEWDPRD =
    new CharacterField(message, HEADERSIZE + 23, 4, "EWDPRD");
    fields[3] = fieldEWDDSC =
    new CharacterField(message, HEADERSIZE + 27, 45, "EWDDSC");
    fields[4] = fieldEWDAMT =
    new DecimalField(message, HEADERSIZE + 72, 17, 2, "EWDAMT");
    fields[5] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 89, 1, "EWDOPE");

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
  * Set field EWDACC using a String value.
  */
  public void setEWDACC(String newvalue)
  {
    fieldEWDACC.setString(newvalue);
  }

  /**
  * Get value of field EWDACC as a String.
  */
  public String getEWDACC()
  {
    return fieldEWDACC.getString();
  }

  /**
  * Set numeric field EWDACC using a BigDecimal value.
  */
  public void setEWDACC(BigDecimal newvalue)
  {
    fieldEWDACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDACC()
  {
    return fieldEWDACC.getBigDecimal();
  }

  /**
  * Set field EWDPRD using a String value.
  */
  public void setEWDPRD(String newvalue)
  {
    fieldEWDPRD.setString(newvalue);
  }

  /**
  * Get value of field EWDPRD as a String.
  */
  public String getEWDPRD()
  {
    return fieldEWDPRD.getString();
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
