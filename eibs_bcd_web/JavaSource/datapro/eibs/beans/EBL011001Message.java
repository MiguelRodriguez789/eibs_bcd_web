package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EBL011001 physical file definition.
* 
* File level identifier is 1140509095827.
* Record format level identifier is 5877382CE17D7.
*/

public class EBL011001Message extends MessageRecord
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
                                     "E01CURTID",
                                     "E01CURPID",
                                     "E01CURIDN",
                                     "E01CURCUN",
                                     "E01CURNA1",
                                     "E01CURNA2",
                                     "E01CURNA3",
                                     "E01CURNA4",
                                     "E01CURWBL",
                                     "E01CURTBL",
                                     "E01CURSTS",
                                     "E01CURFNT",
                                     "E01CUROBS",
                                     "E01CURFDM",
                                     "E01CURFDD",
                                     "E01CURFDY",
                                     "E01CURLMM",
                                     "E01CURLMD",
                                     "E01CURLMY",
                                     "E01CURLMU",
                                     "D01CURFNT",
                                     "D01CURPID",
                                     "E01OPECOD",
                                     "E01RECNUM"
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
                                   "E01CURTID",
                                   "E01CURPID",
                                   "E01CURIDN",
                                   "E01CURCUN",
                                   "E01CURNA1",
                                   "E01CURNA2",
                                   "E01CURNA3",
                                   "E01CURNA4",
                                   "E01CURWBL",
                                   "E01CURTBL",
                                   "E01CURSTS",
                                   "E01CURFNT",
                                   "E01CUROBS",
                                   "E01CURFDM",
                                   "E01CURFDD",
                                   "E01CURFDY",
                                   "E01CURLMM",
                                   "E01CURLMD",
                                   "E01CURLMY",
                                   "E01CURLMU",
                                   "D01CURFNT",
                                   "D01CURPID",
                                   "E01OPECOD",
                                   "E01RECNUM"
                                 };
  final static String fid = "1140509095827";
  final static String rid = "5877382CE17D7";
  final static String fmtname = "EBL011001";
  final int FIELDCOUNT = 33;
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
  private CharacterField fieldE01CURTID = null;
  private CharacterField fieldE01CURPID = null;
  private CharacterField fieldE01CURIDN = null;
  private DecimalField fieldE01CURCUN = null;
  private CharacterField fieldE01CURNA1 = null;
  private CharacterField fieldE01CURNA2 = null;
  private CharacterField fieldE01CURNA3 = null;
  private CharacterField fieldE01CURNA4 = null;
  private CharacterField fieldE01CURWBL = null;
  private CharacterField fieldE01CURTBL = null;
  private CharacterField fieldE01CURSTS = null;
  private CharacterField fieldE01CURFNT = null;
  private CharacterField fieldE01CUROBS = null;
  private DecimalField fieldE01CURFDM = null;
  private DecimalField fieldE01CURFDD = null;
  private DecimalField fieldE01CURFDY = null;
  private DecimalField fieldE01CURLMM = null;
  private DecimalField fieldE01CURLMD = null;
  private DecimalField fieldE01CURLMY = null;
  private CharacterField fieldE01CURLMU = null;
  private CharacterField fieldD01CURFNT = null;
  private CharacterField fieldD01CURPID = null;
  private CharacterField fieldE01OPECOD = null;
  private DecimalField fieldE01RECNUM = null;

  /**
  * Constructor for EBL011001Message.
  */
  public EBL011001Message()
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
    recordsize = 929;
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
    fields[9] = fieldE01CURTID =
    new CharacterField(message, HEADERSIZE + 42, 4, "E01CURTID");
    fields[10] = fieldE01CURPID =
    new CharacterField(message, HEADERSIZE + 46, 4, "E01CURPID");
    fields[11] = fieldE01CURIDN =
    new CharacterField(message, HEADERSIZE + 50, 25, "E01CURIDN");
    fields[12] = fieldE01CURCUN =
    new DecimalField(message, HEADERSIZE + 75, 10, 0, "E01CURCUN");
    fields[13] = fieldE01CURNA1 =
    new CharacterField(message, HEADERSIZE + 85, 60, "E01CURNA1");
    fields[14] = fieldE01CURNA2 =
    new CharacterField(message, HEADERSIZE + 145, 45, "E01CURNA2");
    fields[15] = fieldE01CURNA3 =
    new CharacterField(message, HEADERSIZE + 190, 45, "E01CURNA3");
    fields[16] = fieldE01CURNA4 =
    new CharacterField(message, HEADERSIZE + 235, 45, "E01CURNA4");
    fields[17] = fieldE01CURWBL =
    new CharacterField(message, HEADERSIZE + 280, 1, "E01CURWBL");
    fields[18] = fieldE01CURTBL =
    new CharacterField(message, HEADERSIZE + 281, 1, "E01CURTBL");
    fields[19] = fieldE01CURSTS =
    new CharacterField(message, HEADERSIZE + 282, 1, "E01CURSTS");
    fields[20] = fieldE01CURFNT =
    new CharacterField(message, HEADERSIZE + 283, 4, "E01CURFNT");
    fields[21] = fieldE01CUROBS =
    new CharacterField(message, HEADERSIZE + 287, 512, "E01CUROBS");
    fields[22] = fieldE01CURFDM =
    new DecimalField(message, HEADERSIZE + 799, 3, 0, "E01CURFDM");
    fields[23] = fieldE01CURFDD =
    new DecimalField(message, HEADERSIZE + 802, 3, 0, "E01CURFDD");
    fields[24] = fieldE01CURFDY =
    new DecimalField(message, HEADERSIZE + 805, 5, 0, "E01CURFDY");
    fields[25] = fieldE01CURLMM =
    new DecimalField(message, HEADERSIZE + 810, 3, 0, "E01CURLMM");
    fields[26] = fieldE01CURLMD =
    new DecimalField(message, HEADERSIZE + 813, 3, 0, "E01CURLMD");
    fields[27] = fieldE01CURLMY =
    new DecimalField(message, HEADERSIZE + 816, 5, 0, "E01CURLMY");
    fields[28] = fieldE01CURLMU =
    new CharacterField(message, HEADERSIZE + 821, 10, "E01CURLMU");
    fields[29] = fieldD01CURFNT =
    new CharacterField(message, HEADERSIZE + 831, 45, "D01CURFNT");
    fields[30] = fieldD01CURPID =
    new CharacterField(message, HEADERSIZE + 876, 45, "D01CURPID");
    fields[31] = fieldE01OPECOD =
    new CharacterField(message, HEADERSIZE + 921, 4, "E01OPECOD");
    fields[32] = fieldE01RECNUM =
    new DecimalField(message, HEADERSIZE + 925, 4, 0, "E01RECNUM");

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
  * Set field E01CURTID using a String value.
  */
  public void setE01CURTID(String newvalue)
  {
    fieldE01CURTID.setString(newvalue);
  }

  /**
  * Get value of field E01CURTID as a String.
  */
  public String getE01CURTID()
  {
    return fieldE01CURTID.getString();
  }

  /**
  * Set field E01CURPID using a String value.
  */
  public void setE01CURPID(String newvalue)
  {
    fieldE01CURPID.setString(newvalue);
  }

  /**
  * Get value of field E01CURPID as a String.
  */
  public String getE01CURPID()
  {
    return fieldE01CURPID.getString();
  }

  /**
  * Set field E01CURIDN using a String value.
  */
  public void setE01CURIDN(String newvalue)
  {
    fieldE01CURIDN.setString(newvalue);
  }

  /**
  * Get value of field E01CURIDN as a String.
  */
  public String getE01CURIDN()
  {
    return fieldE01CURIDN.getString();
  }

  /**
  * Set field E01CURCUN using a String value.
  */
  public void setE01CURCUN(String newvalue)
  {
    fieldE01CURCUN.setString(newvalue);
  }

  /**
  * Get value of field E01CURCUN as a String.
  */
  public String getE01CURCUN()
  {
    return fieldE01CURCUN.getString();
  }

  /**
  * Set numeric field E01CURCUN using a BigDecimal value.
  */
  public void setE01CURCUN(BigDecimal newvalue)
  {
    fieldE01CURCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CURCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CURCUN()
  {
    return fieldE01CURCUN.getBigDecimal();
  }

  /**
  * Set field E01CURNA1 using a String value.
  */
  public void setE01CURNA1(String newvalue)
  {
    fieldE01CURNA1.setString(newvalue);
  }

  /**
  * Get value of field E01CURNA1 as a String.
  */
  public String getE01CURNA1()
  {
    return fieldE01CURNA1.getString();
  }

  /**
  * Set field E01CURNA2 using a String value.
  */
  public void setE01CURNA2(String newvalue)
  {
    fieldE01CURNA2.setString(newvalue);
  }

  /**
  * Get value of field E01CURNA2 as a String.
  */
  public String getE01CURNA2()
  {
    return fieldE01CURNA2.getString();
  }

  /**
  * Set field E01CURNA3 using a String value.
  */
  public void setE01CURNA3(String newvalue)
  {
    fieldE01CURNA3.setString(newvalue);
  }

  /**
  * Get value of field E01CURNA3 as a String.
  */
  public String getE01CURNA3()
  {
    return fieldE01CURNA3.getString();
  }

  /**
  * Set field E01CURNA4 using a String value.
  */
  public void setE01CURNA4(String newvalue)
  {
    fieldE01CURNA4.setString(newvalue);
  }

  /**
  * Get value of field E01CURNA4 as a String.
  */
  public String getE01CURNA4()
  {
    return fieldE01CURNA4.getString();
  }

  /**
  * Set field E01CURWBL using a String value.
  */
  public void setE01CURWBL(String newvalue)
  {
    fieldE01CURWBL.setString(newvalue);
  }

  /**
  * Get value of field E01CURWBL as a String.
  */
  public String getE01CURWBL()
  {
    return fieldE01CURWBL.getString();
  }

  /**
  * Set field E01CURTBL using a String value.
  */
  public void setE01CURTBL(String newvalue)
  {
    fieldE01CURTBL.setString(newvalue);
  }

  /**
  * Get value of field E01CURTBL as a String.
  */
  public String getE01CURTBL()
  {
    return fieldE01CURTBL.getString();
  }

  /**
  * Set field E01CURSTS using a String value.
  */
  public void setE01CURSTS(String newvalue)
  {
    fieldE01CURSTS.setString(newvalue);
  }

  /**
  * Get value of field E01CURSTS as a String.
  */
  public String getE01CURSTS()
  {
    return fieldE01CURSTS.getString();
  }

  /**
  * Set field E01CURFNT using a String value.
  */
  public void setE01CURFNT(String newvalue)
  {
    fieldE01CURFNT.setString(newvalue);
  }

  /**
  * Get value of field E01CURFNT as a String.
  */
  public String getE01CURFNT()
  {
    return fieldE01CURFNT.getString();
  }

  /**
  * Set field E01CUROBS using a String value.
  */
  public void setE01CUROBS(String newvalue)
  {
    fieldE01CUROBS.setString(newvalue);
  }

  /**
  * Get value of field E01CUROBS as a String.
  */
  public String getE01CUROBS()
  {
    return fieldE01CUROBS.getString();
  }

  /**
  * Set field E01CURFDM using a String value.
  */
  public void setE01CURFDM(String newvalue)
  {
    fieldE01CURFDM.setString(newvalue);
  }

  /**
  * Get value of field E01CURFDM as a String.
  */
  public String getE01CURFDM()
  {
    return fieldE01CURFDM.getString();
  }

  /**
  * Set numeric field E01CURFDM using a BigDecimal value.
  */
  public void setE01CURFDM(BigDecimal newvalue)
  {
    fieldE01CURFDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CURFDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CURFDM()
  {
    return fieldE01CURFDM.getBigDecimal();
  }

  /**
  * Set field E01CURFDD using a String value.
  */
  public void setE01CURFDD(String newvalue)
  {
    fieldE01CURFDD.setString(newvalue);
  }

  /**
  * Get value of field E01CURFDD as a String.
  */
  public String getE01CURFDD()
  {
    return fieldE01CURFDD.getString();
  }

  /**
  * Set numeric field E01CURFDD using a BigDecimal value.
  */
  public void setE01CURFDD(BigDecimal newvalue)
  {
    fieldE01CURFDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CURFDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CURFDD()
  {
    return fieldE01CURFDD.getBigDecimal();
  }

  /**
  * Set field E01CURFDY using a String value.
  */
  public void setE01CURFDY(String newvalue)
  {
    fieldE01CURFDY.setString(newvalue);
  }

  /**
  * Get value of field E01CURFDY as a String.
  */
  public String getE01CURFDY()
  {
    return fieldE01CURFDY.getString();
  }

  /**
  * Set numeric field E01CURFDY using a BigDecimal value.
  */
  public void setE01CURFDY(BigDecimal newvalue)
  {
    fieldE01CURFDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CURFDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CURFDY()
  {
    return fieldE01CURFDY.getBigDecimal();
  }

  /**
  * Set field E01CURLMM using a String value.
  */
  public void setE01CURLMM(String newvalue)
  {
    fieldE01CURLMM.setString(newvalue);
  }

  /**
  * Get value of field E01CURLMM as a String.
  */
  public String getE01CURLMM()
  {
    return fieldE01CURLMM.getString();
  }

  /**
  * Set numeric field E01CURLMM using a BigDecimal value.
  */
  public void setE01CURLMM(BigDecimal newvalue)
  {
    fieldE01CURLMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CURLMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CURLMM()
  {
    return fieldE01CURLMM.getBigDecimal();
  }

  /**
  * Set field E01CURLMD using a String value.
  */
  public void setE01CURLMD(String newvalue)
  {
    fieldE01CURLMD.setString(newvalue);
  }

  /**
  * Get value of field E01CURLMD as a String.
  */
  public String getE01CURLMD()
  {
    return fieldE01CURLMD.getString();
  }

  /**
  * Set numeric field E01CURLMD using a BigDecimal value.
  */
  public void setE01CURLMD(BigDecimal newvalue)
  {
    fieldE01CURLMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CURLMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CURLMD()
  {
    return fieldE01CURLMD.getBigDecimal();
  }

  /**
  * Set field E01CURLMY using a String value.
  */
  public void setE01CURLMY(String newvalue)
  {
    fieldE01CURLMY.setString(newvalue);
  }

  /**
  * Get value of field E01CURLMY as a String.
  */
  public String getE01CURLMY()
  {
    return fieldE01CURLMY.getString();
  }

  /**
  * Set numeric field E01CURLMY using a BigDecimal value.
  */
  public void setE01CURLMY(BigDecimal newvalue)
  {
    fieldE01CURLMY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CURLMY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CURLMY()
  {
    return fieldE01CURLMY.getBigDecimal();
  }

  /**
  * Set field E01CURLMU using a String value.
  */
  public void setE01CURLMU(String newvalue)
  {
    fieldE01CURLMU.setString(newvalue);
  }

  /**
  * Get value of field E01CURLMU as a String.
  */
  public String getE01CURLMU()
  {
    return fieldE01CURLMU.getString();
  }

  /**
  * Set field D01CURFNT using a String value.
  */
  public void setD01CURFNT(String newvalue)
  {
    fieldD01CURFNT.setString(newvalue);
  }

  /**
  * Get value of field D01CURFNT as a String.
  */
  public String getD01CURFNT()
  {
    return fieldD01CURFNT.getString();
  }

  /**
  * Set field D01CURPID using a String value.
  */
  public void setD01CURPID(String newvalue)
  {
    fieldD01CURPID.setString(newvalue);
  }

  /**
  * Get value of field D01CURPID as a String.
  */
  public String getD01CURPID()
  {
    return fieldD01CURPID.getString();
  }

  /**
  * Set field E01OPECOD using a String value.
  */
  public void setE01OPECOD(String newvalue)
  {
    fieldE01OPECOD.setString(newvalue);
  }

  /**
  * Get value of field E01OPECOD as a String.
  */
  public String getE01OPECOD()
  {
    return fieldE01OPECOD.getString();
  }

  /**
  * Set field E01RECNUM using a String value.
  */
  public void setE01RECNUM(String newvalue)
  {
    fieldE01RECNUM.setString(newvalue);
  }

  /**
  * Get value of field E01RECNUM as a String.
  */
  public String getE01RECNUM()
  {
    return fieldE01RECNUM.getString();
  }

  /**
  * Set numeric field E01RECNUM using a BigDecimal value.
  */
  public void setE01RECNUM(BigDecimal newvalue)
  {
    fieldE01RECNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RECNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RECNUM()
  {
    return fieldE01RECNUM.getBigDecimal();
  }

}