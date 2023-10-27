package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD150002 physical file definition.
* 
* File level identifier is 1130611112905.
* Record format level identifier is 4836D72A41B19.
*/

public class EDD150002Message extends MessageRecord
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
                                     "E02SELCUN",
                                     "E02SELNUM",
                                     "E02REQCMM",
                                     "E02REQCDD",
                                     "E02REQCYY",
                                     "E02REQCUS",
                                     "E02REQCCO",
                                     "E02REQROT",
                                     "E02REQIDN",
                                     "E02REQNAM",
                                     "E02REQSMM",
                                     "E02REQSDD",
                                     "E02REQSYY",
                                     "E02REQFMM",
                                     "E02REQFDD",
                                     "E02REQFYY",
                                     "E02REQACD",
                                     "E02REQAPC",
                                     "E02REQOFI",
                                     "E02REQOFP",
                                     "E02REQIDR",
                                     "E02REQNAR",
                                     "E02REQUS1",
                                     "E02REQUS2",
                                     "E02REQUS3",
                                     "E02REQUS4",
                                     "E02REQUS5"
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
                                   "E02SELCUN",
                                   "E02SELNUM",
                                   "E02REQCMM",
                                   "E02REQCDD",
                                   "E02REQCYY",
                                   "E02REQCUS",
                                   "E02REQCCO",
                                   "E02REQROT",
                                   "E02REQIDN",
                                   "E02REQNAM",
                                   "E02REQSMM",
                                   "E02REQSDD",
                                   "E02REQSYY",
                                   "E02REQFMM",
                                   "E02REQFDD",
                                   "E02REQFYY",
                                   "E02REQACD",
                                   "E02REQAPC",
                                   "E02REQOFI",
                                   "E02REQOFP",
                                   "E02REQIDR",
                                   "E02REQNAR",
                                   "E02REQUS1",
                                   "E02REQUS2",
                                   "E02REQUS3",
                                   "E02REQUS4",
                                   "E02REQUS5"
                                 };
  final static String fid = "1130611112905";
  final static String rid = "4836D72A41B19";
  final static String fmtname = "EDD150002";
  final int FIELDCOUNT = 36;
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
  private DecimalField fieldE02SELCUN = null;
  private DecimalField fieldE02SELNUM = null;
  private DecimalField fieldE02REQCMM = null;
  private DecimalField fieldE02REQCDD = null;
  private DecimalField fieldE02REQCYY = null;
  private CharacterField fieldE02REQCUS = null;
  private CharacterField fieldE02REQCCO = null;
  private CharacterField fieldE02REQROT = null;
  private CharacterField fieldE02REQIDN = null;
  private CharacterField fieldE02REQNAM = null;
  private DecimalField fieldE02REQSMM = null;
  private DecimalField fieldE02REQSDD = null;
  private DecimalField fieldE02REQSYY = null;
  private DecimalField fieldE02REQFMM = null;
  private DecimalField fieldE02REQFDD = null;
  private DecimalField fieldE02REQFYY = null;
  private CharacterField fieldE02REQACD = null;
  private CharacterField fieldE02REQAPC = null;
  private CharacterField fieldE02REQOFI = null;
  private CharacterField fieldE02REQOFP = null;
  private CharacterField fieldE02REQIDR = null;
  private CharacterField fieldE02REQNAR = null;
  private CharacterField fieldE02REQUS1 = null;
  private CharacterField fieldE02REQUS2 = null;
  private CharacterField fieldE02REQUS3 = null;
  private CharacterField fieldE02REQUS4 = null;
  private CharacterField fieldE02REQUS5 = null;

  /**
  * Constructor for EDD150002Message.
  */
  public EDD150002Message()
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
    recordsize = 429;
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
    fields[9] = fieldE02SELCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E02SELCUN");
    fields[10] = fieldE02SELNUM =
    new DecimalField(message, HEADERSIZE + 52, 7, 0, "E02SELNUM");
    fields[11] = fieldE02REQCMM =
    new DecimalField(message, HEADERSIZE + 59, 3, 0, "E02REQCMM");
    fields[12] = fieldE02REQCDD =
    new DecimalField(message, HEADERSIZE + 62, 3, 0, "E02REQCDD");
    fields[13] = fieldE02REQCYY =
    new DecimalField(message, HEADERSIZE + 65, 5, 0, "E02REQCYY");
    fields[14] = fieldE02REQCUS =
    new CharacterField(message, HEADERSIZE + 70, 10, "E02REQCUS");
    fields[15] = fieldE02REQCCO =
    new CharacterField(message, HEADERSIZE + 80, 25, "E02REQCCO");
    fields[16] = fieldE02REQROT =
    new CharacterField(message, HEADERSIZE + 105, 25, "E02REQROT");
    fields[17] = fieldE02REQIDN =
    new CharacterField(message, HEADERSIZE + 130, 10, "E02REQIDN");
    fields[18] = fieldE02REQNAM =
    new CharacterField(message, HEADERSIZE + 140, 45, "E02REQNAM");
    fields[19] = fieldE02REQSMM =
    new DecimalField(message, HEADERSIZE + 185, 3, 0, "E02REQSMM");
    fields[20] = fieldE02REQSDD =
    new DecimalField(message, HEADERSIZE + 188, 3, 0, "E02REQSDD");
    fields[21] = fieldE02REQSYY =
    new DecimalField(message, HEADERSIZE + 191, 5, 0, "E02REQSYY");
    fields[22] = fieldE02REQFMM =
    new DecimalField(message, HEADERSIZE + 196, 3, 0, "E02REQFMM");
    fields[23] = fieldE02REQFDD =
    new DecimalField(message, HEADERSIZE + 199, 3, 0, "E02REQFDD");
    fields[24] = fieldE02REQFYY =
    new DecimalField(message, HEADERSIZE + 202, 5, 0, "E02REQFYY");
    fields[25] = fieldE02REQACD =
    new CharacterField(message, HEADERSIZE + 207, 2, "E02REQACD");
    fields[26] = fieldE02REQAPC =
    new CharacterField(message, HEADERSIZE + 209, 2, "E02REQAPC");
    fields[27] = fieldE02REQOFI =
    new CharacterField(message, HEADERSIZE + 211, 25, "E02REQOFI");
    fields[28] = fieldE02REQOFP =
    new CharacterField(message, HEADERSIZE + 236, 25, "E02REQOFP");
    fields[29] = fieldE02REQIDR =
    new CharacterField(message, HEADERSIZE + 261, 10, "E02REQIDR");
    fields[30] = fieldE02REQNAR =
    new CharacterField(message, HEADERSIZE + 271, 45, "E02REQNAR");
    fields[31] = fieldE02REQUS1 =
    new CharacterField(message, HEADERSIZE + 316, 4, "E02REQUS1");
    fields[32] = fieldE02REQUS2 =
    new CharacterField(message, HEADERSIZE + 320, 4, "E02REQUS2");
    fields[33] = fieldE02REQUS3 =
    new CharacterField(message, HEADERSIZE + 324, 45, "E02REQUS3");
    fields[34] = fieldE02REQUS4 =
    new CharacterField(message, HEADERSIZE + 369, 45, "E02REQUS4");
    fields[35] = fieldE02REQUS5 =
    new CharacterField(message, HEADERSIZE + 414, 15, "E02REQUS5");

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
  * Set field E02SELCUN using a String value.
  */
  public void setE02SELCUN(String newvalue)
  {
    fieldE02SELCUN.setString(newvalue);
  }

  /**
  * Get value of field E02SELCUN as a String.
  */
  public String getE02SELCUN()
  {
    return fieldE02SELCUN.getString();
  }

  /**
  * Set numeric field E02SELCUN using a BigDecimal value.
  */
  public void setE02SELCUN(BigDecimal newvalue)
  {
    fieldE02SELCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELCUN()
  {
    return fieldE02SELCUN.getBigDecimal();
  }

  /**
  * Set field E02SELNUM using a String value.
  */
  public void setE02SELNUM(String newvalue)
  {
    fieldE02SELNUM.setString(newvalue);
  }

  /**
  * Get value of field E02SELNUM as a String.
  */
  public String getE02SELNUM()
  {
    return fieldE02SELNUM.getString();
  }

  /**
  * Set numeric field E02SELNUM using a BigDecimal value.
  */
  public void setE02SELNUM(BigDecimal newvalue)
  {
    fieldE02SELNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELNUM()
  {
    return fieldE02SELNUM.getBigDecimal();
  }

  /**
  * Set field E02REQCMM using a String value.
  */
  public void setE02REQCMM(String newvalue)
  {
    fieldE02REQCMM.setString(newvalue);
  }

  /**
  * Get value of field E02REQCMM as a String.
  */
  public String getE02REQCMM()
  {
    return fieldE02REQCMM.getString();
  }

  /**
  * Set numeric field E02REQCMM using a BigDecimal value.
  */
  public void setE02REQCMM(BigDecimal newvalue)
  {
    fieldE02REQCMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQCMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQCMM()
  {
    return fieldE02REQCMM.getBigDecimal();
  }

  /**
  * Set field E02REQCDD using a String value.
  */
  public void setE02REQCDD(String newvalue)
  {
    fieldE02REQCDD.setString(newvalue);
  }

  /**
  * Get value of field E02REQCDD as a String.
  */
  public String getE02REQCDD()
  {
    return fieldE02REQCDD.getString();
  }

  /**
  * Set numeric field E02REQCDD using a BigDecimal value.
  */
  public void setE02REQCDD(BigDecimal newvalue)
  {
    fieldE02REQCDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQCDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQCDD()
  {
    return fieldE02REQCDD.getBigDecimal();
  }

  /**
  * Set field E02REQCYY using a String value.
  */
  public void setE02REQCYY(String newvalue)
  {
    fieldE02REQCYY.setString(newvalue);
  }

  /**
  * Get value of field E02REQCYY as a String.
  */
  public String getE02REQCYY()
  {
    return fieldE02REQCYY.getString();
  }

  /**
  * Set numeric field E02REQCYY using a BigDecimal value.
  */
  public void setE02REQCYY(BigDecimal newvalue)
  {
    fieldE02REQCYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQCYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQCYY()
  {
    return fieldE02REQCYY.getBigDecimal();
  }

  /**
  * Set field E02REQCUS using a String value.
  */
  public void setE02REQCUS(String newvalue)
  {
    fieldE02REQCUS.setString(newvalue);
  }

  /**
  * Get value of field E02REQCUS as a String.
  */
  public String getE02REQCUS()
  {
    return fieldE02REQCUS.getString();
  }

  /**
  * Set field E02REQCCO using a String value.
  */
  public void setE02REQCCO(String newvalue)
  {
    fieldE02REQCCO.setString(newvalue);
  }

  /**
  * Get value of field E02REQCCO as a String.
  */
  public String getE02REQCCO()
  {
    return fieldE02REQCCO.getString();
  }

  /**
  * Set field E02REQROT using a String value.
  */
  public void setE02REQROT(String newvalue)
  {
    fieldE02REQROT.setString(newvalue);
  }

  /**
  * Get value of field E02REQROT as a String.
  */
  public String getE02REQROT()
  {
    return fieldE02REQROT.getString();
  }

  /**
  * Set field E02REQIDN using a String value.
  */
  public void setE02REQIDN(String newvalue)
  {
    fieldE02REQIDN.setString(newvalue);
  }

  /**
  * Get value of field E02REQIDN as a String.
  */
  public String getE02REQIDN()
  {
    return fieldE02REQIDN.getString();
  }

  /**
  * Set field E02REQNAM using a String value.
  */
  public void setE02REQNAM(String newvalue)
  {
    fieldE02REQNAM.setString(newvalue);
  }

  /**
  * Get value of field E02REQNAM as a String.
  */
  public String getE02REQNAM()
  {
    return fieldE02REQNAM.getString();
  }

  /**
  * Set field E02REQSMM using a String value.
  */
  public void setE02REQSMM(String newvalue)
  {
    fieldE02REQSMM.setString(newvalue);
  }

  /**
  * Get value of field E02REQSMM as a String.
  */
  public String getE02REQSMM()
  {
    return fieldE02REQSMM.getString();
  }

  /**
  * Set numeric field E02REQSMM using a BigDecimal value.
  */
  public void setE02REQSMM(BigDecimal newvalue)
  {
    fieldE02REQSMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQSMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQSMM()
  {
    return fieldE02REQSMM.getBigDecimal();
  }

  /**
  * Set field E02REQSDD using a String value.
  */
  public void setE02REQSDD(String newvalue)
  {
    fieldE02REQSDD.setString(newvalue);
  }

  /**
  * Get value of field E02REQSDD as a String.
  */
  public String getE02REQSDD()
  {
    return fieldE02REQSDD.getString();
  }

  /**
  * Set numeric field E02REQSDD using a BigDecimal value.
  */
  public void setE02REQSDD(BigDecimal newvalue)
  {
    fieldE02REQSDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQSDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQSDD()
  {
    return fieldE02REQSDD.getBigDecimal();
  }

  /**
  * Set field E02REQSYY using a String value.
  */
  public void setE02REQSYY(String newvalue)
  {
    fieldE02REQSYY.setString(newvalue);
  }

  /**
  * Get value of field E02REQSYY as a String.
  */
  public String getE02REQSYY()
  {
    return fieldE02REQSYY.getString();
  }

  /**
  * Set numeric field E02REQSYY using a BigDecimal value.
  */
  public void setE02REQSYY(BigDecimal newvalue)
  {
    fieldE02REQSYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQSYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQSYY()
  {
    return fieldE02REQSYY.getBigDecimal();
  }

  /**
  * Set field E02REQFMM using a String value.
  */
  public void setE02REQFMM(String newvalue)
  {
    fieldE02REQFMM.setString(newvalue);
  }

  /**
  * Get value of field E02REQFMM as a String.
  */
  public String getE02REQFMM()
  {
    return fieldE02REQFMM.getString();
  }

  /**
  * Set numeric field E02REQFMM using a BigDecimal value.
  */
  public void setE02REQFMM(BigDecimal newvalue)
  {
    fieldE02REQFMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQFMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQFMM()
  {
    return fieldE02REQFMM.getBigDecimal();
  }

  /**
  * Set field E02REQFDD using a String value.
  */
  public void setE02REQFDD(String newvalue)
  {
    fieldE02REQFDD.setString(newvalue);
  }

  /**
  * Get value of field E02REQFDD as a String.
  */
  public String getE02REQFDD()
  {
    return fieldE02REQFDD.getString();
  }

  /**
  * Set numeric field E02REQFDD using a BigDecimal value.
  */
  public void setE02REQFDD(BigDecimal newvalue)
  {
    fieldE02REQFDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQFDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQFDD()
  {
    return fieldE02REQFDD.getBigDecimal();
  }

  /**
  * Set field E02REQFYY using a String value.
  */
  public void setE02REQFYY(String newvalue)
  {
    fieldE02REQFYY.setString(newvalue);
  }

  /**
  * Get value of field E02REQFYY as a String.
  */
  public String getE02REQFYY()
  {
    return fieldE02REQFYY.getString();
  }

  /**
  * Set numeric field E02REQFYY using a BigDecimal value.
  */
  public void setE02REQFYY(BigDecimal newvalue)
  {
    fieldE02REQFYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQFYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQFYY()
  {
    return fieldE02REQFYY.getBigDecimal();
  }

  /**
  * Set field E02REQACD using a String value.
  */
  public void setE02REQACD(String newvalue)
  {
    fieldE02REQACD.setString(newvalue);
  }

  /**
  * Get value of field E02REQACD as a String.
  */
  public String getE02REQACD()
  {
    return fieldE02REQACD.getString();
  }

  /**
  * Set field E02REQAPC using a String value.
  */
  public void setE02REQAPC(String newvalue)
  {
    fieldE02REQAPC.setString(newvalue);
  }

  /**
  * Get value of field E02REQAPC as a String.
  */
  public String getE02REQAPC()
  {
    return fieldE02REQAPC.getString();
  }

  /**
  * Set field E02REQOFI using a String value.
  */
  public void setE02REQOFI(String newvalue)
  {
    fieldE02REQOFI.setString(newvalue);
  }

  /**
  * Get value of field E02REQOFI as a String.
  */
  public String getE02REQOFI()
  {
    return fieldE02REQOFI.getString();
  }

  /**
  * Set field E02REQOFP using a String value.
  */
  public void setE02REQOFP(String newvalue)
  {
    fieldE02REQOFP.setString(newvalue);
  }

  /**
  * Get value of field E02REQOFP as a String.
  */
  public String getE02REQOFP()
  {
    return fieldE02REQOFP.getString();
  }

  /**
  * Set field E02REQIDR using a String value.
  */
  public void setE02REQIDR(String newvalue)
  {
    fieldE02REQIDR.setString(newvalue);
  }

  /**
  * Get value of field E02REQIDR as a String.
  */
  public String getE02REQIDR()
  {
    return fieldE02REQIDR.getString();
  }

  /**
  * Set field E02REQNAR using a String value.
  */
  public void setE02REQNAR(String newvalue)
  {
    fieldE02REQNAR.setString(newvalue);
  }

  /**
  * Get value of field E02REQNAR as a String.
  */
  public String getE02REQNAR()
  {
    return fieldE02REQNAR.getString();
  }

  /**
  * Set field E02REQUS1 using a String value.
  */
  public void setE02REQUS1(String newvalue)
  {
    fieldE02REQUS1.setString(newvalue);
  }

  /**
  * Get value of field E02REQUS1 as a String.
  */
  public String getE02REQUS1()
  {
    return fieldE02REQUS1.getString();
  }

  /**
  * Set field E02REQUS2 using a String value.
  */
  public void setE02REQUS2(String newvalue)
  {
    fieldE02REQUS2.setString(newvalue);
  }

  /**
  * Get value of field E02REQUS2 as a String.
  */
  public String getE02REQUS2()
  {
    return fieldE02REQUS2.getString();
  }

  /**
  * Set field E02REQUS3 using a String value.
  */
  public void setE02REQUS3(String newvalue)
  {
    fieldE02REQUS3.setString(newvalue);
  }

  /**
  * Get value of field E02REQUS3 as a String.
  */
  public String getE02REQUS3()
  {
    return fieldE02REQUS3.getString();
  }

  /**
  * Set field E02REQUS4 using a String value.
  */
  public void setE02REQUS4(String newvalue)
  {
    fieldE02REQUS4.setString(newvalue);
  }

  /**
  * Get value of field E02REQUS4 as a String.
  */
  public String getE02REQUS4()
  {
    return fieldE02REQUS4.getString();
  }

  /**
  * Set field E02REQUS5 using a String value.
  */
  public void setE02REQUS5(String newvalue)
  {
    fieldE02REQUS5.setString(newvalue);
  }

  /**
  * Get value of field E02REQUS5 as a String.
  */
  public String getE02REQUS5()
  {
    return fieldE02REQUS5.getString();
  }

}