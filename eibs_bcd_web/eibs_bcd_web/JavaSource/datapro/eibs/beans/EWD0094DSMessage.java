package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0094DS physical file definition.
* 
* File level identifier is 1030903185030.
* Record format level identifier is 4750BEB6EE833.
*/

public class EWD0094DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDTBL",
                                     "EWDTDS",
                                     "EWDCOD",
                                     "EWDDSC",
                                     "EWDREC",
                                     "EWDOPE",
                                     "EWDFRC"
                                   };
  final static String tnames[] = {
                                   "EWDTBL",
                                   "EWDTDS",
                                   "EWDCOD",
                                   "EWDDSC",
                                   "EWDREC",
                                   "EWDOPE",
                                   "EWDFRC"
                                 };
  final static String fid = "1030903185030";
  final static String rid = "4750BEB6EE833";
  final static String fmtname = "EWD0094DS";
  final int FIELDCOUNT = 7;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDTBL = null;
  private CharacterField fieldEWDTDS = null;
  private CharacterField fieldEWDCOD = null;
  private CharacterField fieldEWDDSC = null;
  private DecimalField fieldEWDREC = null;
  private CharacterField fieldEWDOPE = null;
  private DecimalField fieldEWDFRC = null;

  /**
  * Constructor for EWD0094DSMessage.
  */
  public EWD0094DSMessage()
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
    recordsize = 120;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDTBL =
    new CharacterField(message, HEADERSIZE + 0, 2, "EWDTBL");
    fields[1] = fieldEWDTDS =
    new CharacterField(message, HEADERSIZE + 2, 35, "EWDTDS");
    fields[2] = fieldEWDCOD =
    new CharacterField(message, HEADERSIZE + 37, 6, "EWDCOD");
    fields[3] = fieldEWDDSC =
    new CharacterField(message, HEADERSIZE + 43, 60, "EWDDSC");
    fields[4] = fieldEWDREC =
    new DecimalField(message, HEADERSIZE + 103, 8, 0, "EWDREC");
    fields[5] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 111, 1, "EWDOPE");
    fields[6] = fieldEWDFRC =
    new DecimalField(message, HEADERSIZE + 112, 8, 0, "EWDFRC");

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
  * Set field EWDTDS using a String value.
  */
  public void setEWDTDS(String newvalue)
  {
    fieldEWDTDS.setString(newvalue);
  }

  /**
  * Get value of field EWDTDS as a String.
  */
  public String getEWDTDS()
  {
    return fieldEWDTDS.getString();
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

  /**
  * Set field EWDFRC using a String value.
  */
  public void setEWDFRC(String newvalue)
  {
    fieldEWDFRC.setString(newvalue);
  }

  /**
  * Get value of field EWDFRC as a String.
  */
  public String getEWDFRC()
  {
    return fieldEWDFRC.getString();
  }

  /**
  * Set numeric field EWDFRC using a BigDecimal value.
  */
  public void setEWDFRC(BigDecimal newvalue)
  {
    fieldEWDFRC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDFRC as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDFRC()
  {
    return fieldEWDFRC.getBigDecimal();
  }

}
