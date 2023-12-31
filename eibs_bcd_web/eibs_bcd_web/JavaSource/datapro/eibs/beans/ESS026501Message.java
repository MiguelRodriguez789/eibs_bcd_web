package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESS026501 physical file definition.
* 
* File level identifier is 1170809175504.
* Record format level identifier is 2CD2DA19D72ED.
*/

public class ESS026501Message extends MessageRecord
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
                                     "H01CUN",
                                     "H01LGT",
                                     "H01STS",
                                     "H01NA1",
                                     "H01IDN",
                                     "H01TID",
                                     "H01PID",
                                     "E01REQTYP",
                                     "E01REQORD",
                                     "E01REQFRM",
                                     "E01REQDFD",
                                     "E01REQDFM",
                                     "E01REQDFY",
                                     "E01REQDTD",
                                     "E01REQDTM",
                                     "E01REQDTY",
                                     "E01CULCUN",
                                     "E01CULFNA",
                                     "E01CULFN2",
                                     "E01CULLN1",
                                     "E01CULLN2",
                                     "E01CULIDN",
                                     "E01CULTID",
                                     "E01CULPID",
                                     "E01CULRMK",
                                     "E01CULDTE",
                                     "E01CULSEQ",
                                     "E01CULSTA",
                                     "E01CULMUS",
                                     "E01CULMDM",
                                     "E01CULMDD",
                                     "E01CULMDY",
                                     "E01CULMTM",
                                     "D01CULMUS",
                                     "D01STATUS",
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
                                   "H01CUN",
                                   "H01LGT",
                                   "H01STS",
                                   "H01NA1",
                                   "H01IDN",
                                   "H01TID",
                                   "H01PID",
                                   "E01REQTYP",
                                   "E01REQORD",
                                   "E01REQFRM",
                                   "E01REQDFD",
                                   "E01REQDFM",
                                   "E01REQDFY",
                                   "E01REQDTD",
                                   "E01REQDTM",
                                   "E01REQDTY",
                                   "E01CULCUN",
                                   "E01CULFNA",
                                   "E01CULFN2",
                                   "E01CULLN1",
                                   "E01CULLN2",
                                   "E01CULIDN",
                                   "E01CULTID",
                                   "E01CULPID",
                                   "E01CULRMK",
                                   "E01CULDTE",
                                   "E01CULSEQ",
                                   "E01CULSTA",
                                   "E01CULMUS",
                                   "E01CULMDM",
                                   "E01CULMDD",
                                   "E01CULMDY",
                                   "E01CULMTM",
                                   "D01CULMUS",
                                   "D01STATUS",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1170809175504";
  final static String rid = "2CD2DA19D72ED";
  final static String fmtname = "ESS026501";
  final int FIELDCOUNT = 46;
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
  private DecimalField fieldH01CUN = null;
  private CharacterField fieldH01LGT = null;
  private CharacterField fieldH01STS = null;
  private CharacterField fieldH01NA1 = null;
  private CharacterField fieldH01IDN = null;
  private CharacterField fieldH01TID = null;
  private CharacterField fieldH01PID = null;
  private CharacterField fieldE01REQTYP = null;
  private CharacterField fieldE01REQORD = null;
  private CharacterField fieldE01REQFRM = null;
  private DecimalField fieldE01REQDFD = null;
  private DecimalField fieldE01REQDFM = null;
  private DecimalField fieldE01REQDFY = null;
  private DecimalField fieldE01REQDTD = null;
  private DecimalField fieldE01REQDTM = null;
  private DecimalField fieldE01REQDTY = null;
  private DecimalField fieldE01CULCUN = null;
  private CharacterField fieldE01CULFNA = null;
  private CharacterField fieldE01CULFN2 = null;
  private CharacterField fieldE01CULLN1 = null;
  private CharacterField fieldE01CULLN2 = null;
  private CharacterField fieldE01CULIDN = null;
  private CharacterField fieldE01CULTID = null;
  private CharacterField fieldE01CULPID = null;
  private CharacterField fieldE01CULRMK = null;
  private DecimalField fieldE01CULDTE = null;
  private DecimalField fieldE01CULSEQ = null;
  private CharacterField fieldE01CULSTA = null;
  private CharacterField fieldE01CULMUS = null;
  private DecimalField fieldE01CULMDM = null;
  private DecimalField fieldE01CULMDD = null;
  private DecimalField fieldE01CULMDY = null;
  private CharacterField fieldE01CULMTM = null;
  private CharacterField fieldD01CULMUS = null;
  private CharacterField fieldD01STATUS = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ESS026501Message.
  */
  public ESS026501Message()
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
    recordsize = 806;
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
    fields[9] = fieldH01CUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "H01CUN");
    fields[10] = fieldH01LGT =
    new CharacterField(message, HEADERSIZE + 52, 1, "H01LGT");
    fields[11] = fieldH01STS =
    new CharacterField(message, HEADERSIZE + 53, 1, "H01STS");
    fields[12] = fieldH01NA1 =
    new CharacterField(message, HEADERSIZE + 54, 45, "H01NA1");
    fields[13] = fieldH01IDN =
    new CharacterField(message, HEADERSIZE + 99, 25, "H01IDN");
    fields[14] = fieldH01TID =
    new CharacterField(message, HEADERSIZE + 124, 4, "H01TID");
    fields[15] = fieldH01PID =
    new CharacterField(message, HEADERSIZE + 128, 4, "H01PID");
    fields[16] = fieldE01REQTYP =
    new CharacterField(message, HEADERSIZE + 132, 1, "E01REQTYP");
    fields[17] = fieldE01REQORD =
    new CharacterField(message, HEADERSIZE + 133, 1, "E01REQORD");
    fields[18] = fieldE01REQFRM =
    new CharacterField(message, HEADERSIZE + 134, 25, "E01REQFRM");
    fields[19] = fieldE01REQDFD =
    new DecimalField(message, HEADERSIZE + 159, 3, 0, "E01REQDFD");
    fields[20] = fieldE01REQDFM =
    new DecimalField(message, HEADERSIZE + 162, 3, 0, "E01REQDFM");
    fields[21] = fieldE01REQDFY =
    new DecimalField(message, HEADERSIZE + 165, 5, 0, "E01REQDFY");
    fields[22] = fieldE01REQDTD =
    new DecimalField(message, HEADERSIZE + 170, 3, 0, "E01REQDTD");
    fields[23] = fieldE01REQDTM =
    new DecimalField(message, HEADERSIZE + 173, 3, 0, "E01REQDTM");
    fields[24] = fieldE01REQDTY =
    new DecimalField(message, HEADERSIZE + 176, 5, 0, "E01REQDTY");
    fields[25] = fieldE01CULCUN =
    new DecimalField(message, HEADERSIZE + 181, 10, 0, "E01CULCUN");
    fields[26] = fieldE01CULFNA =
    new CharacterField(message, HEADERSIZE + 191, 40, "E01CULFNA");
    fields[27] = fieldE01CULFN2 =
    new CharacterField(message, HEADERSIZE + 231, 40, "E01CULFN2");
    fields[28] = fieldE01CULLN1 =
    new CharacterField(message, HEADERSIZE + 271, 40, "E01CULLN1");
    fields[29] = fieldE01CULLN2 =
    new CharacterField(message, HEADERSIZE + 311, 40, "E01CULLN2");
    fields[30] = fieldE01CULIDN =
    new CharacterField(message, HEADERSIZE + 351, 25, "E01CULIDN");
    fields[31] = fieldE01CULTID =
    new CharacterField(message, HEADERSIZE + 376, 4, "E01CULTID");
    fields[32] = fieldE01CULPID =
    new CharacterField(message, HEADERSIZE + 380, 4, "E01CULPID");
    fields[33] = fieldE01CULRMK =
    new CharacterField(message, HEADERSIZE + 384, 256, "E01CULRMK");
    fields[34] = fieldE01CULDTE =
    new DecimalField(message, HEADERSIZE + 640, 9, 0, "E01CULDTE");
    fields[35] = fieldE01CULSEQ =
    new DecimalField(message, HEADERSIZE + 649, 10, 0, "E01CULSEQ");
    fields[36] = fieldE01CULSTA =
    new CharacterField(message, HEADERSIZE + 659, 1, "E01CULSTA");
    fields[37] = fieldE01CULMUS =
    new CharacterField(message, HEADERSIZE + 660, 10, "E01CULMUS");
    fields[38] = fieldE01CULMDM =
    new DecimalField(message, HEADERSIZE + 670, 3, 0, "E01CULMDM");
    fields[39] = fieldE01CULMDD =
    new DecimalField(message, HEADERSIZE + 673, 3, 0, "E01CULMDD");
    fields[40] = fieldE01CULMDY =
    new DecimalField(message, HEADERSIZE + 676, 5, 0, "E01CULMDY");
    fields[41] = fieldE01CULMTM =
    new CharacterField(message, HEADERSIZE + 681, 26, "E01CULMTM");
    fields[42] = fieldD01CULMUS =
    new CharacterField(message, HEADERSIZE + 707, 45, "D01CULMUS");
    fields[43] = fieldD01STATUS =
    new CharacterField(message, HEADERSIZE + 752, 45, "D01STATUS");
    fields[44] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 797, 8, 0, "E01NUMREC");
    fields[45] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 805, 1, "E01INDOPE");

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
  * Set field H01CUN using a String value.
  */
  public void setH01CUN(String newvalue)
  {
    fieldH01CUN.setString(newvalue);
  }

  /**
  * Get value of field H01CUN as a String.
  */
  public String getH01CUN()
  {
    return fieldH01CUN.getString();
  }

  /**
  * Set numeric field H01CUN using a BigDecimal value.
  */
  public void setH01CUN(BigDecimal newvalue)
  {
    fieldH01CUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field H01CUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalH01CUN()
  {
    return fieldH01CUN.getBigDecimal();
  }

  /**
  * Set field H01LGT using a String value.
  */
  public void setH01LGT(String newvalue)
  {
    fieldH01LGT.setString(newvalue);
  }

  /**
  * Get value of field H01LGT as a String.
  */
  public String getH01LGT()
  {
    return fieldH01LGT.getString();
  }

  /**
  * Set field H01STS using a String value.
  */
  public void setH01STS(String newvalue)
  {
    fieldH01STS.setString(newvalue);
  }

  /**
  * Get value of field H01STS as a String.
  */
  public String getH01STS()
  {
    return fieldH01STS.getString();
  }

  /**
  * Set field H01NA1 using a String value.
  */
  public void setH01NA1(String newvalue)
  {
    fieldH01NA1.setString(newvalue);
  }

  /**
  * Get value of field H01NA1 as a String.
  */
  public String getH01NA1()
  {
    return fieldH01NA1.getString();
  }

  /**
  * Set field H01IDN using a String value.
  */
  public void setH01IDN(String newvalue)
  {
    fieldH01IDN.setString(newvalue);
  }

  /**
  * Get value of field H01IDN as a String.
  */
  public String getH01IDN()
  {
    return fieldH01IDN.getString();
  }

  /**
  * Set field H01TID using a String value.
  */
  public void setH01TID(String newvalue)
  {
    fieldH01TID.setString(newvalue);
  }

  /**
  * Get value of field H01TID as a String.
  */
  public String getH01TID()
  {
    return fieldH01TID.getString();
  }

  /**
  * Set field H01PID using a String value.
  */
  public void setH01PID(String newvalue)
  {
    fieldH01PID.setString(newvalue);
  }

  /**
  * Get value of field H01PID as a String.
  */
  public String getH01PID()
  {
    return fieldH01PID.getString();
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
  * Set field E01REQORD using a String value.
  */
  public void setE01REQORD(String newvalue)
  {
    fieldE01REQORD.setString(newvalue);
  }

  /**
  * Get value of field E01REQORD as a String.
  */
  public String getE01REQORD()
  {
    return fieldE01REQORD.getString();
  }

  /**
  * Set field E01REQFRM using a String value.
  */
  public void setE01REQFRM(String newvalue)
  {
    fieldE01REQFRM.setString(newvalue);
  }

  /**
  * Get value of field E01REQFRM as a String.
  */
  public String getE01REQFRM()
  {
    return fieldE01REQFRM.getString();
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
  * Set field E01CULCUN using a String value.
  */
  public void setE01CULCUN(String newvalue)
  {
    fieldE01CULCUN.setString(newvalue);
  }

  /**
  * Get value of field E01CULCUN as a String.
  */
  public String getE01CULCUN()
  {
    return fieldE01CULCUN.getString();
  }

  /**
  * Set numeric field E01CULCUN using a BigDecimal value.
  */
  public void setE01CULCUN(BigDecimal newvalue)
  {
    fieldE01CULCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CULCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CULCUN()
  {
    return fieldE01CULCUN.getBigDecimal();
  }

  /**
  * Set field E01CULFNA using a String value.
  */
  public void setE01CULFNA(String newvalue)
  {
    fieldE01CULFNA.setString(newvalue);
  }

  /**
  * Get value of field E01CULFNA as a String.
  */
  public String getE01CULFNA()
  {
    return fieldE01CULFNA.getString();
  }

  /**
  * Set field E01CULFN2 using a String value.
  */
  public void setE01CULFN2(String newvalue)
  {
    fieldE01CULFN2.setString(newvalue);
  }

  /**
  * Get value of field E01CULFN2 as a String.
  */
  public String getE01CULFN2()
  {
    return fieldE01CULFN2.getString();
  }

  /**
  * Set field E01CULLN1 using a String value.
  */
  public void setE01CULLN1(String newvalue)
  {
    fieldE01CULLN1.setString(newvalue);
  }

  /**
  * Get value of field E01CULLN1 as a String.
  */
  public String getE01CULLN1()
  {
    return fieldE01CULLN1.getString();
  }

  /**
  * Set field E01CULLN2 using a String value.
  */
  public void setE01CULLN2(String newvalue)
  {
    fieldE01CULLN2.setString(newvalue);
  }

  /**
  * Get value of field E01CULLN2 as a String.
  */
  public String getE01CULLN2()
  {
    return fieldE01CULLN2.getString();
  }

  /**
  * Set field E01CULIDN using a String value.
  */
  public void setE01CULIDN(String newvalue)
  {
    fieldE01CULIDN.setString(newvalue);
  }

  /**
  * Get value of field E01CULIDN as a String.
  */
  public String getE01CULIDN()
  {
    return fieldE01CULIDN.getString();
  }

  /**
  * Set field E01CULTID using a String value.
  */
  public void setE01CULTID(String newvalue)
  {
    fieldE01CULTID.setString(newvalue);
  }

  /**
  * Get value of field E01CULTID as a String.
  */
  public String getE01CULTID()
  {
    return fieldE01CULTID.getString();
  }

  /**
  * Set field E01CULPID using a String value.
  */
  public void setE01CULPID(String newvalue)
  {
    fieldE01CULPID.setString(newvalue);
  }

  /**
  * Get value of field E01CULPID as a String.
  */
  public String getE01CULPID()
  {
    return fieldE01CULPID.getString();
  }

  /**
  * Set field E01CULRMK using a String value.
  */
  public void setE01CULRMK(String newvalue)
  {
    fieldE01CULRMK.setString(newvalue);
  }

  /**
  * Get value of field E01CULRMK as a String.
  */
  public String getE01CULRMK()
  {
    return fieldE01CULRMK.getString();
  }

  /**
  * Set field E01CULDTE using a String value.
  */
  public void setE01CULDTE(String newvalue)
  {
    fieldE01CULDTE.setString(newvalue);
  }

  /**
  * Get value of field E01CULDTE as a String.
  */
  public String getE01CULDTE()
  {
    return fieldE01CULDTE.getString();
  }

  /**
  * Set numeric field E01CULDTE using a BigDecimal value.
  */
  public void setE01CULDTE(BigDecimal newvalue)
  {
    fieldE01CULDTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CULDTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CULDTE()
  {
    return fieldE01CULDTE.getBigDecimal();
  }

  /**
  * Set field E01CULSEQ using a String value.
  */
  public void setE01CULSEQ(String newvalue)
  {
    fieldE01CULSEQ.setString(newvalue);
  }

  /**
  * Get value of field E01CULSEQ as a String.
  */
  public String getE01CULSEQ()
  {
    return fieldE01CULSEQ.getString();
  }

  /**
  * Set numeric field E01CULSEQ using a BigDecimal value.
  */
  public void setE01CULSEQ(BigDecimal newvalue)
  {
    fieldE01CULSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CULSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CULSEQ()
  {
    return fieldE01CULSEQ.getBigDecimal();
  }

  /**
  * Set field E01CULSTA using a String value.
  */
  public void setE01CULSTA(String newvalue)
  {
    fieldE01CULSTA.setString(newvalue);
  }

  /**
  * Get value of field E01CULSTA as a String.
  */
  public String getE01CULSTA()
  {
    return fieldE01CULSTA.getString();
  }

  /**
  * Set field E01CULMUS using a String value.
  */
  public void setE01CULMUS(String newvalue)
  {
    fieldE01CULMUS.setString(newvalue);
  }

  /**
  * Get value of field E01CULMUS as a String.
  */
  public String getE01CULMUS()
  {
    return fieldE01CULMUS.getString();
  }

  /**
  * Set field E01CULMDM using a String value.
  */
  public void setE01CULMDM(String newvalue)
  {
    fieldE01CULMDM.setString(newvalue);
  }

  /**
  * Get value of field E01CULMDM as a String.
  */
  public String getE01CULMDM()
  {
    return fieldE01CULMDM.getString();
  }

  /**
  * Set numeric field E01CULMDM using a BigDecimal value.
  */
  public void setE01CULMDM(BigDecimal newvalue)
  {
    fieldE01CULMDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CULMDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CULMDM()
  {
    return fieldE01CULMDM.getBigDecimal();
  }

  /**
  * Set field E01CULMDD using a String value.
  */
  public void setE01CULMDD(String newvalue)
  {
    fieldE01CULMDD.setString(newvalue);
  }

  /**
  * Get value of field E01CULMDD as a String.
  */
  public String getE01CULMDD()
  {
    return fieldE01CULMDD.getString();
  }

  /**
  * Set numeric field E01CULMDD using a BigDecimal value.
  */
  public void setE01CULMDD(BigDecimal newvalue)
  {
    fieldE01CULMDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CULMDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CULMDD()
  {
    return fieldE01CULMDD.getBigDecimal();
  }

  /**
  * Set field E01CULMDY using a String value.
  */
  public void setE01CULMDY(String newvalue)
  {
    fieldE01CULMDY.setString(newvalue);
  }

  /**
  * Get value of field E01CULMDY as a String.
  */
  public String getE01CULMDY()
  {
    return fieldE01CULMDY.getString();
  }

  /**
  * Set numeric field E01CULMDY using a BigDecimal value.
  */
  public void setE01CULMDY(BigDecimal newvalue)
  {
    fieldE01CULMDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CULMDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CULMDY()
  {
    return fieldE01CULMDY.getBigDecimal();
  }

  /**
  * Set field E01CULMTM using a String value.
  */
  public void setE01CULMTM(String newvalue)
  {
    fieldE01CULMTM.setString(newvalue);
  }

  /**
  * Get value of field E01CULMTM as a String.
  */
  public String getE01CULMTM()
  {
    return fieldE01CULMTM.getString();
  }

  /**
  * Set field D01CULMUS using a String value.
  */
  public void setD01CULMUS(String newvalue)
  {
    fieldD01CULMUS.setString(newvalue);
  }

  /**
  * Get value of field D01CULMUS as a String.
  */
  public String getD01CULMUS()
  {
    return fieldD01CULMUS.getString();
  }

  /**
  * Set field D01STATUS using a String value.
  */
  public void setD01STATUS(String newvalue)
  {
    fieldD01STATUS.setString(newvalue);
  }

  /**
  * Get value of field D01STATUS as a String.
  */
  public String getD01STATUS()
  {
    return fieldD01STATUS.getString();
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
