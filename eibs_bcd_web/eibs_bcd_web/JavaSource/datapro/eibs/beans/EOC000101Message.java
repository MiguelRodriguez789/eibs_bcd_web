package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EOC000101 physical file definition.
* 
* File level identifier is 1100706173634.
* Record format level identifier is 410C370789305.
*/

public class EOC000101Message extends MessageRecord
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
                                     "CCDCCO",
                                     "CCDDES",
                                     "CCDCOP",
                                     "CCDTOP",
                                     "CCDIDE",
                                     "CCDPAI",
                                     "CCDAUT",
                                     "CCDCED",
                                     "CCDCEX",
                                     "CCDARC",
                                     "CCDOBS",
                                     "CCDPRE",
                                     "CCDCAG",
                                     "CCDLSG",
                                     "CCDCP1",
                                     "CCDCP2",
                                     "CCDCP3"
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
                                   "CCDCCO",
                                   "CCDDES",
                                   "CCDCOP",
                                   "CCDTOP",
                                   "CCDIDE",
                                   "CCDPAI",
                                   "CCDAUT",
                                   "CCDCED",
                                   "CCDCEX",
                                   "CCDARC",
                                   "CCDOBS",
                                   "CCDPRE",
                                   "CCDCAG",
                                   "CCDLSG",
                                   "CCDCP1",
                                   "CCDCP2",
                                   "CCDCP3"
                                 };
  final static String fid = "1100706173634";
  final static String rid = "410C370789305";
  final static String fmtname = "EOC000101";
  final int FIELDCOUNT = 26;
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
  private DecimalField fieldCCDCCO = null;
  private CharacterField fieldCCDDES = null;
  private CharacterField fieldCCDCOP = null;
  private CharacterField fieldCCDTOP = null;
  private CharacterField fieldCCDIDE = null;
  private CharacterField fieldCCDPAI = null;
  private CharacterField fieldCCDAUT = null;
  private CharacterField fieldCCDCED = null;
  private CharacterField fieldCCDCEX = null;
  private CharacterField fieldCCDARC = null;
  private CharacterField fieldCCDOBS = null;
  private CharacterField fieldCCDPRE = null;
  private CharacterField fieldCCDCAG = null;
  private CharacterField fieldCCDLSG = null;
  private CharacterField fieldCCDCP1 = null;
  private CharacterField fieldCCDCP2 = null;
  private CharacterField fieldCCDCP3 = null;

  /**
  * Constructor for EOC000101Message.
  */
  public EOC000101Message()
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
    recordsize = 186;
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
    fields[9] = fieldCCDCCO =
    new DecimalField(message, HEADERSIZE + 42, 7, 0, "CCDCCO");
    fields[10] = fieldCCDDES =
    new CharacterField(message, HEADERSIZE + 49, 120, "CCDDES");
    fields[11] = fieldCCDCOP =
    new CharacterField(message, HEADERSIZE + 169, 3, "CCDCOP");
    fields[12] = fieldCCDTOP =
    new CharacterField(message, HEADERSIZE + 172, 1, "CCDTOP");
    fields[13] = fieldCCDIDE =
    new CharacterField(message, HEADERSIZE + 173, 1, "CCDIDE");
    fields[14] = fieldCCDPAI =
    new CharacterField(message, HEADERSIZE + 174, 1, "CCDPAI");
    fields[15] = fieldCCDAUT =
    new CharacterField(message, HEADERSIZE + 175, 1, "CCDAUT");
    fields[16] = fieldCCDCED =
    new CharacterField(message, HEADERSIZE + 176, 1, "CCDCED");
    fields[17] = fieldCCDCEX =
    new CharacterField(message, HEADERSIZE + 177, 1, "CCDCEX");
    fields[18] = fieldCCDARC =
    new CharacterField(message, HEADERSIZE + 178, 1, "CCDARC");
    fields[19] = fieldCCDOBS =
    new CharacterField(message, HEADERSIZE + 179, 1, "CCDOBS");
    fields[20] = fieldCCDPRE =
    new CharacterField(message, HEADERSIZE + 180, 1, "CCDPRE");
    fields[21] = fieldCCDCAG =
    new CharacterField(message, HEADERSIZE + 181, 1, "CCDCAG");
    fields[22] = fieldCCDLSG =
    new CharacterField(message, HEADERSIZE + 182, 1, "CCDLSG");
    fields[23] = fieldCCDCP1 =
    new CharacterField(message, HEADERSIZE + 183, 1, "CCDCP1");
    fields[24] = fieldCCDCP2 =
    new CharacterField(message, HEADERSIZE + 184, 1, "CCDCP2");
    fields[25] = fieldCCDCP3 =
    new CharacterField(message, HEADERSIZE + 185, 1, "CCDCP3");

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
  * Set field CCDCCO using a String value.
  */
  public void setCCDCCO(String newvalue)
  {
    fieldCCDCCO.setString(newvalue);
  }

  /**
  * Get value of field CCDCCO as a String.
  */
  public String getCCDCCO()
  {
    return fieldCCDCCO.getString();
  }

  /**
  * Set numeric field CCDCCO using a BigDecimal value.
  */
  public void setCCDCCO(BigDecimal newvalue)
  {
    fieldCCDCCO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field CCDCCO as a BigDecimal.
  */
  public BigDecimal getBigDecimalCCDCCO()
  {
    return fieldCCDCCO.getBigDecimal();
  }

  /**
  * Set field CCDDES using a String value.
  */
  public void setCCDDES(String newvalue)
  {
    fieldCCDDES.setString(newvalue);
  }

  /**
  * Get value of field CCDDES as a String.
  */
  public String getCCDDES()
  {
    return fieldCCDDES.getString();
  }

  /**
  * Set field CCDCOP using a String value.
  */
  public void setCCDCOP(String newvalue)
  {
    fieldCCDCOP.setString(newvalue);
  }

  /**
  * Get value of field CCDCOP as a String.
  */
  public String getCCDCOP()
  {
    return fieldCCDCOP.getString();
  }

  /**
  * Set field CCDTOP using a String value.
  */
  public void setCCDTOP(String newvalue)
  {
    fieldCCDTOP.setString(newvalue);
  }

  /**
  * Get value of field CCDTOP as a String.
  */
  public String getCCDTOP()
  {
    return fieldCCDTOP.getString();
  }

  /**
  * Set field CCDIDE using a String value.
  */
  public void setCCDIDE(String newvalue)
  {
    fieldCCDIDE.setString(newvalue);
  }

  /**
  * Get value of field CCDIDE as a String.
  */
  public String getCCDIDE()
  {
    return fieldCCDIDE.getString();
  }

  /**
  * Set field CCDPAI using a String value.
  */
  public void setCCDPAI(String newvalue)
  {
    fieldCCDPAI.setString(newvalue);
  }

  /**
  * Get value of field CCDPAI as a String.
  */
  public String getCCDPAI()
  {
    return fieldCCDPAI.getString();
  }

  /**
  * Set field CCDAUT using a String value.
  */
  public void setCCDAUT(String newvalue)
  {
    fieldCCDAUT.setString(newvalue);
  }

  /**
  * Get value of field CCDAUT as a String.
  */
  public String getCCDAUT()
  {
    return fieldCCDAUT.getString();
  }

  /**
  * Set field CCDCED using a String value.
  */
  public void setCCDCED(String newvalue)
  {
    fieldCCDCED.setString(newvalue);
  }

  /**
  * Get value of field CCDCED as a String.
  */
  public String getCCDCED()
  {
    return fieldCCDCED.getString();
  }

  /**
  * Set field CCDCEX using a String value.
  */
  public void setCCDCEX(String newvalue)
  {
    fieldCCDCEX.setString(newvalue);
  }

  /**
  * Get value of field CCDCEX as a String.
  */
  public String getCCDCEX()
  {
    return fieldCCDCEX.getString();
  }

  /**
  * Set field CCDARC using a String value.
  */
  public void setCCDARC(String newvalue)
  {
    fieldCCDARC.setString(newvalue);
  }

  /**
  * Get value of field CCDARC as a String.
  */
  public String getCCDARC()
  {
    return fieldCCDARC.getString();
  }

  /**
  * Set field CCDOBS using a String value.
  */
  public void setCCDOBS(String newvalue)
  {
    fieldCCDOBS.setString(newvalue);
  }

  /**
  * Get value of field CCDOBS as a String.
  */
  public String getCCDOBS()
  {
    return fieldCCDOBS.getString();
  }

  /**
  * Set field CCDPRE using a String value.
  */
  public void setCCDPRE(String newvalue)
  {
    fieldCCDPRE.setString(newvalue);
  }

  /**
  * Get value of field CCDPRE as a String.
  */
  public String getCCDPRE()
  {
    return fieldCCDPRE.getString();
  }

  /**
  * Set field CCDCAG using a String value.
  */
  public void setCCDCAG(String newvalue)
  {
    fieldCCDCAG.setString(newvalue);
  }

  /**
  * Get value of field CCDCAG as a String.
  */
  public String getCCDCAG()
  {
    return fieldCCDCAG.getString();
  }

  /**
  * Set field CCDLSG using a String value.
  */
  public void setCCDLSG(String newvalue)
  {
    fieldCCDLSG.setString(newvalue);
  }

  /**
  * Get value of field CCDLSG as a String.
  */
  public String getCCDLSG()
  {
    return fieldCCDLSG.getString();
  }

  /**
  * Set field CCDCP1 using a String value.
  */
  public void setCCDCP1(String newvalue)
  {
    fieldCCDCP1.setString(newvalue);
  }

  /**
  * Get value of field CCDCP1 as a String.
  */
  public String getCCDCP1()
  {
    return fieldCCDCP1.getString();
  }

  /**
  * Set field CCDCP2 using a String value.
  */
  public void setCCDCP2(String newvalue)
  {
    fieldCCDCP2.setString(newvalue);
  }

  /**
  * Get value of field CCDCP2 as a String.
  */
  public String getCCDCP2()
  {
    return fieldCCDCP2.getString();
  }

  /**
  * Set field CCDCP3 using a String value.
  */
  public void setCCDCP3(String newvalue)
  {
    fieldCCDCP3.setString(newvalue);
  }

  /**
  * Get value of field CCDCP3 as a String.
  */
  public String getCCDCP3()
  {
    return fieldCCDCP3.getString();
  }

}
