package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECSM00401 physical file definition.
* 
* File level identifier is 1190123164541.
* Record format level identifier is 3C0F910CC1A9B.
*/

public class ECSM00401Message extends MessageRecord
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
                                     "E01INQAGR",
                                     "E01INQTIP",
                                     "E01ILHBNK",
                                     "E01ILHNUM",
                                     "E01ILHAGR",
                                     "D01ILHAGR",
                                     "E01ILHCUN",
                                     "D01ILHCUN",
                                     "E01ILHFIL",
                                     "E01ILHTIP",
                                     "D01ILHTIP",
                                     "E01ILHTX1",
                                     "E01ILHTX2",
                                     "E01ILHTX3",
                                     "E01ILHTX4",
                                     "E01ILHTX5",
                                     "E01ILHSTS",
                                     "D01ILHSTS",
                                     "E01ILHMSG",
                                     "E01ILHSTT",
                                     "E01ILHSYY",
                                     "E01ILHSMM",
                                     "E01ILHSDD",
                                     "E01ILHSIM",
                                     "E01ILHTYY",
                                     "E01ILHTMM",
                                     "E01ILHTDD",
                                     "E01RAHSTS",
                                     "D01RAHSTS",
                                     "E01RAHMSG",
                                     "E01ILHTIM",
                                     "E01ILHCTM",
                                     "E01ILHRTM",
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
                                   "E01INQAGR",
                                   "E01INQTIP",
                                   "E01ILHBNK",
                                   "E01ILHNUM",
                                   "E01ILHAGR",
                                   "D01ILHAGR",
                                   "E01ILHCUN",
                                   "D01ILHCUN",
                                   "E01ILHFIL",
                                   "E01ILHTIP",
                                   "D01ILHTIP",
                                   "E01ILHTX1",
                                   "E01ILHTX2",
                                   "E01ILHTX3",
                                   "E01ILHTX4",
                                   "E01ILHTX5",
                                   "E01ILHSTS",
                                   "D01ILHSTS",
                                   "E01ILHMSG",
                                   "E01ILHSTT",
                                   "E01ILHSYY",
                                   "E01ILHSMM",
                                   "E01ILHSDD",
                                   "E01ILHSIM",
                                   "E01ILHTYY",
                                   "E01ILHTMM",
                                   "E01ILHTDD",
                                   "E01RAHSTS",
                                   "D01RAHSTS",
                                   "E01RAHMSG",
                                   "E01ILHTIM",
                                   "E01ILHCTM",
                                   "E01ILHRTM",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1190123164541";
  final static String rid = "3C0F910CC1A9B";
  final static String fmtname = "ECSM00401";
  final int FIELDCOUNT = 44;
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
  private DecimalField fieldE01INQAGR = null;
  private CharacterField fieldE01INQTIP = null;
  private CharacterField fieldE01ILHBNK = null;
  private DecimalField fieldE01ILHNUM = null;
  private DecimalField fieldE01ILHAGR = null;
  private CharacterField fieldD01ILHAGR = null;
  private DecimalField fieldE01ILHCUN = null;
  private CharacterField fieldD01ILHCUN = null;
  private CharacterField fieldE01ILHFIL = null;
  private CharacterField fieldE01ILHTIP = null;
  private CharacterField fieldD01ILHTIP = null;
  private CharacterField fieldE01ILHTX1 = null;
  private CharacterField fieldE01ILHTX2 = null;
  private CharacterField fieldE01ILHTX3 = null;
  private CharacterField fieldE01ILHTX4 = null;
  private CharacterField fieldE01ILHTX5 = null;
  private CharacterField fieldE01ILHSTS = null;
  private CharacterField fieldD01ILHSTS = null;
  private CharacterField fieldE01ILHMSG = null;
  private CharacterField fieldE01ILHSTT = null;
  private DecimalField fieldE01ILHSYY = null;
  private DecimalField fieldE01ILHSMM = null;
  private DecimalField fieldE01ILHSDD = null;
  private DecimalField fieldE01ILHSIM = null;
  private DecimalField fieldE01ILHTYY = null;
  private DecimalField fieldE01ILHTMM = null;
  private DecimalField fieldE01ILHTDD = null;
  private CharacterField fieldE01RAHSTS = null;
  private CharacterField fieldD01RAHSTS = null;
  private CharacterField fieldE01RAHMSG = null;
  private CharacterField fieldE01ILHTIM = null;
  private CharacterField fieldE01ILHCTM = null;
  private CharacterField fieldE01ILHRTM = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ECSM00401Message.
  */
  public ECSM00401Message()
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
    recordsize = 1157;
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
    fields[9] = fieldE01INQAGR =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01INQAGR");
    fields[10] = fieldE01INQTIP =
    new CharacterField(message, HEADERSIZE + 55, 1, "E01INQTIP");
    fields[11] = fieldE01ILHBNK =
    new CharacterField(message, HEADERSIZE + 56, 2, "E01ILHBNK");
    fields[12] = fieldE01ILHNUM =
    new DecimalField(message, HEADERSIZE + 58, 13, 0, "E01ILHNUM");
    fields[13] = fieldE01ILHAGR =
    new DecimalField(message, HEADERSIZE + 71, 13, 0, "E01ILHAGR");
    fields[14] = fieldD01ILHAGR =
    new CharacterField(message, HEADERSIZE + 84, 60, "D01ILHAGR");
    fields[15] = fieldE01ILHCUN =
    new DecimalField(message, HEADERSIZE + 144, 10, 0, "E01ILHCUN");
    fields[16] = fieldD01ILHCUN =
    new CharacterField(message, HEADERSIZE + 154, 60, "D01ILHCUN");
    fields[17] = fieldE01ILHFIL =
    new CharacterField(message, HEADERSIZE + 214, 45, "E01ILHFIL");
    fields[18] = fieldE01ILHTIP =
    new CharacterField(message, HEADERSIZE + 259, 1, "E01ILHTIP");
    fields[19] = fieldD01ILHTIP =
    new CharacterField(message, HEADERSIZE + 260, 60, "D01ILHTIP");
    fields[20] = fieldE01ILHTX1 =
    new CharacterField(message, HEADERSIZE + 320, 100, "E01ILHTX1");
    fields[21] = fieldE01ILHTX2 =
    new CharacterField(message, HEADERSIZE + 420, 100, "E01ILHTX2");
    fields[22] = fieldE01ILHTX3 =
    new CharacterField(message, HEADERSIZE + 520, 100, "E01ILHTX3");
    fields[23] = fieldE01ILHTX4 =
    new CharacterField(message, HEADERSIZE + 620, 100, "E01ILHTX4");
    fields[24] = fieldE01ILHTX5 =
    new CharacterField(message, HEADERSIZE + 720, 100, "E01ILHTX5");
    fields[25] = fieldE01ILHSTS =
    new CharacterField(message, HEADERSIZE + 820, 1, "E01ILHSTS");
    fields[26] = fieldD01ILHSTS =
    new CharacterField(message, HEADERSIZE + 821, 60, "D01ILHSTS");
    fields[27] = fieldE01ILHMSG =
    new CharacterField(message, HEADERSIZE + 881, 50, "E01ILHMSG");
    fields[28] = fieldE01ILHSTT =
    new CharacterField(message, HEADERSIZE + 931, 1, "E01ILHSTT");
    fields[29] = fieldE01ILHSYY =
    new DecimalField(message, HEADERSIZE + 932, 5, 0, "E01ILHSYY");
    fields[30] = fieldE01ILHSMM =
    new DecimalField(message, HEADERSIZE + 937, 3, 0, "E01ILHSMM");
    fields[31] = fieldE01ILHSDD =
    new DecimalField(message, HEADERSIZE + 940, 3, 0, "E01ILHSDD");
    fields[32] = fieldE01ILHSIM =
    new DecimalField(message, HEADERSIZE + 943, 5, 0, "E01ILHSIM");
    fields[33] = fieldE01ILHTYY =
    new DecimalField(message, HEADERSIZE + 948, 5, 0, "E01ILHTYY");
    fields[34] = fieldE01ILHTMM =
    new DecimalField(message, HEADERSIZE + 953, 3, 0, "E01ILHTMM");
    fields[35] = fieldE01ILHTDD =
    new DecimalField(message, HEADERSIZE + 956, 3, 0, "E01ILHTDD");
    fields[36] = fieldE01RAHSTS =
    new CharacterField(message, HEADERSIZE + 959, 1, "E01RAHSTS");
    fields[37] = fieldD01RAHSTS =
    new CharacterField(message, HEADERSIZE + 960, 60, "D01RAHSTS");
    fields[38] = fieldE01RAHMSG =
    new CharacterField(message, HEADERSIZE + 1020, 50, "E01RAHMSG");
    fields[39] = fieldE01ILHTIM =
    new CharacterField(message, HEADERSIZE + 1070, 26, "E01ILHTIM");
    fields[40] = fieldE01ILHCTM =
    new CharacterField(message, HEADERSIZE + 1096, 26, "E01ILHCTM");
    fields[41] = fieldE01ILHRTM =
    new CharacterField(message, HEADERSIZE + 1122, 26, "E01ILHRTM");
    fields[42] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 1148, 8, 0, "E01NUMREC");
    fields[43] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 1156, 1, "E01INDOPE");

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
  * Set field E01INQAGR using a String value.
  */
  public void setE01INQAGR(String newvalue)
  {
    fieldE01INQAGR.setString(newvalue);
  }

  /**
  * Get value of field E01INQAGR as a String.
  */
  public String getE01INQAGR()
  {
    return fieldE01INQAGR.getString();
  }

  /**
  * Set numeric field E01INQAGR using a BigDecimal value.
  */
  public void setE01INQAGR(BigDecimal newvalue)
  {
    fieldE01INQAGR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01INQAGR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01INQAGR()
  {
    return fieldE01INQAGR.getBigDecimal();
  }

  /**
  * Set field E01INQTIP using a String value.
  */
  public void setE01INQTIP(String newvalue)
  {
    fieldE01INQTIP.setString(newvalue);
  }

  /**
  * Get value of field E01INQTIP as a String.
  */
  public String getE01INQTIP()
  {
    return fieldE01INQTIP.getString();
  }

  /**
  * Set field E01ILHBNK using a String value.
  */
  public void setE01ILHBNK(String newvalue)
  {
    fieldE01ILHBNK.setString(newvalue);
  }

  /**
  * Get value of field E01ILHBNK as a String.
  */
  public String getE01ILHBNK()
  {
    return fieldE01ILHBNK.getString();
  }

  /**
  * Set field E01ILHNUM using a String value.
  */
  public void setE01ILHNUM(String newvalue)
  {
    fieldE01ILHNUM.setString(newvalue);
  }

  /**
  * Get value of field E01ILHNUM as a String.
  */
  public String getE01ILHNUM()
  {
    return fieldE01ILHNUM.getString();
  }

  /**
  * Set numeric field E01ILHNUM using a BigDecimal value.
  */
  public void setE01ILHNUM(BigDecimal newvalue)
  {
    fieldE01ILHNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ILHNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ILHNUM()
  {
    return fieldE01ILHNUM.getBigDecimal();
  }

  /**
  * Set field E01ILHAGR using a String value.
  */
  public void setE01ILHAGR(String newvalue)
  {
    fieldE01ILHAGR.setString(newvalue);
  }

  /**
  * Get value of field E01ILHAGR as a String.
  */
  public String getE01ILHAGR()
  {
    return fieldE01ILHAGR.getString();
  }

  /**
  * Set numeric field E01ILHAGR using a BigDecimal value.
  */
  public void setE01ILHAGR(BigDecimal newvalue)
  {
    fieldE01ILHAGR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ILHAGR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ILHAGR()
  {
    return fieldE01ILHAGR.getBigDecimal();
  }

  /**
  * Set field D01ILHAGR using a String value.
  */
  public void setD01ILHAGR(String newvalue)
  {
    fieldD01ILHAGR.setString(newvalue);
  }

  /**
  * Get value of field D01ILHAGR as a String.
  */
  public String getD01ILHAGR()
  {
    return fieldD01ILHAGR.getString();
  }

  /**
  * Set field E01ILHCUN using a String value.
  */
  public void setE01ILHCUN(String newvalue)
  {
    fieldE01ILHCUN.setString(newvalue);
  }

  /**
  * Get value of field E01ILHCUN as a String.
  */
  public String getE01ILHCUN()
  {
    return fieldE01ILHCUN.getString();
  }

  /**
  * Set numeric field E01ILHCUN using a BigDecimal value.
  */
  public void setE01ILHCUN(BigDecimal newvalue)
  {
    fieldE01ILHCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ILHCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ILHCUN()
  {
    return fieldE01ILHCUN.getBigDecimal();
  }

  /**
  * Set field D01ILHCUN using a String value.
  */
  public void setD01ILHCUN(String newvalue)
  {
    fieldD01ILHCUN.setString(newvalue);
  }

  /**
  * Get value of field D01ILHCUN as a String.
  */
  public String getD01ILHCUN()
  {
    return fieldD01ILHCUN.getString();
  }

  /**
  * Set field E01ILHFIL using a String value.
  */
  public void setE01ILHFIL(String newvalue)
  {
    fieldE01ILHFIL.setString(newvalue);
  }

  /**
  * Get value of field E01ILHFIL as a String.
  */
  public String getE01ILHFIL()
  {
    return fieldE01ILHFIL.getString();
  }

  /**
  * Set field E01ILHTIP using a String value.
  */
  public void setE01ILHTIP(String newvalue)
  {
    fieldE01ILHTIP.setString(newvalue);
  }

  /**
  * Get value of field E01ILHTIP as a String.
  */
  public String getE01ILHTIP()
  {
    return fieldE01ILHTIP.getString();
  }

  /**
  * Set field D01ILHTIP using a String value.
  */
  public void setD01ILHTIP(String newvalue)
  {
    fieldD01ILHTIP.setString(newvalue);
  }

  /**
  * Get value of field D01ILHTIP as a String.
  */
  public String getD01ILHTIP()
  {
    return fieldD01ILHTIP.getString();
  }

  /**
  * Set field E01ILHTX1 using a String value.
  */
  public void setE01ILHTX1(String newvalue)
  {
    fieldE01ILHTX1.setString(newvalue);
  }

  /**
  * Get value of field E01ILHTX1 as a String.
  */
  public String getE01ILHTX1()
  {
    return fieldE01ILHTX1.getString();
  }

  /**
  * Set field E01ILHTX2 using a String value.
  */
  public void setE01ILHTX2(String newvalue)
  {
    fieldE01ILHTX2.setString(newvalue);
  }

  /**
  * Get value of field E01ILHTX2 as a String.
  */
  public String getE01ILHTX2()
  {
    return fieldE01ILHTX2.getString();
  }

  /**
  * Set field E01ILHTX3 using a String value.
  */
  public void setE01ILHTX3(String newvalue)
  {
    fieldE01ILHTX3.setString(newvalue);
  }

  /**
  * Get value of field E01ILHTX3 as a String.
  */
  public String getE01ILHTX3()
  {
    return fieldE01ILHTX3.getString();
  }

  /**
  * Set field E01ILHTX4 using a String value.
  */
  public void setE01ILHTX4(String newvalue)
  {
    fieldE01ILHTX4.setString(newvalue);
  }

  /**
  * Get value of field E01ILHTX4 as a String.
  */
  public String getE01ILHTX4()
  {
    return fieldE01ILHTX4.getString();
  }

  /**
  * Set field E01ILHTX5 using a String value.
  */
  public void setE01ILHTX5(String newvalue)
  {
    fieldE01ILHTX5.setString(newvalue);
  }

  /**
  * Get value of field E01ILHTX5 as a String.
  */
  public String getE01ILHTX5()
  {
    return fieldE01ILHTX5.getString();
  }

  /**
  * Set field E01ILHSTS using a String value.
  */
  public void setE01ILHSTS(String newvalue)
  {
    fieldE01ILHSTS.setString(newvalue);
  }

  /**
  * Get value of field E01ILHSTS as a String.
  */
  public String getE01ILHSTS()
  {
    return fieldE01ILHSTS.getString();
  }

  /**
  * Set field D01ILHSTS using a String value.
  */
  public void setD01ILHSTS(String newvalue)
  {
    fieldD01ILHSTS.setString(newvalue);
  }

  /**
  * Get value of field D01ILHSTS as a String.
  */
  public String getD01ILHSTS()
  {
    return fieldD01ILHSTS.getString();
  }

  /**
  * Set field E01ILHMSG using a String value.
  */
  public void setE01ILHMSG(String newvalue)
  {
    fieldE01ILHMSG.setString(newvalue);
  }

  /**
  * Get value of field E01ILHMSG as a String.
  */
  public String getE01ILHMSG()
  {
    return fieldE01ILHMSG.getString();
  }

  /**
  * Set field E01ILHSTT using a String value.
  */
  public void setE01ILHSTT(String newvalue)
  {
    fieldE01ILHSTT.setString(newvalue);
  }

  /**
  * Get value of field E01ILHSTT as a String.
  */
  public String getE01ILHSTT()
  {
    return fieldE01ILHSTT.getString();
  }

  /**
  * Set field E01ILHSYY using a String value.
  */
  public void setE01ILHSYY(String newvalue)
  {
    fieldE01ILHSYY.setString(newvalue);
  }

  /**
  * Get value of field E01ILHSYY as a String.
  */
  public String getE01ILHSYY()
  {
    return fieldE01ILHSYY.getString();
  }

  /**
  * Set numeric field E01ILHSYY using a BigDecimal value.
  */
  public void setE01ILHSYY(BigDecimal newvalue)
  {
    fieldE01ILHSYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ILHSYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ILHSYY()
  {
    return fieldE01ILHSYY.getBigDecimal();
  }

  /**
  * Set field E01ILHSMM using a String value.
  */
  public void setE01ILHSMM(String newvalue)
  {
    fieldE01ILHSMM.setString(newvalue);
  }

  /**
  * Get value of field E01ILHSMM as a String.
  */
  public String getE01ILHSMM()
  {
    return fieldE01ILHSMM.getString();
  }

  /**
  * Set numeric field E01ILHSMM using a BigDecimal value.
  */
  public void setE01ILHSMM(BigDecimal newvalue)
  {
    fieldE01ILHSMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ILHSMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ILHSMM()
  {
    return fieldE01ILHSMM.getBigDecimal();
  }

  /**
  * Set field E01ILHSDD using a String value.
  */
  public void setE01ILHSDD(String newvalue)
  {
    fieldE01ILHSDD.setString(newvalue);
  }

  /**
  * Get value of field E01ILHSDD as a String.
  */
  public String getE01ILHSDD()
  {
    return fieldE01ILHSDD.getString();
  }

  /**
  * Set numeric field E01ILHSDD using a BigDecimal value.
  */
  public void setE01ILHSDD(BigDecimal newvalue)
  {
    fieldE01ILHSDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ILHSDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ILHSDD()
  {
    return fieldE01ILHSDD.getBigDecimal();
  }

  /**
  * Set field E01ILHSIM using a String value.
  */
  public void setE01ILHSIM(String newvalue)
  {
    fieldE01ILHSIM.setString(newvalue);
  }

  /**
  * Get value of field E01ILHSIM as a String.
  */
  public String getE01ILHSIM()
  {
    return fieldE01ILHSIM.getString();
  }

  /**
  * Set numeric field E01ILHSIM using a BigDecimal value.
  */
  public void setE01ILHSIM(BigDecimal newvalue)
  {
    fieldE01ILHSIM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ILHSIM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ILHSIM()
  {
    return fieldE01ILHSIM.getBigDecimal();
  }

  /**
  * Set field E01ILHTYY using a String value.
  */
  public void setE01ILHTYY(String newvalue)
  {
    fieldE01ILHTYY.setString(newvalue);
  }

  /**
  * Get value of field E01ILHTYY as a String.
  */
  public String getE01ILHTYY()
  {
    return fieldE01ILHTYY.getString();
  }

  /**
  * Set numeric field E01ILHTYY using a BigDecimal value.
  */
  public void setE01ILHTYY(BigDecimal newvalue)
  {
    fieldE01ILHTYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ILHTYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ILHTYY()
  {
    return fieldE01ILHTYY.getBigDecimal();
  }

  /**
  * Set field E01ILHTMM using a String value.
  */
  public void setE01ILHTMM(String newvalue)
  {
    fieldE01ILHTMM.setString(newvalue);
  }

  /**
  * Get value of field E01ILHTMM as a String.
  */
  public String getE01ILHTMM()
  {
    return fieldE01ILHTMM.getString();
  }

  /**
  * Set numeric field E01ILHTMM using a BigDecimal value.
  */
  public void setE01ILHTMM(BigDecimal newvalue)
  {
    fieldE01ILHTMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ILHTMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ILHTMM()
  {
    return fieldE01ILHTMM.getBigDecimal();
  }

  /**
  * Set field E01ILHTDD using a String value.
  */
  public void setE01ILHTDD(String newvalue)
  {
    fieldE01ILHTDD.setString(newvalue);
  }

  /**
  * Get value of field E01ILHTDD as a String.
  */
  public String getE01ILHTDD()
  {
    return fieldE01ILHTDD.getString();
  }

  /**
  * Set numeric field E01ILHTDD using a BigDecimal value.
  */
  public void setE01ILHTDD(BigDecimal newvalue)
  {
    fieldE01ILHTDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ILHTDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ILHTDD()
  {
    return fieldE01ILHTDD.getBigDecimal();
  }

  /**
  * Set field E01RAHSTS using a String value.
  */
  public void setE01RAHSTS(String newvalue)
  {
    fieldE01RAHSTS.setString(newvalue);
  }

  /**
  * Get value of field E01RAHSTS as a String.
  */
  public String getE01RAHSTS()
  {
    return fieldE01RAHSTS.getString();
  }

  /**
  * Set field D01RAHSTS using a String value.
  */
  public void setD01RAHSTS(String newvalue)
  {
    fieldD01RAHSTS.setString(newvalue);
  }

  /**
  * Get value of field D01RAHSTS as a String.
  */
  public String getD01RAHSTS()
  {
    return fieldD01RAHSTS.getString();
  }

  /**
  * Set field E01RAHMSG using a String value.
  */
  public void setE01RAHMSG(String newvalue)
  {
    fieldE01RAHMSG.setString(newvalue);
  }

  /**
  * Get value of field E01RAHMSG as a String.
  */
  public String getE01RAHMSG()
  {
    return fieldE01RAHMSG.getString();
  }

  /**
  * Set field E01ILHTIM using a String value.
  */
  public void setE01ILHTIM(String newvalue)
  {
    fieldE01ILHTIM.setString(newvalue);
  }

  /**
  * Get value of field E01ILHTIM as a String.
  */
  public String getE01ILHTIM()
  {
    return fieldE01ILHTIM.getString();
  }

  /**
  * Set field E01ILHCTM using a String value.
  */
  public void setE01ILHCTM(String newvalue)
  {
    fieldE01ILHCTM.setString(newvalue);
  }

  /**
  * Get value of field E01ILHCTM as a String.
  */
  public String getE01ILHCTM()
  {
    return fieldE01ILHCTM.getString();
  }

  /**
  * Set field E01ILHRTM using a String value.
  */
  public void setE01ILHRTM(String newvalue)
  {
    fieldE01ILHRTM.setString(newvalue);
  }

  /**
  * Get value of field E01ILHRTM as a String.
  */
  public String getE01ILHRTM()
  {
    return fieldE01ILHRTM.getString();
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