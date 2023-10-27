package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECH032001 physical file definition.
* 
* File level identifier is 1180515145025.
* Record format level identifier is 3C73537CD3D6C.
*/

public class ECH032001Message extends MessageRecord
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
                                     "E01SELBNK",
                                     "E01SELBRN",
                                     "E01SELOSTA",
                                     "E01SELFSTA",
                                     "E01SELIDM",
                                     "E01SELIDD",
                                     "E01SELIDY",
                                     "E01SELFDM",
                                     "E01SELFDD",
                                     "E01SELFDY",
                                     "E01CHMBNK",
                                     "E01CHMBRN",
                                     "E01CHMCCY",
                                     "E01CHMACC",
                                     "E01CHMACD",
                                     "E01CHMPRO",
                                     "E01CHMCUN",
                                     "E01CHMNA1",
                                     "E01CHMOFC",
                                     "E01DSCOFC",
                                     "E01CHMRQM",
                                     "E01CHMRQD",
                                     "E01CHMRQY",
                                     "E01CHMNCB",
                                     "E01CHMTCB",
                                     "E01CHMICK",
                                     "E01CHMFCK",
                                     "E01CHMNTC",
                                     "E01CHMDBR",
                                     "E01CHMDES",
                                     "E01CHMACT",
                                     "E01OPECDE"
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
                                   "E01SELBNK",
                                   "E01SELBRN",
                                   "E01SELOSTA",
                                   "E01SELFSTA",
                                   "E01SELIDM",
                                   "E01SELIDD",
                                   "E01SELIDY",
                                   "E01SELFDM",
                                   "E01SELFDD",
                                   "E01SELFDY",
                                   "E01CHMBNK",
                                   "E01CHMBRN",
                                   "E01CHMCCY",
                                   "E01CHMACC",
                                   "E01CHMACD",
                                   "E01CHMPRO",
                                   "E01CHMCUN",
                                   "E01CHMNA1",
                                   "E01CHMOFC",
                                   "E01DSCOFC",
                                   "E01CHMRQM",
                                   "E01CHMRQD",
                                   "E01CHMRQY",
                                   "E01CHMNCB",
                                   "E01CHMTCB",
                                   "E01CHMICK",
                                   "E01CHMFCK",
                                   "E01CHMNTC",
                                   "E01CHMDBR",
                                   "E01CHMDES",
                                   "E01CHMACT",
                                   "E01OPECDE"
                                 };
  final static String fid = "1180515145025";
  final static String rid = "3C73537CD3D6C";
  final static String fmtname = "ECH032001";
  final int FIELDCOUNT = 41;
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
  private CharacterField fieldE01SELBNK = null;
  private DecimalField fieldE01SELBRN = null;
  private CharacterField fieldE01SELOSTA = null;
  private CharacterField fieldE01SELFSTA = null;
  private DecimalField fieldE01SELIDM = null;
  private DecimalField fieldE01SELIDD = null;
  private DecimalField fieldE01SELIDY = null;
  private DecimalField fieldE01SELFDM = null;
  private DecimalField fieldE01SELFDD = null;
  private DecimalField fieldE01SELFDY = null;
  private CharacterField fieldE01CHMBNK = null;
  private DecimalField fieldE01CHMBRN = null;
  private CharacterField fieldE01CHMCCY = null;
  private DecimalField fieldE01CHMACC = null;
  private CharacterField fieldE01CHMACD = null;
  private CharacterField fieldE01CHMPRO = null;
  private DecimalField fieldE01CHMCUN = null;
  private CharacterField fieldE01CHMNA1 = null;
  private CharacterField fieldE01CHMOFC = null;
  private CharacterField fieldE01DSCOFC = null;
  private DecimalField fieldE01CHMRQM = null;
  private DecimalField fieldE01CHMRQD = null;
  private DecimalField fieldE01CHMRQY = null;
  private DecimalField fieldE01CHMNCB = null;
  private CharacterField fieldE01CHMTCB = null;
  private DecimalField fieldE01CHMICK = null;
  private DecimalField fieldE01CHMFCK = null;
  private DecimalField fieldE01CHMNTC = null;
  private DecimalField fieldE01CHMDBR = null;
  private DecimalField fieldE01CHMDES = null;
  private CharacterField fieldE01CHMACT = null;
  private CharacterField fieldE01OPECDE = null;

  /**
  * Constructor for ECH032001Message.
  */
  public ECH032001Message()
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
    recordsize = 303;
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
    fields[9] = fieldE01SELBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01SELBNK");
    fields[10] = fieldE01SELBRN =
    new DecimalField(message, HEADERSIZE + 44, 5, 0, "E01SELBRN");
    fields[11] = fieldE01SELOSTA =
    new CharacterField(message, HEADERSIZE + 49, 1, "E01SELOSTA");
    fields[12] = fieldE01SELFSTA =
    new CharacterField(message, HEADERSIZE + 50, 1, "E01SELFSTA");
    fields[13] = fieldE01SELIDM =
    new DecimalField(message, HEADERSIZE + 51, 3, 0, "E01SELIDM");
    fields[14] = fieldE01SELIDD =
    new DecimalField(message, HEADERSIZE + 54, 3, 0, "E01SELIDD");
    fields[15] = fieldE01SELIDY =
    new DecimalField(message, HEADERSIZE + 57, 5, 0, "E01SELIDY");
    fields[16] = fieldE01SELFDM =
    new DecimalField(message, HEADERSIZE + 62, 3, 0, "E01SELFDM");
    fields[17] = fieldE01SELFDD =
    new DecimalField(message, HEADERSIZE + 65, 3, 0, "E01SELFDD");
    fields[18] = fieldE01SELFDY =
    new DecimalField(message, HEADERSIZE + 68, 5, 0, "E01SELFDY");
    fields[19] = fieldE01CHMBNK =
    new CharacterField(message, HEADERSIZE + 73, 2, "E01CHMBNK");
    fields[20] = fieldE01CHMBRN =
    new DecimalField(message, HEADERSIZE + 75, 5, 0, "E01CHMBRN");
    fields[21] = fieldE01CHMCCY =
    new CharacterField(message, HEADERSIZE + 80, 3, "E01CHMCCY");
    fields[22] = fieldE01CHMACC =
    new DecimalField(message, HEADERSIZE + 83, 13, 0, "E01CHMACC");
    fields[23] = fieldE01CHMACD =
    new CharacterField(message, HEADERSIZE + 96, 2, "E01CHMACD");
    fields[24] = fieldE01CHMPRO =
    new CharacterField(message, HEADERSIZE + 98, 4, "E01CHMPRO");
    fields[25] = fieldE01CHMCUN =
    new DecimalField(message, HEADERSIZE + 102, 10, 0, "E01CHMCUN");
    fields[26] = fieldE01CHMNA1 =
    new CharacterField(message, HEADERSIZE + 112, 60, "E01CHMNA1");
    fields[27] = fieldE01CHMOFC =
    new CharacterField(message, HEADERSIZE + 172, 4, "E01CHMOFC");
    fields[28] = fieldE01DSCOFC =
    new CharacterField(message, HEADERSIZE + 176, 60, "E01DSCOFC");
    fields[29] = fieldE01CHMRQM =
    new DecimalField(message, HEADERSIZE + 236, 3, 0, "E01CHMRQM");
    fields[30] = fieldE01CHMRQD =
    new DecimalField(message, HEADERSIZE + 239, 3, 0, "E01CHMRQD");
    fields[31] = fieldE01CHMRQY =
    new DecimalField(message, HEADERSIZE + 242, 5, 0, "E01CHMRQY");
    fields[32] = fieldE01CHMNCB =
    new DecimalField(message, HEADERSIZE + 247, 13, 0, "E01CHMNCB");
    fields[33] = fieldE01CHMTCB =
    new CharacterField(message, HEADERSIZE + 260, 2, "E01CHMTCB");
    fields[34] = fieldE01CHMICK =
    new DecimalField(message, HEADERSIZE + 262, 12, 0, "E01CHMICK");
    fields[35] = fieldE01CHMFCK =
    new DecimalField(message, HEADERSIZE + 274, 12, 0, "E01CHMFCK");
    fields[36] = fieldE01CHMNTC =
    new DecimalField(message, HEADERSIZE + 286, 5, 0, "E01CHMNTC");
    fields[37] = fieldE01CHMDBR =
    new DecimalField(message, HEADERSIZE + 291, 5, 0, "E01CHMDBR");
    fields[38] = fieldE01CHMDES =
    new DecimalField(message, HEADERSIZE + 296, 5, 0, "E01CHMDES");
    fields[39] = fieldE01CHMACT =
    new CharacterField(message, HEADERSIZE + 301, 1, "E01CHMACT");
    fields[40] = fieldE01OPECDE =
    new CharacterField(message, HEADERSIZE + 302, 1, "E01OPECDE");

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
  * Set field E01SELBNK using a String value.
  */
  public void setE01SELBNK(String newvalue)
  {
    fieldE01SELBNK.setString(newvalue);
  }

  /**
  * Get value of field E01SELBNK as a String.
  */
  public String getE01SELBNK()
  {
    return fieldE01SELBNK.getString();
  }

  /**
  * Set field E01SELBRN using a String value.
  */
  public void setE01SELBRN(String newvalue)
  {
    fieldE01SELBRN.setString(newvalue);
  }

  /**
  * Get value of field E01SELBRN as a String.
  */
  public String getE01SELBRN()
  {
    return fieldE01SELBRN.getString();
  }

  /**
  * Set numeric field E01SELBRN using a BigDecimal value.
  */
  public void setE01SELBRN(BigDecimal newvalue)
  {
    fieldE01SELBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SELBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SELBRN()
  {
    return fieldE01SELBRN.getBigDecimal();
  }

  /**
  * Set field E01SELOSTA using a String value.
  */
  public void setE01SELOSTA(String newvalue)
  {
    fieldE01SELOSTA.setString(newvalue);
  }

  /**
  * Get value of field E01SELOSTA as a String.
  */
  public String getE01SELOSTA()
  {
    return fieldE01SELOSTA.getString();
  }

  /**
  * Set field E01SELFSTA using a String value.
  */
  public void setE01SELFSTA(String newvalue)
  {
    fieldE01SELFSTA.setString(newvalue);
  }

  /**
  * Get value of field E01SELFSTA as a String.
  */
  public String getE01SELFSTA()
  {
    return fieldE01SELFSTA.getString();
  }

  /**
  * Set field E01SELIDM using a String value.
  */
  public void setE01SELIDM(String newvalue)
  {
    fieldE01SELIDM.setString(newvalue);
  }

  /**
  * Get value of field E01SELIDM as a String.
  */
  public String getE01SELIDM()
  {
    return fieldE01SELIDM.getString();
  }

  /**
  * Set numeric field E01SELIDM using a BigDecimal value.
  */
  public void setE01SELIDM(BigDecimal newvalue)
  {
    fieldE01SELIDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SELIDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SELIDM()
  {
    return fieldE01SELIDM.getBigDecimal();
  }

  /**
  * Set field E01SELIDD using a String value.
  */
  public void setE01SELIDD(String newvalue)
  {
    fieldE01SELIDD.setString(newvalue);
  }

  /**
  * Get value of field E01SELIDD as a String.
  */
  public String getE01SELIDD()
  {
    return fieldE01SELIDD.getString();
  }

  /**
  * Set numeric field E01SELIDD using a BigDecimal value.
  */
  public void setE01SELIDD(BigDecimal newvalue)
  {
    fieldE01SELIDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SELIDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SELIDD()
  {
    return fieldE01SELIDD.getBigDecimal();
  }

  /**
  * Set field E01SELIDY using a String value.
  */
  public void setE01SELIDY(String newvalue)
  {
    fieldE01SELIDY.setString(newvalue);
  }

  /**
  * Get value of field E01SELIDY as a String.
  */
  public String getE01SELIDY()
  {
    return fieldE01SELIDY.getString();
  }

  /**
  * Set numeric field E01SELIDY using a BigDecimal value.
  */
  public void setE01SELIDY(BigDecimal newvalue)
  {
    fieldE01SELIDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SELIDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SELIDY()
  {
    return fieldE01SELIDY.getBigDecimal();
  }

  /**
  * Set field E01SELFDM using a String value.
  */
  public void setE01SELFDM(String newvalue)
  {
    fieldE01SELFDM.setString(newvalue);
  }

  /**
  * Get value of field E01SELFDM as a String.
  */
  public String getE01SELFDM()
  {
    return fieldE01SELFDM.getString();
  }

  /**
  * Set numeric field E01SELFDM using a BigDecimal value.
  */
  public void setE01SELFDM(BigDecimal newvalue)
  {
    fieldE01SELFDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SELFDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SELFDM()
  {
    return fieldE01SELFDM.getBigDecimal();
  }

  /**
  * Set field E01SELFDD using a String value.
  */
  public void setE01SELFDD(String newvalue)
  {
    fieldE01SELFDD.setString(newvalue);
  }

  /**
  * Get value of field E01SELFDD as a String.
  */
  public String getE01SELFDD()
  {
    return fieldE01SELFDD.getString();
  }

  /**
  * Set numeric field E01SELFDD using a BigDecimal value.
  */
  public void setE01SELFDD(BigDecimal newvalue)
  {
    fieldE01SELFDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SELFDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SELFDD()
  {
    return fieldE01SELFDD.getBigDecimal();
  }

  /**
  * Set field E01SELFDY using a String value.
  */
  public void setE01SELFDY(String newvalue)
  {
    fieldE01SELFDY.setString(newvalue);
  }

  /**
  * Get value of field E01SELFDY as a String.
  */
  public String getE01SELFDY()
  {
    return fieldE01SELFDY.getString();
  }

  /**
  * Set numeric field E01SELFDY using a BigDecimal value.
  */
  public void setE01SELFDY(BigDecimal newvalue)
  {
    fieldE01SELFDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SELFDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SELFDY()
  {
    return fieldE01SELFDY.getBigDecimal();
  }

  /**
  * Set field E01CHMBNK using a String value.
  */
  public void setE01CHMBNK(String newvalue)
  {
    fieldE01CHMBNK.setString(newvalue);
  }

  /**
  * Get value of field E01CHMBNK as a String.
  */
  public String getE01CHMBNK()
  {
    return fieldE01CHMBNK.getString();
  }

  /**
  * Set field E01CHMBRN using a String value.
  */
  public void setE01CHMBRN(String newvalue)
  {
    fieldE01CHMBRN.setString(newvalue);
  }

  /**
  * Get value of field E01CHMBRN as a String.
  */
  public String getE01CHMBRN()
  {
    return fieldE01CHMBRN.getString();
  }

  /**
  * Set numeric field E01CHMBRN using a BigDecimal value.
  */
  public void setE01CHMBRN(BigDecimal newvalue)
  {
    fieldE01CHMBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHMBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHMBRN()
  {
    return fieldE01CHMBRN.getBigDecimal();
  }

  /**
  * Set field E01CHMCCY using a String value.
  */
  public void setE01CHMCCY(String newvalue)
  {
    fieldE01CHMCCY.setString(newvalue);
  }

  /**
  * Get value of field E01CHMCCY as a String.
  */
  public String getE01CHMCCY()
  {
    return fieldE01CHMCCY.getString();
  }

  /**
  * Set field E01CHMACC using a String value.
  */
  public void setE01CHMACC(String newvalue)
  {
    fieldE01CHMACC.setString(newvalue);
  }

  /**
  * Get value of field E01CHMACC as a String.
  */
  public String getE01CHMACC()
  {
    return fieldE01CHMACC.getString();
  }

  /**
  * Set numeric field E01CHMACC using a BigDecimal value.
  */
  public void setE01CHMACC(BigDecimal newvalue)
  {
    fieldE01CHMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHMACC()
  {
    return fieldE01CHMACC.getBigDecimal();
  }

  /**
  * Set field E01CHMACD using a String value.
  */
  public void setE01CHMACD(String newvalue)
  {
    fieldE01CHMACD.setString(newvalue);
  }

  /**
  * Get value of field E01CHMACD as a String.
  */
  public String getE01CHMACD()
  {
    return fieldE01CHMACD.getString();
  }

  /**
  * Set field E01CHMPRO using a String value.
  */
  public void setE01CHMPRO(String newvalue)
  {
    fieldE01CHMPRO.setString(newvalue);
  }

  /**
  * Get value of field E01CHMPRO as a String.
  */
  public String getE01CHMPRO()
  {
    return fieldE01CHMPRO.getString();
  }

  /**
  * Set field E01CHMCUN using a String value.
  */
  public void setE01CHMCUN(String newvalue)
  {
    fieldE01CHMCUN.setString(newvalue);
  }

  /**
  * Get value of field E01CHMCUN as a String.
  */
  public String getE01CHMCUN()
  {
    return fieldE01CHMCUN.getString();
  }

  /**
  * Set numeric field E01CHMCUN using a BigDecimal value.
  */
  public void setE01CHMCUN(BigDecimal newvalue)
  {
    fieldE01CHMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHMCUN()
  {
    return fieldE01CHMCUN.getBigDecimal();
  }

  /**
  * Set field E01CHMNA1 using a String value.
  */
  public void setE01CHMNA1(String newvalue)
  {
    fieldE01CHMNA1.setString(newvalue);
  }

  /**
  * Get value of field E01CHMNA1 as a String.
  */
  public String getE01CHMNA1()
  {
    return fieldE01CHMNA1.getString();
  }

  /**
  * Set field E01CHMOFC using a String value.
  */
  public void setE01CHMOFC(String newvalue)
  {
    fieldE01CHMOFC.setString(newvalue);
  }

  /**
  * Get value of field E01CHMOFC as a String.
  */
  public String getE01CHMOFC()
  {
    return fieldE01CHMOFC.getString();
  }

  /**
  * Set field E01DSCOFC using a String value.
  */
  public void setE01DSCOFC(String newvalue)
  {
    fieldE01DSCOFC.setString(newvalue);
  }

  /**
  * Get value of field E01DSCOFC as a String.
  */
  public String getE01DSCOFC()
  {
    return fieldE01DSCOFC.getString();
  }

  /**
  * Set field E01CHMRQM using a String value.
  */
  public void setE01CHMRQM(String newvalue)
  {
    fieldE01CHMRQM.setString(newvalue);
  }

  /**
  * Get value of field E01CHMRQM as a String.
  */
  public String getE01CHMRQM()
  {
    return fieldE01CHMRQM.getString();
  }

  /**
  * Set numeric field E01CHMRQM using a BigDecimal value.
  */
  public void setE01CHMRQM(BigDecimal newvalue)
  {
    fieldE01CHMRQM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHMRQM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHMRQM()
  {
    return fieldE01CHMRQM.getBigDecimal();
  }

  /**
  * Set field E01CHMRQD using a String value.
  */
  public void setE01CHMRQD(String newvalue)
  {
    fieldE01CHMRQD.setString(newvalue);
  }

  /**
  * Get value of field E01CHMRQD as a String.
  */
  public String getE01CHMRQD()
  {
    return fieldE01CHMRQD.getString();
  }

  /**
  * Set numeric field E01CHMRQD using a BigDecimal value.
  */
  public void setE01CHMRQD(BigDecimal newvalue)
  {
    fieldE01CHMRQD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHMRQD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHMRQD()
  {
    return fieldE01CHMRQD.getBigDecimal();
  }

  /**
  * Set field E01CHMRQY using a String value.
  */
  public void setE01CHMRQY(String newvalue)
  {
    fieldE01CHMRQY.setString(newvalue);
  }

  /**
  * Get value of field E01CHMRQY as a String.
  */
  public String getE01CHMRQY()
  {
    return fieldE01CHMRQY.getString();
  }

  /**
  * Set numeric field E01CHMRQY using a BigDecimal value.
  */
  public void setE01CHMRQY(BigDecimal newvalue)
  {
    fieldE01CHMRQY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHMRQY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHMRQY()
  {
    return fieldE01CHMRQY.getBigDecimal();
  }

  /**
  * Set field E01CHMNCB using a String value.
  */
  public void setE01CHMNCB(String newvalue)
  {
    fieldE01CHMNCB.setString(newvalue);
  }

  /**
  * Get value of field E01CHMNCB as a String.
  */
  public String getE01CHMNCB()
  {
    return fieldE01CHMNCB.getString();
  }

  /**
  * Set numeric field E01CHMNCB using a BigDecimal value.
  */
  public void setE01CHMNCB(BigDecimal newvalue)
  {
    fieldE01CHMNCB.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHMNCB as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHMNCB()
  {
    return fieldE01CHMNCB.getBigDecimal();
  }

  /**
  * Set field E01CHMTCB using a String value.
  */
  public void setE01CHMTCB(String newvalue)
  {
    fieldE01CHMTCB.setString(newvalue);
  }

  /**
  * Get value of field E01CHMTCB as a String.
  */
  public String getE01CHMTCB()
  {
    return fieldE01CHMTCB.getString();
  }

  /**
  * Set field E01CHMICK using a String value.
  */
  public void setE01CHMICK(String newvalue)
  {
    fieldE01CHMICK.setString(newvalue);
  }

  /**
  * Get value of field E01CHMICK as a String.
  */
  public String getE01CHMICK()
  {
    return fieldE01CHMICK.getString();
  }

  /**
  * Set numeric field E01CHMICK using a BigDecimal value.
  */
  public void setE01CHMICK(BigDecimal newvalue)
  {
    fieldE01CHMICK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHMICK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHMICK()
  {
    return fieldE01CHMICK.getBigDecimal();
  }

  /**
  * Set field E01CHMFCK using a String value.
  */
  public void setE01CHMFCK(String newvalue)
  {
    fieldE01CHMFCK.setString(newvalue);
  }

  /**
  * Get value of field E01CHMFCK as a String.
  */
  public String getE01CHMFCK()
  {
    return fieldE01CHMFCK.getString();
  }

  /**
  * Set numeric field E01CHMFCK using a BigDecimal value.
  */
  public void setE01CHMFCK(BigDecimal newvalue)
  {
    fieldE01CHMFCK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHMFCK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHMFCK()
  {
    return fieldE01CHMFCK.getBigDecimal();
  }

  /**
  * Set field E01CHMNTC using a String value.
  */
  public void setE01CHMNTC(String newvalue)
  {
    fieldE01CHMNTC.setString(newvalue);
  }

  /**
  * Get value of field E01CHMNTC as a String.
  */
  public String getE01CHMNTC()
  {
    return fieldE01CHMNTC.getString();
  }

  /**
  * Set numeric field E01CHMNTC using a BigDecimal value.
  */
  public void setE01CHMNTC(BigDecimal newvalue)
  {
    fieldE01CHMNTC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHMNTC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHMNTC()
  {
    return fieldE01CHMNTC.getBigDecimal();
  }

  /**
  * Set field E01CHMDBR using a String value.
  */
  public void setE01CHMDBR(String newvalue)
  {
    fieldE01CHMDBR.setString(newvalue);
  }

  /**
  * Get value of field E01CHMDBR as a String.
  */
  public String getE01CHMDBR()
  {
    return fieldE01CHMDBR.getString();
  }

  /**
  * Set numeric field E01CHMDBR using a BigDecimal value.
  */
  public void setE01CHMDBR(BigDecimal newvalue)
  {
    fieldE01CHMDBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHMDBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHMDBR()
  {
    return fieldE01CHMDBR.getBigDecimal();
  }

  /**
  * Set field E01CHMDES using a String value.
  */
  public void setE01CHMDES(String newvalue)
  {
    fieldE01CHMDES.setString(newvalue);
  }

  /**
  * Get value of field E01CHMDES as a String.
  */
  public String getE01CHMDES()
  {
    return fieldE01CHMDES.getString();
  }

  /**
  * Set numeric field E01CHMDES using a BigDecimal value.
  */
  public void setE01CHMDES(BigDecimal newvalue)
  {
    fieldE01CHMDES.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHMDES as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHMDES()
  {
    return fieldE01CHMDES.getBigDecimal();
  }

  /**
  * Set field E01CHMACT using a String value.
  */
  public void setE01CHMACT(String newvalue)
  {
    fieldE01CHMACT.setString(newvalue);
  }

  /**
  * Get value of field E01CHMACT as a String.
  */
  public String getE01CHMACT()
  {
    return fieldE01CHMACT.getString();
  }

  /**
  * Set field E01OPECDE using a String value.
  */
  public void setE01OPECDE(String newvalue)
  {
    fieldE01OPECDE.setString(newvalue);
  }

  /**
  * Get value of field E01OPECDE as a String.
  */
  public String getE01OPECDE()
  {
    return fieldE01OPECDE.getString();
  }

}
