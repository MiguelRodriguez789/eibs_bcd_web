package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0450DS physical file definition.
* 
* File level identifier is 1121227152757.
* Record format level identifier is 4D75C891669CF.
*/

public class EWD0450DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDEID",
                                     "EWDNME",
                                     "EWDFNM",
                                     "EWDCTA",
                                     "EWDBNK",
                                     "EWDBRN",
                                     "EWDCCY",
                                     "EWDGLN",
                                     "EWDACC",
                                     "EWDIPA",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDEID",
                                   "EWDNME",
                                   "EWDFNM",
                                   "EWDCTA",
                                   "EWDBNK",
                                   "EWDBRN",
                                   "EWDCCY",
                                   "EWDGLN",
                                   "EWDACC",
                                   "EWDIPA",
                                   "EWDOPE"
                                 };
  final static String fid = "1121227152757";
  final static String rid = "4D75C891669CF";
  final static String fmtname = "EWD0450DS";
  final int FIELDCOUNT = 11;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDEID = null;
  private CharacterField fieldEWDNME = null;
  private CharacterField fieldEWDFNM = null;
  private CharacterField fieldEWDCTA = null;
  private CharacterField fieldEWDBNK = null;
  private DecimalField fieldEWDBRN = null;
  private CharacterField fieldEWDCCY = null;
  private DecimalField fieldEWDGLN = null;
  private DecimalField fieldEWDACC = null;
  private CharacterField fieldEWDIPA = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0450DSMessage.
  */
  public EWD0450DSMessage()
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
    recordsize = 253;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDEID =
    new CharacterField(message, HEADERSIZE + 0, 4, "EWDEID");
    fields[1] = fieldEWDNME =
    new CharacterField(message, HEADERSIZE + 4, 45, "EWDNME");
    fields[2] = fieldEWDFNM =
    new CharacterField(message, HEADERSIZE + 49, 128, "EWDFNM");
    fields[3] = fieldEWDCTA =
    new CharacterField(message, HEADERSIZE + 177, 20, "EWDCTA");
    fields[4] = fieldEWDBNK =
    new CharacterField(message, HEADERSIZE + 197, 2, "EWDBNK");
    fields[5] = fieldEWDBRN =
    new DecimalField(message, HEADERSIZE + 199, 5, 0, "EWDBRN");
    fields[6] = fieldEWDCCY =
    new CharacterField(message, HEADERSIZE + 204, 3, "EWDCCY");
    fields[7] = fieldEWDGLN =
    new DecimalField(message, HEADERSIZE + 207, 17, 0, "EWDGLN");
    fields[8] = fieldEWDACC =
    new DecimalField(message, HEADERSIZE + 224, 13, 0, "EWDACC");
    fields[9] = fieldEWDIPA =
    new CharacterField(message, HEADERSIZE + 237, 15, "EWDIPA");
    fields[10] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 252, 1, "EWDOPE");

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
  * Set field EWDEID using a String value.
  */
  public void setEWDEID(String newvalue)
  {
    fieldEWDEID.setString(newvalue);
  }

  /**
  * Get value of field EWDEID as a String.
  */
  public String getEWDEID()
  {
    return fieldEWDEID.getString();
  }

  /**
  * Set field EWDNME using a String value.
  */
  public void setEWDNME(String newvalue)
  {
    fieldEWDNME.setString(newvalue);
  }

  /**
  * Get value of field EWDNME as a String.
  */
  public String getEWDNME()
  {
    return fieldEWDNME.getString();
  }

  /**
  * Set field EWDFNM using a String value.
  */
  public void setEWDFNM(String newvalue)
  {
    fieldEWDFNM.setString(newvalue);
  }

  /**
  * Get value of field EWDFNM as a String.
  */
  public String getEWDFNM()
  {
    return fieldEWDFNM.getString();
  }

  /**
  * Set field EWDCTA using a String value.
  */
  public void setEWDCTA(String newvalue)
  {
    fieldEWDCTA.setString(newvalue);
  }

  /**
  * Get value of field EWDCTA as a String.
  */
  public String getEWDCTA()
  {
    return fieldEWDCTA.getString();
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
  * Set field EWDIPA using a String value.
  */
  public void setEWDIPA(String newvalue)
  {
    fieldEWDIPA.setString(newvalue);
  }

  /**
  * Get value of field EWDIPA as a String.
  */
  public String getEWDIPA()
  {
    return fieldEWDIPA.getString();
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
