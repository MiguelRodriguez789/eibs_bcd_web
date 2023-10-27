package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0002DS physical file definition.
* 
* File level identifier is 1130611113446.
* Record format level identifier is 3A3C086DB1103.
*/

public class EWD0002DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDTBL",
                                     "EWDSHN",
                                     "EWDSHO",
                                     "EWDCOD",
                                     "EWDDSC",
                                     "EWDSCG",
                                     "EWDMID",
                                     "EWDMIC",
                                     "EWDF02",
                                     "EWDREC",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDTBL",
                                   "EWDSHN",
                                   "EWDSHO",
                                   "EWDCOD",
                                   "EWDDSC",
                                   "EWDSCG",
                                   "EWDMID",
                                   "EWDMIC",
                                   "EWDF02",
                                   "EWDREC",
                                   "EWDOPE"
                                 };
  final static String fid = "1130611113446";
  final static String rid = "3A3C086DB1103";
  final static String fmtname = "EWD0002DS";
  final int FIELDCOUNT = 11;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDTBL = null;
  private CharacterField fieldEWDSHN = null;
  private CharacterField fieldEWDSHO = null;
  private CharacterField fieldEWDCOD = null;
  private CharacterField fieldEWDDSC = null;
  private DecimalField fieldEWDSCG = null;
  private CharacterField fieldEWDMID = null;
  private CharacterField fieldEWDMIC = null;
  private CharacterField fieldEWDF02 = null;
  private DecimalField fieldEWDREC = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0002DSMessage.
  */
  public EWD0002DSMessage()
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
    recordsize = 199;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDTBL =
    new CharacterField(message, HEADERSIZE + 0, 2, "EWDTBL");
    fields[1] = fieldEWDSHN =
    new CharacterField(message, HEADERSIZE + 2, 45, "EWDSHN");
    fields[2] = fieldEWDSHO =
    new CharacterField(message, HEADERSIZE + 47, 45, "EWDSHO");
    fields[3] = fieldEWDCOD =
    new CharacterField(message, HEADERSIZE + 92, 6, "EWDCOD");
    fields[4] = fieldEWDDSC =
    new CharacterField(message, HEADERSIZE + 98, 60, "EWDDSC");
    fields[5] = fieldEWDSCG =
    new DecimalField(message, HEADERSIZE + 158, 17, 0, "EWDSCG");
    fields[6] = fieldEWDMID =
    new CharacterField(message, HEADERSIZE + 175, 6, "EWDMID");
    fields[7] = fieldEWDMIC =
    new CharacterField(message, HEADERSIZE + 181, 6, "EWDMIC");
    fields[8] = fieldEWDF02 =
    new CharacterField(message, HEADERSIZE + 187, 3, "EWDF02");
    fields[9] = fieldEWDREC =
    new DecimalField(message, HEADERSIZE + 190, 8, 0, "EWDREC");
    fields[10] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 198, 1, "EWDOPE");

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
  * Set field EWDSHN using a String value.
  */
  public void setEWDSHN(String newvalue)
  {
    fieldEWDSHN.setString(newvalue);
  }

  /**
  * Get value of field EWDSHN as a String.
  */
  public String getEWDSHN()
  {
    return fieldEWDSHN.getString();
  }

  /**
  * Set field EWDSHO using a String value.
  */
  public void setEWDSHO(String newvalue)
  {
    fieldEWDSHO.setString(newvalue);
  }

  /**
  * Get value of field EWDSHO as a String.
  */
  public String getEWDSHO()
  {
    return fieldEWDSHO.getString();
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
  * Set field EWDSCG using a String value.
  */
  public void setEWDSCG(String newvalue)
  {
    fieldEWDSCG.setString(newvalue);
  }

  /**
  * Get value of field EWDSCG as a String.
  */
  public String getEWDSCG()
  {
    return fieldEWDSCG.getString();
  }

  /**
  * Set numeric field EWDSCG using a BigDecimal value.
  */
  public void setEWDSCG(BigDecimal newvalue)
  {
    fieldEWDSCG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDSCG as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDSCG()
  {
    return fieldEWDSCG.getBigDecimal();
  }

  /**
  * Set field EWDMID using a String value.
  */
  public void setEWDMID(String newvalue)
  {
    fieldEWDMID.setString(newvalue);
  }

  /**
  * Get value of field EWDMID as a String.
  */
  public String getEWDMID()
  {
    return fieldEWDMID.getString();
  }

  /**
  * Set field EWDMIC using a String value.
  */
  public void setEWDMIC(String newvalue)
  {
    fieldEWDMIC.setString(newvalue);
  }

  /**
  * Get value of field EWDMIC as a String.
  */
  public String getEWDMIC()
  {
    return fieldEWDMIC.getString();
  }

  /**
  * Set field EWDF02 using a String value.
  */
  public void setEWDF02(String newvalue)
  {
    fieldEWDF02.setString(newvalue);
  }

  /**
  * Get value of field EWDF02 as a String.
  */
  public String getEWDF02()
  {
    return fieldEWDF02.getString();
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

}