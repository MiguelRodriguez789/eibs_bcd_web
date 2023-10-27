package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD109001 physical file definition.
* 
* File level identifier is 1180330160611.
* Record format level identifier is 2D22CFF528915.
*/

public class ESD109001Message extends MessageRecord
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
                                     "E01BNK",
                                     "E01LDV",
                                     "E01LDA",
                                     "E01KIL",
                                     "E01EAD",
                                     "E01EMB",
                                     "E01TTR",
                                     "E01TTE",
                                     "E01TTC",
                                     "E01TTF",
                                     "E01TAV",
                                     "E01TAI",
                                     "E01TDO",
                                     "E01TDP",
                                     "E01PFD",
                                     "E01PFF",
                                     "E01PFG",
                                     "E01JFD",
                                     "E01JFF",
                                     "E01JFG",
                                     "D01LDV",
                                     "D01LDA",
                                     "D01KIL",
                                     "D01EAD",
                                     "D01EMB",
                                     "D01TTR",
                                     "D01TTE",
                                     "D01TTC",
                                     "D01TTF",
                                     "D01TAV",
                                     "D01TAI",
                                     "D01TDO",
                                     "D01TDP",
                                     "F01LDV",
                                     "F01LDA",
                                     "F01KIL",
                                     "F01EAD",
                                     "F01EMB",
                                     "F01TTR",
                                     "F01TTE",
                                     "F01TTC",
                                     "F01TTF",
                                     "F01TAV",
                                     "F01TAI",
                                     "F01TDO",
                                     "F01TDP",
                                     "F01PFD",
                                     "F01PFF",
                                     "F01PFG",
                                     "F01JFD",
                                     "F01JFF",
                                     "F01JFG",
                                     "E01ACT",
                                     "E01NUMREC",
                                     "E01INDOPE"
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
                                   "E01BNK",
                                   "E01LDV",
                                   "E01LDA",
                                   "E01KIL",
                                   "E01EAD",
                                   "E01EMB",
                                   "E01TTR",
                                   "E01TTE",
                                   "E01TTC",
                                   "E01TTF",
                                   "E01TAV",
                                   "E01TAI",
                                   "E01TDO",
                                   "E01TDP",
                                   "E01PFD",
                                   "E01PFF",
                                   "E01PFG",
                                   "E01JFD",
                                   "E01JFF",
                                   "E01JFG",
                                   "D01LDV",
                                   "D01LDA",
                                   "D01KIL",
                                   "D01EAD",
                                   "D01EMB",
                                   "D01TTR",
                                   "D01TTE",
                                   "D01TTC",
                                   "D01TTF",
                                   "D01TAV",
                                   "D01TAI",
                                   "D01TDO",
                                   "D01TDP",
                                   "F01LDV",
                                   "F01LDA",
                                   "F01KIL",
                                   "F01EAD",
                                   "F01EMB",
                                   "F01TTR",
                                   "F01TTE",
                                   "F01TTC",
                                   "F01TTF",
                                   "F01TAV",
                                   "F01TAI",
                                   "F01TDO",
                                   "F01TDP",
                                   "F01PFD",
                                   "F01PFF",
                                   "F01PFG",
                                   "F01JFD",
                                   "F01JFF",
                                   "F01JFG",
                                   "E01ACT",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1180330160611";
  final static String rid = "2D22CFF528915";
  final static String fmtname = "ESD109001";
  final int FIELDCOUNT = 64;
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
  private CharacterField fieldE01BNK = null;
  private CharacterField fieldE01LDV = null;
  private CharacterField fieldE01LDA = null;
  private CharacterField fieldE01KIL = null;
  private CharacterField fieldE01EAD = null;
  private CharacterField fieldE01EMB = null;
  private CharacterField fieldE01TTR = null;
  private CharacterField fieldE01TTE = null;
  private CharacterField fieldE01TTC = null;
  private CharacterField fieldE01TTF = null;
  private CharacterField fieldE01TAV = null;
  private CharacterField fieldE01TAI = null;
  private CharacterField fieldE01TDO = null;
  private CharacterField fieldE01TDP = null;
  private DecimalField fieldE01PFD = null;
  private DecimalField fieldE01PFF = null;
  private DecimalField fieldE01PFG = null;
  private DecimalField fieldE01JFD = null;
  private DecimalField fieldE01JFF = null;
  private DecimalField fieldE01JFG = null;
  private CharacterField fieldD01LDV = null;
  private CharacterField fieldD01LDA = null;
  private CharacterField fieldD01KIL = null;
  private CharacterField fieldD01EAD = null;
  private CharacterField fieldD01EMB = null;
  private CharacterField fieldD01TTR = null;
  private CharacterField fieldD01TTE = null;
  private CharacterField fieldD01TTC = null;
  private CharacterField fieldD01TTF = null;
  private CharacterField fieldD01TAV = null;
  private CharacterField fieldD01TAI = null;
  private CharacterField fieldD01TDO = null;
  private CharacterField fieldD01TDP = null;
  private CharacterField fieldF01LDV = null;
  private CharacterField fieldF01LDA = null;
  private CharacterField fieldF01KIL = null;
  private CharacterField fieldF01EAD = null;
  private CharacterField fieldF01EMB = null;
  private CharacterField fieldF01TTR = null;
  private CharacterField fieldF01TTE = null;
  private CharacterField fieldF01TTC = null;
  private CharacterField fieldF01TTF = null;
  private CharacterField fieldF01TAV = null;
  private CharacterField fieldF01TAI = null;
  private CharacterField fieldF01TDO = null;
  private CharacterField fieldF01TDP = null;
  private CharacterField fieldF01PFD = null;
  private CharacterField fieldF01PFF = null;
  private CharacterField fieldF01PFG = null;
  private CharacterField fieldF01JFD = null;
  private CharacterField fieldF01JFF = null;
  private CharacterField fieldF01JFG = null;
  private CharacterField fieldE01ACT = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ESD109001Message.
  */
  public ESD109001Message()
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
    recordsize = 734;
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
    fields[9] = fieldE01BNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01BNK");
    fields[10] = fieldE01LDV =
    new CharacterField(message, HEADERSIZE + 44, 4, "E01LDV");
    fields[11] = fieldE01LDA =
    new CharacterField(message, HEADERSIZE + 48, 4, "E01LDA");
    fields[12] = fieldE01KIL =
    new CharacterField(message, HEADERSIZE + 52, 4, "E01KIL");
    fields[13] = fieldE01EAD =
    new CharacterField(message, HEADERSIZE + 56, 4, "E01EAD");
    fields[14] = fieldE01EMB =
    new CharacterField(message, HEADERSIZE + 60, 4, "E01EMB");
    fields[15] = fieldE01TTR =
    new CharacterField(message, HEADERSIZE + 64, 4, "E01TTR");
    fields[16] = fieldE01TTE =
    new CharacterField(message, HEADERSIZE + 68, 4, "E01TTE");
    fields[17] = fieldE01TTC =
    new CharacterField(message, HEADERSIZE + 72, 4, "E01TTC");
    fields[18] = fieldE01TTF =
    new CharacterField(message, HEADERSIZE + 76, 4, "E01TTF");
    fields[19] = fieldE01TAV =
    new CharacterField(message, HEADERSIZE + 80, 4, "E01TAV");
    fields[20] = fieldE01TAI =
    new CharacterField(message, HEADERSIZE + 84, 4, "E01TAI");
    fields[21] = fieldE01TDO =
    new CharacterField(message, HEADERSIZE + 88, 4, "E01TDO");
    fields[22] = fieldE01TDP =
    new CharacterField(message, HEADERSIZE + 92, 4, "E01TDP");
    fields[23] = fieldE01PFD =
    new DecimalField(message, HEADERSIZE + 96, 4, 0, "E01PFD");
    fields[24] = fieldE01PFF =
    new DecimalField(message, HEADERSIZE + 100, 4, 0, "E01PFF");
    fields[25] = fieldE01PFG =
    new DecimalField(message, HEADERSIZE + 104, 4, 0, "E01PFG");
    fields[26] = fieldE01JFD =
    new DecimalField(message, HEADERSIZE + 108, 4, 0, "E01JFD");
    fields[27] = fieldE01JFF =
    new DecimalField(message, HEADERSIZE + 112, 4, 0, "E01JFF");
    fields[28] = fieldE01JFG =
    new DecimalField(message, HEADERSIZE + 116, 4, 0, "E01JFG");
    fields[29] = fieldD01LDV =
    new CharacterField(message, HEADERSIZE + 120, 45, "D01LDV");
    fields[30] = fieldD01LDA =
    new CharacterField(message, HEADERSIZE + 165, 45, "D01LDA");
    fields[31] = fieldD01KIL =
    new CharacterField(message, HEADERSIZE + 210, 45, "D01KIL");
    fields[32] = fieldD01EAD =
    new CharacterField(message, HEADERSIZE + 255, 45, "D01EAD");
    fields[33] = fieldD01EMB =
    new CharacterField(message, HEADERSIZE + 300, 45, "D01EMB");
    fields[34] = fieldD01TTR =
    new CharacterField(message, HEADERSIZE + 345, 45, "D01TTR");
    fields[35] = fieldD01TTE =
    new CharacterField(message, HEADERSIZE + 390, 45, "D01TTE");
    fields[36] = fieldD01TTC =
    new CharacterField(message, HEADERSIZE + 435, 45, "D01TTC");
    fields[37] = fieldD01TTF =
    new CharacterField(message, HEADERSIZE + 480, 45, "D01TTF");
    fields[38] = fieldD01TAV =
    new CharacterField(message, HEADERSIZE + 525, 45, "D01TAV");
    fields[39] = fieldD01TAI =
    new CharacterField(message, HEADERSIZE + 570, 45, "D01TAI");
    fields[40] = fieldD01TDO =
    new CharacterField(message, HEADERSIZE + 615, 45, "D01TDO");
    fields[41] = fieldD01TDP =
    new CharacterField(message, HEADERSIZE + 660, 45, "D01TDP");
    fields[42] = fieldF01LDV =
    new CharacterField(message, HEADERSIZE + 705, 1, "F01LDV");
    fields[43] = fieldF01LDA =
    new CharacterField(message, HEADERSIZE + 706, 1, "F01LDA");
    fields[44] = fieldF01KIL =
    new CharacterField(message, HEADERSIZE + 707, 1, "F01KIL");
    fields[45] = fieldF01EAD =
    new CharacterField(message, HEADERSIZE + 708, 1, "F01EAD");
    fields[46] = fieldF01EMB =
    new CharacterField(message, HEADERSIZE + 709, 1, "F01EMB");
    fields[47] = fieldF01TTR =
    new CharacterField(message, HEADERSIZE + 710, 1, "F01TTR");
    fields[48] = fieldF01TTE =
    new CharacterField(message, HEADERSIZE + 711, 1, "F01TTE");
    fields[49] = fieldF01TTC =
    new CharacterField(message, HEADERSIZE + 712, 1, "F01TTC");
    fields[50] = fieldF01TTF =
    new CharacterField(message, HEADERSIZE + 713, 1, "F01TTF");
    fields[51] = fieldF01TAV =
    new CharacterField(message, HEADERSIZE + 714, 1, "F01TAV");
    fields[52] = fieldF01TAI =
    new CharacterField(message, HEADERSIZE + 715, 1, "F01TAI");
    fields[53] = fieldF01TDO =
    new CharacterField(message, HEADERSIZE + 716, 1, "F01TDO");
    fields[54] = fieldF01TDP =
    new CharacterField(message, HEADERSIZE + 717, 1, "F01TDP");
    fields[55] = fieldF01PFD =
    new CharacterField(message, HEADERSIZE + 718, 1, "F01PFD");
    fields[56] = fieldF01PFF =
    new CharacterField(message, HEADERSIZE + 719, 1, "F01PFF");
    fields[57] = fieldF01PFG =
    new CharacterField(message, HEADERSIZE + 720, 1, "F01PFG");
    fields[58] = fieldF01JFD =
    new CharacterField(message, HEADERSIZE + 721, 1, "F01JFD");
    fields[59] = fieldF01JFF =
    new CharacterField(message, HEADERSIZE + 722, 1, "F01JFF");
    fields[60] = fieldF01JFG =
    new CharacterField(message, HEADERSIZE + 723, 1, "F01JFG");
    fields[61] = fieldE01ACT =
    new CharacterField(message, HEADERSIZE + 724, 1, "E01ACT");
    fields[62] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 725, 8, 0, "E01NUMREC");
    fields[63] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 733, 1, "E01INDOPE");

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
  * Set field E01LDV using a String value.
  */
  public void setE01LDV(String newvalue)
  {
    fieldE01LDV.setString(newvalue);
  }

  /**
  * Get value of field E01LDV as a String.
  */
  public String getE01LDV()
  {
    return fieldE01LDV.getString();
  }

  /**
  * Set field E01LDA using a String value.
  */
  public void setE01LDA(String newvalue)
  {
    fieldE01LDA.setString(newvalue);
  }

  /**
  * Get value of field E01LDA as a String.
  */
  public String getE01LDA()
  {
    return fieldE01LDA.getString();
  }

  /**
  * Set field E01KIL using a String value.
  */
  public void setE01KIL(String newvalue)
  {
    fieldE01KIL.setString(newvalue);
  }

  /**
  * Get value of field E01KIL as a String.
  */
  public String getE01KIL()
  {
    return fieldE01KIL.getString();
  }

  /**
  * Set field E01EAD using a String value.
  */
  public void setE01EAD(String newvalue)
  {
    fieldE01EAD.setString(newvalue);
  }

  /**
  * Get value of field E01EAD as a String.
  */
  public String getE01EAD()
  {
    return fieldE01EAD.getString();
  }

  /**
  * Set field E01EMB using a String value.
  */
  public void setE01EMB(String newvalue)
  {
    fieldE01EMB.setString(newvalue);
  }

  /**
  * Get value of field E01EMB as a String.
  */
  public String getE01EMB()
  {
    return fieldE01EMB.getString();
  }

  /**
  * Set field E01TTR using a String value.
  */
  public void setE01TTR(String newvalue)
  {
    fieldE01TTR.setString(newvalue);
  }

  /**
  * Get value of field E01TTR as a String.
  */
  public String getE01TTR()
  {
    return fieldE01TTR.getString();
  }

  /**
  * Set field E01TTE using a String value.
  */
  public void setE01TTE(String newvalue)
  {
    fieldE01TTE.setString(newvalue);
  }

  /**
  * Get value of field E01TTE as a String.
  */
  public String getE01TTE()
  {
    return fieldE01TTE.getString();
  }

  /**
  * Set field E01TTC using a String value.
  */
  public void setE01TTC(String newvalue)
  {
    fieldE01TTC.setString(newvalue);
  }

  /**
  * Get value of field E01TTC as a String.
  */
  public String getE01TTC()
  {
    return fieldE01TTC.getString();
  }

  /**
  * Set field E01TTF using a String value.
  */
  public void setE01TTF(String newvalue)
  {
    fieldE01TTF.setString(newvalue);
  }

  /**
  * Get value of field E01TTF as a String.
  */
  public String getE01TTF()
  {
    return fieldE01TTF.getString();
  }

  /**
  * Set field E01TAV using a String value.
  */
  public void setE01TAV(String newvalue)
  {
    fieldE01TAV.setString(newvalue);
  }

  /**
  * Get value of field E01TAV as a String.
  */
  public String getE01TAV()
  {
    return fieldE01TAV.getString();
  }

  /**
  * Set field E01TAI using a String value.
  */
  public void setE01TAI(String newvalue)
  {
    fieldE01TAI.setString(newvalue);
  }

  /**
  * Get value of field E01TAI as a String.
  */
  public String getE01TAI()
  {
    return fieldE01TAI.getString();
  }

  /**
  * Set field E01TDO using a String value.
  */
  public void setE01TDO(String newvalue)
  {
    fieldE01TDO.setString(newvalue);
  }

  /**
  * Get value of field E01TDO as a String.
  */
  public String getE01TDO()
  {
    return fieldE01TDO.getString();
  }

  /**
  * Set field E01TDP using a String value.
  */
  public void setE01TDP(String newvalue)
  {
    fieldE01TDP.setString(newvalue);
  }

  /**
  * Get value of field E01TDP as a String.
  */
  public String getE01TDP()
  {
    return fieldE01TDP.getString();
  }

  /**
  * Set field E01PFD using a String value.
  */
  public void setE01PFD(String newvalue)
  {
    fieldE01PFD.setString(newvalue);
  }

  /**
  * Get value of field E01PFD as a String.
  */
  public String getE01PFD()
  {
    return fieldE01PFD.getString();
  }

  /**
  * Set numeric field E01PFD using a BigDecimal value.
  */
  public void setE01PFD(BigDecimal newvalue)
  {
    fieldE01PFD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFD()
  {
    return fieldE01PFD.getBigDecimal();
  }

  /**
  * Set field E01PFF using a String value.
  */
  public void setE01PFF(String newvalue)
  {
    fieldE01PFF.setString(newvalue);
  }

  /**
  * Get value of field E01PFF as a String.
  */
  public String getE01PFF()
  {
    return fieldE01PFF.getString();
  }

  /**
  * Set numeric field E01PFF using a BigDecimal value.
  */
  public void setE01PFF(BigDecimal newvalue)
  {
    fieldE01PFF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFF()
  {
    return fieldE01PFF.getBigDecimal();
  }

  /**
  * Set field E01PFG using a String value.
  */
  public void setE01PFG(String newvalue)
  {
    fieldE01PFG.setString(newvalue);
  }

  /**
  * Get value of field E01PFG as a String.
  */
  public String getE01PFG()
  {
    return fieldE01PFG.getString();
  }

  /**
  * Set numeric field E01PFG using a BigDecimal value.
  */
  public void setE01PFG(BigDecimal newvalue)
  {
    fieldE01PFG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFG()
  {
    return fieldE01PFG.getBigDecimal();
  }

  /**
  * Set field E01JFD using a String value.
  */
  public void setE01JFD(String newvalue)
  {
    fieldE01JFD.setString(newvalue);
  }

  /**
  * Get value of field E01JFD as a String.
  */
  public String getE01JFD()
  {
    return fieldE01JFD.getString();
  }

  /**
  * Set numeric field E01JFD using a BigDecimal value.
  */
  public void setE01JFD(BigDecimal newvalue)
  {
    fieldE01JFD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01JFD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01JFD()
  {
    return fieldE01JFD.getBigDecimal();
  }

  /**
  * Set field E01JFF using a String value.
  */
  public void setE01JFF(String newvalue)
  {
    fieldE01JFF.setString(newvalue);
  }

  /**
  * Get value of field E01JFF as a String.
  */
  public String getE01JFF()
  {
    return fieldE01JFF.getString();
  }

  /**
  * Set numeric field E01JFF using a BigDecimal value.
  */
  public void setE01JFF(BigDecimal newvalue)
  {
    fieldE01JFF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01JFF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01JFF()
  {
    return fieldE01JFF.getBigDecimal();
  }

  /**
  * Set field E01JFG using a String value.
  */
  public void setE01JFG(String newvalue)
  {
    fieldE01JFG.setString(newvalue);
  }

  /**
  * Get value of field E01JFG as a String.
  */
  public String getE01JFG()
  {
    return fieldE01JFG.getString();
  }

  /**
  * Set numeric field E01JFG using a BigDecimal value.
  */
  public void setE01JFG(BigDecimal newvalue)
  {
    fieldE01JFG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01JFG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01JFG()
  {
    return fieldE01JFG.getBigDecimal();
  }

  /**
  * Set field D01LDV using a String value.
  */
  public void setD01LDV(String newvalue)
  {
    fieldD01LDV.setString(newvalue);
  }

  /**
  * Get value of field D01LDV as a String.
  */
  public String getD01LDV()
  {
    return fieldD01LDV.getString();
  }

  /**
  * Set field D01LDA using a String value.
  */
  public void setD01LDA(String newvalue)
  {
    fieldD01LDA.setString(newvalue);
  }

  /**
  * Get value of field D01LDA as a String.
  */
  public String getD01LDA()
  {
    return fieldD01LDA.getString();
  }

  /**
  * Set field D01KIL using a String value.
  */
  public void setD01KIL(String newvalue)
  {
    fieldD01KIL.setString(newvalue);
  }

  /**
  * Get value of field D01KIL as a String.
  */
  public String getD01KIL()
  {
    return fieldD01KIL.getString();
  }

  /**
  * Set field D01EAD using a String value.
  */
  public void setD01EAD(String newvalue)
  {
    fieldD01EAD.setString(newvalue);
  }

  /**
  * Get value of field D01EAD as a String.
  */
  public String getD01EAD()
  {
    return fieldD01EAD.getString();
  }

  /**
  * Set field D01EMB using a String value.
  */
  public void setD01EMB(String newvalue)
  {
    fieldD01EMB.setString(newvalue);
  }

  /**
  * Get value of field D01EMB as a String.
  */
  public String getD01EMB()
  {
    return fieldD01EMB.getString();
  }

  /**
  * Set field D01TTR using a String value.
  */
  public void setD01TTR(String newvalue)
  {
    fieldD01TTR.setString(newvalue);
  }

  /**
  * Get value of field D01TTR as a String.
  */
  public String getD01TTR()
  {
    return fieldD01TTR.getString();
  }

  /**
  * Set field D01TTE using a String value.
  */
  public void setD01TTE(String newvalue)
  {
    fieldD01TTE.setString(newvalue);
  }

  /**
  * Get value of field D01TTE as a String.
  */
  public String getD01TTE()
  {
    return fieldD01TTE.getString();
  }

  /**
  * Set field D01TTC using a String value.
  */
  public void setD01TTC(String newvalue)
  {
    fieldD01TTC.setString(newvalue);
  }

  /**
  * Get value of field D01TTC as a String.
  */
  public String getD01TTC()
  {
    return fieldD01TTC.getString();
  }

  /**
  * Set field D01TTF using a String value.
  */
  public void setD01TTF(String newvalue)
  {
    fieldD01TTF.setString(newvalue);
  }

  /**
  * Get value of field D01TTF as a String.
  */
  public String getD01TTF()
  {
    return fieldD01TTF.getString();
  }

  /**
  * Set field D01TAV using a String value.
  */
  public void setD01TAV(String newvalue)
  {
    fieldD01TAV.setString(newvalue);
  }

  /**
  * Get value of field D01TAV as a String.
  */
  public String getD01TAV()
  {
    return fieldD01TAV.getString();
  }

  /**
  * Set field D01TAI using a String value.
  */
  public void setD01TAI(String newvalue)
  {
    fieldD01TAI.setString(newvalue);
  }

  /**
  * Get value of field D01TAI as a String.
  */
  public String getD01TAI()
  {
    return fieldD01TAI.getString();
  }

  /**
  * Set field D01TDO using a String value.
  */
  public void setD01TDO(String newvalue)
  {
    fieldD01TDO.setString(newvalue);
  }

  /**
  * Get value of field D01TDO as a String.
  */
  public String getD01TDO()
  {
    return fieldD01TDO.getString();
  }

  /**
  * Set field D01TDP using a String value.
  */
  public void setD01TDP(String newvalue)
  {
    fieldD01TDP.setString(newvalue);
  }

  /**
  * Get value of field D01TDP as a String.
  */
  public String getD01TDP()
  {
    return fieldD01TDP.getString();
  }

  /**
  * Set field F01LDV using a String value.
  */
  public void setF01LDV(String newvalue)
  {
    fieldF01LDV.setString(newvalue);
  }

  /**
  * Get value of field F01LDV as a String.
  */
  public String getF01LDV()
  {
    return fieldF01LDV.getString();
  }

  /**
  * Set field F01LDA using a String value.
  */
  public void setF01LDA(String newvalue)
  {
    fieldF01LDA.setString(newvalue);
  }

  /**
  * Get value of field F01LDA as a String.
  */
  public String getF01LDA()
  {
    return fieldF01LDA.getString();
  }

  /**
  * Set field F01KIL using a String value.
  */
  public void setF01KIL(String newvalue)
  {
    fieldF01KIL.setString(newvalue);
  }

  /**
  * Get value of field F01KIL as a String.
  */
  public String getF01KIL()
  {
    return fieldF01KIL.getString();
  }

  /**
  * Set field F01EAD using a String value.
  */
  public void setF01EAD(String newvalue)
  {
    fieldF01EAD.setString(newvalue);
  }

  /**
  * Get value of field F01EAD as a String.
  */
  public String getF01EAD()
  {
    return fieldF01EAD.getString();
  }

  /**
  * Set field F01EMB using a String value.
  */
  public void setF01EMB(String newvalue)
  {
    fieldF01EMB.setString(newvalue);
  }

  /**
  * Get value of field F01EMB as a String.
  */
  public String getF01EMB()
  {
    return fieldF01EMB.getString();
  }

  /**
  * Set field F01TTR using a String value.
  */
  public void setF01TTR(String newvalue)
  {
    fieldF01TTR.setString(newvalue);
  }

  /**
  * Get value of field F01TTR as a String.
  */
  public String getF01TTR()
  {
    return fieldF01TTR.getString();
  }

  /**
  * Set field F01TTE using a String value.
  */
  public void setF01TTE(String newvalue)
  {
    fieldF01TTE.setString(newvalue);
  }

  /**
  * Get value of field F01TTE as a String.
  */
  public String getF01TTE()
  {
    return fieldF01TTE.getString();
  }

  /**
  * Set field F01TTC using a String value.
  */
  public void setF01TTC(String newvalue)
  {
    fieldF01TTC.setString(newvalue);
  }

  /**
  * Get value of field F01TTC as a String.
  */
  public String getF01TTC()
  {
    return fieldF01TTC.getString();
  }

  /**
  * Set field F01TTF using a String value.
  */
  public void setF01TTF(String newvalue)
  {
    fieldF01TTF.setString(newvalue);
  }

  /**
  * Get value of field F01TTF as a String.
  */
  public String getF01TTF()
  {
    return fieldF01TTF.getString();
  }

  /**
  * Set field F01TAV using a String value.
  */
  public void setF01TAV(String newvalue)
  {
    fieldF01TAV.setString(newvalue);
  }

  /**
  * Get value of field F01TAV as a String.
  */
  public String getF01TAV()
  {
    return fieldF01TAV.getString();
  }

  /**
  * Set field F01TAI using a String value.
  */
  public void setF01TAI(String newvalue)
  {
    fieldF01TAI.setString(newvalue);
  }

  /**
  * Get value of field F01TAI as a String.
  */
  public String getF01TAI()
  {
    return fieldF01TAI.getString();
  }

  /**
  * Set field F01TDO using a String value.
  */
  public void setF01TDO(String newvalue)
  {
    fieldF01TDO.setString(newvalue);
  }

  /**
  * Get value of field F01TDO as a String.
  */
  public String getF01TDO()
  {
    return fieldF01TDO.getString();
  }

  /**
  * Set field F01TDP using a String value.
  */
  public void setF01TDP(String newvalue)
  {
    fieldF01TDP.setString(newvalue);
  }

  /**
  * Get value of field F01TDP as a String.
  */
  public String getF01TDP()
  {
    return fieldF01TDP.getString();
  }

  /**
  * Set field F01PFD using a String value.
  */
  public void setF01PFD(String newvalue)
  {
    fieldF01PFD.setString(newvalue);
  }

  /**
  * Get value of field F01PFD as a String.
  */
  public String getF01PFD()
  {
    return fieldF01PFD.getString();
  }

  /**
  * Set field F01PFF using a String value.
  */
  public void setF01PFF(String newvalue)
  {
    fieldF01PFF.setString(newvalue);
  }

  /**
  * Get value of field F01PFF as a String.
  */
  public String getF01PFF()
  {
    return fieldF01PFF.getString();
  }

  /**
  * Set field F01PFG using a String value.
  */
  public void setF01PFG(String newvalue)
  {
    fieldF01PFG.setString(newvalue);
  }

  /**
  * Get value of field F01PFG as a String.
  */
  public String getF01PFG()
  {
    return fieldF01PFG.getString();
  }

  /**
  * Set field F01JFD using a String value.
  */
  public void setF01JFD(String newvalue)
  {
    fieldF01JFD.setString(newvalue);
  }

  /**
  * Get value of field F01JFD as a String.
  */
  public String getF01JFD()
  {
    return fieldF01JFD.getString();
  }

  /**
  * Set field F01JFF using a String value.
  */
  public void setF01JFF(String newvalue)
  {
    fieldF01JFF.setString(newvalue);
  }

  /**
  * Get value of field F01JFF as a String.
  */
  public String getF01JFF()
  {
    return fieldF01JFF.getString();
  }

  /**
  * Set field F01JFG using a String value.
  */
  public void setF01JFG(String newvalue)
  {
    fieldF01JFG.setString(newvalue);
  }

  /**
  * Get value of field F01JFG as a String.
  */
  public String getF01JFG()
  {
    return fieldF01JFG.getString();
  }

  /**
  * Set field E01ACT using a String value.
  */
  public void setE01ACT(String newvalue)
  {
    fieldE01ACT.setString(newvalue);
  }

  /**
  * Get value of field E01ACT as a String.
  */
  public String getE01ACT()
  {
    return fieldE01ACT.getString();
  }

  /**
  * Set field E01NUMREC using a String value.
  */
  public void setE01NUMREC(String newvalue)
  {
    fieldE01NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E01NUMREC as a String.
  */
  public String getE01NUMREC()
  {
    return fieldE01NUMREC.getString();
  }

  /**
  * Set numeric field E01NUMREC using a BigDecimal value.
  */
  public void setE01NUMREC(BigDecimal newvalue)
  {
    fieldE01NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NUMREC()
  {
    return fieldE01NUMREC.getBigDecimal();
  }

  /**
  * Set field E01INDOPE using a String value.
  */
  public void setE01INDOPE(String newvalue)
  {
    fieldE01INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E01INDOPE as a String.
  */
  public String getE01INDOPE()
  {
    return fieldE01INDOPE.getString();
  }

}
