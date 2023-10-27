package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EBP014001 physical file definition.
* 
* File level identifier is 1151005060549.
* Record format level identifier is 2754FFC7D0D00.
*/

public class EBP014001Message extends MessageRecord
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
                                     "E01REQTYP",
                                     "E01REQBNK",
                                     "E01REQBRN",
                                     "E01REQPVI",
                                     "E01REQDFM",
                                     "E01REQDFD",
                                     "E01REQDFY",
                                     "E01REQDTM",
                                     "E01REQDTD",
                                     "E01REQDTY",
                                     "E01BPBNUM",
                                     "E01BPBSEQ",
                                     "E01BPBBIL",
                                     "E01BPBCOD",
                                     "E01BPBCUN",
                                     "E01BPBVCN",
                                     "E01BPBORD",
                                     "E01BPBTYP",
                                     "E01BPBTYPD",
                                     "E01BPBBNK",
                                     "E01BPBBRN",
                                     "E01BPBCCY",
                                     "E01BPBBAM",
                                     "E01BPBDSC",
                                     "E01BPBPTY",
                                     "E01BPBPDY",
                                     "E01BPBPDM",
                                     "E01BPBPDD",
                                     "E01BPBPLI",
                                     "E01BPBPVI",
                                     "E01BPPAMT",
                                     "E01BPPPDY",
                                     "E01BPPPDM",
                                     "E01BPPPDD",
                                     "E01BPPPVI",
                                     "E01BPPUSR",
                                     "E01BPPAUS",
                                     "E01BPPADY",
                                     "E01BPPADM",
                                     "E01BPPADD",
                                     "E01BPPSTS",
                                     "E01BPPRTI",
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
                                   "E01REQTYP",
                                   "E01REQBNK",
                                   "E01REQBRN",
                                   "E01REQPVI",
                                   "E01REQDFM",
                                   "E01REQDFD",
                                   "E01REQDFY",
                                   "E01REQDTM",
                                   "E01REQDTD",
                                   "E01REQDTY",
                                   "E01BPBNUM",
                                   "E01BPBSEQ",
                                   "E01BPBBIL",
                                   "E01BPBCOD",
                                   "E01BPBCUN",
                                   "E01BPBVCN",
                                   "E01BPBORD",
                                   "E01BPBTYP",
                                   "E01BPBTYPD",
                                   "E01BPBBNK",
                                   "E01BPBBRN",
                                   "E01BPBCCY",
                                   "E01BPBBAM",
                                   "E01BPBDSC",
                                   "E01BPBPTY",
                                   "E01BPBPDY",
                                   "E01BPBPDM",
                                   "E01BPBPDD",
                                   "E01BPBPLI",
                                   "E01BPBPVI",
                                   "E01BPPAMT",
                                   "E01BPPPDY",
                                   "E01BPPPDM",
                                   "E01BPPPDD",
                                   "E01BPPPVI",
                                   "E01BPPUSR",
                                   "E01BPPAUS",
                                   "E01BPPADY",
                                   "E01BPPADM",
                                   "E01BPPADD",
                                   "E01BPPSTS",
                                   "E01BPPRTI",
                                   "E01ACT",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1151005060549";
  final static String rid = "2754FFC7D0D00";
  final static String fmtname = "EBP014001";
  final int FIELDCOUNT = 54;
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
  private CharacterField fieldE01REQTYP = null;
  private CharacterField fieldE01REQBNK = null;
  private DecimalField fieldE01REQBRN = null;
  private CharacterField fieldE01REQPVI = null;
  private DecimalField fieldE01REQDFM = null;
  private DecimalField fieldE01REQDFD = null;
  private DecimalField fieldE01REQDFY = null;
  private DecimalField fieldE01REQDTM = null;
  private DecimalField fieldE01REQDTD = null;
  private DecimalField fieldE01REQDTY = null;
  private DecimalField fieldE01BPBNUM = null;
  private DecimalField fieldE01BPBSEQ = null;
  private CharacterField fieldE01BPBBIL = null;
  private DecimalField fieldE01BPBCOD = null;
  private DecimalField fieldE01BPBCUN = null;
  private CharacterField fieldE01BPBVCN = null;
  private DecimalField fieldE01BPBORD = null;
  private CharacterField fieldE01BPBTYP = null;
  private CharacterField fieldE01BPBTYPD = null;
  private CharacterField fieldE01BPBBNK = null;
  private DecimalField fieldE01BPBBRN = null;
  private CharacterField fieldE01BPBCCY = null;
  private DecimalField fieldE01BPBBAM = null;
  private CharacterField fieldE01BPBDSC = null;
  private CharacterField fieldE01BPBPTY = null;
  private DecimalField fieldE01BPBPDY = null;
  private DecimalField fieldE01BPBPDM = null;
  private DecimalField fieldE01BPBPDD = null;
  private CharacterField fieldE01BPBPLI = null;
  private CharacterField fieldE01BPBPVI = null;
  private DecimalField fieldE01BPPAMT = null;
  private DecimalField fieldE01BPPPDY = null;
  private DecimalField fieldE01BPPPDM = null;
  private DecimalField fieldE01BPPPDD = null;
  private CharacterField fieldE01BPPPVI = null;
  private CharacterField fieldE01BPPUSR = null;
  private CharacterField fieldE01BPPAUS = null;
  private DecimalField fieldE01BPPADY = null;
  private DecimalField fieldE01BPPADM = null;
  private DecimalField fieldE01BPPADD = null;
  private CharacterField fieldE01BPPSTS = null;
  private CharacterField fieldE01BPPRTI = null;
  private CharacterField fieldE01ACT = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for EBP014001Message.
  */
  public EBP014001Message()
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
    recordsize = 397;
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
    fields[9] = fieldE01REQTYP =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01REQTYP");
    fields[10] = fieldE01REQBNK =
    new CharacterField(message, HEADERSIZE + 43, 2, "E01REQBNK");
    fields[11] = fieldE01REQBRN =
    new DecimalField(message, HEADERSIZE + 45, 5, 0, "E01REQBRN");
    fields[12] = fieldE01REQPVI =
    new CharacterField(message, HEADERSIZE + 50, 1, "E01REQPVI");
    fields[13] = fieldE01REQDFM =
    new DecimalField(message, HEADERSIZE + 51, 3, 0, "E01REQDFM");
    fields[14] = fieldE01REQDFD =
    new DecimalField(message, HEADERSIZE + 54, 3, 0, "E01REQDFD");
    fields[15] = fieldE01REQDFY =
    new DecimalField(message, HEADERSIZE + 57, 5, 0, "E01REQDFY");
    fields[16] = fieldE01REQDTM =
    new DecimalField(message, HEADERSIZE + 62, 3, 0, "E01REQDTM");
    fields[17] = fieldE01REQDTD =
    new DecimalField(message, HEADERSIZE + 65, 3, 0, "E01REQDTD");
    fields[18] = fieldE01REQDTY =
    new DecimalField(message, HEADERSIZE + 68, 5, 0, "E01REQDTY");
    fields[19] = fieldE01BPBNUM =
    new DecimalField(message, HEADERSIZE + 73, 13, 0, "E01BPBNUM");
    fields[20] = fieldE01BPBSEQ =
    new DecimalField(message, HEADERSIZE + 86, 4, 0, "E01BPBSEQ");
    fields[21] = fieldE01BPBBIL =
    new CharacterField(message, HEADERSIZE + 90, 25, "E01BPBBIL");
    fields[22] = fieldE01BPBCOD =
    new DecimalField(message, HEADERSIZE + 115, 10, 0, "E01BPBCOD");
    fields[23] = fieldE01BPBCUN =
    new DecimalField(message, HEADERSIZE + 125, 10, 0, "E01BPBCUN");
    fields[24] = fieldE01BPBVCN =
    new CharacterField(message, HEADERSIZE + 135, 45, "E01BPBVCN");
    fields[25] = fieldE01BPBORD =
    new DecimalField(message, HEADERSIZE + 180, 13, 0, "E01BPBORD");
    fields[26] = fieldE01BPBTYP =
    new CharacterField(message, HEADERSIZE + 193, 1, "E01BPBTYP");
    fields[27] = fieldE01BPBTYPD =
    new CharacterField(message, HEADERSIZE + 194, 45, "E01BPBTYPD");
    fields[28] = fieldE01BPBBNK =
    new CharacterField(message, HEADERSIZE + 239, 2, "E01BPBBNK");
    fields[29] = fieldE01BPBBRN =
    new DecimalField(message, HEADERSIZE + 241, 5, 0, "E01BPBBRN");
    fields[30] = fieldE01BPBCCY =
    new CharacterField(message, HEADERSIZE + 246, 3, "E01BPBCCY");
    fields[31] = fieldE01BPBBAM =
    new DecimalField(message, HEADERSIZE + 249, 17, 2, "E01BPBBAM");
    fields[32] = fieldE01BPBDSC =
    new CharacterField(message, HEADERSIZE + 266, 45, "E01BPBDSC");
    fields[33] = fieldE01BPBPTY =
    new CharacterField(message, HEADERSIZE + 311, 1, "E01BPBPTY");
    fields[34] = fieldE01BPBPDY =
    new DecimalField(message, HEADERSIZE + 312, 5, 0, "E01BPBPDY");
    fields[35] = fieldE01BPBPDM =
    new DecimalField(message, HEADERSIZE + 317, 3, 0, "E01BPBPDM");
    fields[36] = fieldE01BPBPDD =
    new DecimalField(message, HEADERSIZE + 320, 3, 0, "E01BPBPDD");
    fields[37] = fieldE01BPBPLI =
    new CharacterField(message, HEADERSIZE + 323, 1, "E01BPBPLI");
    fields[38] = fieldE01BPBPVI =
    new CharacterField(message, HEADERSIZE + 324, 1, "E01BPBPVI");
    fields[39] = fieldE01BPPAMT =
    new DecimalField(message, HEADERSIZE + 325, 17, 2, "E01BPPAMT");
    fields[40] = fieldE01BPPPDY =
    new DecimalField(message, HEADERSIZE + 342, 5, 0, "E01BPPPDY");
    fields[41] = fieldE01BPPPDM =
    new DecimalField(message, HEADERSIZE + 347, 3, 0, "E01BPPPDM");
    fields[42] = fieldE01BPPPDD =
    new DecimalField(message, HEADERSIZE + 350, 3, 0, "E01BPPPDD");
    fields[43] = fieldE01BPPPVI =
    new CharacterField(message, HEADERSIZE + 353, 1, "E01BPPPVI");
    fields[44] = fieldE01BPPUSR =
    new CharacterField(message, HEADERSIZE + 354, 10, "E01BPPUSR");
    fields[45] = fieldE01BPPAUS =
    new CharacterField(message, HEADERSIZE + 364, 10, "E01BPPAUS");
    fields[46] = fieldE01BPPADY =
    new DecimalField(message, HEADERSIZE + 374, 5, 0, "E01BPPADY");
    fields[47] = fieldE01BPPADM =
    new DecimalField(message, HEADERSIZE + 379, 3, 0, "E01BPPADM");
    fields[48] = fieldE01BPPADD =
    new DecimalField(message, HEADERSIZE + 382, 3, 0, "E01BPPADD");
    fields[49] = fieldE01BPPSTS =
    new CharacterField(message, HEADERSIZE + 385, 1, "E01BPPSTS");
    fields[50] = fieldE01BPPRTI =
    new CharacterField(message, HEADERSIZE + 386, 1, "E01BPPRTI");
    fields[51] = fieldE01ACT =
    new CharacterField(message, HEADERSIZE + 387, 1, "E01ACT");
    fields[52] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 388, 8, 0, "E01NUMREC");
    fields[53] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 396, 1, "E01INDOPE");

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
  * Set field E01REQTYP using a String value.
  */
  public void setE01REQTYP(String newvalue)
  {
    fieldE01REQTYP.setString(newvalue);
  }

  /**
  * Get value of field E01REQTYP as a String.
  */
  public String getE01REQTYP()
  {
    return fieldE01REQTYP.getString();
  }

  /**
  * Set field E01REQBNK using a String value.
  */
  public void setE01REQBNK(String newvalue)
  {
    fieldE01REQBNK.setString(newvalue);
  }

  /**
  * Get value of field E01REQBNK as a String.
  */
  public String getE01REQBNK()
  {
    return fieldE01REQBNK.getString();
  }

  /**
  * Set field E01REQBRN using a String value.
  */
  public void setE01REQBRN(String newvalue)
  {
    fieldE01REQBRN.setString(newvalue);
  }

  /**
  * Get value of field E01REQBRN as a String.
  */
  public String getE01REQBRN()
  {
    return fieldE01REQBRN.getString();
  }

  /**
  * Set numeric field E01REQBRN using a BigDecimal value.
  */
  public void setE01REQBRN(BigDecimal newvalue)
  {
    fieldE01REQBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REQBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REQBRN()
  {
    return fieldE01REQBRN.getBigDecimal();
  }

  /**
  * Set field E01REQPVI using a String value.
  */
  public void setE01REQPVI(String newvalue)
  {
    fieldE01REQPVI.setString(newvalue);
  }

  /**
  * Get value of field E01REQPVI as a String.
  */
  public String getE01REQPVI()
  {
    return fieldE01REQPVI.getString();
  }

  /**
  * Set field E01REQDFM using a String value.
  */
  public void setE01REQDFM(String newvalue)
  {
    fieldE01REQDFM.setString(newvalue);
  }

  /**
  * Get value of field E01REQDFM as a String.
  */
  public String getE01REQDFM()
  {
    return fieldE01REQDFM.getString();
  }

  /**
  * Set numeric field E01REQDFM using a BigDecimal value.
  */
  public void setE01REQDFM(BigDecimal newvalue)
  {
    fieldE01REQDFM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REQDFM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REQDFM()
  {
    return fieldE01REQDFM.getBigDecimal();
  }

  /**
  * Set field E01REQDFD using a String value.
  */
  public void setE01REQDFD(String newvalue)
  {
    fieldE01REQDFD.setString(newvalue);
  }

  /**
  * Get value of field E01REQDFD as a String.
  */
  public String getE01REQDFD()
  {
    return fieldE01REQDFD.getString();
  }

  /**
  * Set numeric field E01REQDFD using a BigDecimal value.
  */
  public void setE01REQDFD(BigDecimal newvalue)
  {
    fieldE01REQDFD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REQDFD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REQDFD()
  {
    return fieldE01REQDFD.getBigDecimal();
  }

  /**
  * Set field E01REQDFY using a String value.
  */
  public void setE01REQDFY(String newvalue)
  {
    fieldE01REQDFY.setString(newvalue);
  }

  /**
  * Get value of field E01REQDFY as a String.
  */
  public String getE01REQDFY()
  {
    return fieldE01REQDFY.getString();
  }

  /**
  * Set numeric field E01REQDFY using a BigDecimal value.
  */
  public void setE01REQDFY(BigDecimal newvalue)
  {
    fieldE01REQDFY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REQDFY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REQDFY()
  {
    return fieldE01REQDFY.getBigDecimal();
  }

  /**
  * Set field E01REQDTM using a String value.
  */
  public void setE01REQDTM(String newvalue)
  {
    fieldE01REQDTM.setString(newvalue);
  }

  /**
  * Get value of field E01REQDTM as a String.
  */
  public String getE01REQDTM()
  {
    return fieldE01REQDTM.getString();
  }

  /**
  * Set numeric field E01REQDTM using a BigDecimal value.
  */
  public void setE01REQDTM(BigDecimal newvalue)
  {
    fieldE01REQDTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REQDTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REQDTM()
  {
    return fieldE01REQDTM.getBigDecimal();
  }

  /**
  * Set field E01REQDTD using a String value.
  */
  public void setE01REQDTD(String newvalue)
  {
    fieldE01REQDTD.setString(newvalue);
  }

  /**
  * Get value of field E01REQDTD as a String.
  */
  public String getE01REQDTD()
  {
    return fieldE01REQDTD.getString();
  }

  /**
  * Set numeric field E01REQDTD using a BigDecimal value.
  */
  public void setE01REQDTD(BigDecimal newvalue)
  {
    fieldE01REQDTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REQDTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REQDTD()
  {
    return fieldE01REQDTD.getBigDecimal();
  }

  /**
  * Set field E01REQDTY using a String value.
  */
  public void setE01REQDTY(String newvalue)
  {
    fieldE01REQDTY.setString(newvalue);
  }

  /**
  * Get value of field E01REQDTY as a String.
  */
  public String getE01REQDTY()
  {
    return fieldE01REQDTY.getString();
  }

  /**
  * Set numeric field E01REQDTY using a BigDecimal value.
  */
  public void setE01REQDTY(BigDecimal newvalue)
  {
    fieldE01REQDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REQDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REQDTY()
  {
    return fieldE01REQDTY.getBigDecimal();
  }

  /**
  * Set field E01BPBNUM using a String value.
  */
  public void setE01BPBNUM(String newvalue)
  {
    fieldE01BPBNUM.setString(newvalue);
  }

  /**
  * Get value of field E01BPBNUM as a String.
  */
  public String getE01BPBNUM()
  {
    return fieldE01BPBNUM.getString();
  }

  /**
  * Set numeric field E01BPBNUM using a BigDecimal value.
  */
  public void setE01BPBNUM(BigDecimal newvalue)
  {
    fieldE01BPBNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPBNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPBNUM()
  {
    return fieldE01BPBNUM.getBigDecimal();
  }

  /**
  * Set field E01BPBSEQ using a String value.
  */
  public void setE01BPBSEQ(String newvalue)
  {
    fieldE01BPBSEQ.setString(newvalue);
  }

  /**
  * Get value of field E01BPBSEQ as a String.
  */
  public String getE01BPBSEQ()
  {
    return fieldE01BPBSEQ.getString();
  }

  /**
  * Set numeric field E01BPBSEQ using a BigDecimal value.
  */
  public void setE01BPBSEQ(BigDecimal newvalue)
  {
    fieldE01BPBSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPBSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPBSEQ()
  {
    return fieldE01BPBSEQ.getBigDecimal();
  }

  /**
  * Set field E01BPBBIL using a String value.
  */
  public void setE01BPBBIL(String newvalue)
  {
    fieldE01BPBBIL.setString(newvalue);
  }

  /**
  * Get value of field E01BPBBIL as a String.
  */
  public String getE01BPBBIL()
  {
    return fieldE01BPBBIL.getString();
  }

  /**
  * Set field E01BPBCOD using a String value.
  */
  public void setE01BPBCOD(String newvalue)
  {
    fieldE01BPBCOD.setString(newvalue);
  }

  /**
  * Get value of field E01BPBCOD as a String.
  */
  public String getE01BPBCOD()
  {
    return fieldE01BPBCOD.getString();
  }

  /**
  * Set numeric field E01BPBCOD using a BigDecimal value.
  */
  public void setE01BPBCOD(BigDecimal newvalue)
  {
    fieldE01BPBCOD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPBCOD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPBCOD()
  {
    return fieldE01BPBCOD.getBigDecimal();
  }

  /**
  * Set field E01BPBCUN using a String value.
  */
  public void setE01BPBCUN(String newvalue)
  {
    fieldE01BPBCUN.setString(newvalue);
  }

  /**
  * Get value of field E01BPBCUN as a String.
  */
  public String getE01BPBCUN()
  {
    return fieldE01BPBCUN.getString();
  }

  /**
  * Set numeric field E01BPBCUN using a BigDecimal value.
  */
  public void setE01BPBCUN(BigDecimal newvalue)
  {
    fieldE01BPBCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPBCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPBCUN()
  {
    return fieldE01BPBCUN.getBigDecimal();
  }

  /**
  * Set field E01BPBVCN using a String value.
  */
  public void setE01BPBVCN(String newvalue)
  {
    fieldE01BPBVCN.setString(newvalue);
  }

  /**
  * Get value of field E01BPBVCN as a String.
  */
  public String getE01BPBVCN()
  {
    return fieldE01BPBVCN.getString();
  }

  /**
  * Set field E01BPBORD using a String value.
  */
  public void setE01BPBORD(String newvalue)
  {
    fieldE01BPBORD.setString(newvalue);
  }

  /**
  * Get value of field E01BPBORD as a String.
  */
  public String getE01BPBORD()
  {
    return fieldE01BPBORD.getString();
  }

  /**
  * Set numeric field E01BPBORD using a BigDecimal value.
  */
  public void setE01BPBORD(BigDecimal newvalue)
  {
    fieldE01BPBORD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPBORD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPBORD()
  {
    return fieldE01BPBORD.getBigDecimal();
  }

  /**
  * Set field E01BPBTYP using a String value.
  */
  public void setE01BPBTYP(String newvalue)
  {
    fieldE01BPBTYP.setString(newvalue);
  }

  /**
  * Get value of field E01BPBTYP as a String.
  */
  public String getE01BPBTYP()
  {
    return fieldE01BPBTYP.getString();
  }

  /**
  * Set field E01BPBTYPD using a String value.
  */
  public void setE01BPBTYPD(String newvalue)
  {
    fieldE01BPBTYPD.setString(newvalue);
  }

  /**
  * Get value of field E01BPBTYPD as a String.
  */
  public String getE01BPBTYPD()
  {
    return fieldE01BPBTYPD.getString();
  }

  /**
  * Set field E01BPBBNK using a String value.
  */
  public void setE01BPBBNK(String newvalue)
  {
    fieldE01BPBBNK.setString(newvalue);
  }

  /**
  * Get value of field E01BPBBNK as a String.
  */
  public String getE01BPBBNK()
  {
    return fieldE01BPBBNK.getString();
  }

  /**
  * Set field E01BPBBRN using a String value.
  */
  public void setE01BPBBRN(String newvalue)
  {
    fieldE01BPBBRN.setString(newvalue);
  }

  /**
  * Get value of field E01BPBBRN as a String.
  */
  public String getE01BPBBRN()
  {
    return fieldE01BPBBRN.getString();
  }

  /**
  * Set numeric field E01BPBBRN using a BigDecimal value.
  */
  public void setE01BPBBRN(BigDecimal newvalue)
  {
    fieldE01BPBBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPBBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPBBRN()
  {
    return fieldE01BPBBRN.getBigDecimal();
  }

  /**
  * Set field E01BPBCCY using a String value.
  */
  public void setE01BPBCCY(String newvalue)
  {
    fieldE01BPBCCY.setString(newvalue);
  }

  /**
  * Get value of field E01BPBCCY as a String.
  */
  public String getE01BPBCCY()
  {
    return fieldE01BPBCCY.getString();
  }

  /**
  * Set field E01BPBBAM using a String value.
  */
  public void setE01BPBBAM(String newvalue)
  {
    fieldE01BPBBAM.setString(newvalue);
  }

  /**
  * Get value of field E01BPBBAM as a String.
  */
  public String getE01BPBBAM()
  {
    return fieldE01BPBBAM.getString();
  }

  /**
  * Set numeric field E01BPBBAM using a BigDecimal value.
  */
  public void setE01BPBBAM(BigDecimal newvalue)
  {
    fieldE01BPBBAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPBBAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPBBAM()
  {
    return fieldE01BPBBAM.getBigDecimal();
  }

  /**
  * Set field E01BPBDSC using a String value.
  */
  public void setE01BPBDSC(String newvalue)
  {
    fieldE01BPBDSC.setString(newvalue);
  }

  /**
  * Get value of field E01BPBDSC as a String.
  */
  public String getE01BPBDSC()
  {
    return fieldE01BPBDSC.getString();
  }

  /**
  * Set field E01BPBPTY using a String value.
  */
  public void setE01BPBPTY(String newvalue)
  {
    fieldE01BPBPTY.setString(newvalue);
  }

  /**
  * Get value of field E01BPBPTY as a String.
  */
  public String getE01BPBPTY()
  {
    return fieldE01BPBPTY.getString();
  }

  /**
  * Set field E01BPBPDY using a String value.
  */
  public void setE01BPBPDY(String newvalue)
  {
    fieldE01BPBPDY.setString(newvalue);
  }

  /**
  * Get value of field E01BPBPDY as a String.
  */
  public String getE01BPBPDY()
  {
    return fieldE01BPBPDY.getString();
  }

  /**
  * Set numeric field E01BPBPDY using a BigDecimal value.
  */
  public void setE01BPBPDY(BigDecimal newvalue)
  {
    fieldE01BPBPDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPBPDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPBPDY()
  {
    return fieldE01BPBPDY.getBigDecimal();
  }

  /**
  * Set field E01BPBPDM using a String value.
  */
  public void setE01BPBPDM(String newvalue)
  {
    fieldE01BPBPDM.setString(newvalue);
  }

  /**
  * Get value of field E01BPBPDM as a String.
  */
  public String getE01BPBPDM()
  {
    return fieldE01BPBPDM.getString();
  }

  /**
  * Set numeric field E01BPBPDM using a BigDecimal value.
  */
  public void setE01BPBPDM(BigDecimal newvalue)
  {
    fieldE01BPBPDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPBPDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPBPDM()
  {
    return fieldE01BPBPDM.getBigDecimal();
  }

  /**
  * Set field E01BPBPDD using a String value.
  */
  public void setE01BPBPDD(String newvalue)
  {
    fieldE01BPBPDD.setString(newvalue);
  }

  /**
  * Get value of field E01BPBPDD as a String.
  */
  public String getE01BPBPDD()
  {
    return fieldE01BPBPDD.getString();
  }

  /**
  * Set numeric field E01BPBPDD using a BigDecimal value.
  */
  public void setE01BPBPDD(BigDecimal newvalue)
  {
    fieldE01BPBPDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPBPDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPBPDD()
  {
    return fieldE01BPBPDD.getBigDecimal();
  }

  /**
  * Set field E01BPBPLI using a String value.
  */
  public void setE01BPBPLI(String newvalue)
  {
    fieldE01BPBPLI.setString(newvalue);
  }

  /**
  * Get value of field E01BPBPLI as a String.
  */
  public String getE01BPBPLI()
  {
    return fieldE01BPBPLI.getString();
  }

  /**
  * Set field E01BPBPVI using a String value.
  */
  public void setE01BPBPVI(String newvalue)
  {
    fieldE01BPBPVI.setString(newvalue);
  }

  /**
  * Get value of field E01BPBPVI as a String.
  */
  public String getE01BPBPVI()
  {
    return fieldE01BPBPVI.getString();
  }

  /**
  * Set field E01BPPAMT using a String value.
  */
  public void setE01BPPAMT(String newvalue)
  {
    fieldE01BPPAMT.setString(newvalue);
  }

  /**
  * Get value of field E01BPPAMT as a String.
  */
  public String getE01BPPAMT()
  {
    return fieldE01BPPAMT.getString();
  }

  /**
  * Set numeric field E01BPPAMT using a BigDecimal value.
  */
  public void setE01BPPAMT(BigDecimal newvalue)
  {
    fieldE01BPPAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPPAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPPAMT()
  {
    return fieldE01BPPAMT.getBigDecimal();
  }

  /**
  * Set field E01BPPPDY using a String value.
  */
  public void setE01BPPPDY(String newvalue)
  {
    fieldE01BPPPDY.setString(newvalue);
  }

  /**
  * Get value of field E01BPPPDY as a String.
  */
  public String getE01BPPPDY()
  {
    return fieldE01BPPPDY.getString();
  }

  /**
  * Set numeric field E01BPPPDY using a BigDecimal value.
  */
  public void setE01BPPPDY(BigDecimal newvalue)
  {
    fieldE01BPPPDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPPPDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPPPDY()
  {
    return fieldE01BPPPDY.getBigDecimal();
  }

  /**
  * Set field E01BPPPDM using a String value.
  */
  public void setE01BPPPDM(String newvalue)
  {
    fieldE01BPPPDM.setString(newvalue);
  }

  /**
  * Get value of field E01BPPPDM as a String.
  */
  public String getE01BPPPDM()
  {
    return fieldE01BPPPDM.getString();
  }

  /**
  * Set numeric field E01BPPPDM using a BigDecimal value.
  */
  public void setE01BPPPDM(BigDecimal newvalue)
  {
    fieldE01BPPPDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPPPDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPPPDM()
  {
    return fieldE01BPPPDM.getBigDecimal();
  }

  /**
  * Set field E01BPPPDD using a String value.
  */
  public void setE01BPPPDD(String newvalue)
  {
    fieldE01BPPPDD.setString(newvalue);
  }

  /**
  * Get value of field E01BPPPDD as a String.
  */
  public String getE01BPPPDD()
  {
    return fieldE01BPPPDD.getString();
  }

  /**
  * Set numeric field E01BPPPDD using a BigDecimal value.
  */
  public void setE01BPPPDD(BigDecimal newvalue)
  {
    fieldE01BPPPDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPPPDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPPPDD()
  {
    return fieldE01BPPPDD.getBigDecimal();
  }

  /**
  * Set field E01BPPPVI using a String value.
  */
  public void setE01BPPPVI(String newvalue)
  {
    fieldE01BPPPVI.setString(newvalue);
  }

  /**
  * Get value of field E01BPPPVI as a String.
  */
  public String getE01BPPPVI()
  {
    return fieldE01BPPPVI.getString();
  }

  /**
  * Set field E01BPPUSR using a String value.
  */
  public void setE01BPPUSR(String newvalue)
  {
    fieldE01BPPUSR.setString(newvalue);
  }

  /**
  * Get value of field E01BPPUSR as a String.
  */
  public String getE01BPPUSR()
  {
    return fieldE01BPPUSR.getString();
  }

  /**
  * Set field E01BPPAUS using a String value.
  */
  public void setE01BPPAUS(String newvalue)
  {
    fieldE01BPPAUS.setString(newvalue);
  }

  /**
  * Get value of field E01BPPAUS as a String.
  */
  public String getE01BPPAUS()
  {
    return fieldE01BPPAUS.getString();
  }

  /**
  * Set field E01BPPADY using a String value.
  */
  public void setE01BPPADY(String newvalue)
  {
    fieldE01BPPADY.setString(newvalue);
  }

  /**
  * Get value of field E01BPPADY as a String.
  */
  public String getE01BPPADY()
  {
    return fieldE01BPPADY.getString();
  }

  /**
  * Set numeric field E01BPPADY using a BigDecimal value.
  */
  public void setE01BPPADY(BigDecimal newvalue)
  {
    fieldE01BPPADY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPPADY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPPADY()
  {
    return fieldE01BPPADY.getBigDecimal();
  }

  /**
  * Set field E01BPPADM using a String value.
  */
  public void setE01BPPADM(String newvalue)
  {
    fieldE01BPPADM.setString(newvalue);
  }

  /**
  * Get value of field E01BPPADM as a String.
  */
  public String getE01BPPADM()
  {
    return fieldE01BPPADM.getString();
  }

  /**
  * Set numeric field E01BPPADM using a BigDecimal value.
  */
  public void setE01BPPADM(BigDecimal newvalue)
  {
    fieldE01BPPADM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPPADM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPPADM()
  {
    return fieldE01BPPADM.getBigDecimal();
  }

  /**
  * Set field E01BPPADD using a String value.
  */
  public void setE01BPPADD(String newvalue)
  {
    fieldE01BPPADD.setString(newvalue);
  }

  /**
  * Get value of field E01BPPADD as a String.
  */
  public String getE01BPPADD()
  {
    return fieldE01BPPADD.getString();
  }

  /**
  * Set numeric field E01BPPADD using a BigDecimal value.
  */
  public void setE01BPPADD(BigDecimal newvalue)
  {
    fieldE01BPPADD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPPADD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPPADD()
  {
    return fieldE01BPPADD.getBigDecimal();
  }

  /**
  * Set field E01BPPSTS using a String value.
  */
  public void setE01BPPSTS(String newvalue)
  {
    fieldE01BPPSTS.setString(newvalue);
  }

  /**
  * Get value of field E01BPPSTS as a String.
  */
  public String getE01BPPSTS()
  {
    return fieldE01BPPSTS.getString();
  }

  /**
  * Set field E01BPPRTI using a String value.
  */
  public void setE01BPPRTI(String newvalue)
  {
    fieldE01BPPRTI.setString(newvalue);
  }

  /**
  * Get value of field E01BPPRTI as a String.
  */
  public String getE01BPPRTI()
  {
    return fieldE01BPPRTI.getString();
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
