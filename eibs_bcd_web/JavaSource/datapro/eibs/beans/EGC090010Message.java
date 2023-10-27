package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EGC090010 physical file definition.
* 
* File level identifier is 1100706173620.
* Record format level identifier is 40672143EDE9D.
*/

public class EGC090010Message extends MessageRecord
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
                                     "EGCATY",
                                     "EGCXAA",
                                     "EGCXMM",
                                     "ACMOPM",
                                     "ACMOPD",
                                     "ACMOPY",
                                     "ACMSDC",
                                     "EGCATD",
                                     "ACMAST",
                                     "ACMACC",
                                     "CUSIDN",
                                     "CUSSHN",
                                     "ACMUC2",
                                     "PVMSLC",
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
                                   "EGCATY",
                                   "EGCXAA",
                                   "EGCXMM",
                                   "ACMOPM",
                                   "ACMOPD",
                                   "ACMOPY",
                                   "ACMSDC",
                                   "EGCATD",
                                   "ACMAST",
                                   "ACMACC",
                                   "CUSIDN",
                                   "CUSSHN",
                                   "ACMUC2",
                                   "PVMSLC",
                                   "EGCXRT"
                                 };
  final static String fid = "1100706173620";
  final static String rid = "40672143EDE9D";
  final static String fmtname = "EGC090010";
  final int FIELDCOUNT = 25;
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
  private CharacterField fieldEGCATY = null;
  private DecimalField fieldEGCXAA = null;
  private DecimalField fieldEGCXMM = null;
  private DecimalField fieldACMOPM = null;
  private DecimalField fieldACMOPD = null;
  private DecimalField fieldACMOPY = null;
  private DecimalField fieldACMSDC = null;
  private CharacterField fieldEGCATD = null;
  private CharacterField fieldACMAST = null;
  private DecimalField fieldACMACC = null;
  private CharacterField fieldCUSIDN = null;
  private CharacterField fieldCUSSHN = null;
  private CharacterField fieldACMUC2 = null;
  private CharacterField fieldPVMSLC = null;
  private DecimalField fieldEGCXRT = null;

  /**
  * Constructor for EGC090010Message.
  */
  public EGC090010Message()
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
    recordsize = 164;
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
    fields[10] = fieldEGCATY =
    new CharacterField(message, HEADERSIZE + 52, 4, "EGCATY");
    fields[11] = fieldEGCXAA =
    new DecimalField(message, HEADERSIZE + 56, 5, 0, "EGCXAA");
    fields[12] = fieldEGCXMM =
    new DecimalField(message, HEADERSIZE + 61, 3, 0, "EGCXMM");
    fields[13] = fieldACMOPM =
    new DecimalField(message, HEADERSIZE + 64, 3, 0, "ACMOPM");
    fields[14] = fieldACMOPD =
    new DecimalField(message, HEADERSIZE + 67, 3, 0, "ACMOPD");
    fields[15] = fieldACMOPY =
    new DecimalField(message, HEADERSIZE + 70, 3, 0, "ACMOPY");
    fields[16] = fieldACMSDC =
    new DecimalField(message, HEADERSIZE + 73, 7, 0, "ACMSDC");
    fields[17] = fieldEGCATD =
    new CharacterField(message, HEADERSIZE + 80, 30, "EGCATD");
    fields[18] = fieldACMAST =
    new CharacterField(message, HEADERSIZE + 110, 1, "ACMAST");
    fields[19] = fieldACMACC =
    new DecimalField(message, HEADERSIZE + 111, 13, 0, "ACMACC");
    fields[20] = fieldCUSIDN =
    new CharacterField(message, HEADERSIZE + 124, 15, "CUSIDN");
    fields[21] = fieldCUSSHN =
    new CharacterField(message, HEADERSIZE + 139, 15, "CUSSHN");
    fields[22] = fieldACMUC2 =
    new CharacterField(message, HEADERSIZE + 154, 4, "ACMUC2");
    fields[23] = fieldPVMSLC =
    new CharacterField(message, HEADERSIZE + 158, 4, "PVMSLC");
    fields[24] = fieldEGCXRT =
    new DecimalField(message, HEADERSIZE + 162, 2, 0, "EGCXRT");

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
  * Set field EGCATY using a String value.
  */
  public void setEGCATY(String newvalue)
  {
    fieldEGCATY.setString(newvalue);
  }

  /**
  * Get value of field EGCATY as a String.
  */
  public String getEGCATY()
  {
    return fieldEGCATY.getString();
  }

  /**
  * Set field EGCXAA using a String value.
  */
  public void setEGCXAA(String newvalue)
  {
    fieldEGCXAA.setString(newvalue);
  }

  /**
  * Get value of field EGCXAA as a String.
  */
  public String getEGCXAA()
  {
    return fieldEGCXAA.getString();
  }

  /**
  * Set numeric field EGCXAA using a BigDecimal value.
  */
  public void setEGCXAA(BigDecimal newvalue)
  {
    fieldEGCXAA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EGCXAA as a BigDecimal.
  */
  public BigDecimal getBigDecimalEGCXAA()
  {
    return fieldEGCXAA.getBigDecimal();
  }

  /**
  * Set field EGCXMM using a String value.
  */
  public void setEGCXMM(String newvalue)
  {
    fieldEGCXMM.setString(newvalue);
  }

  /**
  * Get value of field EGCXMM as a String.
  */
  public String getEGCXMM()
  {
    return fieldEGCXMM.getString();
  }

  /**
  * Set numeric field EGCXMM using a BigDecimal value.
  */
  public void setEGCXMM(BigDecimal newvalue)
  {
    fieldEGCXMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EGCXMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalEGCXMM()
  {
    return fieldEGCXMM.getBigDecimal();
  }

  /**
  * Set field ACMOPM using a String value.
  */
  public void setACMOPM(String newvalue)
  {
    fieldACMOPM.setString(newvalue);
  }

  /**
  * Get value of field ACMOPM as a String.
  */
  public String getACMOPM()
  {
    return fieldACMOPM.getString();
  }

  /**
  * Set numeric field ACMOPM using a BigDecimal value.
  */
  public void setACMOPM(BigDecimal newvalue)
  {
    fieldACMOPM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ACMOPM as a BigDecimal.
  */
  public BigDecimal getBigDecimalACMOPM()
  {
    return fieldACMOPM.getBigDecimal();
  }

  /**
  * Set field ACMOPD using a String value.
  */
  public void setACMOPD(String newvalue)
  {
    fieldACMOPD.setString(newvalue);
  }

  /**
  * Get value of field ACMOPD as a String.
  */
  public String getACMOPD()
  {
    return fieldACMOPD.getString();
  }

  /**
  * Set numeric field ACMOPD using a BigDecimal value.
  */
  public void setACMOPD(BigDecimal newvalue)
  {
    fieldACMOPD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ACMOPD as a BigDecimal.
  */
  public BigDecimal getBigDecimalACMOPD()
  {
    return fieldACMOPD.getBigDecimal();
  }

  /**
  * Set field ACMOPY using a String value.
  */
  public void setACMOPY(String newvalue)
  {
    fieldACMOPY.setString(newvalue);
  }

  /**
  * Get value of field ACMOPY as a String.
  */
  public String getACMOPY()
  {
    return fieldACMOPY.getString();
  }

  /**
  * Set numeric field ACMOPY using a BigDecimal value.
  */
  public void setACMOPY(BigDecimal newvalue)
  {
    fieldACMOPY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ACMOPY as a BigDecimal.
  */
  public BigDecimal getBigDecimalACMOPY()
  {
    return fieldACMOPY.getBigDecimal();
  }

  /**
  * Set field ACMSDC using a String value.
  */
  public void setACMSDC(String newvalue)
  {
    fieldACMSDC.setString(newvalue);
  }

  /**
  * Get value of field ACMSDC as a String.
  */
  public String getACMSDC()
  {
    return fieldACMSDC.getString();
  }

  /**
  * Set numeric field ACMSDC using a BigDecimal value.
  */
  public void setACMSDC(BigDecimal newvalue)
  {
    fieldACMSDC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ACMSDC as a BigDecimal.
  */
  public BigDecimal getBigDecimalACMSDC()
  {
    return fieldACMSDC.getBigDecimal();
  }

  /**
  * Set field EGCATD using a String value.
  */
  public void setEGCATD(String newvalue)
  {
    fieldEGCATD.setString(newvalue);
  }

  /**
  * Get value of field EGCATD as a String.
  */
  public String getEGCATD()
  {
    return fieldEGCATD.getString();
  }

  /**
  * Set field ACMAST using a String value.
  */
  public void setACMAST(String newvalue)
  {
    fieldACMAST.setString(newvalue);
  }

  /**
  * Get value of field ACMAST as a String.
  */
  public String getACMAST()
  {
    return fieldACMAST.getString();
  }

  /**
  * Set field ACMACC using a String value.
  */
  public void setACMACC(String newvalue)
  {
    fieldACMACC.setString(newvalue);
  }

  /**
  * Get value of field ACMACC as a String.
  */
  public String getACMACC()
  {
    return fieldACMACC.getString();
  }

  /**
  * Set numeric field ACMACC using a BigDecimal value.
  */
  public void setACMACC(BigDecimal newvalue)
  {
    fieldACMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ACMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalACMACC()
  {
    return fieldACMACC.getBigDecimal();
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
  * Set field ACMUC2 using a String value.
  */
  public void setACMUC2(String newvalue)
  {
    fieldACMUC2.setString(newvalue);
  }

  /**
  * Get value of field ACMUC2 as a String.
  */
  public String getACMUC2()
  {
    return fieldACMUC2.getString();
  }

  /**
  * Set field PVMSLC using a String value.
  */
  public void setPVMSLC(String newvalue)
  {
    fieldPVMSLC.setString(newvalue);
  }

  /**
  * Get value of field PVMSLC as a String.
  */
  public String getPVMSLC()
  {
    return fieldPVMSLC.getString();
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