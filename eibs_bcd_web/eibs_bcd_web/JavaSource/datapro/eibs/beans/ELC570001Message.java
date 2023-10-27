package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ELC570001 physical file definition.
* 
* File level identifier is 1100706173632.
* Record format level identifier is 4F554E0A542C4.
*/

public class ELC570001Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H01USERID",
                                     "H01PROGRM",
                                     "H01TIMSYS",
                                     "H01SCRCOD",
                                     "H01OPECOD",
                                     "H01FLGMAS",
                                     "H01FLGWK1",
                                     "H01FLGWK2",
                                     "H01FLGWK3",
                                     "ELCCUN",
                                     "ELCBOL",
                                     "CUSIDN",
                                     "CUSNA1",
                                     "LCMPRO",
                                     "ELCDES",
                                     "LCMIDY",
                                     "LCMIDM",
                                     "LCMIDD",
                                     "LCMEEY",
                                     "LCMEEM",
                                     "LCMEED",
                                     "LCMACC",
                                     "LCMCCY",
                                     "LCMOAM",
                                     "ELCRUB",
                                     "ELCNOB",
                                     "ELCSTS"
                                   };
  final static String tnames[] = {
                                   "H01USERID",
                                   "H01PROGRM",
                                   "H01TIMSYS",
                                   "H01SCRCOD",
                                   "H01OPECOD",
                                   "H01FLGMAS",
                                   "H01FLGWK1",
                                   "H01FLGWK2",
                                   "H01FLGWK3",
                                   "ELCCUN",
                                   "ELCBOL",
                                   "CUSIDN",
                                   "CUSNA1",
                                   "LCMPRO",
                                   "ELCDES",
                                   "LCMIDY",
                                   "LCMIDM",
                                   "LCMIDD",
                                   "LCMEEY",
                                   "LCMEEM",
                                   "LCMEED",
                                   "LCMACC",
                                   "LCMCCY",
                                   "LCMOAM",
                                   "ELCRUB",
                                   "ELCNOB",
                                   "ELCSTS"
                                 };
  final static String fid = "1100706173632";
  final static String rid = "4F554E0A542C4";
  final static String fmtname = "ELC570001";
  final int FIELDCOUNT = 27;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH01USERID = null;
  private CharacterField fieldH01PROGRM = null;
  private CharacterField fieldH01TIMSYS = null;
  private CharacterField fieldH01SCRCOD = null;
  private CharacterField fieldH01OPECOD = null;
  private CharacterField fieldH01FLGMAS = null;
  private CharacterField fieldH01FLGWK1 = null;
  private CharacterField fieldH01FLGWK2 = null;
  private CharacterField fieldH01FLGWK3 = null;
  private DecimalField fieldELCCUN = null;
  private DecimalField fieldELCBOL = null;
  private CharacterField fieldCUSIDN = null;
  private CharacterField fieldCUSNA1 = null;
  private CharacterField fieldLCMPRO = null;
  private CharacterField fieldELCDES = null;
  private DecimalField fieldLCMIDY = null;
  private DecimalField fieldLCMIDM = null;
  private DecimalField fieldLCMIDD = null;
  private DecimalField fieldLCMEEY = null;
  private DecimalField fieldLCMEEM = null;
  private DecimalField fieldLCMEED = null;
  private DecimalField fieldLCMACC = null;
  private CharacterField fieldLCMCCY = null;
  private DecimalField fieldLCMOAM = null;
  private CharacterField fieldELCRUB = null;
  private CharacterField fieldELCNOB = null;
  private CharacterField fieldELCSTS = null;

  /**
  * Constructor for ELC570001Message.
  */
  public ELC570001Message()
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
    recordsize = 264;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH01USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H01USERID");
    fields[1] = fieldH01PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H01PROGRM");
    fields[2] = fieldH01TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H01TIMSYS");
    fields[3] = fieldH01SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H01SCRCOD");
    fields[4] = fieldH01OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H01OPECOD");
    fields[5] = fieldH01FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H01FLGMAS");
    fields[6] = fieldH01FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H01FLGWK1");
    fields[7] = fieldH01FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H01FLGWK2");
    fields[8] = fieldH01FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H01FLGWK3");
    fields[9] = fieldELCCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "ELCCUN");
    fields[10] = fieldELCBOL =
    new DecimalField(message, HEADERSIZE + 52, 13, 0, "ELCBOL");
    fields[11] = fieldCUSIDN =
    new CharacterField(message, HEADERSIZE + 65, 15, "CUSIDN");
    fields[12] = fieldCUSNA1 =
    new CharacterField(message, HEADERSIZE + 80, 45, "CUSNA1");
    fields[13] = fieldLCMPRO =
    new CharacterField(message, HEADERSIZE + 125, 4, "LCMPRO");
    fields[14] = fieldELCDES =
    new CharacterField(message, HEADERSIZE + 129, 35, "ELCDES");
    fields[15] = fieldLCMIDY =
    new DecimalField(message, HEADERSIZE + 164, 3, 0, "LCMIDY");
    fields[16] = fieldLCMIDM =
    new DecimalField(message, HEADERSIZE + 167, 3, 0, "LCMIDM");
    fields[17] = fieldLCMIDD =
    new DecimalField(message, HEADERSIZE + 170, 3, 0, "LCMIDD");
    fields[18] = fieldLCMEEY =
    new DecimalField(message, HEADERSIZE + 173, 3, 0, "LCMEEY");
    fields[19] = fieldLCMEEM =
    new DecimalField(message, HEADERSIZE + 176, 3, 0, "LCMEEM");
    fields[20] = fieldLCMEED =
    new DecimalField(message, HEADERSIZE + 179, 3, 0, "LCMEED");
    fields[21] = fieldLCMACC =
    new DecimalField(message, HEADERSIZE + 182, 13, 0, "LCMACC");
    fields[22] = fieldLCMCCY =
    new CharacterField(message, HEADERSIZE + 195, 3, "LCMCCY");
    fields[23] = fieldLCMOAM =
    new DecimalField(message, HEADERSIZE + 198, 15, 2, "LCMOAM");
    fields[24] = fieldELCRUB =
    new CharacterField(message, HEADERSIZE + 213, 15, "ELCRUB");
    fields[25] = fieldELCNOB =
    new CharacterField(message, HEADERSIZE + 228, 35, "ELCNOB");
    fields[26] = fieldELCSTS =
    new CharacterField(message, HEADERSIZE + 263, 1, "ELCSTS");

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
  * Set field H01USERID using a String value.
  */
  public void setH01USERID(String newvalue)
  {
    fieldH01USERID.setString(newvalue);
  }

  /**
  * Get value of field H01USERID as a String.
  */
  public String getH01USERID()
  {
    return fieldH01USERID.getString();
  }

  /**
  * Set field H01PROGRM using a String value.
  */
  public void setH01PROGRM(String newvalue)
  {
    fieldH01PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H01PROGRM as a String.
  */
  public String getH01PROGRM()
  {
    return fieldH01PROGRM.getString();
  }

  /**
  * Set field H01TIMSYS using a String value.
  */
  public void setH01TIMSYS(String newvalue)
  {
    fieldH01TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H01TIMSYS as a String.
  */
  public String getH01TIMSYS()
  {
    return fieldH01TIMSYS.getString();
  }

  /**
  * Set field H01SCRCOD using a String value.
  */
  public void setH01SCRCOD(String newvalue)
  {
    fieldH01SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H01SCRCOD as a String.
  */
  public String getH01SCRCOD()
  {
    return fieldH01SCRCOD.getString();
  }

  /**
  * Set field H01OPECOD using a String value.
  */
  public void setH01OPECOD(String newvalue)
  {
    fieldH01OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H01OPECOD as a String.
  */
  public String getH01OPECOD()
  {
    return fieldH01OPECOD.getString();
  }

  /**
  * Set field H01FLGMAS using a String value.
  */
  public void setH01FLGMAS(String newvalue)
  {
    fieldH01FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H01FLGMAS as a String.
  */
  public String getH01FLGMAS()
  {
    return fieldH01FLGMAS.getString();
  }

  /**
  * Set field H01FLGWK1 using a String value.
  */
  public void setH01FLGWK1(String newvalue)
  {
    fieldH01FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK1 as a String.
  */
  public String getH01FLGWK1()
  {
    return fieldH01FLGWK1.getString();
  }

  /**
  * Set field H01FLGWK2 using a String value.
  */
  public void setH01FLGWK2(String newvalue)
  {
    fieldH01FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK2 as a String.
  */
  public String getH01FLGWK2()
  {
    return fieldH01FLGWK2.getString();
  }

  /**
  * Set field H01FLGWK3 using a String value.
  */
  public void setH01FLGWK3(String newvalue)
  {
    fieldH01FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK3 as a String.
  */
  public String getH01FLGWK3()
  {
    return fieldH01FLGWK3.getString();
  }

  /**
  * Set field ELCCUN using a String value.
  */
  public void setELCCUN(String newvalue)
  {
    fieldELCCUN.setString(newvalue);
  }

  /**
  * Get value of field ELCCUN as a String.
  */
  public String getELCCUN()
  {
    return fieldELCCUN.getString();
  }

  /**
  * Set numeric field ELCCUN using a BigDecimal value.
  */
  public void setELCCUN(BigDecimal newvalue)
  {
    fieldELCCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ELCCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalELCCUN()
  {
    return fieldELCCUN.getBigDecimal();
  }

  /**
  * Set field ELCBOL using a String value.
  */
  public void setELCBOL(String newvalue)
  {
    fieldELCBOL.setString(newvalue);
  }

  /**
  * Get value of field ELCBOL as a String.
  */
  public String getELCBOL()
  {
    return fieldELCBOL.getString();
  }

  /**
  * Set numeric field ELCBOL using a BigDecimal value.
  */
  public void setELCBOL(BigDecimal newvalue)
  {
    fieldELCBOL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ELCBOL as a BigDecimal.
  */
  public BigDecimal getBigDecimalELCBOL()
  {
    return fieldELCBOL.getBigDecimal();
  }

  /**
  * Set field CUSIDN using a String value.
  */
  public void setCUSIDN(String newvalue)
  {
    fieldCUSIDN.setString(newvalue);
  }

  /**
  * Get value of field CUSIDN as a String.
  */
  public String getCUSIDN()
  {
    return fieldCUSIDN.getString();
  }

  /**
  * Set field CUSNA1 using a String value.
  */
  public void setCUSNA1(String newvalue)
  {
    fieldCUSNA1.setString(newvalue);
  }

  /**
  * Get value of field CUSNA1 as a String.
  */
  public String getCUSNA1()
  {
    return fieldCUSNA1.getString();
  }

  /**
  * Set field LCMPRO using a String value.
  */
  public void setLCMPRO(String newvalue)
  {
    fieldLCMPRO.setString(newvalue);
  }

  /**
  * Get value of field LCMPRO as a String.
  */
  public String getLCMPRO()
  {
    return fieldLCMPRO.getString();
  }

  /**
  * Set field ELCDES using a String value.
  */
  public void setELCDES(String newvalue)
  {
    fieldELCDES.setString(newvalue);
  }

  /**
  * Get value of field ELCDES as a String.
  */
  public String getELCDES()
  {
    return fieldELCDES.getString();
  }

  /**
  * Set field LCMIDY using a String value.
  */
  public void setLCMIDY(String newvalue)
  {
    fieldLCMIDY.setString(newvalue);
  }

  /**
  * Get value of field LCMIDY as a String.
  */
  public String getLCMIDY()
  {
    return fieldLCMIDY.getString();
  }

  /**
  * Set numeric field LCMIDY using a BigDecimal value.
  */
  public void setLCMIDY(BigDecimal newvalue)
  {
    fieldLCMIDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LCMIDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalLCMIDY()
  {
    return fieldLCMIDY.getBigDecimal();
  }

  /**
  * Set field LCMIDM using a String value.
  */
  public void setLCMIDM(String newvalue)
  {
    fieldLCMIDM.setString(newvalue);
  }

  /**
  * Get value of field LCMIDM as a String.
  */
  public String getLCMIDM()
  {
    return fieldLCMIDM.getString();
  }

  /**
  * Set numeric field LCMIDM using a BigDecimal value.
  */
  public void setLCMIDM(BigDecimal newvalue)
  {
    fieldLCMIDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LCMIDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalLCMIDM()
  {
    return fieldLCMIDM.getBigDecimal();
  }

  /**
  * Set field LCMIDD using a String value.
  */
  public void setLCMIDD(String newvalue)
  {
    fieldLCMIDD.setString(newvalue);
  }

  /**
  * Get value of field LCMIDD as a String.
  */
  public String getLCMIDD()
  {
    return fieldLCMIDD.getString();
  }

  /**
  * Set numeric field LCMIDD using a BigDecimal value.
  */
  public void setLCMIDD(BigDecimal newvalue)
  {
    fieldLCMIDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LCMIDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalLCMIDD()
  {
    return fieldLCMIDD.getBigDecimal();
  }

  /**
  * Set field LCMEEY using a String value.
  */
  public void setLCMEEY(String newvalue)
  {
    fieldLCMEEY.setString(newvalue);
  }

  /**
  * Get value of field LCMEEY as a String.
  */
  public String getLCMEEY()
  {
    return fieldLCMEEY.getString();
  }

  /**
  * Set numeric field LCMEEY using a BigDecimal value.
  */
  public void setLCMEEY(BigDecimal newvalue)
  {
    fieldLCMEEY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LCMEEY as a BigDecimal.
  */
  public BigDecimal getBigDecimalLCMEEY()
  {
    return fieldLCMEEY.getBigDecimal();
  }

  /**
  * Set field LCMEEM using a String value.
  */
  public void setLCMEEM(String newvalue)
  {
    fieldLCMEEM.setString(newvalue);
  }

  /**
  * Get value of field LCMEEM as a String.
  */
  public String getLCMEEM()
  {
    return fieldLCMEEM.getString();
  }

  /**
  * Set numeric field LCMEEM using a BigDecimal value.
  */
  public void setLCMEEM(BigDecimal newvalue)
  {
    fieldLCMEEM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LCMEEM as a BigDecimal.
  */
  public BigDecimal getBigDecimalLCMEEM()
  {
    return fieldLCMEEM.getBigDecimal();
  }

  /**
  * Set field LCMEED using a String value.
  */
  public void setLCMEED(String newvalue)
  {
    fieldLCMEED.setString(newvalue);
  }

  /**
  * Get value of field LCMEED as a String.
  */
  public String getLCMEED()
  {
    return fieldLCMEED.getString();
  }

  /**
  * Set numeric field LCMEED using a BigDecimal value.
  */
  public void setLCMEED(BigDecimal newvalue)
  {
    fieldLCMEED.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LCMEED as a BigDecimal.
  */
  public BigDecimal getBigDecimalLCMEED()
  {
    return fieldLCMEED.getBigDecimal();
  }

  /**
  * Set field LCMACC using a String value.
  */
  public void setLCMACC(String newvalue)
  {
    fieldLCMACC.setString(newvalue);
  }

  /**
  * Get value of field LCMACC as a String.
  */
  public String getLCMACC()
  {
    return fieldLCMACC.getString();
  }

  /**
  * Set numeric field LCMACC using a BigDecimal value.
  */
  public void setLCMACC(BigDecimal newvalue)
  {
    fieldLCMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LCMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalLCMACC()
  {
    return fieldLCMACC.getBigDecimal();
  }

  /**
  * Set field LCMCCY using a String value.
  */
  public void setLCMCCY(String newvalue)
  {
    fieldLCMCCY.setString(newvalue);
  }

  /**
  * Get value of field LCMCCY as a String.
  */
  public String getLCMCCY()
  {
    return fieldLCMCCY.getString();
  }

  /**
  * Set field LCMOAM using a String value.
  */
  public void setLCMOAM(String newvalue)
  {
    fieldLCMOAM.setString(newvalue);
  }

  /**
  * Get value of field LCMOAM as a String.
  */
  public String getLCMOAM()
  {
    return fieldLCMOAM.getString();
  }

  /**
  * Set numeric field LCMOAM using a BigDecimal value.
  */
  public void setLCMOAM(BigDecimal newvalue)
  {
    fieldLCMOAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field LCMOAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalLCMOAM()
  {
    return fieldLCMOAM.getBigDecimal();
  }

  /**
  * Set field ELCRUB using a String value.
  */
  public void setELCRUB(String newvalue)
  {
    fieldELCRUB.setString(newvalue);
  }

  /**
  * Get value of field ELCRUB as a String.
  */
  public String getELCRUB()
  {
    return fieldELCRUB.getString();
  }

  /**
  * Set field ELCNOB using a String value.
  */
  public void setELCNOB(String newvalue)
  {
    fieldELCNOB.setString(newvalue);
  }

  /**
  * Get value of field ELCNOB as a String.
  */
  public String getELCNOB()
  {
    return fieldELCNOB.getString();
  }

  /**
  * Set field ELCSTS using a String value.
  */
  public void setELCSTS(String newvalue)
  {
    fieldELCSTS.setString(newvalue);
  }

  /**
  * Get value of field ELCSTS as a String.
  */
  public String getELCSTS()
  {
    return fieldELCSTS.getString();
  }

}
