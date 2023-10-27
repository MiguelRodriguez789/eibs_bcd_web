package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL154003 physical file definition.
* 
* File level identifier is 1210716153809.
* Record format level identifier is 4350A7FD093F4.
*/

public class EDL154003Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H03USERID",
                                     "H03PROGRM",
                                     "H03TIMSYS",
                                     "H03SCRCOD",
                                     "H03OPECOD",
                                     "H03FLGMAS",
                                     "H03FLGWK1",
                                     "H03FLGWK2",
                                     "H03FLGWK3",
                                     "E03BNK",
                                     "E03CDE",
                                     "E03VDY",
                                     "E03VDM",
                                     "E03VDD",
                                     "E03EXP",
                                     "E03PRC",
                                     "E03CMM",
                                     "E03CMD",
                                     "E03CMY",
                                     "E03CTM",
                                     "E03CUS",
                                     "E03LMM",
                                     "E03LMD",
                                     "E03LMY",
                                     "E03LMT",
                                     "E03LMU",
                                     "E03NUMREC",
                                     "E03INDOPE"
                                   };
  final static String tnames[] = {
                                   "H03USERID",
                                   "H03PROGRM",
                                   "H03TIMSYS",
                                   "H03SCRCOD",
                                   "H03OPECOD",
                                   "H03FLGMAS",
                                   "H03FLGWK1",
                                   "H03FLGWK2",
                                   "H03FLGWK3",
                                   "E03BNK",
                                   "E03CDE",
                                   "E03VDY",
                                   "E03VDM",
                                   "E03VDD",
                                   "E03EXP",
                                   "E03PRC",
                                   "E03CMM",
                                   "E03CMD",
                                   "E03CMY",
                                   "E03CTM",
                                   "E03CUS",
                                   "E03LMM",
                                   "E03LMD",
                                   "E03LMY",
                                   "E03LMT",
                                   "E03LMU",
                                   "E03NUMREC",
                                   "E03INDOPE"
                                 };
  final static String fid = "1210716153809";
  final static String rid = "4350A7FD093F4";
  final static String fmtname = "EDL154003";
  final int FIELDCOUNT = 28;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH03USERID = null;
  private CharacterField fieldH03PROGRM = null;
  private CharacterField fieldH03TIMSYS = null;
  private CharacterField fieldH03SCRCOD = null;
  private CharacterField fieldH03OPECOD = null;
  private CharacterField fieldH03FLGMAS = null;
  private CharacterField fieldH03FLGWK1 = null;
  private CharacterField fieldH03FLGWK2 = null;
  private CharacterField fieldH03FLGWK3 = null;
  private CharacterField fieldE03BNK = null;
  private CharacterField fieldE03CDE = null;
  private DecimalField fieldE03VDY = null;
  private DecimalField fieldE03VDM = null;
  private DecimalField fieldE03VDD = null;
  private CharacterField fieldE03EXP = null;
  private DecimalField fieldE03PRC = null;
  private DecimalField fieldE03CMM = null;
  private DecimalField fieldE03CMD = null;
  private DecimalField fieldE03CMY = null;
  private CharacterField fieldE03CTM = null;
  private CharacterField fieldE03CUS = null;
  private DecimalField fieldE03LMM = null;
  private DecimalField fieldE03LMD = null;
  private DecimalField fieldE03LMY = null;
  private CharacterField fieldE03LMT = null;
  private CharacterField fieldE03LMU = null;
  private DecimalField fieldE03NUMREC = null;
  private CharacterField fieldE03INDOPE = null;

  /**
  * Constructor for EDL154003Message.
  */
  public EDL154003Message()
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
    recordsize = 174;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH03USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H03USERID");
    fields[1] = fieldH03PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H03PROGRM");
    fields[2] = fieldH03TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H03TIMSYS");
    fields[3] = fieldH03SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H03SCRCOD");
    fields[4] = fieldH03OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H03OPECOD");
    fields[5] = fieldH03FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H03FLGMAS");
    fields[6] = fieldH03FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H03FLGWK1");
    fields[7] = fieldH03FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H03FLGWK2");
    fields[8] = fieldH03FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H03FLGWK3");
    fields[9] = fieldE03BNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E03BNK");
    fields[10] = fieldE03CDE =
    new CharacterField(message, HEADERSIZE + 44, 4, "E03CDE");
    fields[11] = fieldE03VDY =
    new DecimalField(message, HEADERSIZE + 48, 5, 0, "E03VDY");
    fields[12] = fieldE03VDM =
    new DecimalField(message, HEADERSIZE + 53, 3, 0, "E03VDM");
    fields[13] = fieldE03VDD =
    new DecimalField(message, HEADERSIZE + 56, 3, 0, "E03VDD");
    fields[14] = fieldE03EXP =
    new CharacterField(message, HEADERSIZE + 59, 1, "E03EXP");
    fields[15] = fieldE03PRC =
    new DecimalField(message, HEADERSIZE + 60, 11, 6, "E03PRC");
    fields[16] = fieldE03CMM =
    new DecimalField(message, HEADERSIZE + 71, 3, 0, "E03CMM");
    fields[17] = fieldE03CMD =
    new DecimalField(message, HEADERSIZE + 74, 3, 0, "E03CMD");
    fields[18] = fieldE03CMY =
    new DecimalField(message, HEADERSIZE + 77, 5, 0, "E03CMY");
    fields[19] = fieldE03CTM =
    new CharacterField(message, HEADERSIZE + 82, 26, "E03CTM");
    fields[20] = fieldE03CUS =
    new CharacterField(message, HEADERSIZE + 108, 10, "E03CUS");
    fields[21] = fieldE03LMM =
    new DecimalField(message, HEADERSIZE + 118, 3, 0, "E03LMM");
    fields[22] = fieldE03LMD =
    new DecimalField(message, HEADERSIZE + 121, 3, 0, "E03LMD");
    fields[23] = fieldE03LMY =
    new DecimalField(message, HEADERSIZE + 124, 5, 0, "E03LMY");
    fields[24] = fieldE03LMT =
    new CharacterField(message, HEADERSIZE + 129, 26, "E03LMT");
    fields[25] = fieldE03LMU =
    new CharacterField(message, HEADERSIZE + 155, 10, "E03LMU");
    fields[26] = fieldE03NUMREC =
    new DecimalField(message, HEADERSIZE + 165, 8, 0, "E03NUMREC");
    fields[27] = fieldE03INDOPE =
    new CharacterField(message, HEADERSIZE + 173, 1, "E03INDOPE");

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
  * Set field H03USERID using a String value.
  */
  public void setH03USERID(String newvalue)
  {
    fieldH03USERID.setString(newvalue);
  }

  /**
  * Get value of field H03USERID as a String.
  */
  public String getH03USERID()
  {
    return fieldH03USERID.getString();
  }

  /**
  * Set field H03PROGRM using a String value.
  */
  public void setH03PROGRM(String newvalue)
  {
    fieldH03PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H03PROGRM as a String.
  */
  public String getH03PROGRM()
  {
    return fieldH03PROGRM.getString();
  }

  /**
  * Set field H03TIMSYS using a String value.
  */
  public void setH03TIMSYS(String newvalue)
  {
    fieldH03TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H03TIMSYS as a String.
  */
  public String getH03TIMSYS()
  {
    return fieldH03TIMSYS.getString();
  }

  /**
  * Set field H03SCRCOD using a String value.
  */
  public void setH03SCRCOD(String newvalue)
  {
    fieldH03SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H03SCRCOD as a String.
  */
  public String getH03SCRCOD()
  {
    return fieldH03SCRCOD.getString();
  }

  /**
  * Set field H03OPECOD using a String value.
  */
  public void setH03OPECOD(String newvalue)
  {
    fieldH03OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H03OPECOD as a String.
  */
  public String getH03OPECOD()
  {
    return fieldH03OPECOD.getString();
  }

  /**
  * Set field H03FLGMAS using a String value.
  */
  public void setH03FLGMAS(String newvalue)
  {
    fieldH03FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H03FLGMAS as a String.
  */
  public String getH03FLGMAS()
  {
    return fieldH03FLGMAS.getString();
  }

  /**
  * Set field H03FLGWK1 using a String value.
  */
  public void setH03FLGWK1(String newvalue)
  {
    fieldH03FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK1 as a String.
  */
  public String getH03FLGWK1()
  {
    return fieldH03FLGWK1.getString();
  }

  /**
  * Set field H03FLGWK2 using a String value.
  */
  public void setH03FLGWK2(String newvalue)
  {
    fieldH03FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK2 as a String.
  */
  public String getH03FLGWK2()
  {
    return fieldH03FLGWK2.getString();
  }

  /**
  * Set field H03FLGWK3 using a String value.
  */
  public void setH03FLGWK3(String newvalue)
  {
    fieldH03FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK3 as a String.
  */
  public String getH03FLGWK3()
  {
    return fieldH03FLGWK3.getString();
  }

  /**
  * Set field E03BNK using a String value.
  */
  public void setE03BNK(String newvalue)
  {
    fieldE03BNK.setString(newvalue);
  }

  /**
  * Get value of field E03BNK as a String.
  */
  public String getE03BNK()
  {
    return fieldE03BNK.getString();
  }

  /**
  * Set field E03CDE using a String value.
  */
  public void setE03CDE(String newvalue)
  {
    fieldE03CDE.setString(newvalue);
  }

  /**
  * Get value of field E03CDE as a String.
  */
  public String getE03CDE()
  {
    return fieldE03CDE.getString();
  }

  /**
  * Set field E03VDY using a String value.
  */
  public void setE03VDY(String newvalue)
  {
    fieldE03VDY.setString(newvalue);
  }

  /**
  * Get value of field E03VDY as a String.
  */
  public String getE03VDY()
  {
    return fieldE03VDY.getString();
  }

  /**
  * Set numeric field E03VDY using a BigDecimal value.
  */
  public void setE03VDY(BigDecimal newvalue)
  {
    fieldE03VDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03VDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03VDY()
  {
    return fieldE03VDY.getBigDecimal();
  }

  /**
  * Set field E03VDM using a String value.
  */
  public void setE03VDM(String newvalue)
  {
    fieldE03VDM.setString(newvalue);
  }

  /**
  * Get value of field E03VDM as a String.
  */
  public String getE03VDM()
  {
    return fieldE03VDM.getString();
  }

  /**
  * Set numeric field E03VDM using a BigDecimal value.
  */
  public void setE03VDM(BigDecimal newvalue)
  {
    fieldE03VDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03VDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03VDM()
  {
    return fieldE03VDM.getBigDecimal();
  }

  /**
  * Set field E03VDD using a String value.
  */
  public void setE03VDD(String newvalue)
  {
    fieldE03VDD.setString(newvalue);
  }

  /**
  * Get value of field E03VDD as a String.
  */
  public String getE03VDD()
  {
    return fieldE03VDD.getString();
  }

  /**
  * Set numeric field E03VDD using a BigDecimal value.
  */
  public void setE03VDD(BigDecimal newvalue)
  {
    fieldE03VDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03VDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03VDD()
  {
    return fieldE03VDD.getBigDecimal();
  }

  /**
  * Set field E03EXP using a String value.
  */
  public void setE03EXP(String newvalue)
  {
    fieldE03EXP.setString(newvalue);
  }

  /**
  * Get value of field E03EXP as a String.
  */
  public String getE03EXP()
  {
    return fieldE03EXP.getString();
  }

  /**
  * Set field E03PRC using a String value.
  */
  public void setE03PRC(String newvalue)
  {
    fieldE03PRC.setString(newvalue);
  }

  /**
  * Get value of field E03PRC as a String.
  */
  public String getE03PRC()
  {
    return fieldE03PRC.getString();
  }

  /**
  * Set numeric field E03PRC using a BigDecimal value.
  */
  public void setE03PRC(BigDecimal newvalue)
  {
    fieldE03PRC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PRC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PRC()
  {
    return fieldE03PRC.getBigDecimal();
  }

  /**
  * Set field E03CMM using a String value.
  */
  public void setE03CMM(String newvalue)
  {
    fieldE03CMM.setString(newvalue);
  }

  /**
  * Get value of field E03CMM as a String.
  */
  public String getE03CMM()
  {
    return fieldE03CMM.getString();
  }

  /**
  * Set numeric field E03CMM using a BigDecimal value.
  */
  public void setE03CMM(BigDecimal newvalue)
  {
    fieldE03CMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03CMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03CMM()
  {
    return fieldE03CMM.getBigDecimal();
  }

  /**
  * Set field E03CMD using a String value.
  */
  public void setE03CMD(String newvalue)
  {
    fieldE03CMD.setString(newvalue);
  }

  /**
  * Get value of field E03CMD as a String.
  */
  public String getE03CMD()
  {
    return fieldE03CMD.getString();
  }

  /**
  * Set numeric field E03CMD using a BigDecimal value.
  */
  public void setE03CMD(BigDecimal newvalue)
  {
    fieldE03CMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03CMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03CMD()
  {
    return fieldE03CMD.getBigDecimal();
  }

  /**
  * Set field E03CMY using a String value.
  */
  public void setE03CMY(String newvalue)
  {
    fieldE03CMY.setString(newvalue);
  }

  /**
  * Get value of field E03CMY as a String.
  */
  public String getE03CMY()
  {
    return fieldE03CMY.getString();
  }

  /**
  * Set numeric field E03CMY using a BigDecimal value.
  */
  public void setE03CMY(BigDecimal newvalue)
  {
    fieldE03CMY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03CMY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03CMY()
  {
    return fieldE03CMY.getBigDecimal();
  }

  /**
  * Set field E03CTM using a String value.
  */
  public void setE03CTM(String newvalue)
  {
    fieldE03CTM.setString(newvalue);
  }

  /**
  * Get value of field E03CTM as a String.
  */
  public String getE03CTM()
  {
    return fieldE03CTM.getString();
  }

  /**
  * Set field E03CUS using a String value.
  */
  public void setE03CUS(String newvalue)
  {
    fieldE03CUS.setString(newvalue);
  }

  /**
  * Get value of field E03CUS as a String.
  */
  public String getE03CUS()
  {
    return fieldE03CUS.getString();
  }

  /**
  * Set field E03LMM using a String value.
  */
  public void setE03LMM(String newvalue)
  {
    fieldE03LMM.setString(newvalue);
  }

  /**
  * Get value of field E03LMM as a String.
  */
  public String getE03LMM()
  {
    return fieldE03LMM.getString();
  }

  /**
  * Set numeric field E03LMM using a BigDecimal value.
  */
  public void setE03LMM(BigDecimal newvalue)
  {
    fieldE03LMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03LMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03LMM()
  {
    return fieldE03LMM.getBigDecimal();
  }

  /**
  * Set field E03LMD using a String value.
  */
  public void setE03LMD(String newvalue)
  {
    fieldE03LMD.setString(newvalue);
  }

  /**
  * Get value of field E03LMD as a String.
  */
  public String getE03LMD()
  {
    return fieldE03LMD.getString();
  }

  /**
  * Set numeric field E03LMD using a BigDecimal value.
  */
  public void setE03LMD(BigDecimal newvalue)
  {
    fieldE03LMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03LMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03LMD()
  {
    return fieldE03LMD.getBigDecimal();
  }

  /**
  * Set field E03LMY using a String value.
  */
  public void setE03LMY(String newvalue)
  {
    fieldE03LMY.setString(newvalue);
  }

  /**
  * Get value of field E03LMY as a String.
  */
  public String getE03LMY()
  {
    return fieldE03LMY.getString();
  }

  /**
  * Set numeric field E03LMY using a BigDecimal value.
  */
  public void setE03LMY(BigDecimal newvalue)
  {
    fieldE03LMY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03LMY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03LMY()
  {
    return fieldE03LMY.getBigDecimal();
  }

  /**
  * Set field E03LMT using a String value.
  */
  public void setE03LMT(String newvalue)
  {
    fieldE03LMT.setString(newvalue);
  }

  /**
  * Get value of field E03LMT as a String.
  */
  public String getE03LMT()
  {
    return fieldE03LMT.getString();
  }

  /**
  * Set field E03LMU using a String value.
  */
  public void setE03LMU(String newvalue)
  {
    fieldE03LMU.setString(newvalue);
  }

  /**
  * Get value of field E03LMU as a String.
  */
  public String getE03LMU()
  {
    return fieldE03LMU.getString();
  }

  /**
  * Set field E03NUMREC using a String value.
  */
  public void setE03NUMREC(String newvalue)
  {
    fieldE03NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E03NUMREC as a String.
  */
  public String getE03NUMREC()
  {
    return fieldE03NUMREC.getString();
  }

  /**
  * Set numeric field E03NUMREC using a BigDecimal value.
  */
  public void setE03NUMREC(BigDecimal newvalue)
  {
    fieldE03NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03NUMREC()
  {
    return fieldE03NUMREC.getBigDecimal();
  }

  /**
  * Set field E03INDOPE using a String value.
  */
  public void setE03INDOPE(String newvalue)
  {
    fieldE03INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E03INDOPE as a String.
  */
  public String getE03INDOPE()
  {
    return fieldE03INDOPE.getString();
  }

}