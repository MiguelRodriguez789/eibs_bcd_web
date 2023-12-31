package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EGC051003 physical file definition.
* 
* File level identifier is 1100706173618.
* Record format level identifier is 46169979AE1B8.
*/

public class EGC051003Message extends MessageRecord
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
                                     "EGCUSR",
                                     "EXPNID",
                                     "CUSSHN",
                                     "APCDSC",
                                     "EXPACC",
                                     "CIFACS",
                                     "EXPCPO",
                                     "EXPTBS",
                                     "EXPTOP",
                                     "EXPCPT",
                                     "EXPCPG",
                                     "EXPMTC",
                                     "EXPSDE",
                                     "EGCXRT"
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
                                   "EGCUSR",
                                   "EXPNID",
                                   "CUSSHN",
                                   "APCDSC",
                                   "EXPACC",
                                   "CIFACS",
                                   "EXPCPO",
                                   "EXPTBS",
                                   "EXPTOP",
                                   "EXPCPT",
                                   "EXPCPG",
                                   "EXPMTC",
                                   "EXPSDE",
                                   "EGCXRT"
                                 };
  final static String fid = "1100706173618";
  final static String rid = "46169979AE1B8";
  final static String fmtname = "EGC051003";
  final int FIELDCOUNT = 23;
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
  private CharacterField fieldEGCUSR = null;
  private CharacterField fieldEXPNID = null;
  private CharacterField fieldCUSSHN = null;
  private CharacterField fieldAPCDSC = null;
  private DecimalField fieldEXPACC = null;
  private CharacterField fieldCIFACS = null;
  private DecimalField fieldEXPCPO = null;
  private DecimalField fieldEXPTBS = null;
  private DecimalField fieldEXPTOP = null;
  private DecimalField fieldEXPCPT = null;
  private DecimalField fieldEXPCPG = null;
  private DecimalField fieldEXPMTC = null;
  private DecimalField fieldEXPSDE = null;
  private DecimalField fieldEGCXRT = null;

  /**
  * Constructor for EGC051003Message.
  */
  public EGC051003Message()
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
    recordsize = 259;
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
    fields[9] = fieldEGCUSR =
    new CharacterField(message, HEADERSIZE + 42, 10, "EGCUSR");
    fields[10] = fieldEXPNID =
    new CharacterField(message, HEADERSIZE + 52, 15, "EXPNID");
    fields[11] = fieldCUSSHN =
    new CharacterField(message, HEADERSIZE + 67, 15, "CUSSHN");
    fields[12] = fieldAPCDSC =
    new CharacterField(message, HEADERSIZE + 82, 78, "APCDSC");
    fields[13] = fieldEXPACC =
    new DecimalField(message, HEADERSIZE + 160, 13, 0, "EXPACC");
    fields[14] = fieldCIFACS =
    new CharacterField(message, HEADERSIZE + 173, 1, "CIFACS");
    fields[15] = fieldEXPCPO =
    new DecimalField(message, HEADERSIZE + 174, 17, 2, "EXPCPO");
    fields[16] = fieldEXPTBS =
    new DecimalField(message, HEADERSIZE + 191, 11, 6, "EXPTBS");
    fields[17] = fieldEXPTOP =
    new DecimalField(message, HEADERSIZE + 202, 11, 6, "EXPTOP");
    fields[18] = fieldEXPCPT =
    new DecimalField(message, HEADERSIZE + 213, 5, 0, "EXPCPT");
    fields[19] = fieldEXPCPG =
    new DecimalField(message, HEADERSIZE + 218, 5, 0, "EXPCPG");
    fields[20] = fieldEXPMTC =
    new DecimalField(message, HEADERSIZE + 223, 17, 2, "EXPMTC");
    fields[21] = fieldEXPSDE =
    new DecimalField(message, HEADERSIZE + 240, 17, 2, "EXPSDE");
    fields[22] = fieldEGCXRT =
    new DecimalField(message, HEADERSIZE + 257, 2, 0, "EGCXRT");

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
  * Set field EGCUSR using a String value.
  */
  public void setEGCUSR(String newvalue)
  {
    fieldEGCUSR.setString(newvalue);
  }

  /**
  * Get value of field EGCUSR as a String.
  */
  public String getEGCUSR()
  {
    return fieldEGCUSR.getString();
  }

  /**
  * Set field EXPNID using a String value.
  */
  public void setEXPNID(String newvalue)
  {
    fieldEXPNID.setString(newvalue);
  }

  /**
  * Get value of field EXPNID as a String.
  */
  public String getEXPNID()
  {
    return fieldEXPNID.getString();
  }

  /**
  * Set field CUSSHN using a String value.
  */
  public void setCUSSHN(String newvalue)
  {
    fieldCUSSHN.setString(newvalue);
  }

  /**
  * Get value of field CUSSHN as a String.
  */
  public String getCUSSHN()
  {
    return fieldCUSSHN.getString();
  }

  /**
  * Set field APCDSC using a String value.
  */
  public void setAPCDSC(String newvalue)
  {
    fieldAPCDSC.setString(newvalue);
  }

  /**
  * Get value of field APCDSC as a String.
  */
  public String getAPCDSC()
  {
    return fieldAPCDSC.getString();
  }

  /**
  * Set field EXPACC using a String value.
  */
  public void setEXPACC(String newvalue)
  {
    fieldEXPACC.setString(newvalue);
  }

  /**
  * Get value of field EXPACC as a String.
  */
  public String getEXPACC()
  {
    return fieldEXPACC.getString();
  }

  /**
  * Set numeric field EXPACC using a BigDecimal value.
  */
  public void setEXPACC(BigDecimal newvalue)
  {
    fieldEXPACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EXPACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalEXPACC()
  {
    return fieldEXPACC.getBigDecimal();
  }

  /**
  * Set field CIFACS using a String value.
  */
  public void setCIFACS(String newvalue)
  {
    fieldCIFACS.setString(newvalue);
  }

  /**
  * Get value of field CIFACS as a String.
  */
  public String getCIFACS()
  {
    return fieldCIFACS.getString();
  }

  /**
  * Set field EXPCPO using a String value.
  */
  public void setEXPCPO(String newvalue)
  {
    fieldEXPCPO.setString(newvalue);
  }

  /**
  * Get value of field EXPCPO as a String.
  */
  public String getEXPCPO()
  {
    return fieldEXPCPO.getString();
  }

  /**
  * Set numeric field EXPCPO using a BigDecimal value.
  */
  public void setEXPCPO(BigDecimal newvalue)
  {
    fieldEXPCPO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EXPCPO as a BigDecimal.
  */
  public BigDecimal getBigDecimalEXPCPO()
  {
    return fieldEXPCPO.getBigDecimal();
  }

  /**
  * Set field EXPTBS using a String value.
  */
  public void setEXPTBS(String newvalue)
  {
    fieldEXPTBS.setString(newvalue);
  }

  /**
  * Get value of field EXPTBS as a String.
  */
  public String getEXPTBS()
  {
    return fieldEXPTBS.getString();
  }

  /**
  * Set numeric field EXPTBS using a BigDecimal value.
  */
  public void setEXPTBS(BigDecimal newvalue)
  {
    fieldEXPTBS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EXPTBS as a BigDecimal.
  */
  public BigDecimal getBigDecimalEXPTBS()
  {
    return fieldEXPTBS.getBigDecimal();
  }

  /**
  * Set field EXPTOP using a String value.
  */
  public void setEXPTOP(String newvalue)
  {
    fieldEXPTOP.setString(newvalue);
  }

  /**
  * Get value of field EXPTOP as a String.
  */
  public String getEXPTOP()
  {
    return fieldEXPTOP.getString();
  }

  /**
  * Set numeric field EXPTOP using a BigDecimal value.
  */
  public void setEXPTOP(BigDecimal newvalue)
  {
    fieldEXPTOP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EXPTOP as a BigDecimal.
  */
  public BigDecimal getBigDecimalEXPTOP()
  {
    return fieldEXPTOP.getBigDecimal();
  }

  /**
  * Set field EXPCPT using a String value.
  */
  public void setEXPCPT(String newvalue)
  {
    fieldEXPCPT.setString(newvalue);
  }

  /**
  * Get value of field EXPCPT as a String.
  */
  public String getEXPCPT()
  {
    return fieldEXPCPT.getString();
  }

  /**
  * Set numeric field EXPCPT using a BigDecimal value.
  */
  public void setEXPCPT(BigDecimal newvalue)
  {
    fieldEXPCPT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EXPCPT as a BigDecimal.
  */
  public BigDecimal getBigDecimalEXPCPT()
  {
    return fieldEXPCPT.getBigDecimal();
  }

  /**
  * Set field EXPCPG using a String value.
  */
  public void setEXPCPG(String newvalue)
  {
    fieldEXPCPG.setString(newvalue);
  }

  /**
  * Get value of field EXPCPG as a String.
  */
  public String getEXPCPG()
  {
    return fieldEXPCPG.getString();
  }

  /**
  * Set numeric field EXPCPG using a BigDecimal value.
  */
  public void setEXPCPG(BigDecimal newvalue)
  {
    fieldEXPCPG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EXPCPG as a BigDecimal.
  */
  public BigDecimal getBigDecimalEXPCPG()
  {
    return fieldEXPCPG.getBigDecimal();
  }

  /**
  * Set field EXPMTC using a String value.
  */
  public void setEXPMTC(String newvalue)
  {
    fieldEXPMTC.setString(newvalue);
  }

  /**
  * Get value of field EXPMTC as a String.
  */
  public String getEXPMTC()
  {
    return fieldEXPMTC.getString();
  }

  /**
  * Set numeric field EXPMTC using a BigDecimal value.
  */
  public void setEXPMTC(BigDecimal newvalue)
  {
    fieldEXPMTC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EXPMTC as a BigDecimal.
  */
  public BigDecimal getBigDecimalEXPMTC()
  {
    return fieldEXPMTC.getBigDecimal();
  }

  /**
  * Set field EXPSDE using a String value.
  */
  public void setEXPSDE(String newvalue)
  {
    fieldEXPSDE.setString(newvalue);
  }

  /**
  * Get value of field EXPSDE as a String.
  */
  public String getEXPSDE()
  {
    return fieldEXPSDE.getString();
  }

  /**
  * Set numeric field EXPSDE using a BigDecimal value.
  */
  public void setEXPSDE(BigDecimal newvalue)
  {
    fieldEXPSDE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EXPSDE as a BigDecimal.
  */
  public BigDecimal getBigDecimalEXPSDE()
  {
    return fieldEXPSDE.getBigDecimal();
  }

  /**
  * Set field EGCXRT using a String value.
  */
  public void setEGCXRT(String newvalue)
  {
    fieldEGCXRT.setString(newvalue);
  }

  /**
  * Get value of field EGCXRT as a String.
  */
  public String getEGCXRT()
  {
    return fieldEGCXRT.getString();
  }

  /**
  * Set numeric field EGCXRT using a BigDecimal value.
  */
  public void setEGCXRT(BigDecimal newvalue)
  {
    fieldEGCXRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EGCXRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalEGCXRT()
  {
    return fieldEGCXRT.getBigDecimal();
  }

}
