package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0413DS physical file definition.
* 
* File level identifier is 1151005060632.
* Record format level identifier is 2F093CD3C8460.
*/

public class EWD0413DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDUSE",
                                     "EWDFLG",
                                     "EWDTPL",
                                     "EWDBRN",
                                     "EWDNUM",
                                     "EWDSTS",
                                     "EWDSTD",
                                     "EWDDAS",
                                     "EWDMOS",
                                     "EWDYES",
                                     "EWDTIS",
                                     "EWDDAX",
                                     "EWDMOX",
                                     "EWDYEX",
                                     "EWDOPE",
                                     "EWDREC"
                                   };
  final static String tnames[] = {
                                   "EWDUSE",
                                   "EWDFLG",
                                   "EWDTPL",
                                   "EWDBRN",
                                   "EWDNUM",
                                   "EWDSTS",
                                   "EWDSTD",
                                   "EWDDAS",
                                   "EWDMOS",
                                   "EWDYES",
                                   "EWDTIS",
                                   "EWDDAX",
                                   "EWDMOX",
                                   "EWDYEX",
                                   "EWDOPE",
                                   "EWDREC"
                                 };
  final static String fid = "1151005060632";
  final static String rid = "2F093CD3C8460";
  final static String fmtname = "EWD0413DS";
  final int FIELDCOUNT = 16;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDUSE = null;
  private CharacterField fieldEWDFLG = null;
  private CharacterField fieldEWDTPL = null;
  private DecimalField fieldEWDBRN = null;
  private CharacterField fieldEWDNUM = null;
  private CharacterField fieldEWDSTS = null;
  private CharacterField fieldEWDSTD = null;
  private DecimalField fieldEWDDAS = null;
  private DecimalField fieldEWDMOS = null;
  private DecimalField fieldEWDYES = null;
  private DecimalField fieldEWDTIS = null;
  private DecimalField fieldEWDDAX = null;
  private DecimalField fieldEWDMOX = null;
  private DecimalField fieldEWDYEX = null;
  private CharacterField fieldEWDOPE = null;
  private DecimalField fieldEWDREC = null;

  /**
  * Constructor for EWD0413DSMessage.
  */
  public EWD0413DSMessage()
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
    recordsize = 130;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDUSE =
    new CharacterField(message, HEADERSIZE + 0, 10, "EWDUSE");
    fields[1] = fieldEWDFLG =
    new CharacterField(message, HEADERSIZE + 10, 1, "EWDFLG");
    fields[2] = fieldEWDTPL =
    new CharacterField(message, HEADERSIZE + 11, 2, "EWDTPL");
    fields[3] = fieldEWDBRN =
    new DecimalField(message, HEADERSIZE + 13, 5, 0, "EWDBRN");
    fields[4] = fieldEWDNUM =
    new CharacterField(message, HEADERSIZE + 18, 20, "EWDNUM");
    fields[5] = fieldEWDSTS =
    new CharacterField(message, HEADERSIZE + 38, 4, "EWDSTS");
    fields[6] = fieldEWDSTD =
    new CharacterField(message, HEADERSIZE + 42, 45, "EWDSTD");
    fields[7] = fieldEWDDAS =
    new DecimalField(message, HEADERSIZE + 87, 3, 0, "EWDDAS");
    fields[8] = fieldEWDMOS =
    new DecimalField(message, HEADERSIZE + 90, 3, 0, "EWDMOS");
    fields[9] = fieldEWDYES =
    new DecimalField(message, HEADERSIZE + 93, 5, 0, "EWDYES");
    fields[10] = fieldEWDTIS =
    new DecimalField(message, HEADERSIZE + 98, 13, 0, "EWDTIS");
    fields[11] = fieldEWDDAX =
    new DecimalField(message, HEADERSIZE + 111, 3, 0, "EWDDAX");
    fields[12] = fieldEWDMOX =
    new DecimalField(message, HEADERSIZE + 114, 3, 0, "EWDMOX");
    fields[13] = fieldEWDYEX =
    new DecimalField(message, HEADERSIZE + 117, 5, 0, "EWDYEX");
    fields[14] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 122, 1, "EWDOPE");
    fields[15] = fieldEWDREC =
    new DecimalField(message, HEADERSIZE + 123, 7, 0, "EWDREC");

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
  * Set field EWDUSE using a String value.
  */
  public void setEWDUSE(String newvalue)
  {
    fieldEWDUSE.setString(newvalue);
  }

  /**
  * Get value of field EWDUSE as a String.
  */
  public String getEWDUSE()
  {
    return fieldEWDUSE.getString();
  }

  /**
  * Set field EWDFLG using a String value.
  */
  public void setEWDFLG(String newvalue)
  {
    fieldEWDFLG.setString(newvalue);
  }

  /**
  * Get value of field EWDFLG as a String.
  */
  public String getEWDFLG()
  {
    return fieldEWDFLG.getString();
  }

  /**
  * Set field EWDTPL using a String value.
  */
  public void setEWDTPL(String newvalue)
  {
    fieldEWDTPL.setString(newvalue);
  }

  /**
  * Get value of field EWDTPL as a String.
  */
  public String getEWDTPL()
  {
    return fieldEWDTPL.getString();
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
  * Set field EWDSTS using a String value.
  */
  public void setEWDSTS(String newvalue)
  {
    fieldEWDSTS.setString(newvalue);
  }

  /**
  * Get value of field EWDSTS as a String.
  */
  public String getEWDSTS()
  {
    return fieldEWDSTS.getString();
  }

  /**
  * Set field EWDSTD using a String value.
  */
  public void setEWDSTD(String newvalue)
  {
    fieldEWDSTD.setString(newvalue);
  }

  /**
  * Get value of field EWDSTD as a String.
  */
  public String getEWDSTD()
  {
    return fieldEWDSTD.getString();
  }

  /**
  * Set field EWDDAS using a String value.
  */
  public void setEWDDAS(String newvalue)
  {
    fieldEWDDAS.setString(newvalue);
  }

  /**
  * Get value of field EWDDAS as a String.
  */
  public String getEWDDAS()
  {
    return fieldEWDDAS.getString();
  }

  /**
  * Set numeric field EWDDAS using a BigDecimal value.
  */
  public void setEWDDAS(BigDecimal newvalue)
  {
    fieldEWDDAS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDDAS as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDDAS()
  {
    return fieldEWDDAS.getBigDecimal();
  }

  /**
  * Set field EWDMOS using a String value.
  */
  public void setEWDMOS(String newvalue)
  {
    fieldEWDMOS.setString(newvalue);
  }

  /**
  * Get value of field EWDMOS as a String.
  */
  public String getEWDMOS()
  {
    return fieldEWDMOS.getString();
  }

  /**
  * Set numeric field EWDMOS using a BigDecimal value.
  */
  public void setEWDMOS(BigDecimal newvalue)
  {
    fieldEWDMOS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDMOS as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDMOS()
  {
    return fieldEWDMOS.getBigDecimal();
  }

  /**
  * Set field EWDYES using a String value.
  */
  public void setEWDYES(String newvalue)
  {
    fieldEWDYES.setString(newvalue);
  }

  /**
  * Get value of field EWDYES as a String.
  */
  public String getEWDYES()
  {
    return fieldEWDYES.getString();
  }

  /**
  * Set numeric field EWDYES using a BigDecimal value.
  */
  public void setEWDYES(BigDecimal newvalue)
  {
    fieldEWDYES.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDYES as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDYES()
  {
    return fieldEWDYES.getBigDecimal();
  }

  /**
  * Set field EWDTIS using a String value.
  */
  public void setEWDTIS(String newvalue)
  {
    fieldEWDTIS.setString(newvalue);
  }

  /**
  * Get value of field EWDTIS as a String.
  */
  public String getEWDTIS()
  {
    return fieldEWDTIS.getString();
  }

  /**
  * Set numeric field EWDTIS using a BigDecimal value.
  */
  public void setEWDTIS(BigDecimal newvalue)
  {
    fieldEWDTIS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDTIS as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDTIS()
  {
    return fieldEWDTIS.getBigDecimal();
  }

  /**
  * Set field EWDDAX using a String value.
  */
  public void setEWDDAX(String newvalue)
  {
    fieldEWDDAX.setString(newvalue);
  }

  /**
  * Get value of field EWDDAX as a String.
  */
  public String getEWDDAX()
  {
    return fieldEWDDAX.getString();
  }

  /**
  * Set numeric field EWDDAX using a BigDecimal value.
  */
  public void setEWDDAX(BigDecimal newvalue)
  {
    fieldEWDDAX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDDAX as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDDAX()
  {
    return fieldEWDDAX.getBigDecimal();
  }

  /**
  * Set field EWDMOX using a String value.
  */
  public void setEWDMOX(String newvalue)
  {
    fieldEWDMOX.setString(newvalue);
  }

  /**
  * Get value of field EWDMOX as a String.
  */
  public String getEWDMOX()
  {
    return fieldEWDMOX.getString();
  }

  /**
  * Set numeric field EWDMOX using a BigDecimal value.
  */
  public void setEWDMOX(BigDecimal newvalue)
  {
    fieldEWDMOX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDMOX as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDMOX()
  {
    return fieldEWDMOX.getBigDecimal();
  }

  /**
  * Set field EWDYEX using a String value.
  */
  public void setEWDYEX(String newvalue)
  {
    fieldEWDYEX.setString(newvalue);
  }

  /**
  * Get value of field EWDYEX as a String.
  */
  public String getEWDYEX()
  {
    return fieldEWDYEX.getString();
  }

  /**
  * Set numeric field EWDYEX using a BigDecimal value.
  */
  public void setEWDYEX(BigDecimal newvalue)
  {
    fieldEWDYEX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDYEX as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDYEX()
  {
    return fieldEWDYEX.getBigDecimal();
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

}
