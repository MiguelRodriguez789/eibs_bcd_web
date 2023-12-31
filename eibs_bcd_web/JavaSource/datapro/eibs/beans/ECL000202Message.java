package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECL000202 physical file definition.
* 
* File level identifier is 1100706173539.
* Record format level identifier is 4A07986D8648E.
*/

public class ECL000202Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H02USERID",
                                     "H02PROGRM",
                                     "H02TIMSYS",
                                     "H02SCRCOD",
                                     "H02OPECOD",
                                     "H02FLGMAS",
                                     "H02FLGWK1",
                                     "H02FLGWK2",
                                     "H02FLGWK3",
                                     "SDDIDN",
                                     "SDDCUN",
                                     "SDDATY",
                                     "SDDPRD",
                                     "SDDCTA",
                                     "SDDMA2",
                                     "SDDMA3",
                                     "SDDMA4",
                                     "SDDSTE",
                                     "SDDCTY",
                                     "SDDCTR",
                                     "SDDUAA",
                                     "SDDUMM",
                                     "SDDUDD",
                                     "SDDXRT"
                                   };
  final static String tnames[] = {
                                   "H02USERID",
                                   "H02PROGRM",
                                   "H02TIMSYS",
                                   "H02SCRCOD",
                                   "H02OPECOD",
                                   "H02FLGMAS",
                                   "H02FLGWK1",
                                   "H02FLGWK2",
                                   "H02FLGWK3",
                                   "SDDIDN",
                                   "SDDCUN",
                                   "SDDATY",
                                   "SDDPRD",
                                   "SDDCTA",
                                   "SDDMA2",
                                   "SDDMA3",
                                   "SDDMA4",
                                   "SDDSTE",
                                   "SDDCTY",
                                   "SDDCTR",
                                   "SDDUAA",
                                   "SDDUMM",
                                   "SDDUDD",
                                   "SDDXRT"
                                 };
  final static String fid = "1100706173539";
  final static String rid = "4A07986D8648E";
  final static String fmtname = "ECL000202";
  final int FIELDCOUNT = 24;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH02USERID = null;
  private CharacterField fieldH02PROGRM = null;
  private CharacterField fieldH02TIMSYS = null;
  private CharacterField fieldH02SCRCOD = null;
  private CharacterField fieldH02OPECOD = null;
  private CharacterField fieldH02FLGMAS = null;
  private CharacterField fieldH02FLGWK1 = null;
  private CharacterField fieldH02FLGWK2 = null;
  private CharacterField fieldH02FLGWK3 = null;
  private CharacterField fieldSDDIDN = null;
  private DecimalField fieldSDDCUN = null;
  private CharacterField fieldSDDATY = null;
  private CharacterField fieldSDDPRD = null;
  private DecimalField fieldSDDCTA = null;
  private CharacterField fieldSDDMA2 = null;
  private CharacterField fieldSDDMA3 = null;
  private CharacterField fieldSDDMA4 = null;
  private CharacterField fieldSDDSTE = null;
  private CharacterField fieldSDDCTY = null;
  private CharacterField fieldSDDCTR = null;
  private CharacterField fieldSDDUAA = null;
  private CharacterField fieldSDDUMM = null;
  private CharacterField fieldSDDUDD = null;
  private DecimalField fieldSDDXRT = null;

  /**
  * Constructor for ECL000202Message.
  */
  public ECL000202Message()
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
    recordsize = 213;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH02USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H02USERID");
    fields[1] = fieldH02PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H02PROGRM");
    fields[2] = fieldH02TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H02TIMSYS");
    fields[3] = fieldH02SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H02SCRCOD");
    fields[4] = fieldH02OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H02OPECOD");
    fields[5] = fieldH02FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H02FLGMAS");
    fields[6] = fieldH02FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H02FLGWK1");
    fields[7] = fieldH02FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H02FLGWK2");
    fields[8] = fieldH02FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H02FLGWK3");
    fields[9] = fieldSDDIDN =
    new CharacterField(message, HEADERSIZE + 42, 15, "SDDIDN");
    fields[10] = fieldSDDCUN =
    new DecimalField(message, HEADERSIZE + 57, 10, 0, "SDDCUN");
    fields[11] = fieldSDDATY =
    new CharacterField(message, HEADERSIZE + 67, 4, "SDDATY");
    fields[12] = fieldSDDPRD =
    new CharacterField(message, HEADERSIZE + 71, 4, "SDDPRD");
    fields[13] = fieldSDDCTA =
    new DecimalField(message, HEADERSIZE + 75, 13, 0, "SDDCTA");
    fields[14] = fieldSDDMA2 =
    new CharacterField(message, HEADERSIZE + 88, 35, "SDDMA2");
    fields[15] = fieldSDDMA3 =
    new CharacterField(message, HEADERSIZE + 123, 35, "SDDMA3");
    fields[16] = fieldSDDMA4 =
    new CharacterField(message, HEADERSIZE + 158, 35, "SDDMA4");
    fields[17] = fieldSDDSTE =
    new CharacterField(message, HEADERSIZE + 193, 4, "SDDSTE");
    fields[18] = fieldSDDCTY =
    new CharacterField(message, HEADERSIZE + 197, 4, "SDDCTY");
    fields[19] = fieldSDDCTR =
    new CharacterField(message, HEADERSIZE + 201, 4, "SDDCTR");
    fields[20] = fieldSDDUAA =
    new CharacterField(message, HEADERSIZE + 205, 2, "SDDUAA");
    fields[21] = fieldSDDUMM =
    new CharacterField(message, HEADERSIZE + 207, 2, "SDDUMM");
    fields[22] = fieldSDDUDD =
    new CharacterField(message, HEADERSIZE + 209, 2, "SDDUDD");
    fields[23] = fieldSDDXRT =
    new DecimalField(message, HEADERSIZE + 211, 2, 0, "SDDXRT");

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
  * Set field H02USERID using a String value.
  */
  public void setH02USERID(String newvalue)
  {
    fieldH02USERID.setString(newvalue);
  }

  /**
  * Get value of field H02USERID as a String.
  */
  public String getH02USERID()
  {
    return fieldH02USERID.getString();
  }

  /**
  * Set field H02PROGRM using a String value.
  */
  public void setH02PROGRM(String newvalue)
  {
    fieldH02PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H02PROGRM as a String.
  */
  public String getH02PROGRM()
  {
    return fieldH02PROGRM.getString();
  }

  /**
  * Set field H02TIMSYS using a String value.
  */
  public void setH02TIMSYS(String newvalue)
  {
    fieldH02TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H02TIMSYS as a String.
  */
  public String getH02TIMSYS()
  {
    return fieldH02TIMSYS.getString();
  }

  /**
  * Set field H02SCRCOD using a String value.
  */
  public void setH02SCRCOD(String newvalue)
  {
    fieldH02SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H02SCRCOD as a String.
  */
  public String getH02SCRCOD()
  {
    return fieldH02SCRCOD.getString();
  }

  /**
  * Set field H02OPECOD using a String value.
  */
  public void setH02OPECOD(String newvalue)
  {
    fieldH02OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H02OPECOD as a String.
  */
  public String getH02OPECOD()
  {
    return fieldH02OPECOD.getString();
  }

  /**
  * Set field H02FLGMAS using a String value.
  */
  public void setH02FLGMAS(String newvalue)
  {
    fieldH02FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H02FLGMAS as a String.
  */
  public String getH02FLGMAS()
  {
    return fieldH02FLGMAS.getString();
  }

  /**
  * Set field H02FLGWK1 using a String value.
  */
  public void setH02FLGWK1(String newvalue)
  {
    fieldH02FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK1 as a String.
  */
  public String getH02FLGWK1()
  {
    return fieldH02FLGWK1.getString();
  }

  /**
  * Set field H02FLGWK2 using a String value.
  */
  public void setH02FLGWK2(String newvalue)
  {
    fieldH02FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK2 as a String.
  */
  public String getH02FLGWK2()
  {
    return fieldH02FLGWK2.getString();
  }

  /**
  * Set field H02FLGWK3 using a String value.
  */
  public void setH02FLGWK3(String newvalue)
  {
    fieldH02FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK3 as a String.
  */
  public String getH02FLGWK3()
  {
    return fieldH02FLGWK3.getString();
  }

  /**
  * Set field SDDIDN using a String value.
  */
  public void setSDDIDN(String newvalue)
  {
    fieldSDDIDN.setString(newvalue);
  }

  /**
  * Get value of field SDDIDN as a String.
  */
  public String getSDDIDN()
  {
    return fieldSDDIDN.getString();
  }

  /**
  * Set field SDDCUN using a String value.
  */
  public void setSDDCUN(String newvalue)
  {
    fieldSDDCUN.setString(newvalue);
  }

  /**
  * Get value of field SDDCUN as a String.
  */
  public String getSDDCUN()
  {
    return fieldSDDCUN.getString();
  }

  /**
  * Set numeric field SDDCUN using a BigDecimal value.
  */
  public void setSDDCUN(BigDecimal newvalue)
  {
    fieldSDDCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SDDCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalSDDCUN()
  {
    return fieldSDDCUN.getBigDecimal();
  }

  /**
  * Set field SDDATY using a String value.
  */
  public void setSDDATY(String newvalue)
  {
    fieldSDDATY.setString(newvalue);
  }

  /**
  * Get value of field SDDATY as a String.
  */
  public String getSDDATY()
  {
    return fieldSDDATY.getString();
  }

  /**
  * Set field SDDPRD using a String value.
  */
  public void setSDDPRD(String newvalue)
  {
    fieldSDDPRD.setString(newvalue);
  }

  /**
  * Get value of field SDDPRD as a String.
  */
  public String getSDDPRD()
  {
    return fieldSDDPRD.getString();
  }

  /**
  * Set field SDDCTA using a String value.
  */
  public void setSDDCTA(String newvalue)
  {
    fieldSDDCTA.setString(newvalue);
  }

  /**
  * Get value of field SDDCTA as a String.
  */
  public String getSDDCTA()
  {
    return fieldSDDCTA.getString();
  }

  /**
  * Set numeric field SDDCTA using a BigDecimal value.
  */
  public void setSDDCTA(BigDecimal newvalue)
  {
    fieldSDDCTA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SDDCTA as a BigDecimal.
  */
  public BigDecimal getBigDecimalSDDCTA()
  {
    return fieldSDDCTA.getBigDecimal();
  }

  /**
  * Set field SDDMA2 using a String value.
  */
  public void setSDDMA2(String newvalue)
  {
    fieldSDDMA2.setString(newvalue);
  }

  /**
  * Get value of field SDDMA2 as a String.
  */
  public String getSDDMA2()
  {
    return fieldSDDMA2.getString();
  }

  /**
  * Set field SDDMA3 using a String value.
  */
  public void setSDDMA3(String newvalue)
  {
    fieldSDDMA3.setString(newvalue);
  }

  /**
  * Get value of field SDDMA3 as a String.
  */
  public String getSDDMA3()
  {
    return fieldSDDMA3.getString();
  }

  /**
  * Set field SDDMA4 using a String value.
  */
  public void setSDDMA4(String newvalue)
  {
    fieldSDDMA4.setString(newvalue);
  }

  /**
  * Get value of field SDDMA4 as a String.
  */
  public String getSDDMA4()
  {
    return fieldSDDMA4.getString();
  }

  /**
  * Set field SDDSTE using a String value.
  */
  public void setSDDSTE(String newvalue)
  {
    fieldSDDSTE.setString(newvalue);
  }

  /**
  * Get value of field SDDSTE as a String.
  */
  public String getSDDSTE()
  {
    return fieldSDDSTE.getString();
  }

  /**
  * Set field SDDCTY using a String value.
  */
  public void setSDDCTY(String newvalue)
  {
    fieldSDDCTY.setString(newvalue);
  }

  /**
  * Get value of field SDDCTY as a String.
  */
  public String getSDDCTY()
  {
    return fieldSDDCTY.getString();
  }

  /**
  * Set field SDDCTR using a String value.
  */
  public void setSDDCTR(String newvalue)
  {
    fieldSDDCTR.setString(newvalue);
  }

  /**
  * Get value of field SDDCTR as a String.
  */
  public String getSDDCTR()
  {
    return fieldSDDCTR.getString();
  }

  /**
  * Set field SDDUAA using a String value.
  */
  public void setSDDUAA(String newvalue)
  {
    fieldSDDUAA.setString(newvalue);
  }

  /**
  * Get value of field SDDUAA as a String.
  */
  public String getSDDUAA()
  {
    return fieldSDDUAA.getString();
  }

  /**
  * Set field SDDUMM using a String value.
  */
  public void setSDDUMM(String newvalue)
  {
    fieldSDDUMM.setString(newvalue);
  }

  /**
  * Get value of field SDDUMM as a String.
  */
  public String getSDDUMM()
  {
    return fieldSDDUMM.getString();
  }

  /**
  * Set field SDDUDD using a String value.
  */
  public void setSDDUDD(String newvalue)
  {
    fieldSDDUDD.setString(newvalue);
  }

  /**
  * Get value of field SDDUDD as a String.
  */
  public String getSDDUDD()
  {
    return fieldSDDUDD.getString();
  }

  /**
  * Set field SDDXRT using a String value.
  */
  public void setSDDXRT(String newvalue)
  {
    fieldSDDXRT.setString(newvalue);
  }

  /**
  * Get value of field SDDXRT as a String.
  */
  public String getSDDXRT()
  {
    return fieldSDDXRT.getString();
  }

  /**
  * Set numeric field SDDXRT using a BigDecimal value.
  */
  public void setSDDXRT(BigDecimal newvalue)
  {
    fieldSDDXRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field SDDXRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalSDDXRT()
  {
    return fieldSDDXRT.getBigDecimal();
  }

}
