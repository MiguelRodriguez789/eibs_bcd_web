package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECQ000010 physical file definition.
* 
* File level identifier is 1100706173542.
* Record format level identifier is 536191A496D02.
*/

public class ECQ000010Message extends MessageRecord
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
                                     "ECQCLI",
                                     "ECQACC",
                                     "ECQBNI",
                                     "ECQMA1",
                                     "ECQRTY",
                                     "ECQMA2",
                                     "ECQPID",
                                     "ECQTID",
                                     "ECQDTD",
                                     "ECQDTM",
                                     "ECQDTY",
                                     "ECQNME",
                                     "ECQINC",
                                     "ECQZPC",
                                     "ECQFL1",
                                     "ECQNST",
                                     "ECQAM1",
                                     "ECQAM2",
                                     "ECQD2D",
                                     "ECQD2M",
                                     "ECQD2Y",
                                     "ECQMA3",
                                     "ECQMA4",
                                     "ECQFL3",
                                     "ECQHPD",
                                     "ECQHPM",
                                     "ECQHPY",
                                     "ECQXRT"
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
                                   "ECQCLI",
                                   "ECQACC",
                                   "ECQBNI",
                                   "ECQMA1",
                                   "ECQRTY",
                                   "ECQMA2",
                                   "ECQPID",
                                   "ECQTID",
                                   "ECQDTD",
                                   "ECQDTM",
                                   "ECQDTY",
                                   "ECQNME",
                                   "ECQINC",
                                   "ECQZPC",
                                   "ECQFL1",
                                   "ECQNST",
                                   "ECQAM1",
                                   "ECQAM2",
                                   "ECQD2D",
                                   "ECQD2M",
                                   "ECQD2Y",
                                   "ECQMA3",
                                   "ECQMA4",
                                   "ECQFL3",
                                   "ECQHPD",
                                   "ECQHPM",
                                   "ECQHPY",
                                   "ECQXRT"
                                 };
  final static String fid = "1100706173542";
  final static String rid = "536191A496D02";
  final static String fmtname = "ECQ000010";
  final int FIELDCOUNT = 37;
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
  private CharacterField fieldECQCLI = null;
  private DecimalField fieldECQACC = null;
  private CharacterField fieldECQBNI = null;
  private CharacterField fieldECQMA1 = null;
  private CharacterField fieldECQRTY = null;
  private CharacterField fieldECQMA2 = null;
  private CharacterField fieldECQPID = null;
  private CharacterField fieldECQTID = null;
  private CharacterField fieldECQDTD = null;
  private CharacterField fieldECQDTM = null;
  private CharacterField fieldECQDTY = null;
  private CharacterField fieldECQNME = null;
  private CharacterField fieldECQINC = null;
  private CharacterField fieldECQZPC = null;
  private CharacterField fieldECQFL1 = null;
  private DecimalField fieldECQNST = null;
  private DecimalField fieldECQAM1 = null;
  private DecimalField fieldECQAM2 = null;
  private CharacterField fieldECQD2D = null;
  private CharacterField fieldECQD2M = null;
  private CharacterField fieldECQD2Y = null;
  private CharacterField fieldECQMA3 = null;
  private CharacterField fieldECQMA4 = null;
  private CharacterField fieldECQFL3 = null;
  private CharacterField fieldECQHPD = null;
  private CharacterField fieldECQHPM = null;
  private CharacterField fieldECQHPY = null;
  private DecimalField fieldECQXRT = null;

  /**
  * Constructor for ECQ000010Message.
  */
  public ECQ000010Message()
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
    recordsize = 338;
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
    fields[9] = fieldECQCLI =
    new CharacterField(message, HEADERSIZE + 42, 15, "ECQCLI");
    fields[10] = fieldECQACC =
    new DecimalField(message, HEADERSIZE + 57, 2, 0, "ECQACC");
    fields[11] = fieldECQBNI =
    new CharacterField(message, HEADERSIZE + 59, 15, "ECQBNI");
    fields[12] = fieldECQMA1 =
    new CharacterField(message, HEADERSIZE + 74, 45, "ECQMA1");
    fields[13] = fieldECQRTY =
    new CharacterField(message, HEADERSIZE + 119, 1, "ECQRTY");
    fields[14] = fieldECQMA2 =
    new CharacterField(message, HEADERSIZE + 120, 35, "ECQMA2");
    fields[15] = fieldECQPID =
    new CharacterField(message, HEADERSIZE + 155, 4, "ECQPID");
    fields[16] = fieldECQTID =
    new CharacterField(message, HEADERSIZE + 159, 4, "ECQTID");
    fields[17] = fieldECQDTD =
    new CharacterField(message, HEADERSIZE + 163, 2, "ECQDTD");
    fields[18] = fieldECQDTM =
    new CharacterField(message, HEADERSIZE + 165, 2, "ECQDTM");
    fields[19] = fieldECQDTY =
    new CharacterField(message, HEADERSIZE + 167, 4, "ECQDTY");
    fields[20] = fieldECQNME =
    new CharacterField(message, HEADERSIZE + 171, 35, "ECQNME");
    fields[21] = fieldECQINC =
    new CharacterField(message, HEADERSIZE + 206, 4, "ECQINC");
    fields[22] = fieldECQZPC =
    new CharacterField(message, HEADERSIZE + 210, 15, "ECQZPC");
    fields[23] = fieldECQFL1 =
    new CharacterField(message, HEADERSIZE + 225, 1, "ECQFL1");
    fields[24] = fieldECQNST =
    new DecimalField(message, HEADERSIZE + 226, 10, 0, "ECQNST");
    fields[25] = fieldECQAM1 =
    new DecimalField(message, HEADERSIZE + 236, 9, 0, "ECQAM1");
    fields[26] = fieldECQAM2 =
    new DecimalField(message, HEADERSIZE + 245, 9, 0, "ECQAM2");
    fields[27] = fieldECQD2D =
    new CharacterField(message, HEADERSIZE + 254, 2, "ECQD2D");
    fields[28] = fieldECQD2M =
    new CharacterField(message, HEADERSIZE + 256, 2, "ECQD2M");
    fields[29] = fieldECQD2Y =
    new CharacterField(message, HEADERSIZE + 258, 4, "ECQD2Y");
    fields[30] = fieldECQMA3 =
    new CharacterField(message, HEADERSIZE + 262, 35, "ECQMA3");
    fields[31] = fieldECQMA4 =
    new CharacterField(message, HEADERSIZE + 297, 30, "ECQMA4");
    fields[32] = fieldECQFL3 =
    new CharacterField(message, HEADERSIZE + 327, 1, "ECQFL3");
    fields[33] = fieldECQHPD =
    new CharacterField(message, HEADERSIZE + 328, 2, "ECQHPD");
    fields[34] = fieldECQHPM =
    new CharacterField(message, HEADERSIZE + 330, 2, "ECQHPM");
    fields[35] = fieldECQHPY =
    new CharacterField(message, HEADERSIZE + 332, 4, "ECQHPY");
    fields[36] = fieldECQXRT =
    new DecimalField(message, HEADERSIZE + 336, 2, 0, "ECQXRT");

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
  * Set field ECQCLI using a String value.
  */
  public void setECQCLI(String newvalue)
  {
    fieldECQCLI.setString(newvalue);
  }

  /**
  * Get value of field ECQCLI as a String.
  */
  public String getECQCLI()
  {
    return fieldECQCLI.getString();
  }

  /**
  * Set field ECQACC using a String value.
  */
  public void setECQACC(String newvalue)
  {
    fieldECQACC.setString(newvalue);
  }

  /**
  * Get value of field ECQACC as a String.
  */
  public String getECQACC()
  {
    return fieldECQACC.getString();
  }

  /**
  * Set numeric field ECQACC using a BigDecimal value.
  */
  public void setECQACC(BigDecimal newvalue)
  {
    fieldECQACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ECQACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalECQACC()
  {
    return fieldECQACC.getBigDecimal();
  }

  /**
  * Set field ECQBNI using a String value.
  */
  public void setECQBNI(String newvalue)
  {
    fieldECQBNI.setString(newvalue);
  }

  /**
  * Get value of field ECQBNI as a String.
  */
  public String getECQBNI()
  {
    return fieldECQBNI.getString();
  }

  /**
  * Set field ECQMA1 using a String value.
  */
  public void setECQMA1(String newvalue)
  {
    fieldECQMA1.setString(newvalue);
  }

  /**
  * Get value of field ECQMA1 as a String.
  */
  public String getECQMA1()
  {
    return fieldECQMA1.getString();
  }

  /**
  * Set field ECQRTY using a String value.
  */
  public void setECQRTY(String newvalue)
  {
    fieldECQRTY.setString(newvalue);
  }

  /**
  * Get value of field ECQRTY as a String.
  */
  public String getECQRTY()
  {
    return fieldECQRTY.getString();
  }

  /**
  * Set field ECQMA2 using a String value.
  */
  public void setECQMA2(String newvalue)
  {
    fieldECQMA2.setString(newvalue);
  }

  /**
  * Get value of field ECQMA2 as a String.
  */
  public String getECQMA2()
  {
    return fieldECQMA2.getString();
  }

  /**
  * Set field ECQPID using a String value.
  */
  public void setECQPID(String newvalue)
  {
    fieldECQPID.setString(newvalue);
  }

  /**
  * Get value of field ECQPID as a String.
  */
  public String getECQPID()
  {
    return fieldECQPID.getString();
  }

  /**
  * Set field ECQTID using a String value.
  */
  public void setECQTID(String newvalue)
  {
    fieldECQTID.setString(newvalue);
  }

  /**
  * Get value of field ECQTID as a String.
  */
  public String getECQTID()
  {
    return fieldECQTID.getString();
  }

  /**
  * Set field ECQDTD using a String value.
  */
  public void setECQDTD(String newvalue)
  {
    fieldECQDTD.setString(newvalue);
  }

  /**
  * Get value of field ECQDTD as a String.
  */
  public String getECQDTD()
  {
    return fieldECQDTD.getString();
  }

  /**
  * Set field ECQDTM using a String value.
  */
  public void setECQDTM(String newvalue)
  {
    fieldECQDTM.setString(newvalue);
  }

  /**
  * Get value of field ECQDTM as a String.
  */
  public String getECQDTM()
  {
    return fieldECQDTM.getString();
  }

  /**
  * Set field ECQDTY using a String value.
  */
  public void setECQDTY(String newvalue)
  {
    fieldECQDTY.setString(newvalue);
  }

  /**
  * Get value of field ECQDTY as a String.
  */
  public String getECQDTY()
  {
    return fieldECQDTY.getString();
  }

  /**
  * Set field ECQNME using a String value.
  */
  public void setECQNME(String newvalue)
  {
    fieldECQNME.setString(newvalue);
  }

  /**
  * Get value of field ECQNME as a String.
  */
  public String getECQNME()
  {
    return fieldECQNME.getString();
  }

  /**
  * Set field ECQINC using a String value.
  */
  public void setECQINC(String newvalue)
  {
    fieldECQINC.setString(newvalue);
  }

  /**
  * Get value of field ECQINC as a String.
  */
  public String getECQINC()
  {
    return fieldECQINC.getString();
  }

  /**
  * Set field ECQZPC using a String value.
  */
  public void setECQZPC(String newvalue)
  {
    fieldECQZPC.setString(newvalue);
  }

  /**
  * Get value of field ECQZPC as a String.
  */
  public String getECQZPC()
  {
    return fieldECQZPC.getString();
  }

  /**
  * Set field ECQFL1 using a String value.
  */
  public void setECQFL1(String newvalue)
  {
    fieldECQFL1.setString(newvalue);
  }

  /**
  * Get value of field ECQFL1 as a String.
  */
  public String getECQFL1()
  {
    return fieldECQFL1.getString();
  }

  /**
  * Set field ECQNST using a String value.
  */
  public void setECQNST(String newvalue)
  {
    fieldECQNST.setString(newvalue);
  }

  /**
  * Get value of field ECQNST as a String.
  */
  public String getECQNST()
  {
    return fieldECQNST.getString();
  }

  /**
  * Set numeric field ECQNST using a BigDecimal value.
  */
  public void setECQNST(BigDecimal newvalue)
  {
    fieldECQNST.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ECQNST as a BigDecimal.
  */
  public BigDecimal getBigDecimalECQNST()
  {
    return fieldECQNST.getBigDecimal();
  }

  /**
  * Set field ECQAM1 using a String value.
  */
  public void setECQAM1(String newvalue)
  {
    fieldECQAM1.setString(newvalue);
  }

  /**
  * Get value of field ECQAM1 as a String.
  */
  public String getECQAM1()
  {
    return fieldECQAM1.getString();
  }

  /**
  * Set numeric field ECQAM1 using a BigDecimal value.
  */
  public void setECQAM1(BigDecimal newvalue)
  {
    fieldECQAM1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ECQAM1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalECQAM1()
  {
    return fieldECQAM1.getBigDecimal();
  }

  /**
  * Set field ECQAM2 using a String value.
  */
  public void setECQAM2(String newvalue)
  {
    fieldECQAM2.setString(newvalue);
  }

  /**
  * Get value of field ECQAM2 as a String.
  */
  public String getECQAM2()
  {
    return fieldECQAM2.getString();
  }

  /**
  * Set numeric field ECQAM2 using a BigDecimal value.
  */
  public void setECQAM2(BigDecimal newvalue)
  {
    fieldECQAM2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ECQAM2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalECQAM2()
  {
    return fieldECQAM2.getBigDecimal();
  }

  /**
  * Set field ECQD2D using a String value.
  */
  public void setECQD2D(String newvalue)
  {
    fieldECQD2D.setString(newvalue);
  }

  /**
  * Get value of field ECQD2D as a String.
  */
  public String getECQD2D()
  {
    return fieldECQD2D.getString();
  }

  /**
  * Set field ECQD2M using a String value.
  */
  public void setECQD2M(String newvalue)
  {
    fieldECQD2M.setString(newvalue);
  }

  /**
  * Get value of field ECQD2M as a String.
  */
  public String getECQD2M()
  {
    return fieldECQD2M.getString();
  }

  /**
  * Set field ECQD2Y using a String value.
  */
  public void setECQD2Y(String newvalue)
  {
    fieldECQD2Y.setString(newvalue);
  }

  /**
  * Get value of field ECQD2Y as a String.
  */
  public String getECQD2Y()
  {
    return fieldECQD2Y.getString();
  }

  /**
  * Set field ECQMA3 using a String value.
  */
  public void setECQMA3(String newvalue)
  {
    fieldECQMA3.setString(newvalue);
  }

  /**
  * Get value of field ECQMA3 as a String.
  */
  public String getECQMA3()
  {
    return fieldECQMA3.getString();
  }

  /**
  * Set field ECQMA4 using a String value.
  */
  public void setECQMA4(String newvalue)
  {
    fieldECQMA4.setString(newvalue);
  }

  /**
  * Get value of field ECQMA4 as a String.
  */
  public String getECQMA4()
  {
    return fieldECQMA4.getString();
  }

  /**
  * Set field ECQFL3 using a String value.
  */
  public void setECQFL3(String newvalue)
  {
    fieldECQFL3.setString(newvalue);
  }

  /**
  * Get value of field ECQFL3 as a String.
  */
  public String getECQFL3()
  {
    return fieldECQFL3.getString();
  }

  /**
  * Set field ECQHPD using a String value.
  */
  public void setECQHPD(String newvalue)
  {
    fieldECQHPD.setString(newvalue);
  }

  /**
  * Get value of field ECQHPD as a String.
  */
  public String getECQHPD()
  {
    return fieldECQHPD.getString();
  }

  /**
  * Set field ECQHPM using a String value.
  */
  public void setECQHPM(String newvalue)
  {
    fieldECQHPM.setString(newvalue);
  }

  /**
  * Get value of field ECQHPM as a String.
  */
  public String getECQHPM()
  {
    return fieldECQHPM.getString();
  }

  /**
  * Set field ECQHPY using a String value.
  */
  public void setECQHPY(String newvalue)
  {
    fieldECQHPY.setString(newvalue);
  }

  /**
  * Get value of field ECQHPY as a String.
  */
  public String getECQHPY()
  {
    return fieldECQHPY.getString();
  }

  /**
  * Set field ECQXRT using a String value.
  */
  public void setECQXRT(String newvalue)
  {
    fieldECQXRT.setString(newvalue);
  }

  /**
  * Get value of field ECQXRT as a String.
  */
  public String getECQXRT()
  {
    return fieldECQXRT.getString();
  }

  /**
  * Set numeric field ECQXRT using a BigDecimal value.
  */
  public void setECQXRT(BigDecimal newvalue)
  {
    fieldECQXRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field ECQXRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalECQXRT()
  {
    return fieldECQXRT.getBigDecimal();
  }

}
