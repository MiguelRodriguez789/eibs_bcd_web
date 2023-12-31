package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD018001 physical file definition.
* 
* File level identifier is 1131024135509.
* Record format level identifier is 399A5E68B943D.
*/

public class EDD018001Message extends MessageRecord
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
                                     "E01STPACC",
                                     "E01STPACD",
                                     "E01STPCUN",
                                     "E01STPPRO",
                                     "E01CUSNA1",
                                     "E01STPSEQ",
                                     "E01STPBNK",
                                     "E01STPBRN",
                                     "E01STPCCY",
                                     "E01STPFCK",
                                     "E01STPTCK",
                                     "E01STPDTM",
                                     "E01STPDTD",
                                     "E01STPDTY",
                                     "E01STPTIM",
                                     "E01STPAMT",
                                     "E01STPGLN",
                                     "E01STPPRF",
                                     "E01STPRMK",
                                     "E01STPCCF",
                                     "E01STPPTS",
                                     "E01STPF04",
                                     "E01STPCKM",
                                     "E01STPCKD",
                                     "E01STPCKY",
                                     "E01STPFLG",
                                     "E01STPF05",
                                     "E01STPF02",
                                     "E01STPF03",
                                     "D01DSCCAU",
                                     "E01STPCPB",
                                     "E01STPAAC",
                                     "E01STPTIT",
                                     "E01STPPUR",
                                     "E01STPSTS",
                                     "E01STPMDM",
                                     "E01STPMDD",
                                     "E01STPMDY",
                                     "E01STPCAU",
                                     "E01STPCNL",
                                     "E01IDENTI",
                                     "E01PLICAN",
                                     "E01DESCRI"
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
                                   "E01STPACC",
                                   "E01STPACD",
                                   "E01STPCUN",
                                   "E01STPPRO",
                                   "E01CUSNA1",
                                   "E01STPSEQ",
                                   "E01STPBNK",
                                   "E01STPBRN",
                                   "E01STPCCY",
                                   "E01STPFCK",
                                   "E01STPTCK",
                                   "E01STPDTM",
                                   "E01STPDTD",
                                   "E01STPDTY",
                                   "E01STPTIM",
                                   "E01STPAMT",
                                   "E01STPGLN",
                                   "E01STPPRF",
                                   "E01STPRMK",
                                   "E01STPCCF",
                                   "E01STPPTS",
                                   "E01STPF04",
                                   "E01STPCKM",
                                   "E01STPCKD",
                                   "E01STPCKY",
                                   "E01STPFLG",
                                   "E01STPF05",
                                   "E01STPF02",
                                   "E01STPF03",
                                   "D01DSCCAU",
                                   "E01STPCPB",
                                   "E01STPAAC",
                                   "E01STPTIT",
                                   "E01STPPUR",
                                   "E01STPSTS",
                                   "E01STPMDM",
                                   "E01STPMDD",
                                   "E01STPMDY",
                                   "E01STPCAU",
                                   "E01STPCNL",
                                   "E01IDENTI",
                                   "E01PLICAN",
                                   "E01DESCRI"
                                 };
  final static String fid = "1131024135509";
  final static String rid = "399A5E68B943D";
  final static String fmtname = "EDD018001";
  final int FIELDCOUNT = 52;
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
  private DecimalField fieldE01STPACC = null;
  private CharacterField fieldE01STPACD = null;
  private DecimalField fieldE01STPCUN = null;
  private CharacterField fieldE01STPPRO = null;
  private CharacterField fieldE01CUSNA1 = null;
  private DecimalField fieldE01STPSEQ = null;
  private CharacterField fieldE01STPBNK = null;
  private DecimalField fieldE01STPBRN = null;
  private CharacterField fieldE01STPCCY = null;
  private DecimalField fieldE01STPFCK = null;
  private DecimalField fieldE01STPTCK = null;
  private DecimalField fieldE01STPDTM = null;
  private DecimalField fieldE01STPDTD = null;
  private DecimalField fieldE01STPDTY = null;
  private CharacterField fieldE01STPTIM = null;
  private DecimalField fieldE01STPAMT = null;
  private DecimalField fieldE01STPGLN = null;
  private CharacterField fieldE01STPPRF = null;
  private CharacterField fieldE01STPRMK = null;
  private CharacterField fieldE01STPCCF = null;
  private DecimalField fieldE01STPPTS = null;
  private CharacterField fieldE01STPF04 = null;
  private DecimalField fieldE01STPCKM = null;
  private DecimalField fieldE01STPCKD = null;
  private DecimalField fieldE01STPCKY = null;
  private CharacterField fieldE01STPFLG = null;
  private CharacterField fieldE01STPF05 = null;
  private CharacterField fieldE01STPF02 = null;
  private CharacterField fieldE01STPF03 = null;
  private CharacterField fieldD01DSCCAU = null;
  private CharacterField fieldE01STPCPB = null;
  private DecimalField fieldE01STPAAC = null;
  private CharacterField fieldE01STPTIT = null;
  private CharacterField fieldE01STPPUR = null;
  private CharacterField fieldE01STPSTS = null;
  private DecimalField fieldE01STPMDM = null;
  private DecimalField fieldE01STPMDD = null;
  private DecimalField fieldE01STPMDY = null;
  private CharacterField fieldE01STPCAU = null;
  private CharacterField fieldE01STPCNL = null;
  private CharacterField fieldE01IDENTI = null;
  private CharacterField fieldE01PLICAN = null;
  private CharacterField fieldE01DESCRI = null;

  /**
  * Constructor for EDD018001Message.
  */
  public EDD018001Message()
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
    recordsize = 533;
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
    fields[9] = fieldE01STPACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01STPACC");
    fields[10] = fieldE01STPACD =
    new CharacterField(message, HEADERSIZE + 55, 2, "E01STPACD");
    fields[11] = fieldE01STPCUN =
    new DecimalField(message, HEADERSIZE + 57, 10, 0, "E01STPCUN");
    fields[12] = fieldE01STPPRO =
    new CharacterField(message, HEADERSIZE + 67, 4, "E01STPPRO");
    fields[13] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 71, 60, "E01CUSNA1");
    fields[14] = fieldE01STPSEQ =
    new DecimalField(message, HEADERSIZE + 131, 4, 0, "E01STPSEQ");
    fields[15] = fieldE01STPBNK =
    new CharacterField(message, HEADERSIZE + 135, 2, "E01STPBNK");
    fields[16] = fieldE01STPBRN =
    new DecimalField(message, HEADERSIZE + 137, 5, 0, "E01STPBRN");
    fields[17] = fieldE01STPCCY =
    new CharacterField(message, HEADERSIZE + 142, 3, "E01STPCCY");
    fields[18] = fieldE01STPFCK =
    new DecimalField(message, HEADERSIZE + 145, 12, 0, "E01STPFCK");
    fields[19] = fieldE01STPTCK =
    new DecimalField(message, HEADERSIZE + 157, 12, 0, "E01STPTCK");
    fields[20] = fieldE01STPDTM =
    new DecimalField(message, HEADERSIZE + 169, 3, 0, "E01STPDTM");
    fields[21] = fieldE01STPDTD =
    new DecimalField(message, HEADERSIZE + 172, 3, 0, "E01STPDTD");
    fields[22] = fieldE01STPDTY =
    new DecimalField(message, HEADERSIZE + 175, 5, 0, "E01STPDTY");
    fields[23] = fieldE01STPTIM =
    new CharacterField(message, HEADERSIZE + 180, 26, "E01STPTIM");
    fields[24] = fieldE01STPAMT =
    new DecimalField(message, HEADERSIZE + 206, 17, 2, "E01STPAMT");
    fields[25] = fieldE01STPGLN =
    new DecimalField(message, HEADERSIZE + 223, 17, 0, "E01STPGLN");
    fields[26] = fieldE01STPPRF =
    new CharacterField(message, HEADERSIZE + 240, 1, "E01STPPRF");
    fields[27] = fieldE01STPRMK =
    new CharacterField(message, HEADERSIZE + 241, 60, "E01STPRMK");
    fields[28] = fieldE01STPCCF =
    new CharacterField(message, HEADERSIZE + 301, 1, "E01STPCCF");
    fields[29] = fieldE01STPPTS =
    new DecimalField(message, HEADERSIZE + 302, 6, 0, "E01STPPTS");
    fields[30] = fieldE01STPF04 =
    new CharacterField(message, HEADERSIZE + 308, 1, "E01STPF04");
    fields[31] = fieldE01STPCKM =
    new DecimalField(message, HEADERSIZE + 309, 3, 0, "E01STPCKM");
    fields[32] = fieldE01STPCKD =
    new DecimalField(message, HEADERSIZE + 312, 3, 0, "E01STPCKD");
    fields[33] = fieldE01STPCKY =
    new DecimalField(message, HEADERSIZE + 315, 5, 0, "E01STPCKY");
    fields[34] = fieldE01STPFLG =
    new CharacterField(message, HEADERSIZE + 320, 1, "E01STPFLG");
    fields[35] = fieldE01STPF05 =
    new CharacterField(message, HEADERSIZE + 321, 1, "E01STPF05");
    fields[36] = fieldE01STPF02 =
    new CharacterField(message, HEADERSIZE + 322, 14, "E01STPF02");
    fields[37] = fieldE01STPF03 =
    new CharacterField(message, HEADERSIZE + 336, 3, "E01STPF03");
    fields[38] = fieldD01DSCCAU =
    new CharacterField(message, HEADERSIZE + 339, 45, "D01DSCCAU");
    fields[39] = fieldE01STPCPB =
    new CharacterField(message, HEADERSIZE + 384, 1, "E01STPCPB");
    fields[40] = fieldE01STPAAC =
    new DecimalField(message, HEADERSIZE + 385, 13, 0, "E01STPAAC");
    fields[41] = fieldE01STPTIT =
    new CharacterField(message, HEADERSIZE + 398, 1, "E01STPTIT");
    fields[42] = fieldE01STPPUR =
    new CharacterField(message, HEADERSIZE + 399, 1, "E01STPPUR");
    fields[43] = fieldE01STPSTS =
    new CharacterField(message, HEADERSIZE + 400, 1, "E01STPSTS");
    fields[44] = fieldE01STPMDM =
    new DecimalField(message, HEADERSIZE + 401, 3, 0, "E01STPMDM");
    fields[45] = fieldE01STPMDD =
    new DecimalField(message, HEADERSIZE + 404, 3, 0, "E01STPMDD");
    fields[46] = fieldE01STPMDY =
    new DecimalField(message, HEADERSIZE + 407, 5, 0, "E01STPMDY");
    fields[47] = fieldE01STPCAU =
    new CharacterField(message, HEADERSIZE + 412, 4, "E01STPCAU");
    fields[48] = fieldE01STPCNL =
    new CharacterField(message, HEADERSIZE + 416, 2, "E01STPCNL");
    fields[49] = fieldE01IDENTI =
    new CharacterField(message, HEADERSIZE + 418, 25, "E01IDENTI");
    fields[50] = fieldE01PLICAN =
    new CharacterField(message, HEADERSIZE + 443, 45, "E01PLICAN");
    fields[51] = fieldE01DESCRI =
    new CharacterField(message, HEADERSIZE + 488, 45, "E01DESCRI");

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
  * Set field E01STPACC using a String value.
  */
  public void setE01STPACC(String newvalue)
  {
    fieldE01STPACC.setString(newvalue);
  }

  /**
  * Get value of field E01STPACC as a String.
  */
  public String getE01STPACC()
  {
    return fieldE01STPACC.getString();
  }

  /**
  * Set numeric field E01STPACC using a BigDecimal value.
  */
  public void setE01STPACC(BigDecimal newvalue)
  {
    fieldE01STPACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPACC()
  {
    return fieldE01STPACC.getBigDecimal();
  }

  /**
  * Set field E01STPACD using a String value.
  */
  public void setE01STPACD(String newvalue)
  {
    fieldE01STPACD.setString(newvalue);
  }

  /**
  * Get value of field E01STPACD as a String.
  */
  public String getE01STPACD()
  {
    return fieldE01STPACD.getString();
  }

  /**
  * Set field E01STPCUN using a String value.
  */
  public void setE01STPCUN(String newvalue)
  {
    fieldE01STPCUN.setString(newvalue);
  }

  /**
  * Get value of field E01STPCUN as a String.
  */
  public String getE01STPCUN()
  {
    return fieldE01STPCUN.getString();
  }

  /**
  * Set numeric field E01STPCUN using a BigDecimal value.
  */
  public void setE01STPCUN(BigDecimal newvalue)
  {
    fieldE01STPCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPCUN()
  {
    return fieldE01STPCUN.getBigDecimal();
  }

  /**
  * Set field E01STPPRO using a String value.
  */
  public void setE01STPPRO(String newvalue)
  {
    fieldE01STPPRO.setString(newvalue);
  }

  /**
  * Get value of field E01STPPRO as a String.
  */
  public String getE01STPPRO()
  {
    return fieldE01STPPRO.getString();
  }

  /**
  * Set field E01CUSNA1 using a String value.
  */
  public void setE01CUSNA1(String newvalue)
  {
    fieldE01CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E01CUSNA1 as a String.
  */
  public String getE01CUSNA1()
  {
    return fieldE01CUSNA1.getString();
  }

  /**
  * Set field E01STPSEQ using a String value.
  */
  public void setE01STPSEQ(String newvalue)
  {
    fieldE01STPSEQ.setString(newvalue);
  }

  /**
  * Get value of field E01STPSEQ as a String.
  */
  public String getE01STPSEQ()
  {
    return fieldE01STPSEQ.getString();
  }

  /**
  * Set numeric field E01STPSEQ using a BigDecimal value.
  */
  public void setE01STPSEQ(BigDecimal newvalue)
  {
    fieldE01STPSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPSEQ()
  {
    return fieldE01STPSEQ.getBigDecimal();
  }

  /**
  * Set field E01STPBNK using a String value.
  */
  public void setE01STPBNK(String newvalue)
  {
    fieldE01STPBNK.setString(newvalue);
  }

  /**
  * Get value of field E01STPBNK as a String.
  */
  public String getE01STPBNK()
  {
    return fieldE01STPBNK.getString();
  }

  /**
  * Set field E01STPBRN using a String value.
  */
  public void setE01STPBRN(String newvalue)
  {
    fieldE01STPBRN.setString(newvalue);
  }

  /**
  * Get value of field E01STPBRN as a String.
  */
  public String getE01STPBRN()
  {
    return fieldE01STPBRN.getString();
  }

  /**
  * Set numeric field E01STPBRN using a BigDecimal value.
  */
  public void setE01STPBRN(BigDecimal newvalue)
  {
    fieldE01STPBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPBRN()
  {
    return fieldE01STPBRN.getBigDecimal();
  }

  /**
  * Set field E01STPCCY using a String value.
  */
  public void setE01STPCCY(String newvalue)
  {
    fieldE01STPCCY.setString(newvalue);
  }

  /**
  * Get value of field E01STPCCY as a String.
  */
  public String getE01STPCCY()
  {
    return fieldE01STPCCY.getString();
  }

  /**
  * Set field E01STPFCK using a String value.
  */
  public void setE01STPFCK(String newvalue)
  {
    fieldE01STPFCK.setString(newvalue);
  }

  /**
  * Get value of field E01STPFCK as a String.
  */
  public String getE01STPFCK()
  {
    return fieldE01STPFCK.getString();
  }

  /**
  * Set numeric field E01STPFCK using a BigDecimal value.
  */
  public void setE01STPFCK(BigDecimal newvalue)
  {
    fieldE01STPFCK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPFCK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPFCK()
  {
    return fieldE01STPFCK.getBigDecimal();
  }

  /**
  * Set field E01STPTCK using a String value.
  */
  public void setE01STPTCK(String newvalue)
  {
    fieldE01STPTCK.setString(newvalue);
  }

  /**
  * Get value of field E01STPTCK as a String.
  */
  public String getE01STPTCK()
  {
    return fieldE01STPTCK.getString();
  }

  /**
  * Set numeric field E01STPTCK using a BigDecimal value.
  */
  public void setE01STPTCK(BigDecimal newvalue)
  {
    fieldE01STPTCK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPTCK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPTCK()
  {
    return fieldE01STPTCK.getBigDecimal();
  }

  /**
  * Set field E01STPDTM using a String value.
  */
  public void setE01STPDTM(String newvalue)
  {
    fieldE01STPDTM.setString(newvalue);
  }

  /**
  * Get value of field E01STPDTM as a String.
  */
  public String getE01STPDTM()
  {
    return fieldE01STPDTM.getString();
  }

  /**
  * Set numeric field E01STPDTM using a BigDecimal value.
  */
  public void setE01STPDTM(BigDecimal newvalue)
  {
    fieldE01STPDTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPDTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPDTM()
  {
    return fieldE01STPDTM.getBigDecimal();
  }

  /**
  * Set field E01STPDTD using a String value.
  */
  public void setE01STPDTD(String newvalue)
  {
    fieldE01STPDTD.setString(newvalue);
  }

  /**
  * Get value of field E01STPDTD as a String.
  */
  public String getE01STPDTD()
  {
    return fieldE01STPDTD.getString();
  }

  /**
  * Set numeric field E01STPDTD using a BigDecimal value.
  */
  public void setE01STPDTD(BigDecimal newvalue)
  {
    fieldE01STPDTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPDTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPDTD()
  {
    return fieldE01STPDTD.getBigDecimal();
  }

  /**
  * Set field E01STPDTY using a String value.
  */
  public void setE01STPDTY(String newvalue)
  {
    fieldE01STPDTY.setString(newvalue);
  }

  /**
  * Get value of field E01STPDTY as a String.
  */
  public String getE01STPDTY()
  {
    return fieldE01STPDTY.getString();
  }

  /**
  * Set numeric field E01STPDTY using a BigDecimal value.
  */
  public void setE01STPDTY(BigDecimal newvalue)
  {
    fieldE01STPDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPDTY()
  {
    return fieldE01STPDTY.getBigDecimal();
  }

  /**
  * Set field E01STPTIM using a String value.
  */
  public void setE01STPTIM(String newvalue)
  {
    fieldE01STPTIM.setString(newvalue);
  }

  /**
  * Get value of field E01STPTIM as a String.
  */
  public String getE01STPTIM()
  {
    return fieldE01STPTIM.getString();
  }

  /**
  * Set field E01STPAMT using a String value.
  */
  public void setE01STPAMT(String newvalue)
  {
    fieldE01STPAMT.setString(newvalue);
  }

  /**
  * Get value of field E01STPAMT as a String.
  */
  public String getE01STPAMT()
  {
    return fieldE01STPAMT.getString();
  }

  /**
  * Set numeric field E01STPAMT using a BigDecimal value.
  */
  public void setE01STPAMT(BigDecimal newvalue)
  {
    fieldE01STPAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPAMT()
  {
    return fieldE01STPAMT.getBigDecimal();
  }

  /**
  * Set field E01STPGLN using a String value.
  */
  public void setE01STPGLN(String newvalue)
  {
    fieldE01STPGLN.setString(newvalue);
  }

  /**
  * Get value of field E01STPGLN as a String.
  */
  public String getE01STPGLN()
  {
    return fieldE01STPGLN.getString();
  }

  /**
  * Set numeric field E01STPGLN using a BigDecimal value.
  */
  public void setE01STPGLN(BigDecimal newvalue)
  {
    fieldE01STPGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPGLN()
  {
    return fieldE01STPGLN.getBigDecimal();
  }

  /**
  * Set field E01STPPRF using a String value.
  */
  public void setE01STPPRF(String newvalue)
  {
    fieldE01STPPRF.setString(newvalue);
  }

  /**
  * Get value of field E01STPPRF as a String.
  */
  public String getE01STPPRF()
  {
    return fieldE01STPPRF.getString();
  }

  /**
  * Set field E01STPRMK using a String value.
  */
  public void setE01STPRMK(String newvalue)
  {
    fieldE01STPRMK.setString(newvalue);
  }

  /**
  * Get value of field E01STPRMK as a String.
  */
  public String getE01STPRMK()
  {
    return fieldE01STPRMK.getString();
  }

  /**
  * Set field E01STPCCF using a String value.
  */
  public void setE01STPCCF(String newvalue)
  {
    fieldE01STPCCF.setString(newvalue);
  }

  /**
  * Get value of field E01STPCCF as a String.
  */
  public String getE01STPCCF()
  {
    return fieldE01STPCCF.getString();
  }

  /**
  * Set field E01STPPTS using a String value.
  */
  public void setE01STPPTS(String newvalue)
  {
    fieldE01STPPTS.setString(newvalue);
  }

  /**
  * Get value of field E01STPPTS as a String.
  */
  public String getE01STPPTS()
  {
    return fieldE01STPPTS.getString();
  }

  /**
  * Set numeric field E01STPPTS using a BigDecimal value.
  */
  public void setE01STPPTS(BigDecimal newvalue)
  {
    fieldE01STPPTS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPPTS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPPTS()
  {
    return fieldE01STPPTS.getBigDecimal();
  }

  /**
  * Set field E01STPF04 using a String value.
  */
  public void setE01STPF04(String newvalue)
  {
    fieldE01STPF04.setString(newvalue);
  }

  /**
  * Get value of field E01STPF04 as a String.
  */
  public String getE01STPF04()
  {
    return fieldE01STPF04.getString();
  }

  /**
  * Set field E01STPCKM using a String value.
  */
  public void setE01STPCKM(String newvalue)
  {
    fieldE01STPCKM.setString(newvalue);
  }

  /**
  * Get value of field E01STPCKM as a String.
  */
  public String getE01STPCKM()
  {
    return fieldE01STPCKM.getString();
  }

  /**
  * Set numeric field E01STPCKM using a BigDecimal value.
  */
  public void setE01STPCKM(BigDecimal newvalue)
  {
    fieldE01STPCKM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPCKM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPCKM()
  {
    return fieldE01STPCKM.getBigDecimal();
  }

  /**
  * Set field E01STPCKD using a String value.
  */
  public void setE01STPCKD(String newvalue)
  {
    fieldE01STPCKD.setString(newvalue);
  }

  /**
  * Get value of field E01STPCKD as a String.
  */
  public String getE01STPCKD()
  {
    return fieldE01STPCKD.getString();
  }

  /**
  * Set numeric field E01STPCKD using a BigDecimal value.
  */
  public void setE01STPCKD(BigDecimal newvalue)
  {
    fieldE01STPCKD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPCKD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPCKD()
  {
    return fieldE01STPCKD.getBigDecimal();
  }

  /**
  * Set field E01STPCKY using a String value.
  */
  public void setE01STPCKY(String newvalue)
  {
    fieldE01STPCKY.setString(newvalue);
  }

  /**
  * Get value of field E01STPCKY as a String.
  */
  public String getE01STPCKY()
  {
    return fieldE01STPCKY.getString();
  }

  /**
  * Set numeric field E01STPCKY using a BigDecimal value.
  */
  public void setE01STPCKY(BigDecimal newvalue)
  {
    fieldE01STPCKY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPCKY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPCKY()
  {
    return fieldE01STPCKY.getBigDecimal();
  }

  /**
  * Set field E01STPFLG using a String value.
  */
  public void setE01STPFLG(String newvalue)
  {
    fieldE01STPFLG.setString(newvalue);
  }

  /**
  * Get value of field E01STPFLG as a String.
  */
  public String getE01STPFLG()
  {
    return fieldE01STPFLG.getString();
  }

  /**
  * Set field E01STPF05 using a String value.
  */
  public void setE01STPF05(String newvalue)
  {
    fieldE01STPF05.setString(newvalue);
  }

  /**
  * Get value of field E01STPF05 as a String.
  */
  public String getE01STPF05()
  {
    return fieldE01STPF05.getString();
  }

  /**
  * Set field E01STPF02 using a String value.
  */
  public void setE01STPF02(String newvalue)
  {
    fieldE01STPF02.setString(newvalue);
  }

  /**
  * Get value of field E01STPF02 as a String.
  */
  public String getE01STPF02()
  {
    return fieldE01STPF02.getString();
  }

  /**
  * Set field E01STPF03 using a String value.
  */
  public void setE01STPF03(String newvalue)
  {
    fieldE01STPF03.setString(newvalue);
  }

  /**
  * Get value of field E01STPF03 as a String.
  */
  public String getE01STPF03()
  {
    return fieldE01STPF03.getString();
  }

  /**
  * Set field D01DSCCAU using a String value.
  */
  public void setD01DSCCAU(String newvalue)
  {
    fieldD01DSCCAU.setString(newvalue);
  }

  /**
  * Get value of field D01DSCCAU as a String.
  */
  public String getD01DSCCAU()
  {
    return fieldD01DSCCAU.getString();
  }

  /**
  * Set field E01STPCPB using a String value.
  */
  public void setE01STPCPB(String newvalue)
  {
    fieldE01STPCPB.setString(newvalue);
  }

  /**
  * Get value of field E01STPCPB as a String.
  */
  public String getE01STPCPB()
  {
    return fieldE01STPCPB.getString();
  }

  /**
  * Set field E01STPAAC using a String value.
  */
  public void setE01STPAAC(String newvalue)
  {
    fieldE01STPAAC.setString(newvalue);
  }

  /**
  * Get value of field E01STPAAC as a String.
  */
  public String getE01STPAAC()
  {
    return fieldE01STPAAC.getString();
  }

  /**
  * Set numeric field E01STPAAC using a BigDecimal value.
  */
  public void setE01STPAAC(BigDecimal newvalue)
  {
    fieldE01STPAAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPAAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPAAC()
  {
    return fieldE01STPAAC.getBigDecimal();
  }

  /**
  * Set field E01STPTIT using a String value.
  */
  public void setE01STPTIT(String newvalue)
  {
    fieldE01STPTIT.setString(newvalue);
  }

  /**
  * Get value of field E01STPTIT as a String.
  */
  public String getE01STPTIT()
  {
    return fieldE01STPTIT.getString();
  }

  /**
  * Set field E01STPPUR using a String value.
  */
  public void setE01STPPUR(String newvalue)
  {
    fieldE01STPPUR.setString(newvalue);
  }

  /**
  * Get value of field E01STPPUR as a String.
  */
  public String getE01STPPUR()
  {
    return fieldE01STPPUR.getString();
  }

  /**
  * Set field E01STPSTS using a String value.
  */
  public void setE01STPSTS(String newvalue)
  {
    fieldE01STPSTS.setString(newvalue);
  }

  /**
  * Get value of field E01STPSTS as a String.
  */
  public String getE01STPSTS()
  {
    return fieldE01STPSTS.getString();
  }

  /**
  * Set field E01STPMDM using a String value.
  */
  public void setE01STPMDM(String newvalue)
  {
    fieldE01STPMDM.setString(newvalue);
  }

  /**
  * Get value of field E01STPMDM as a String.
  */
  public String getE01STPMDM()
  {
    return fieldE01STPMDM.getString();
  }

  /**
  * Set numeric field E01STPMDM using a BigDecimal value.
  */
  public void setE01STPMDM(BigDecimal newvalue)
  {
    fieldE01STPMDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPMDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPMDM()
  {
    return fieldE01STPMDM.getBigDecimal();
  }

  /**
  * Set field E01STPMDD using a String value.
  */
  public void setE01STPMDD(String newvalue)
  {
    fieldE01STPMDD.setString(newvalue);
  }

  /**
  * Get value of field E01STPMDD as a String.
  */
  public String getE01STPMDD()
  {
    return fieldE01STPMDD.getString();
  }

  /**
  * Set numeric field E01STPMDD using a BigDecimal value.
  */
  public void setE01STPMDD(BigDecimal newvalue)
  {
    fieldE01STPMDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPMDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPMDD()
  {
    return fieldE01STPMDD.getBigDecimal();
  }

  /**
  * Set field E01STPMDY using a String value.
  */
  public void setE01STPMDY(String newvalue)
  {
    fieldE01STPMDY.setString(newvalue);
  }

  /**
  * Get value of field E01STPMDY as a String.
  */
  public String getE01STPMDY()
  {
    return fieldE01STPMDY.getString();
  }

  /**
  * Set numeric field E01STPMDY using a BigDecimal value.
  */
  public void setE01STPMDY(BigDecimal newvalue)
  {
    fieldE01STPMDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01STPMDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01STPMDY()
  {
    return fieldE01STPMDY.getBigDecimal();
  }

  /**
  * Set field E01STPCAU using a String value.
  */
  public void setE01STPCAU(String newvalue)
  {
    fieldE01STPCAU.setString(newvalue);
  }

  /**
  * Get value of field E01STPCAU as a String.
  */
  public String getE01STPCAU()
  {
    return fieldE01STPCAU.getString();
  }

  /**
  * Set field E01STPCNL using a String value.
  */
  public void setE01STPCNL(String newvalue)
  {
    fieldE01STPCNL.setString(newvalue);
  }

  /**
  * Get value of field E01STPCNL as a String.
  */
  public String getE01STPCNL()
  {
    return fieldE01STPCNL.getString();
  }

  /**
  * Set field E01IDENTI using a String value.
  */
  public void setE01IDENTI(String newvalue)
  {
    fieldE01IDENTI.setString(newvalue);
  }

  /**
  * Get value of field E01IDENTI as a String.
  */
  public String getE01IDENTI()
  {
    return fieldE01IDENTI.getString();
  }

  /**
  * Set field E01PLICAN using a String value.
  */
  public void setE01PLICAN(String newvalue)
  {
    fieldE01PLICAN.setString(newvalue);
  }

  /**
  * Get value of field E01PLICAN as a String.
  */
  public String getE01PLICAN()
  {
    return fieldE01PLICAN.getString();
  }

  /**
  * Set field E01DESCRI using a String value.
  */
  public void setE01DESCRI(String newvalue)
  {
    fieldE01DESCRI.setString(newvalue);
  }

  /**
  * Get value of field E01DESCRI as a String.
  */
  public String getE01DESCRI()
  {
    return fieldE01DESCRI.getString();
  }

}
