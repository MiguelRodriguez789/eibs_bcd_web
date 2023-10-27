package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECH026503 physical file definition.
* 
* File level identifier is 1180524232326.
* Record format level identifier is 470E7FF9767F1.
*/

public class ECH026503Message extends MessageRecord
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
                                     "E03SELBNK",
                                     "E03SELBRN",
                                     "E03SELBDS",
                                     "E03ACMCUN",
                                     "E03ACMACC",
                                     "E03ACMPRO",
                                     "E03ACMCCY",
                                     "E03CUSNA1",
                                     "E03CHPNO1",
                                     "E03CHPNO2",
                                     "E03CHPRE1",
                                     "E03CHPDBR",
                                     "E03CHPCON",
                                     "E03ACMMSK",
                                     "E03ACMTCB",
                                     "E03ACMCBC",
                                     "E03ACMASK",
                                     "E03CHLMSK",
                                     "E03CHLTSK",
                                     "E03CHLASK",
                                     "E03CHLPSK",
                                     "E03CHLRSK"
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
                                   "E03SELBNK",
                                   "E03SELBRN",
                                   "E03SELBDS",
                                   "E03ACMCUN",
                                   "E03ACMACC",
                                   "E03ACMPRO",
                                   "E03ACMCCY",
                                   "E03CUSNA1",
                                   "E03CHPNO1",
                                   "E03CHPNO2",
                                   "E03CHPRE1",
                                   "E03CHPDBR",
                                   "E03CHPCON",
                                   "E03ACMMSK",
                                   "E03ACMTCB",
                                   "E03ACMCBC",
                                   "E03ACMASK",
                                   "E03CHLMSK",
                                   "E03CHLTSK",
                                   "E03CHLASK",
                                   "E03CHLPSK",
                                   "E03CHLRSK"
                                 };
  final static String fid = "1180524232326";
  final static String rid = "470E7FF9767F1";
  final static String fmtname = "ECH026503";
  final int FIELDCOUNT = 31;
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
  private CharacterField fieldE03SELBNK = null;
  private DecimalField fieldE03SELBRN = null;
  private CharacterField fieldE03SELBDS = null;
  private DecimalField fieldE03ACMCUN = null;
  private DecimalField fieldE03ACMACC = null;
  private CharacterField fieldE03ACMPRO = null;
  private CharacterField fieldE03ACMCCY = null;
  private CharacterField fieldE03CUSNA1 = null;
  private CharacterField fieldE03CHPNO1 = null;
  private CharacterField fieldE03CHPNO2 = null;
  private CharacterField fieldE03CHPRE1 = null;
  private DecimalField fieldE03CHPDBR = null;
  private CharacterField fieldE03CHPCON = null;
  private DecimalField fieldE03ACMMSK = null;
  private CharacterField fieldE03ACMTCB = null;
  private CharacterField fieldE03ACMCBC = null;
  private DecimalField fieldE03ACMASK = null;
  private DecimalField fieldE03CHLMSK = null;
  private DecimalField fieldE03CHLTSK = null;
  private DecimalField fieldE03CHLASK = null;
  private DecimalField fieldE03CHLPSK = null;
  private DecimalField fieldE03CHLRSK = null;

  /**
  * Constructor for ECH026503Message.
  */
  public ECH026503Message()
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
    recordsize = 320;
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
    fields[9] = fieldE03SELBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E03SELBNK");
    fields[10] = fieldE03SELBRN =
    new DecimalField(message, HEADERSIZE + 44, 5, 0, "E03SELBRN");
    fields[11] = fieldE03SELBDS =
    new CharacterField(message, HEADERSIZE + 49, 60, "E03SELBDS");
    fields[12] = fieldE03ACMCUN =
    new DecimalField(message, HEADERSIZE + 109, 10, 0, "E03ACMCUN");
    fields[13] = fieldE03ACMACC =
    new DecimalField(message, HEADERSIZE + 119, 13, 0, "E03ACMACC");
    fields[14] = fieldE03ACMPRO =
    new CharacterField(message, HEADERSIZE + 132, 4, "E03ACMPRO");
    fields[15] = fieldE03ACMCCY =
    new CharacterField(message, HEADERSIZE + 136, 3, "E03ACMCCY");
    fields[16] = fieldE03CUSNA1 =
    new CharacterField(message, HEADERSIZE + 139, 45, "E03CUSNA1");
    fields[17] = fieldE03CHPNO1 =
    new CharacterField(message, HEADERSIZE + 184, 45, "E03CHPNO1");
    fields[18] = fieldE03CHPNO2 =
    new CharacterField(message, HEADERSIZE + 229, 45, "E03CHPNO2");
    fields[19] = fieldE03CHPRE1 =
    new CharacterField(message, HEADERSIZE + 274, 1, "E03CHPRE1");
    fields[20] = fieldE03CHPDBR =
    new DecimalField(message, HEADERSIZE + 275, 5, 0, "E03CHPDBR");
    fields[21] = fieldE03CHPCON =
    new CharacterField(message, HEADERSIZE + 280, 1, "E03CHPCON");
    fields[22] = fieldE03ACMMSK =
    new DecimalField(message, HEADERSIZE + 281, 3, 0, "E03ACMMSK");
    fields[23] = fieldE03ACMTCB =
    new CharacterField(message, HEADERSIZE + 284, 2, "E03ACMTCB");
    fields[24] = fieldE03ACMCBC =
    new CharacterField(message, HEADERSIZE + 286, 1, "E03ACMCBC");
    fields[25] = fieldE03ACMASK =
    new DecimalField(message, HEADERSIZE + 287, 3, 0, "E03ACMASK");
    fields[26] = fieldE03CHLMSK =
    new DecimalField(message, HEADERSIZE + 290, 6, 0, "E03CHLMSK");
    fields[27] = fieldE03CHLTSK =
    new DecimalField(message, HEADERSIZE + 296, 6, 0, "E03CHLTSK");
    fields[28] = fieldE03CHLASK =
    new DecimalField(message, HEADERSIZE + 302, 6, 0, "E03CHLASK");
    fields[29] = fieldE03CHLPSK =
    new DecimalField(message, HEADERSIZE + 308, 6, 0, "E03CHLPSK");
    fields[30] = fieldE03CHLRSK =
    new DecimalField(message, HEADERSIZE + 314, 6, 0, "E03CHLRSK");

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
  * Set field E03SELBNK using a String value.
  */
  public void setE03SELBNK(String newvalue)
  {
    fieldE03SELBNK.setString(newvalue);
  }

  /**
  * Get value of field E03SELBNK as a String.
  */
  public String getE03SELBNK()
  {
    return fieldE03SELBNK.getString();
  }

  /**
  * Set field E03SELBRN using a String value.
  */
  public void setE03SELBRN(String newvalue)
  {
    fieldE03SELBRN.setString(newvalue);
  }

  /**
  * Get value of field E03SELBRN as a String.
  */
  public String getE03SELBRN()
  {
    return fieldE03SELBRN.getString();
  }

  /**
  * Set numeric field E03SELBRN using a BigDecimal value.
  */
  public void setE03SELBRN(BigDecimal newvalue)
  {
    fieldE03SELBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03SELBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03SELBRN()
  {
    return fieldE03SELBRN.getBigDecimal();
  }

  /**
  * Set field E03SELBDS using a String value.
  */
  public void setE03SELBDS(String newvalue)
  {
    fieldE03SELBDS.setString(newvalue);
  }

  /**
  * Get value of field E03SELBDS as a String.
  */
  public String getE03SELBDS()
  {
    return fieldE03SELBDS.getString();
  }

  /**
  * Set field E03ACMCUN using a String value.
  */
  public void setE03ACMCUN(String newvalue)
  {
    fieldE03ACMCUN.setString(newvalue);
  }

  /**
  * Get value of field E03ACMCUN as a String.
  */
  public String getE03ACMCUN()
  {
    return fieldE03ACMCUN.getString();
  }

  /**
  * Set numeric field E03ACMCUN using a BigDecimal value.
  */
  public void setE03ACMCUN(BigDecimal newvalue)
  {
    fieldE03ACMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ACMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ACMCUN()
  {
    return fieldE03ACMCUN.getBigDecimal();
  }

  /**
  * Set field E03ACMACC using a String value.
  */
  public void setE03ACMACC(String newvalue)
  {
    fieldE03ACMACC.setString(newvalue);
  }

  /**
  * Get value of field E03ACMACC as a String.
  */
  public String getE03ACMACC()
  {
    return fieldE03ACMACC.getString();
  }

  /**
  * Set numeric field E03ACMACC using a BigDecimal value.
  */
  public void setE03ACMACC(BigDecimal newvalue)
  {
    fieldE03ACMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ACMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ACMACC()
  {
    return fieldE03ACMACC.getBigDecimal();
  }

  /**
  * Set field E03ACMPRO using a String value.
  */
  public void setE03ACMPRO(String newvalue)
  {
    fieldE03ACMPRO.setString(newvalue);
  }

  /**
  * Get value of field E03ACMPRO as a String.
  */
  public String getE03ACMPRO()
  {
    return fieldE03ACMPRO.getString();
  }

  /**
  * Set field E03ACMCCY using a String value.
  */
  public void setE03ACMCCY(String newvalue)
  {
    fieldE03ACMCCY.setString(newvalue);
  }

  /**
  * Get value of field E03ACMCCY as a String.
  */
  public String getE03ACMCCY()
  {
    return fieldE03ACMCCY.getString();
  }

  /**
  * Set field E03CUSNA1 using a String value.
  */
  public void setE03CUSNA1(String newvalue)
  {
    fieldE03CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E03CUSNA1 as a String.
  */
  public String getE03CUSNA1()
  {
    return fieldE03CUSNA1.getString();
  }

  /**
  * Set field E03CHPNO1 using a String value.
  */
  public void setE03CHPNO1(String newvalue)
  {
    fieldE03CHPNO1.setString(newvalue);
  }

  /**
  * Get value of field E03CHPNO1 as a String.
  */
  public String getE03CHPNO1()
  {
    return fieldE03CHPNO1.getString();
  }

  /**
  * Set field E03CHPNO2 using a String value.
  */
  public void setE03CHPNO2(String newvalue)
  {
    fieldE03CHPNO2.setString(newvalue);
  }

  /**
  * Get value of field E03CHPNO2 as a String.
  */
  public String getE03CHPNO2()
  {
    return fieldE03CHPNO2.getString();
  }

  /**
  * Set field E03CHPRE1 using a String value.
  */
  public void setE03CHPRE1(String newvalue)
  {
    fieldE03CHPRE1.setString(newvalue);
  }

  /**
  * Get value of field E03CHPRE1 as a String.
  */
  public String getE03CHPRE1()
  {
    return fieldE03CHPRE1.getString();
  }

  /**
  * Set field E03CHPDBR using a String value.
  */
  public void setE03CHPDBR(String newvalue)
  {
    fieldE03CHPDBR.setString(newvalue);
  }

  /**
  * Get value of field E03CHPDBR as a String.
  */
  public String getE03CHPDBR()
  {
    return fieldE03CHPDBR.getString();
  }

  /**
  * Set numeric field E03CHPDBR using a BigDecimal value.
  */
  public void setE03CHPDBR(BigDecimal newvalue)
  {
    fieldE03CHPDBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03CHPDBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03CHPDBR()
  {
    return fieldE03CHPDBR.getBigDecimal();
  }

  /**
  * Set field E03CHPCON using a String value.
  */
  public void setE03CHPCON(String newvalue)
  {
    fieldE03CHPCON.setString(newvalue);
  }

  /**
  * Get value of field E03CHPCON as a String.
  */
  public String getE03CHPCON()
  {
    return fieldE03CHPCON.getString();
  }

  /**
  * Set field E03ACMMSK using a String value.
  */
  public void setE03ACMMSK(String newvalue)
  {
    fieldE03ACMMSK.setString(newvalue);
  }

  /**
  * Get value of field E03ACMMSK as a String.
  */
  public String getE03ACMMSK()
  {
    return fieldE03ACMMSK.getString();
  }

  /**
  * Set numeric field E03ACMMSK using a BigDecimal value.
  */
  public void setE03ACMMSK(BigDecimal newvalue)
  {
    fieldE03ACMMSK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ACMMSK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ACMMSK()
  {
    return fieldE03ACMMSK.getBigDecimal();
  }

  /**
  * Set field E03ACMTCB using a String value.
  */
  public void setE03ACMTCB(String newvalue)
  {
    fieldE03ACMTCB.setString(newvalue);
  }

  /**
  * Get value of field E03ACMTCB as a String.
  */
  public String getE03ACMTCB()
  {
    return fieldE03ACMTCB.getString();
  }

  /**
  * Set field E03ACMCBC using a String value.
  */
  public void setE03ACMCBC(String newvalue)
  {
    fieldE03ACMCBC.setString(newvalue);
  }

  /**
  * Get value of field E03ACMCBC as a String.
  */
  public String getE03ACMCBC()
  {
    return fieldE03ACMCBC.getString();
  }

  /**
  * Set field E03ACMASK using a String value.
  */
  public void setE03ACMASK(String newvalue)
  {
    fieldE03ACMASK.setString(newvalue);
  }

  /**
  * Get value of field E03ACMASK as a String.
  */
  public String getE03ACMASK()
  {
    return fieldE03ACMASK.getString();
  }

  /**
  * Set numeric field E03ACMASK using a BigDecimal value.
  */
  public void setE03ACMASK(BigDecimal newvalue)
  {
    fieldE03ACMASK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ACMASK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ACMASK()
  {
    return fieldE03ACMASK.getBigDecimal();
  }

  /**
  * Set field E03CHLMSK using a String value.
  */
  public void setE03CHLMSK(String newvalue)
  {
    fieldE03CHLMSK.setString(newvalue);
  }

  /**
  * Get value of field E03CHLMSK as a String.
  */
  public String getE03CHLMSK()
  {
    return fieldE03CHLMSK.getString();
  }

  /**
  * Set numeric field E03CHLMSK using a BigDecimal value.
  */
  public void setE03CHLMSK(BigDecimal newvalue)
  {
    fieldE03CHLMSK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03CHLMSK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03CHLMSK()
  {
    return fieldE03CHLMSK.getBigDecimal();
  }

  /**
  * Set field E03CHLTSK using a String value.
  */
  public void setE03CHLTSK(String newvalue)
  {
    fieldE03CHLTSK.setString(newvalue);
  }

  /**
  * Get value of field E03CHLTSK as a String.
  */
  public String getE03CHLTSK()
  {
    return fieldE03CHLTSK.getString();
  }

  /**
  * Set numeric field E03CHLTSK using a BigDecimal value.
  */
  public void setE03CHLTSK(BigDecimal newvalue)
  {
    fieldE03CHLTSK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03CHLTSK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03CHLTSK()
  {
    return fieldE03CHLTSK.getBigDecimal();
  }

  /**
  * Set field E03CHLASK using a String value.
  */
  public void setE03CHLASK(String newvalue)
  {
    fieldE03CHLASK.setString(newvalue);
  }

  /**
  * Get value of field E03CHLASK as a String.
  */
  public String getE03CHLASK()
  {
    return fieldE03CHLASK.getString();
  }

  /**
  * Set numeric field E03CHLASK using a BigDecimal value.
  */
  public void setE03CHLASK(BigDecimal newvalue)
  {
    fieldE03CHLASK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03CHLASK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03CHLASK()
  {
    return fieldE03CHLASK.getBigDecimal();
  }

  /**
  * Set field E03CHLPSK using a String value.
  */
  public void setE03CHLPSK(String newvalue)
  {
    fieldE03CHLPSK.setString(newvalue);
  }

  /**
  * Get value of field E03CHLPSK as a String.
  */
  public String getE03CHLPSK()
  {
    return fieldE03CHLPSK.getString();
  }

  /**
  * Set numeric field E03CHLPSK using a BigDecimal value.
  */
  public void setE03CHLPSK(BigDecimal newvalue)
  {
    fieldE03CHLPSK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03CHLPSK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03CHLPSK()
  {
    return fieldE03CHLPSK.getBigDecimal();
  }

  /**
  * Set field E03CHLRSK using a String value.
  */
  public void setE03CHLRSK(String newvalue)
  {
    fieldE03CHLRSK.setString(newvalue);
  }

  /**
  * Get value of field E03CHLRSK as a String.
  */
  public String getE03CHLRSK()
  {
    return fieldE03CHLRSK.getString();
  }

  /**
  * Set numeric field E03CHLRSK using a BigDecimal value.
  */
  public void setE03CHLRSK(BigDecimal newvalue)
  {
    fieldE03CHLRSK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03CHLRSK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03CHLRSK()
  {
    return fieldE03CHLRSK.getBigDecimal();
  }

}
