package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0215DS physical file definition.
* 
* File level identifier is 1180709121907.
* Record format level identifier is 3845014D8FA1A.
*/

public class EWD0215DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDCOD",
                                     "EWDPLN",
                                     "EWDDSC",
                                     "EWDCYS",
                                     "EWDMTS",
                                     "EWDMTF",
                                     "EWDCYP",
                                     "EWDMTP",
                                     "EWDFAC",
                                     "EWDTBL",
                                     "EWDPMI",
                                     "EWDPMX",
                                     "EWDPBS",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDCOD",
                                   "EWDPLN",
                                   "EWDDSC",
                                   "EWDCYS",
                                   "EWDMTS",
                                   "EWDMTF",
                                   "EWDCYP",
                                   "EWDMTP",
                                   "EWDFAC",
                                   "EWDTBL",
                                   "EWDPMI",
                                   "EWDPMX",
                                   "EWDPBS",
                                   "EWDOPE"
                                 };
  final static String fid = "1180709121907";
  final static String rid = "3845014D8FA1A";
  final static String fmtname = "EWD0215DS";
  final int FIELDCOUNT = 14;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDCOD = null;
  private DecimalField fieldEWDPLN = null;
  private CharacterField fieldEWDDSC = null;
  private CharacterField fieldEWDCYS = null;
  private DecimalField fieldEWDMTS = null;
  private CharacterField fieldEWDMTF = null;
  private CharacterField fieldEWDCYP = null;
  private DecimalField fieldEWDMTP = null;
  private CharacterField fieldEWDFAC = null;
  private CharacterField fieldEWDTBL = null;
  private DecimalField fieldEWDPMI = null;
  private DecimalField fieldEWDPMX = null;
  private CharacterField fieldEWDPBS = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0215DSMessage.
  */
  public EWD0215DSMessage()
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
    recordsize = 110;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDCOD =
    new CharacterField(message, HEADERSIZE + 0, 4, "EWDCOD");
    fields[1] = fieldEWDPLN =
    new DecimalField(message, HEADERSIZE + 4, 3, 0, "EWDPLN");
    fields[2] = fieldEWDDSC =
    new CharacterField(message, HEADERSIZE + 7, 45, "EWDDSC");
    fields[3] = fieldEWDCYS =
    new CharacterField(message, HEADERSIZE + 52, 3, "EWDCYS");
    fields[4] = fieldEWDMTS =
    new DecimalField(message, HEADERSIZE + 55, 17, 4, "EWDMTS");
    fields[5] = fieldEWDMTF =
    new CharacterField(message, HEADERSIZE + 72, 1, "EWDMTF");
    fields[6] = fieldEWDCYP =
    new CharacterField(message, HEADERSIZE + 73, 3, "EWDCYP");
    fields[7] = fieldEWDMTP =
    new DecimalField(message, HEADERSIZE + 76, 17, 4, "EWDMTP");
    fields[8] = fieldEWDFAC =
    new CharacterField(message, HEADERSIZE + 93, 1, "EWDFAC");
    fields[9] = fieldEWDTBL =
    new CharacterField(message, HEADERSIZE + 94, 2, "EWDTBL");
    fields[10] = fieldEWDPMI =
    new DecimalField(message, HEADERSIZE + 96, 6, 0, "EWDPMI");
    fields[11] = fieldEWDPMX =
    new DecimalField(message, HEADERSIZE + 102, 6, 0, "EWDPMX");
    fields[12] = fieldEWDPBS =
    new CharacterField(message, HEADERSIZE + 108, 1, "EWDPBS");
    fields[13] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 109, 1, "EWDOPE");

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
  * Set field EWDPLN using a String value.
  */
  public void setEWDPLN(String newvalue)
  {
    fieldEWDPLN.setString(newvalue);
  }

  /**
  * Get value of field EWDPLN as a String.
  */
  public String getEWDPLN()
  {
    return fieldEWDPLN.getString();
  }

  /**
  * Set numeric field EWDPLN using a BigDecimal value.
  */
  public void setEWDPLN(BigDecimal newvalue)
  {
    fieldEWDPLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDPLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDPLN()
  {
    return fieldEWDPLN.getBigDecimal();
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
  * Set field EWDCYS using a String value.
  */
  public void setEWDCYS(String newvalue)
  {
    fieldEWDCYS.setString(newvalue);
  }

  /**
  * Get value of field EWDCYS as a String.
  */
  public String getEWDCYS()
  {
    return fieldEWDCYS.getString();
  }

  /**
  * Set field EWDMTS using a String value.
  */
  public void setEWDMTS(String newvalue)
  {
    fieldEWDMTS.setString(newvalue);
  }

  /**
  * Get value of field EWDMTS as a String.
  */
  public String getEWDMTS()
  {
    return fieldEWDMTS.getString();
  }

  /**
  * Set numeric field EWDMTS using a BigDecimal value.
  */
  public void setEWDMTS(BigDecimal newvalue)
  {
    fieldEWDMTS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDMTS as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDMTS()
  {
    return fieldEWDMTS.getBigDecimal();
  }

  /**
  * Set field EWDMTF using a String value.
  */
  public void setEWDMTF(String newvalue)
  {
    fieldEWDMTF.setString(newvalue);
  }

  /**
  * Get value of field EWDMTF as a String.
  */
  public String getEWDMTF()
  {
    return fieldEWDMTF.getString();
  }

  /**
  * Set field EWDCYP using a String value.
  */
  public void setEWDCYP(String newvalue)
  {
    fieldEWDCYP.setString(newvalue);
  }

  /**
  * Get value of field EWDCYP as a String.
  */
  public String getEWDCYP()
  {
    return fieldEWDCYP.getString();
  }

  /**
  * Set field EWDMTP using a String value.
  */
  public void setEWDMTP(String newvalue)
  {
    fieldEWDMTP.setString(newvalue);
  }

  /**
  * Get value of field EWDMTP as a String.
  */
  public String getEWDMTP()
  {
    return fieldEWDMTP.getString();
  }

  /**
  * Set numeric field EWDMTP using a BigDecimal value.
  */
  public void setEWDMTP(BigDecimal newvalue)
  {
    fieldEWDMTP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDMTP as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDMTP()
  {
    return fieldEWDMTP.getBigDecimal();
  }

  /**
  * Set field EWDFAC using a String value.
  */
  public void setEWDFAC(String newvalue)
  {
    fieldEWDFAC.setString(newvalue);
  }

  /**
  * Get value of field EWDFAC as a String.
  */
  public String getEWDFAC()
  {
    return fieldEWDFAC.getString();
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
  * Set field EWDPMI using a String value.
  */
  public void setEWDPMI(String newvalue)
  {
    fieldEWDPMI.setString(newvalue);
  }

  /**
  * Get value of field EWDPMI as a String.
  */
  public String getEWDPMI()
  {
    return fieldEWDPMI.getString();
  }

  /**
  * Set numeric field EWDPMI using a BigDecimal value.
  */
  public void setEWDPMI(BigDecimal newvalue)
  {
    fieldEWDPMI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDPMI as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDPMI()
  {
    return fieldEWDPMI.getBigDecimal();
  }

  /**
  * Set field EWDPMX using a String value.
  */
  public void setEWDPMX(String newvalue)
  {
    fieldEWDPMX.setString(newvalue);
  }

  /**
  * Get value of field EWDPMX as a String.
  */
  public String getEWDPMX()
  {
    return fieldEWDPMX.getString();
  }

  /**
  * Set numeric field EWDPMX using a BigDecimal value.
  */
  public void setEWDPMX(BigDecimal newvalue)
  {
    fieldEWDPMX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDPMX as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDPMX()
  {
    return fieldEWDPMX.getBigDecimal();
  }

  /**
  * Set field EWDPBS using a String value.
  */
  public void setEWDPBS(String newvalue)
  {
    fieldEWDPBS.setString(newvalue);
  }

  /**
  * Get value of field EWDPBS as a String.
  */
  public String getEWDPBS()
  {
    return fieldEWDPBS.getString();
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
