package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD570001 physical file definition.
* 
* File level identifier is 1130611112907.
* Record format level identifier is 4DACA8C5FFB9A.
*/

public class EDD570001Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H01USR",
                                     "H01PGM",
                                     "H01TIM",
                                     "H01SCR",
                                     "H01OPE",
                                     "H01MAS",
                                     "H01WK1",
                                     "H01WK2",
                                     "H01WK3",
                                     "E01BNK",
                                     "E01ACC",
                                     "E01SQN",
                                     "E01SGR",
                                     "E01CCY",
                                     "E01CUN",
                                     "E01MA1",
                                     "E01AMN",
                                     "E01FDM",
                                     "E01FDD",
                                     "E01FDY",
                                     "E01TDM",
                                     "E01TDD",
                                     "E01TDY",
                                     "E01STS",
                                     "E01BRN",
                                     "E01DOC",
                                     "E01OBS",
                                     "E01FL1",
                                     "E01FL2",
                                     "E01US1",
                                     "E01US2",
                                     "E01TSG",
                                     "E01SG1",
                                     "E01NM1",
                                     "E01CS1",
                                     "E01SG2",
                                     "E01NM2",
                                     "E01CS2",
                                     "E01SG3",
                                     "E01NM3",
                                     "E01CS3"
                                   };
  final static String tnames[] = {
                                   "H01USR",
                                   "H01PGM",
                                   "H01TIM",
                                   "H01SCR",
                                   "H01OPE",
                                   "H01MAS",
                                   "H01WK1",
                                   "H01WK2",
                                   "H01WK3",
                                   "E01BNK",
                                   "E01ACC",
                                   "E01SQN",
                                   "E01SGR",
                                   "E01CCY",
                                   "E01CUN",
                                   "E01MA1",
                                   "E01AMN",
                                   "E01FDM",
                                   "E01FDD",
                                   "E01FDY",
                                   "E01TDM",
                                   "E01TDD",
                                   "E01TDY",
                                   "E01STS",
                                   "E01BRN",
                                   "E01DOC",
                                   "E01OBS",
                                   "E01FL1",
                                   "E01FL2",
                                   "E01US1",
                                   "E01US2",
                                   "E01TSG",
                                   "E01SG1",
                                   "E01NM1",
                                   "E01CS1",
                                   "E01SG2",
                                   "E01NM2",
                                   "E01CS2",
                                   "E01SG3",
                                   "E01NM3",
                                   "E01CS3"
                                 };
  final static String fid = "1130611112907";
  final static String rid = "4DACA8C5FFB9A";
  final static String fmtname = "EDD570001";
  final int FIELDCOUNT = 41;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH01USR = null;
  private CharacterField fieldH01PGM = null;
  private CharacterField fieldH01TIM = null;
  private CharacterField fieldH01SCR = null;
  private CharacterField fieldH01OPE = null;
  private CharacterField fieldH01MAS = null;
  private CharacterField fieldH01WK1 = null;
  private CharacterField fieldH01WK2 = null;
  private CharacterField fieldH01WK3 = null;
  private CharacterField fieldE01BNK = null;
  private DecimalField fieldE01ACC = null;
  private DecimalField fieldE01SQN = null;
  private CharacterField fieldE01SGR = null;
  private CharacterField fieldE01CCY = null;
  private DecimalField fieldE01CUN = null;
  private CharacterField fieldE01MA1 = null;
  private DecimalField fieldE01AMN = null;
  private DecimalField fieldE01FDM = null;
  private DecimalField fieldE01FDD = null;
  private DecimalField fieldE01FDY = null;
  private DecimalField fieldE01TDM = null;
  private DecimalField fieldE01TDD = null;
  private DecimalField fieldE01TDY = null;
  private CharacterField fieldE01STS = null;
  private DecimalField fieldE01BRN = null;
  private CharacterField fieldE01DOC = null;
  private CharacterField fieldE01OBS = null;
  private CharacterField fieldE01FL1 = null;
  private CharacterField fieldE01FL2 = null;
  private CharacterField fieldE01US1 = null;
  private CharacterField fieldE01US2 = null;
  private CharacterField fieldE01TSG = null;
  private DecimalField fieldE01SG1 = null;
  private CharacterField fieldE01NM1 = null;
  private CharacterField fieldE01CS1 = null;
  private DecimalField fieldE01SG2 = null;
  private CharacterField fieldE01NM2 = null;
  private CharacterField fieldE01CS2 = null;
  private DecimalField fieldE01SG3 = null;
  private CharacterField fieldE01NM3 = null;
  private CharacterField fieldE01CS3 = null;

  /**
  * Constructor for EDD570001Message.
  */
  public EDD570001Message()
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
    recordsize = 476;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH01USR =
    new CharacterField(message, HEADERSIZE + 0, 10, "H01USR");
    fields[1] = fieldH01PGM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H01PGM");
    fields[2] = fieldH01TIM =
    new CharacterField(message, HEADERSIZE + 20, 12, "H01TIM");
    fields[3] = fieldH01SCR =
    new CharacterField(message, HEADERSIZE + 32, 2, "H01SCR");
    fields[4] = fieldH01OPE =
    new CharacterField(message, HEADERSIZE + 34, 4, "H01OPE");
    fields[5] = fieldH01MAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H01MAS");
    fields[6] = fieldH01WK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H01WK1");
    fields[7] = fieldH01WK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H01WK2");
    fields[8] = fieldH01WK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H01WK3");
    fields[9] = fieldE01BNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01BNK");
    fields[10] = fieldE01ACC =
    new DecimalField(message, HEADERSIZE + 44, 13, 0, "E01ACC");
    fields[11] = fieldE01SQN =
    new DecimalField(message, HEADERSIZE + 57, 3, 0, "E01SQN");
    fields[12] = fieldE01SGR =
    new CharacterField(message, HEADERSIZE + 60, 4, "E01SGR");
    fields[13] = fieldE01CCY =
    new CharacterField(message, HEADERSIZE + 64, 3, "E01CCY");
    fields[14] = fieldE01CUN =
    new DecimalField(message, HEADERSIZE + 67, 10, 0, "E01CUN");
    fields[15] = fieldE01MA1 =
    new CharacterField(message, HEADERSIZE + 77, 60, "E01MA1");
    fields[16] = fieldE01AMN =
    new DecimalField(message, HEADERSIZE + 137, 17, 2, "E01AMN");
    fields[17] = fieldE01FDM =
    new DecimalField(message, HEADERSIZE + 154, 3, 0, "E01FDM");
    fields[18] = fieldE01FDD =
    new DecimalField(message, HEADERSIZE + 157, 3, 0, "E01FDD");
    fields[19] = fieldE01FDY =
    new DecimalField(message, HEADERSIZE + 160, 5, 0, "E01FDY");
    fields[20] = fieldE01TDM =
    new DecimalField(message, HEADERSIZE + 165, 3, 0, "E01TDM");
    fields[21] = fieldE01TDD =
    new DecimalField(message, HEADERSIZE + 168, 3, 0, "E01TDD");
    fields[22] = fieldE01TDY =
    new DecimalField(message, HEADERSIZE + 171, 5, 0, "E01TDY");
    fields[23] = fieldE01STS =
    new CharacterField(message, HEADERSIZE + 176, 1, "E01STS");
    fields[24] = fieldE01BRN =
    new DecimalField(message, HEADERSIZE + 177, 5, 0, "E01BRN");
    fields[25] = fieldE01DOC =
    new CharacterField(message, HEADERSIZE + 182, 10, "E01DOC");
    fields[26] = fieldE01OBS =
    new CharacterField(message, HEADERSIZE + 192, 60, "E01OBS");
    fields[27] = fieldE01FL1 =
    new CharacterField(message, HEADERSIZE + 252, 1, "E01FL1");
    fields[28] = fieldE01FL2 =
    new CharacterField(message, HEADERSIZE + 253, 1, "E01FL2");
    fields[29] = fieldE01US1 =
    new CharacterField(message, HEADERSIZE + 254, 4, "E01US1");
    fields[30] = fieldE01US2 =
    new CharacterField(message, HEADERSIZE + 258, 4, "E01US2");
    fields[31] = fieldE01TSG =
    new CharacterField(message, HEADERSIZE + 262, 1, "E01TSG");
    fields[32] = fieldE01SG1 =
    new DecimalField(message, HEADERSIZE + 263, 10, 0, "E01SG1");
    fields[33] = fieldE01NM1 =
    new CharacterField(message, HEADERSIZE + 273, 60, "E01NM1");
    fields[34] = fieldE01CS1 =
    new CharacterField(message, HEADERSIZE + 333, 1, "E01CS1");
    fields[35] = fieldE01SG2 =
    new DecimalField(message, HEADERSIZE + 334, 10, 0, "E01SG2");
    fields[36] = fieldE01NM2 =
    new CharacterField(message, HEADERSIZE + 344, 60, "E01NM2");
    fields[37] = fieldE01CS2 =
    new CharacterField(message, HEADERSIZE + 404, 1, "E01CS2");
    fields[38] = fieldE01SG3 =
    new DecimalField(message, HEADERSIZE + 405, 10, 0, "E01SG3");
    fields[39] = fieldE01NM3 =
    new CharacterField(message, HEADERSIZE + 415, 60, "E01NM3");
    fields[40] = fieldE01CS3 =
    new CharacterField(message, HEADERSIZE + 475, 1, "E01CS3");

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
  * Set field H01USR using a String value.
  */
  public void setH01USR(String newvalue)
  {
    fieldH01USR.setString(newvalue);
  }

  /**
  * Get value of field H01USR as a String.
  */
  public String getH01USR()
  {
    return fieldH01USR.getString();
  }

  /**
  * Set field H01PGM using a String value.
  */
  public void setH01PGM(String newvalue)
  {
    fieldH01PGM.setString(newvalue);
  }

  /**
  * Get value of field H01PGM as a String.
  */
  public String getH01PGM()
  {
    return fieldH01PGM.getString();
  }

  /**
  * Set field H01TIM using a String value.
  */
  public void setH01TIM(String newvalue)
  {
    fieldH01TIM.setString(newvalue);
  }

  /**
  * Get value of field H01TIM as a String.
  */
  public String getH01TIM()
  {
    return fieldH01TIM.getString();
  }

  /**
  * Set field H01SCR using a String value.
  */
  public void setH01SCR(String newvalue)
  {
    fieldH01SCR.setString(newvalue);
  }

  /**
  * Get value of field H01SCR as a String.
  */
  public String getH01SCR()
  {
    return fieldH01SCR.getString();
  }

  /**
  * Set field H01OPE using a String value.
  */
  public void setH01OPE(String newvalue)
  {
    fieldH01OPE.setString(newvalue);
  }

  /**
  * Get value of field H01OPE as a String.
  */
  public String getH01OPE()
  {
    return fieldH01OPE.getString();
  }

  /**
  * Set field H01MAS using a String value.
  */
  public void setH01MAS(String newvalue)
  {
    fieldH01MAS.setString(newvalue);
  }

  /**
  * Get value of field H01MAS as a String.
  */
  public String getH01MAS()
  {
    return fieldH01MAS.getString();
  }

  /**
  * Set field H01WK1 using a String value.
  */
  public void setH01WK1(String newvalue)
  {
    fieldH01WK1.setString(newvalue);
  }

  /**
  * Get value of field H01WK1 as a String.
  */
  public String getH01WK1()
  {
    return fieldH01WK1.getString();
  }

  /**
  * Set field H01WK2 using a String value.
  */
  public void setH01WK2(String newvalue)
  {
    fieldH01WK2.setString(newvalue);
  }

  /**
  * Get value of field H01WK2 as a String.
  */
  public String getH01WK2()
  {
    return fieldH01WK2.getString();
  }

  /**
  * Set field H01WK3 using a String value.
  */
  public void setH01WK3(String newvalue)
  {
    fieldH01WK3.setString(newvalue);
  }

  /**
  * Get value of field H01WK3 as a String.
  */
  public String getH01WK3()
  {
    return fieldH01WK3.getString();
  }

  /**
  * Set field E01BNK using a String value.
  */
  public void setE01BNK(String newvalue)
  {
    fieldE01BNK.setString(newvalue);
  }

  /**
  * Get value of field E01BNK as a String.
  */
  public String getE01BNK()
  {
    return fieldE01BNK.getString();
  }

  /**
  * Set field E01ACC using a String value.
  */
  public void setE01ACC(String newvalue)
  {
    fieldE01ACC.setString(newvalue);
  }

  /**
  * Get value of field E01ACC as a String.
  */
  public String getE01ACC()
  {
    return fieldE01ACC.getString();
  }

  /**
  * Set numeric field E01ACC using a BigDecimal value.
  */
  public void setE01ACC(BigDecimal newvalue)
  {
    fieldE01ACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACC()
  {
    return fieldE01ACC.getBigDecimal();
  }

  /**
  * Set field E01SQN using a String value.
  */
  public void setE01SQN(String newvalue)
  {
    fieldE01SQN.setString(newvalue);
  }

  /**
  * Get value of field E01SQN as a String.
  */
  public String getE01SQN()
  {
    return fieldE01SQN.getString();
  }

  /**
  * Set numeric field E01SQN using a BigDecimal value.
  */
  public void setE01SQN(BigDecimal newvalue)
  {
    fieldE01SQN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SQN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SQN()
  {
    return fieldE01SQN.getBigDecimal();
  }

  /**
  * Set field E01SGR using a String value.
  */
  public void setE01SGR(String newvalue)
  {
    fieldE01SGR.setString(newvalue);
  }

  /**
  * Get value of field E01SGR as a String.
  */
  public String getE01SGR()
  {
    return fieldE01SGR.getString();
  }

  /**
  * Set field E01CCY using a String value.
  */
  public void setE01CCY(String newvalue)
  {
    fieldE01CCY.setString(newvalue);
  }

  /**
  * Get value of field E01CCY as a String.
  */
  public String getE01CCY()
  {
    return fieldE01CCY.getString();
  }

  /**
  * Set field E01CUN using a String value.
  */
  public void setE01CUN(String newvalue)
  {
    fieldE01CUN.setString(newvalue);
  }

  /**
  * Get value of field E01CUN as a String.
  */
  public String getE01CUN()
  {
    return fieldE01CUN.getString();
  }

  /**
  * Set numeric field E01CUN using a BigDecimal value.
  */
  public void setE01CUN(BigDecimal newvalue)
  {
    fieldE01CUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUN()
  {
    return fieldE01CUN.getBigDecimal();
  }

  /**
  * Set field E01MA1 using a String value.
  */
  public void setE01MA1(String newvalue)
  {
    fieldE01MA1.setString(newvalue);
  }

  /**
  * Get value of field E01MA1 as a String.
  */
  public String getE01MA1()
  {
    return fieldE01MA1.getString();
  }

  /**
  * Set field E01AMN using a String value.
  */
  public void setE01AMN(String newvalue)
  {
    fieldE01AMN.setString(newvalue);
  }

  /**
  * Get value of field E01AMN as a String.
  */
  public String getE01AMN()
  {
    return fieldE01AMN.getString();
  }

  /**
  * Set numeric field E01AMN using a BigDecimal value.
  */
  public void setE01AMN(BigDecimal newvalue)
  {
    fieldE01AMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01AMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01AMN()
  {
    return fieldE01AMN.getBigDecimal();
  }

  /**
  * Set field E01FDM using a String value.
  */
  public void setE01FDM(String newvalue)
  {
    fieldE01FDM.setString(newvalue);
  }

  /**
  * Get value of field E01FDM as a String.
  */
  public String getE01FDM()
  {
    return fieldE01FDM.getString();
  }

  /**
  * Set numeric field E01FDM using a BigDecimal value.
  */
  public void setE01FDM(BigDecimal newvalue)
  {
    fieldE01FDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FDM()
  {
    return fieldE01FDM.getBigDecimal();
  }

  /**
  * Set field E01FDD using a String value.
  */
  public void setE01FDD(String newvalue)
  {
    fieldE01FDD.setString(newvalue);
  }

  /**
  * Get value of field E01FDD as a String.
  */
  public String getE01FDD()
  {
    return fieldE01FDD.getString();
  }

  /**
  * Set numeric field E01FDD using a BigDecimal value.
  */
  public void setE01FDD(BigDecimal newvalue)
  {
    fieldE01FDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FDD()
  {
    return fieldE01FDD.getBigDecimal();
  }

  /**
  * Set field E01FDY using a String value.
  */
  public void setE01FDY(String newvalue)
  {
    fieldE01FDY.setString(newvalue);
  }

  /**
  * Get value of field E01FDY as a String.
  */
  public String getE01FDY()
  {
    return fieldE01FDY.getString();
  }

  /**
  * Set numeric field E01FDY using a BigDecimal value.
  */
  public void setE01FDY(BigDecimal newvalue)
  {
    fieldE01FDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FDY()
  {
    return fieldE01FDY.getBigDecimal();
  }

  /**
  * Set field E01TDM using a String value.
  */
  public void setE01TDM(String newvalue)
  {
    fieldE01TDM.setString(newvalue);
  }

  /**
  * Get value of field E01TDM as a String.
  */
  public String getE01TDM()
  {
    return fieldE01TDM.getString();
  }

  /**
  * Set numeric field E01TDM using a BigDecimal value.
  */
  public void setE01TDM(BigDecimal newvalue)
  {
    fieldE01TDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TDM()
  {
    return fieldE01TDM.getBigDecimal();
  }

  /**
  * Set field E01TDD using a String value.
  */
  public void setE01TDD(String newvalue)
  {
    fieldE01TDD.setString(newvalue);
  }

  /**
  * Get value of field E01TDD as a String.
  */
  public String getE01TDD()
  {
    return fieldE01TDD.getString();
  }

  /**
  * Set numeric field E01TDD using a BigDecimal value.
  */
  public void setE01TDD(BigDecimal newvalue)
  {
    fieldE01TDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TDD()
  {
    return fieldE01TDD.getBigDecimal();
  }

  /**
  * Set field E01TDY using a String value.
  */
  public void setE01TDY(String newvalue)
  {
    fieldE01TDY.setString(newvalue);
  }

  /**
  * Get value of field E01TDY as a String.
  */
  public String getE01TDY()
  {
    return fieldE01TDY.getString();
  }

  /**
  * Set numeric field E01TDY using a BigDecimal value.
  */
  public void setE01TDY(BigDecimal newvalue)
  {
    fieldE01TDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TDY()
  {
    return fieldE01TDY.getBigDecimal();
  }

  /**
  * Set field E01STS using a String value.
  */
  public void setE01STS(String newvalue)
  {
    fieldE01STS.setString(newvalue);
  }

  /**
  * Get value of field E01STS as a String.
  */
  public String getE01STS()
  {
    return fieldE01STS.getString();
  }

  /**
  * Set field E01BRN using a String value.
  */
  public void setE01BRN(String newvalue)
  {
    fieldE01BRN.setString(newvalue);
  }

  /**
  * Get value of field E01BRN as a String.
  */
  public String getE01BRN()
  {
    return fieldE01BRN.getString();
  }

  /**
  * Set numeric field E01BRN using a BigDecimal value.
  */
  public void setE01BRN(BigDecimal newvalue)
  {
    fieldE01BRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRN()
  {
    return fieldE01BRN.getBigDecimal();
  }

  /**
  * Set field E01DOC using a String value.
  */
  public void setE01DOC(String newvalue)
  {
    fieldE01DOC.setString(newvalue);
  }

  /**
  * Get value of field E01DOC as a String.
  */
  public String getE01DOC()
  {
    return fieldE01DOC.getString();
  }

  /**
  * Set field E01OBS using a String value.
  */
  public void setE01OBS(String newvalue)
  {
    fieldE01OBS.setString(newvalue);
  }

  /**
  * Get value of field E01OBS as a String.
  */
  public String getE01OBS()
  {
    return fieldE01OBS.getString();
  }

  /**
  * Set field E01FL1 using a String value.
  */
  public void setE01FL1(String newvalue)
  {
    fieldE01FL1.setString(newvalue);
  }

  /**
  * Get value of field E01FL1 as a String.
  */
  public String getE01FL1()
  {
    return fieldE01FL1.getString();
  }

  /**
  * Set field E01FL2 using a String value.
  */
  public void setE01FL2(String newvalue)
  {
    fieldE01FL2.setString(newvalue);
  }

  /**
  * Get value of field E01FL2 as a String.
  */
  public String getE01FL2()
  {
    return fieldE01FL2.getString();
  }

  /**
  * Set field E01US1 using a String value.
  */
  public void setE01US1(String newvalue)
  {
    fieldE01US1.setString(newvalue);
  }

  /**
  * Get value of field E01US1 as a String.
  */
  public String getE01US1()
  {
    return fieldE01US1.getString();
  }

  /**
  * Set field E01US2 using a String value.
  */
  public void setE01US2(String newvalue)
  {
    fieldE01US2.setString(newvalue);
  }

  /**
  * Get value of field E01US2 as a String.
  */
  public String getE01US2()
  {
    return fieldE01US2.getString();
  }

  /**
  * Set field E01TSG using a String value.
  */
  public void setE01TSG(String newvalue)
  {
    fieldE01TSG.setString(newvalue);
  }

  /**
  * Get value of field E01TSG as a String.
  */
  public String getE01TSG()
  {
    return fieldE01TSG.getString();
  }

  /**
  * Set field E01SG1 using a String value.
  */
  public void setE01SG1(String newvalue)
  {
    fieldE01SG1.setString(newvalue);
  }

  /**
  * Get value of field E01SG1 as a String.
  */
  public String getE01SG1()
  {
    return fieldE01SG1.getString();
  }

  /**
  * Set numeric field E01SG1 using a BigDecimal value.
  */
  public void setE01SG1(BigDecimal newvalue)
  {
    fieldE01SG1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SG1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SG1()
  {
    return fieldE01SG1.getBigDecimal();
  }

  /**
  * Set field E01NM1 using a String value.
  */
  public void setE01NM1(String newvalue)
  {
    fieldE01NM1.setString(newvalue);
  }

  /**
  * Get value of field E01NM1 as a String.
  */
  public String getE01NM1()
  {
    return fieldE01NM1.getString();
  }

  /**
  * Set field E01CS1 using a String value.
  */
  public void setE01CS1(String newvalue)
  {
    fieldE01CS1.setString(newvalue);
  }

  /**
  * Get value of field E01CS1 as a String.
  */
  public String getE01CS1()
  {
    return fieldE01CS1.getString();
  }

  /**
  * Set field E01SG2 using a String value.
  */
  public void setE01SG2(String newvalue)
  {
    fieldE01SG2.setString(newvalue);
  }

  /**
  * Get value of field E01SG2 as a String.
  */
  public String getE01SG2()
  {
    return fieldE01SG2.getString();
  }

  /**
  * Set numeric field E01SG2 using a BigDecimal value.
  */
  public void setE01SG2(BigDecimal newvalue)
  {
    fieldE01SG2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SG2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SG2()
  {
    return fieldE01SG2.getBigDecimal();
  }

  /**
  * Set field E01NM2 using a String value.
  */
  public void setE01NM2(String newvalue)
  {
    fieldE01NM2.setString(newvalue);
  }

  /**
  * Get value of field E01NM2 as a String.
  */
  public String getE01NM2()
  {
    return fieldE01NM2.getString();
  }

  /**
  * Set field E01CS2 using a String value.
  */
  public void setE01CS2(String newvalue)
  {
    fieldE01CS2.setString(newvalue);
  }

  /**
  * Get value of field E01CS2 as a String.
  */
  public String getE01CS2()
  {
    return fieldE01CS2.getString();
  }

  /**
  * Set field E01SG3 using a String value.
  */
  public void setE01SG3(String newvalue)
  {
    fieldE01SG3.setString(newvalue);
  }

  /**
  * Get value of field E01SG3 as a String.
  */
  public String getE01SG3()
  {
    return fieldE01SG3.getString();
  }

  /**
  * Set numeric field E01SG3 using a BigDecimal value.
  */
  public void setE01SG3(BigDecimal newvalue)
  {
    fieldE01SG3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SG3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SG3()
  {
    return fieldE01SG3.getBigDecimal();
  }

  /**
  * Set field E01NM3 using a String value.
  */
  public void setE01NM3(String newvalue)
  {
    fieldE01NM3.setString(newvalue);
  }

  /**
  * Get value of field E01NM3 as a String.
  */
  public String getE01NM3()
  {
    return fieldE01NM3.getString();
  }

  /**
  * Set field E01CS3 using a String value.
  */
  public void setE01CS3(String newvalue)
  {
    fieldE01CS3.setString(newvalue);
  }

  /**
  * Get value of field E01CS3 as a String.
  */
  public String getE01CS3()
  {
    return fieldE01CS3.getString();
  }

}
