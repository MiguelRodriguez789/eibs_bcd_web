package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECA000002 physical file definition.
* 
* File level identifier is 1150204175108.
* Record format level identifier is 3B9EBB02201A6.
*/

public class ECA000002Message extends MessageRecord
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
                                     "E02ISCNOI",
                                     "E02ISCPTY",
                                     "E02ISCACC",
                                     "E02ISCBRN",
                                     "E02ISCSEQ",
                                     "E02ICADSC",
                                     "E02ICAEST",
                                     "E02ISCDAY",
                                     "E02ISCFTH",
                                     "E02ISCFTM",
                                     "E02ISCTTH",
                                     "E02ISCTTM",
                                     "E02ISCEFM",
                                     "E02ISCEFD",
                                     "E02ISCEFY",
                                     "D02NOIDSC",
                                     "D02PTYDSC",
                                     "D02ACCDSC",
                                     "D02BRNNME",
                                     "E02CDM",
                                     "E02CDD",
                                     "E02CDY",
                                     "E02CTM",
                                     "E02CUS",
                                     "E02MDM",
                                     "E02MDD",
                                     "E02MDY",
                                     "E02MTM",
                                     "E02MUS",
                                     "E02NUMREC",
                                     "E02INDOPE"
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
                                   "E02ISCNOI",
                                   "E02ISCPTY",
                                   "E02ISCACC",
                                   "E02ISCBRN",
                                   "E02ISCSEQ",
                                   "E02ICADSC",
                                   "E02ICAEST",
                                   "E02ISCDAY",
                                   "E02ISCFTH",
                                   "E02ISCFTM",
                                   "E02ISCTTH",
                                   "E02ISCTTM",
                                   "E02ISCEFM",
                                   "E02ISCEFD",
                                   "E02ISCEFY",
                                   "D02NOIDSC",
                                   "D02PTYDSC",
                                   "D02ACCDSC",
                                   "D02BRNNME",
                                   "E02CDM",
                                   "E02CDD",
                                   "E02CDY",
                                   "E02CTM",
                                   "E02CUS",
                                   "E02MDM",
                                   "E02MDD",
                                   "E02MDY",
                                   "E02MTM",
                                   "E02MUS",
                                   "E02NUMREC",
                                   "E02INDOPE"
                                 };
  final static String fid = "1150204175108";
  final static String rid = "3B9EBB02201A6";
  final static String fmtname = "ECA000002";
  final int FIELDCOUNT = 40;
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
  private CharacterField fieldE02ISCNOI = null;
  private CharacterField fieldE02ISCPTY = null;
  private DecimalField fieldE02ISCACC = null;
  private DecimalField fieldE02ISCBRN = null;
  private DecimalField fieldE02ISCSEQ = null;
  private CharacterField fieldE02ICADSC = null;
  private CharacterField fieldE02ICAEST = null;
  private CharacterField fieldE02ISCDAY = null;
  private DecimalField fieldE02ISCFTH = null;
  private DecimalField fieldE02ISCFTM = null;
  private DecimalField fieldE02ISCTTH = null;
  private DecimalField fieldE02ISCTTM = null;
  private DecimalField fieldE02ISCEFM = null;
  private DecimalField fieldE02ISCEFD = null;
  private DecimalField fieldE02ISCEFY = null;
  private CharacterField fieldD02NOIDSC = null;
  private CharacterField fieldD02PTYDSC = null;
  private CharacterField fieldD02ACCDSC = null;
  private CharacterField fieldD02BRNNME = null;
  private DecimalField fieldE02CDM = null;
  private DecimalField fieldE02CDD = null;
  private DecimalField fieldE02CDY = null;
  private CharacterField fieldE02CTM = null;
  private CharacterField fieldE02CUS = null;
  private DecimalField fieldE02MDM = null;
  private DecimalField fieldE02MDD = null;
  private DecimalField fieldE02MDY = null;
  private CharacterField fieldE02MTM = null;
  private CharacterField fieldE02MUS = null;
  private DecimalField fieldE02NUMREC = null;
  private CharacterField fieldE02INDOPE = null;

  /**
  * Constructor for ECA000002Message.
  */
  public ECA000002Message()
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
    recordsize = 433;
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
    fields[9] = fieldE02ISCNOI =
    new CharacterField(message, HEADERSIZE + 42, 10, "E02ISCNOI");
    fields[10] = fieldE02ISCPTY =
    new CharacterField(message, HEADERSIZE + 52, 4, "E02ISCPTY");
    fields[11] = fieldE02ISCACC =
    new DecimalField(message, HEADERSIZE + 56, 13, 0, "E02ISCACC");
    fields[12] = fieldE02ISCBRN =
    new DecimalField(message, HEADERSIZE + 69, 5, 0, "E02ISCBRN");
    fields[13] = fieldE02ISCSEQ =
    new DecimalField(message, HEADERSIZE + 74, 3, 0, "E02ISCSEQ");
    fields[14] = fieldE02ICADSC =
    new CharacterField(message, HEADERSIZE + 77, 45, "E02ICADSC");
    fields[15] = fieldE02ICAEST =
    new CharacterField(message, HEADERSIZE + 122, 1, "E02ICAEST");
    fields[16] = fieldE02ISCDAY =
    new CharacterField(message, HEADERSIZE + 123, 4, "E02ISCDAY");
    fields[17] = fieldE02ISCFTH =
    new DecimalField(message, HEADERSIZE + 127, 3, 0, "E02ISCFTH");
    fields[18] = fieldE02ISCFTM =
    new DecimalField(message, HEADERSIZE + 130, 3, 0, "E02ISCFTM");
    fields[19] = fieldE02ISCTTH =
    new DecimalField(message, HEADERSIZE + 133, 3, 0, "E02ISCTTH");
    fields[20] = fieldE02ISCTTM =
    new DecimalField(message, HEADERSIZE + 136, 3, 0, "E02ISCTTM");
    fields[21] = fieldE02ISCEFM =
    new DecimalField(message, HEADERSIZE + 139, 3, 0, "E02ISCEFM");
    fields[22] = fieldE02ISCEFD =
    new DecimalField(message, HEADERSIZE + 142, 3, 0, "E02ISCEFD");
    fields[23] = fieldE02ISCEFY =
    new DecimalField(message, HEADERSIZE + 145, 5, 0, "E02ISCEFY");
    fields[24] = fieldD02NOIDSC =
    new CharacterField(message, HEADERSIZE + 150, 45, "D02NOIDSC");
    fields[25] = fieldD02PTYDSC =
    new CharacterField(message, HEADERSIZE + 195, 45, "D02PTYDSC");
    fields[26] = fieldD02ACCDSC =
    new CharacterField(message, HEADERSIZE + 240, 45, "D02ACCDSC");
    fields[27] = fieldD02BRNNME =
    new CharacterField(message, HEADERSIZE + 285, 45, "D02BRNNME");
    fields[28] = fieldE02CDM =
    new DecimalField(message, HEADERSIZE + 330, 3, 0, "E02CDM");
    fields[29] = fieldE02CDD =
    new DecimalField(message, HEADERSIZE + 333, 3, 0, "E02CDD");
    fields[30] = fieldE02CDY =
    new DecimalField(message, HEADERSIZE + 336, 5, 0, "E02CDY");
    fields[31] = fieldE02CTM =
    new CharacterField(message, HEADERSIZE + 341, 26, "E02CTM");
    fields[32] = fieldE02CUS =
    new CharacterField(message, HEADERSIZE + 367, 10, "E02CUS");
    fields[33] = fieldE02MDM =
    new DecimalField(message, HEADERSIZE + 377, 3, 0, "E02MDM");
    fields[34] = fieldE02MDD =
    new DecimalField(message, HEADERSIZE + 380, 3, 0, "E02MDD");
    fields[35] = fieldE02MDY =
    new DecimalField(message, HEADERSIZE + 383, 5, 0, "E02MDY");
    fields[36] = fieldE02MTM =
    new CharacterField(message, HEADERSIZE + 388, 26, "E02MTM");
    fields[37] = fieldE02MUS =
    new CharacterField(message, HEADERSIZE + 414, 10, "E02MUS");
    fields[38] = fieldE02NUMREC =
    new DecimalField(message, HEADERSIZE + 424, 8, 0, "E02NUMREC");
    fields[39] = fieldE02INDOPE =
    new CharacterField(message, HEADERSIZE + 432, 1, "E02INDOPE");

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
  * Set field E02ISCNOI using a String value.
  */
  public void setE02ISCNOI(String newvalue)
  {
    fieldE02ISCNOI.setString(newvalue);
  }

  /**
  * Get value of field E02ISCNOI as a String.
  */
  public String getE02ISCNOI()
  {
    return fieldE02ISCNOI.getString();
  }

  /**
  * Set field E02ISCPTY using a String value.
  */
  public void setE02ISCPTY(String newvalue)
  {
    fieldE02ISCPTY.setString(newvalue);
  }

  /**
  * Get value of field E02ISCPTY as a String.
  */
  public String getE02ISCPTY()
  {
    return fieldE02ISCPTY.getString();
  }

  /**
  * Set field E02ISCACC using a String value.
  */
  public void setE02ISCACC(String newvalue)
  {
    fieldE02ISCACC.setString(newvalue);
  }

  /**
  * Get value of field E02ISCACC as a String.
  */
  public String getE02ISCACC()
  {
    return fieldE02ISCACC.getString();
  }

  /**
  * Set numeric field E02ISCACC using a BigDecimal value.
  */
  public void setE02ISCACC(BigDecimal newvalue)
  {
    fieldE02ISCACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ISCACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ISCACC()
  {
    return fieldE02ISCACC.getBigDecimal();
  }

  /**
  * Set field E02ISCBRN using a String value.
  */
  public void setE02ISCBRN(String newvalue)
  {
    fieldE02ISCBRN.setString(newvalue);
  }

  /**
  * Get value of field E02ISCBRN as a String.
  */
  public String getE02ISCBRN()
  {
    return fieldE02ISCBRN.getString();
  }

  /**
  * Set numeric field E02ISCBRN using a BigDecimal value.
  */
  public void setE02ISCBRN(BigDecimal newvalue)
  {
    fieldE02ISCBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ISCBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ISCBRN()
  {
    return fieldE02ISCBRN.getBigDecimal();
  }

  /**
  * Set field E02ISCSEQ using a String value.
  */
  public void setE02ISCSEQ(String newvalue)
  {
    fieldE02ISCSEQ.setString(newvalue);
  }

  /**
  * Get value of field E02ISCSEQ as a String.
  */
  public String getE02ISCSEQ()
  {
    return fieldE02ISCSEQ.getString();
  }

  /**
  * Set numeric field E02ISCSEQ using a BigDecimal value.
  */
  public void setE02ISCSEQ(BigDecimal newvalue)
  {
    fieldE02ISCSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ISCSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ISCSEQ()
  {
    return fieldE02ISCSEQ.getBigDecimal();
  }

  /**
  * Set field E02ICADSC using a String value.
  */
  public void setE02ICADSC(String newvalue)
  {
    fieldE02ICADSC.setString(newvalue);
  }

  /**
  * Get value of field E02ICADSC as a String.
  */
  public String getE02ICADSC()
  {
    return fieldE02ICADSC.getString();
  }

  /**
  * Set field E02ICAEST using a String value.
  */
  public void setE02ICAEST(String newvalue)
  {
    fieldE02ICAEST.setString(newvalue);
  }

  /**
  * Get value of field E02ICAEST as a String.
  */
  public String getE02ICAEST()
  {
    return fieldE02ICAEST.getString();
  }

  /**
  * Set field E02ISCDAY using a String value.
  */
  public void setE02ISCDAY(String newvalue)
  {
    fieldE02ISCDAY.setString(newvalue);
  }

  /**
  * Get value of field E02ISCDAY as a String.
  */
  public String getE02ISCDAY()
  {
    return fieldE02ISCDAY.getString();
  }

  /**
  * Set field E02ISCFTH using a String value.
  */
  public void setE02ISCFTH(String newvalue)
  {
    fieldE02ISCFTH.setString(newvalue);
  }

  /**
  * Get value of field E02ISCFTH as a String.
  */
  public String getE02ISCFTH()
  {
    return fieldE02ISCFTH.getString();
  }

  /**
  * Set numeric field E02ISCFTH using a BigDecimal value.
  */
  public void setE02ISCFTH(BigDecimal newvalue)
  {
    fieldE02ISCFTH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ISCFTH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ISCFTH()
  {
    return fieldE02ISCFTH.getBigDecimal();
  }

  /**
  * Set field E02ISCFTM using a String value.
  */
  public void setE02ISCFTM(String newvalue)
  {
    fieldE02ISCFTM.setString(newvalue);
  }

  /**
  * Get value of field E02ISCFTM as a String.
  */
  public String getE02ISCFTM()
  {
    return fieldE02ISCFTM.getString();
  }

  /**
  * Set numeric field E02ISCFTM using a BigDecimal value.
  */
  public void setE02ISCFTM(BigDecimal newvalue)
  {
    fieldE02ISCFTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ISCFTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ISCFTM()
  {
    return fieldE02ISCFTM.getBigDecimal();
  }

  /**
  * Set field E02ISCTTH using a String value.
  */
  public void setE02ISCTTH(String newvalue)
  {
    fieldE02ISCTTH.setString(newvalue);
  }

  /**
  * Get value of field E02ISCTTH as a String.
  */
  public String getE02ISCTTH()
  {
    return fieldE02ISCTTH.getString();
  }

  /**
  * Set numeric field E02ISCTTH using a BigDecimal value.
  */
  public void setE02ISCTTH(BigDecimal newvalue)
  {
    fieldE02ISCTTH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ISCTTH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ISCTTH()
  {
    return fieldE02ISCTTH.getBigDecimal();
  }

  /**
  * Set field E02ISCTTM using a String value.
  */
  public void setE02ISCTTM(String newvalue)
  {
    fieldE02ISCTTM.setString(newvalue);
  }

  /**
  * Get value of field E02ISCTTM as a String.
  */
  public String getE02ISCTTM()
  {
    return fieldE02ISCTTM.getString();
  }

  /**
  * Set numeric field E02ISCTTM using a BigDecimal value.
  */
  public void setE02ISCTTM(BigDecimal newvalue)
  {
    fieldE02ISCTTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ISCTTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ISCTTM()
  {
    return fieldE02ISCTTM.getBigDecimal();
  }

  /**
  * Set field E02ISCEFM using a String value.
  */
  public void setE02ISCEFM(String newvalue)
  {
    fieldE02ISCEFM.setString(newvalue);
  }

  /**
  * Get value of field E02ISCEFM as a String.
  */
  public String getE02ISCEFM()
  {
    return fieldE02ISCEFM.getString();
  }

  /**
  * Set numeric field E02ISCEFM using a BigDecimal value.
  */
  public void setE02ISCEFM(BigDecimal newvalue)
  {
    fieldE02ISCEFM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ISCEFM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ISCEFM()
  {
    return fieldE02ISCEFM.getBigDecimal();
  }

  /**
  * Set field E02ISCEFD using a String value.
  */
  public void setE02ISCEFD(String newvalue)
  {
    fieldE02ISCEFD.setString(newvalue);
  }

  /**
  * Get value of field E02ISCEFD as a String.
  */
  public String getE02ISCEFD()
  {
    return fieldE02ISCEFD.getString();
  }

  /**
  * Set numeric field E02ISCEFD using a BigDecimal value.
  */
  public void setE02ISCEFD(BigDecimal newvalue)
  {
    fieldE02ISCEFD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ISCEFD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ISCEFD()
  {
    return fieldE02ISCEFD.getBigDecimal();
  }

  /**
  * Set field E02ISCEFY using a String value.
  */
  public void setE02ISCEFY(String newvalue)
  {
    fieldE02ISCEFY.setString(newvalue);
  }

  /**
  * Get value of field E02ISCEFY as a String.
  */
  public String getE02ISCEFY()
  {
    return fieldE02ISCEFY.getString();
  }

  /**
  * Set numeric field E02ISCEFY using a BigDecimal value.
  */
  public void setE02ISCEFY(BigDecimal newvalue)
  {
    fieldE02ISCEFY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ISCEFY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ISCEFY()
  {
    return fieldE02ISCEFY.getBigDecimal();
  }

  /**
  * Set field D02NOIDSC using a String value.
  */
  public void setD02NOIDSC(String newvalue)
  {
    fieldD02NOIDSC.setString(newvalue);
  }

  /**
  * Get value of field D02NOIDSC as a String.
  */
  public String getD02NOIDSC()
  {
    return fieldD02NOIDSC.getString();
  }

  /**
  * Set field D02PTYDSC using a String value.
  */
  public void setD02PTYDSC(String newvalue)
  {
    fieldD02PTYDSC.setString(newvalue);
  }

  /**
  * Get value of field D02PTYDSC as a String.
  */
  public String getD02PTYDSC()
  {
    return fieldD02PTYDSC.getString();
  }

  /**
  * Set field D02ACCDSC using a String value.
  */
  public void setD02ACCDSC(String newvalue)
  {
    fieldD02ACCDSC.setString(newvalue);
  }

  /**
  * Get value of field D02ACCDSC as a String.
  */
  public String getD02ACCDSC()
  {
    return fieldD02ACCDSC.getString();
  }

  /**
  * Set field D02BRNNME using a String value.
  */
  public void setD02BRNNME(String newvalue)
  {
    fieldD02BRNNME.setString(newvalue);
  }

  /**
  * Get value of field D02BRNNME as a String.
  */
  public String getD02BRNNME()
  {
    return fieldD02BRNNME.getString();
  }

  /**
  * Set field E02CDM using a String value.
  */
  public void setE02CDM(String newvalue)
  {
    fieldE02CDM.setString(newvalue);
  }

  /**
  * Get value of field E02CDM as a String.
  */
  public String getE02CDM()
  {
    return fieldE02CDM.getString();
  }

  /**
  * Set numeric field E02CDM using a BigDecimal value.
  */
  public void setE02CDM(BigDecimal newvalue)
  {
    fieldE02CDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CDM()
  {
    return fieldE02CDM.getBigDecimal();
  }

  /**
  * Set field E02CDD using a String value.
  */
  public void setE02CDD(String newvalue)
  {
    fieldE02CDD.setString(newvalue);
  }

  /**
  * Get value of field E02CDD as a String.
  */
  public String getE02CDD()
  {
    return fieldE02CDD.getString();
  }

  /**
  * Set numeric field E02CDD using a BigDecimal value.
  */
  public void setE02CDD(BigDecimal newvalue)
  {
    fieldE02CDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CDD()
  {
    return fieldE02CDD.getBigDecimal();
  }

  /**
  * Set field E02CDY using a String value.
  */
  public void setE02CDY(String newvalue)
  {
    fieldE02CDY.setString(newvalue);
  }

  /**
  * Get value of field E02CDY as a String.
  */
  public String getE02CDY()
  {
    return fieldE02CDY.getString();
  }

  /**
  * Set numeric field E02CDY using a BigDecimal value.
  */
  public void setE02CDY(BigDecimal newvalue)
  {
    fieldE02CDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CDY()
  {
    return fieldE02CDY.getBigDecimal();
  }

  /**
  * Set field E02CTM using a String value.
  */
  public void setE02CTM(String newvalue)
  {
    fieldE02CTM.setString(newvalue);
  }

  /**
  * Get value of field E02CTM as a String.
  */
  public String getE02CTM()
  {
    return fieldE02CTM.getString();
  }

  /**
  * Set field E02CUS using a String value.
  */
  public void setE02CUS(String newvalue)
  {
    fieldE02CUS.setString(newvalue);
  }

  /**
  * Get value of field E02CUS as a String.
  */
  public String getE02CUS()
  {
    return fieldE02CUS.getString();
  }

  /**
  * Set field E02MDM using a String value.
  */
  public void setE02MDM(String newvalue)
  {
    fieldE02MDM.setString(newvalue);
  }

  /**
  * Get value of field E02MDM as a String.
  */
  public String getE02MDM()
  {
    return fieldE02MDM.getString();
  }

  /**
  * Set numeric field E02MDM using a BigDecimal value.
  */
  public void setE02MDM(BigDecimal newvalue)
  {
    fieldE02MDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02MDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02MDM()
  {
    return fieldE02MDM.getBigDecimal();
  }

  /**
  * Set field E02MDD using a String value.
  */
  public void setE02MDD(String newvalue)
  {
    fieldE02MDD.setString(newvalue);
  }

  /**
  * Get value of field E02MDD as a String.
  */
  public String getE02MDD()
  {
    return fieldE02MDD.getString();
  }

  /**
  * Set numeric field E02MDD using a BigDecimal value.
  */
  public void setE02MDD(BigDecimal newvalue)
  {
    fieldE02MDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02MDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02MDD()
  {
    return fieldE02MDD.getBigDecimal();
  }

  /**
  * Set field E02MDY using a String value.
  */
  public void setE02MDY(String newvalue)
  {
    fieldE02MDY.setString(newvalue);
  }

  /**
  * Get value of field E02MDY as a String.
  */
  public String getE02MDY()
  {
    return fieldE02MDY.getString();
  }

  /**
  * Set numeric field E02MDY using a BigDecimal value.
  */
  public void setE02MDY(BigDecimal newvalue)
  {
    fieldE02MDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02MDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02MDY()
  {
    return fieldE02MDY.getBigDecimal();
  }

  /**
  * Set field E02MTM using a String value.
  */
  public void setE02MTM(String newvalue)
  {
    fieldE02MTM.setString(newvalue);
  }

  /**
  * Get value of field E02MTM as a String.
  */
  public String getE02MTM()
  {
    return fieldE02MTM.getString();
  }

  /**
  * Set field E02MUS using a String value.
  */
  public void setE02MUS(String newvalue)
  {
    fieldE02MUS.setString(newvalue);
  }

  /**
  * Get value of field E02MUS as a String.
  */
  public String getE02MUS()
  {
    return fieldE02MUS.getString();
  }

  /**
  * Set field E02NUMREC using a String value.
  */
  public void setE02NUMREC(String newvalue)
  {
    fieldE02NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E02NUMREC as a String.
  */
  public String getE02NUMREC()
  {
    return fieldE02NUMREC.getString();
  }

  /**
  * Set numeric field E02NUMREC using a BigDecimal value.
  */
  public void setE02NUMREC(BigDecimal newvalue)
  {
    fieldE02NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02NUMREC()
  {
    return fieldE02NUMREC.getBigDecimal();
  }

  /**
  * Set field E02INDOPE using a String value.
  */
  public void setE02INDOPE(String newvalue)
  {
    fieldE02INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E02INDOPE as a String.
  */
  public String getE02INDOPE()
  {
    return fieldE02INDOPE.getString();
  }

}