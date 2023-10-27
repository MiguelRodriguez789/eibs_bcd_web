package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECIF33002 physical file definition.
* 
* File level identifier is 1130611112847.
* Record format level identifier is 4807E5E14BDAC.
*/

public class ECIF33002Message extends MessageRecord
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
                                     "E02SELACC",
                                     "E02SELRDY",
                                     "E02SELRDM",
                                     "E02STHACC",
                                     "E02STHCUN",
                                     "E02CUSNA1",
                                     "E02STHBNK",
                                     "E02STHBRN",
                                     "E02STHCCY",
                                     "E02STHATY",
                                     "E02STHPRO",
                                     "E02STHOFC",
                                     "E02DSCATY",
                                     "E02DSCPRO",
                                     "E02DSCOFC",
                                     "E02STHRDM",
                                     "E02STHRDD",
                                     "E02STHRDY",
                                     "E02STHNUM",
                                     "E02STHPRN",
                                     "E02STHSTV",
                                     "E02STHPTH"
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
                                   "E02SELACC",
                                   "E02SELRDY",
                                   "E02SELRDM",
                                   "E02STHACC",
                                   "E02STHCUN",
                                   "E02CUSNA1",
                                   "E02STHBNK",
                                   "E02STHBRN",
                                   "E02STHCCY",
                                   "E02STHATY",
                                   "E02STHPRO",
                                   "E02STHOFC",
                                   "E02DSCATY",
                                   "E02DSCPRO",
                                   "E02DSCOFC",
                                   "E02STHRDM",
                                   "E02STHRDD",
                                   "E02STHRDY",
                                   "E02STHNUM",
                                   "E02STHPRN",
                                   "E02STHSTV",
                                   "E02STHPTH"
                                 };
  final static String fid = "1130611112847";
  final static String rid = "4807E5E14BDAC";
  final static String fmtname = "ECIF33002";
  final int FIELDCOUNT = 31;
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
  private DecimalField fieldE02SELACC = null;
  private DecimalField fieldE02SELRDY = null;
  private DecimalField fieldE02SELRDM = null;
  private DecimalField fieldE02STHACC = null;
  private DecimalField fieldE02STHCUN = null;
  private CharacterField fieldE02CUSNA1 = null;
  private CharacterField fieldE02STHBNK = null;
  private DecimalField fieldE02STHBRN = null;
  private CharacterField fieldE02STHCCY = null;
  private CharacterField fieldE02STHATY = null;
  private CharacterField fieldE02STHPRO = null;
  private CharacterField fieldE02STHOFC = null;
  private CharacterField fieldE02DSCATY = null;
  private CharacterField fieldE02DSCPRO = null;
  private CharacterField fieldE02DSCOFC = null;
  private DecimalField fieldE02STHRDM = null;
  private DecimalField fieldE02STHRDD = null;
  private DecimalField fieldE02STHRDY = null;
  private DecimalField fieldE02STHNUM = null;
  private DecimalField fieldE02STHPRN = null;
  private CharacterField fieldE02STHSTV = null;
  private CharacterField fieldE02STHPTH = null;

  /**
  * Constructor for ECIF33002Message.
  */
  public ECIF33002Message()
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
    recordsize = 601;
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
    fields[9] = fieldE02SELACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E02SELACC");
    fields[10] = fieldE02SELRDY =
    new DecimalField(message, HEADERSIZE + 55, 5, 0, "E02SELRDY");
    fields[11] = fieldE02SELRDM =
    new DecimalField(message, HEADERSIZE + 60, 3, 0, "E02SELRDM");
    fields[12] = fieldE02STHACC =
    new DecimalField(message, HEADERSIZE + 63, 13, 0, "E02STHACC");
    fields[13] = fieldE02STHCUN =
    new DecimalField(message, HEADERSIZE + 76, 10, 0, "E02STHCUN");
    fields[14] = fieldE02CUSNA1 =
    new CharacterField(message, HEADERSIZE + 86, 60, "E02CUSNA1");
    fields[15] = fieldE02STHBNK =
    new CharacterField(message, HEADERSIZE + 146, 2, "E02STHBNK");
    fields[16] = fieldE02STHBRN =
    new DecimalField(message, HEADERSIZE + 148, 5, 0, "E02STHBRN");
    fields[17] = fieldE02STHCCY =
    new CharacterField(message, HEADERSIZE + 153, 3, "E02STHCCY");
    fields[18] = fieldE02STHATY =
    new CharacterField(message, HEADERSIZE + 156, 4, "E02STHATY");
    fields[19] = fieldE02STHPRO =
    new CharacterField(message, HEADERSIZE + 160, 4, "E02STHPRO");
    fields[20] = fieldE02STHOFC =
    new CharacterField(message, HEADERSIZE + 164, 4, "E02STHOFC");
    fields[21] = fieldE02DSCATY =
    new CharacterField(message, HEADERSIZE + 168, 45, "E02DSCATY");
    fields[22] = fieldE02DSCPRO =
    new CharacterField(message, HEADERSIZE + 213, 45, "E02DSCPRO");
    fields[23] = fieldE02DSCOFC =
    new CharacterField(message, HEADERSIZE + 258, 45, "E02DSCOFC");
    fields[24] = fieldE02STHRDM =
    new DecimalField(message, HEADERSIZE + 303, 3, 0, "E02STHRDM");
    fields[25] = fieldE02STHRDD =
    new DecimalField(message, HEADERSIZE + 306, 3, 0, "E02STHRDD");
    fields[26] = fieldE02STHRDY =
    new DecimalField(message, HEADERSIZE + 309, 5, 0, "E02STHRDY");
    fields[27] = fieldE02STHNUM =
    new DecimalField(message, HEADERSIZE + 314, 8, 0, "E02STHNUM");
    fields[28] = fieldE02STHPRN =
    new DecimalField(message, HEADERSIZE + 322, 3, 0, "E02STHPRN");
    fields[29] = fieldE02STHSTV =
    new CharacterField(message, HEADERSIZE + 325, 20, "E02STHSTV");
    fields[30] = fieldE02STHPTH =
    new CharacterField(message, HEADERSIZE + 345, 256, "E02STHPTH");

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
  * Set field E02SELACC using a String value.
  */
  public void setE02SELACC(String newvalue)
  {
    fieldE02SELACC.setString(newvalue);
  }

  /**
  * Get value of field E02SELACC as a String.
  */
  public String getE02SELACC()
  {
    return fieldE02SELACC.getString();
  }

  /**
  * Set numeric field E02SELACC using a BigDecimal value.
  */
  public void setE02SELACC(BigDecimal newvalue)
  {
    fieldE02SELACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELACC()
  {
    return fieldE02SELACC.getBigDecimal();
  }

  /**
  * Set field E02SELRDY using a String value.
  */
  public void setE02SELRDY(String newvalue)
  {
    fieldE02SELRDY.setString(newvalue);
  }

  /**
  * Get value of field E02SELRDY as a String.
  */
  public String getE02SELRDY()
  {
    return fieldE02SELRDY.getString();
  }

  /**
  * Set numeric field E02SELRDY using a BigDecimal value.
  */
  public void setE02SELRDY(BigDecimal newvalue)
  {
    fieldE02SELRDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELRDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELRDY()
  {
    return fieldE02SELRDY.getBigDecimal();
  }

  /**
  * Set field E02SELRDM using a String value.
  */
  public void setE02SELRDM(String newvalue)
  {
    fieldE02SELRDM.setString(newvalue);
  }

  /**
  * Get value of field E02SELRDM as a String.
  */
  public String getE02SELRDM()
  {
    return fieldE02SELRDM.getString();
  }

  /**
  * Set numeric field E02SELRDM using a BigDecimal value.
  */
  public void setE02SELRDM(BigDecimal newvalue)
  {
    fieldE02SELRDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELRDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELRDM()
  {
    return fieldE02SELRDM.getBigDecimal();
  }

  /**
  * Set field E02STHACC using a String value.
  */
  public void setE02STHACC(String newvalue)
  {
    fieldE02STHACC.setString(newvalue);
  }

  /**
  * Get value of field E02STHACC as a String.
  */
  public String getE02STHACC()
  {
    return fieldE02STHACC.getString();
  }

  /**
  * Set numeric field E02STHACC using a BigDecimal value.
  */
  public void setE02STHACC(BigDecimal newvalue)
  {
    fieldE02STHACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02STHACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02STHACC()
  {
    return fieldE02STHACC.getBigDecimal();
  }

  /**
  * Set field E02STHCUN using a String value.
  */
  public void setE02STHCUN(String newvalue)
  {
    fieldE02STHCUN.setString(newvalue);
  }

  /**
  * Get value of field E02STHCUN as a String.
  */
  public String getE02STHCUN()
  {
    return fieldE02STHCUN.getString();
  }

  /**
  * Set numeric field E02STHCUN using a BigDecimal value.
  */
  public void setE02STHCUN(BigDecimal newvalue)
  {
    fieldE02STHCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02STHCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02STHCUN()
  {
    return fieldE02STHCUN.getBigDecimal();
  }

  /**
  * Set field E02CUSNA1 using a String value.
  */
  public void setE02CUSNA1(String newvalue)
  {
    fieldE02CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E02CUSNA1 as a String.
  */
  public String getE02CUSNA1()
  {
    return fieldE02CUSNA1.getString();
  }

  /**
  * Set field E02STHBNK using a String value.
  */
  public void setE02STHBNK(String newvalue)
  {
    fieldE02STHBNK.setString(newvalue);
  }

  /**
  * Get value of field E02STHBNK as a String.
  */
  public String getE02STHBNK()
  {
    return fieldE02STHBNK.getString();
  }

  /**
  * Set field E02STHBRN using a String value.
  */
  public void setE02STHBRN(String newvalue)
  {
    fieldE02STHBRN.setString(newvalue);
  }

  /**
  * Get value of field E02STHBRN as a String.
  */
  public String getE02STHBRN()
  {
    return fieldE02STHBRN.getString();
  }

  /**
  * Set numeric field E02STHBRN using a BigDecimal value.
  */
  public void setE02STHBRN(BigDecimal newvalue)
  {
    fieldE02STHBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02STHBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02STHBRN()
  {
    return fieldE02STHBRN.getBigDecimal();
  }

  /**
  * Set field E02STHCCY using a String value.
  */
  public void setE02STHCCY(String newvalue)
  {
    fieldE02STHCCY.setString(newvalue);
  }

  /**
  * Get value of field E02STHCCY as a String.
  */
  public String getE02STHCCY()
  {
    return fieldE02STHCCY.getString();
  }

  /**
  * Set field E02STHATY using a String value.
  */
  public void setE02STHATY(String newvalue)
  {
    fieldE02STHATY.setString(newvalue);
  }

  /**
  * Get value of field E02STHATY as a String.
  */
  public String getE02STHATY()
  {
    return fieldE02STHATY.getString();
  }

  /**
  * Set field E02STHPRO using a String value.
  */
  public void setE02STHPRO(String newvalue)
  {
    fieldE02STHPRO.setString(newvalue);
  }

  /**
  * Get value of field E02STHPRO as a String.
  */
  public String getE02STHPRO()
  {
    return fieldE02STHPRO.getString();
  }

  /**
  * Set field E02STHOFC using a String value.
  */
  public void setE02STHOFC(String newvalue)
  {
    fieldE02STHOFC.setString(newvalue);
  }

  /**
  * Get value of field E02STHOFC as a String.
  */
  public String getE02STHOFC()
  {
    return fieldE02STHOFC.getString();
  }

  /**
  * Set field E02DSCATY using a String value.
  */
  public void setE02DSCATY(String newvalue)
  {
    fieldE02DSCATY.setString(newvalue);
  }

  /**
  * Get value of field E02DSCATY as a String.
  */
  public String getE02DSCATY()
  {
    return fieldE02DSCATY.getString();
  }

  /**
  * Set field E02DSCPRO using a String value.
  */
  public void setE02DSCPRO(String newvalue)
  {
    fieldE02DSCPRO.setString(newvalue);
  }

  /**
  * Get value of field E02DSCPRO as a String.
  */
  public String getE02DSCPRO()
  {
    return fieldE02DSCPRO.getString();
  }

  /**
  * Set field E02DSCOFC using a String value.
  */
  public void setE02DSCOFC(String newvalue)
  {
    fieldE02DSCOFC.setString(newvalue);
  }

  /**
  * Get value of field E02DSCOFC as a String.
  */
  public String getE02DSCOFC()
  {
    return fieldE02DSCOFC.getString();
  }

  /**
  * Set field E02STHRDM using a String value.
  */
  public void setE02STHRDM(String newvalue)
  {
    fieldE02STHRDM.setString(newvalue);
  }

  /**
  * Get value of field E02STHRDM as a String.
  */
  public String getE02STHRDM()
  {
    return fieldE02STHRDM.getString();
  }

  /**
  * Set numeric field E02STHRDM using a BigDecimal value.
  */
  public void setE02STHRDM(BigDecimal newvalue)
  {
    fieldE02STHRDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02STHRDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02STHRDM()
  {
    return fieldE02STHRDM.getBigDecimal();
  }

  /**
  * Set field E02STHRDD using a String value.
  */
  public void setE02STHRDD(String newvalue)
  {
    fieldE02STHRDD.setString(newvalue);
  }

  /**
  * Get value of field E02STHRDD as a String.
  */
  public String getE02STHRDD()
  {
    return fieldE02STHRDD.getString();
  }

  /**
  * Set numeric field E02STHRDD using a BigDecimal value.
  */
  public void setE02STHRDD(BigDecimal newvalue)
  {
    fieldE02STHRDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02STHRDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02STHRDD()
  {
    return fieldE02STHRDD.getBigDecimal();
  }

  /**
  * Set field E02STHRDY using a String value.
  */
  public void setE02STHRDY(String newvalue)
  {
    fieldE02STHRDY.setString(newvalue);
  }

  /**
  * Get value of field E02STHRDY as a String.
  */
  public String getE02STHRDY()
  {
    return fieldE02STHRDY.getString();
  }

  /**
  * Set numeric field E02STHRDY using a BigDecimal value.
  */
  public void setE02STHRDY(BigDecimal newvalue)
  {
    fieldE02STHRDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02STHRDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02STHRDY()
  {
    return fieldE02STHRDY.getBigDecimal();
  }

  /**
  * Set field E02STHNUM using a String value.
  */
  public void setE02STHNUM(String newvalue)
  {
    fieldE02STHNUM.setString(newvalue);
  }

  /**
  * Get value of field E02STHNUM as a String.
  */
  public String getE02STHNUM()
  {
    return fieldE02STHNUM.getString();
  }

  /**
  * Set numeric field E02STHNUM using a BigDecimal value.
  */
  public void setE02STHNUM(BigDecimal newvalue)
  {
    fieldE02STHNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02STHNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02STHNUM()
  {
    return fieldE02STHNUM.getBigDecimal();
  }

  /**
  * Set field E02STHPRN using a String value.
  */
  public void setE02STHPRN(String newvalue)
  {
    fieldE02STHPRN.setString(newvalue);
  }

  /**
  * Get value of field E02STHPRN as a String.
  */
  public String getE02STHPRN()
  {
    return fieldE02STHPRN.getString();
  }

  /**
  * Set numeric field E02STHPRN using a BigDecimal value.
  */
  public void setE02STHPRN(BigDecimal newvalue)
  {
    fieldE02STHPRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02STHPRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02STHPRN()
  {
    return fieldE02STHPRN.getBigDecimal();
  }

  /**
  * Set field E02STHSTV using a String value.
  */
  public void setE02STHSTV(String newvalue)
  {
    fieldE02STHSTV.setString(newvalue);
  }

  /**
  * Get value of field E02STHSTV as a String.
  */
  public String getE02STHSTV()
  {
    return fieldE02STHSTV.getString();
  }

  /**
  * Set field E02STHPTH using a String value.
  */
  public void setE02STHPTH(String newvalue)
  {
    fieldE02STHPTH.setString(newvalue);
  }

  /**
  * Get value of field E02STHPTH as a String.
  */
  public String getE02STHPTH()
  {
    return fieldE02STHPTH.getString();
  }

}