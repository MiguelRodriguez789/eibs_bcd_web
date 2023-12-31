package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV030001 physical file definition.
* 
* File level identifier is 1141126163540.
* Record format level identifier is 3E04E41F422D3.
*/

public class EPV030001Message extends MessageRecord
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
                                     "E01UNCBNK",
                                     "E01UNCBRN",
                                     "E01UNCACC",
                                     "E01UNCFLG",
                                     "E01UNCAMN",
                                     "E01UNCCKN",
                                     "E01UNCF02",
                                     "E01UNCDYS",
                                     "E01UNCRDM",
                                     "E01UNCRDD",
                                     "E01UNCRDY",
                                     "E01UNCMDM",
                                     "E01UNCMDD",
                                     "E01UNCMDY",
                                     "E01UNCCUN",
                                     "E01UNCRSN",
                                     "E01UNCSTA",
                                     "E01UNCCON",
                                     "E01UNCTEL",
                                     "E01UNCTSQ",
                                     "E01UNCKBK",
                                     "E01UNCKBR",
                                     "E01UNCKAC",
                                     "E01UNCDES",
                                     "E01UNCCRM",
                                     "E01UNCOBR",
                                     "E01UNCHTY",
                                     "E01UNCNRM",
                                     "E01UNCUSR",
                                     "E01UNCFUS",
                                     "E01UNCNA1",
                                     "E01UNCACD",
                                     "E01UNCCCY",
                                     "E01UNCPRO",
                                     "E01DSCPRO",
                                     "E01UNCCNV",
                                     "E01DSCCNV",
                                     "E01FRMDTM",
                                     "E01FRMDTD",
                                     "E01FRMDTY",
                                     "E01TODTEM",
                                     "E01TODTED",
                                     "E01TODTEY",
                                     "E01NUMREC"
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
                                   "E01UNCBNK",
                                   "E01UNCBRN",
                                   "E01UNCACC",
                                   "E01UNCFLG",
                                   "E01UNCAMN",
                                   "E01UNCCKN",
                                   "E01UNCF02",
                                   "E01UNCDYS",
                                   "E01UNCRDM",
                                   "E01UNCRDD",
                                   "E01UNCRDY",
                                   "E01UNCMDM",
                                   "E01UNCMDD",
                                   "E01UNCMDY",
                                   "E01UNCCUN",
                                   "E01UNCRSN",
                                   "E01UNCSTA",
                                   "E01UNCCON",
                                   "E01UNCTEL",
                                   "E01UNCTSQ",
                                   "E01UNCKBK",
                                   "E01UNCKBR",
                                   "E01UNCKAC",
                                   "E01UNCDES",
                                   "E01UNCCRM",
                                   "E01UNCOBR",
                                   "E01UNCHTY",
                                   "E01UNCNRM",
                                   "E01UNCUSR",
                                   "E01UNCFUS",
                                   "E01UNCNA1",
                                   "E01UNCACD",
                                   "E01UNCCCY",
                                   "E01UNCPRO",
                                   "E01DSCPRO",
                                   "E01UNCCNV",
                                   "E01DSCCNV",
                                   "E01FRMDTM",
                                   "E01FRMDTD",
                                   "E01FRMDTY",
                                   "E01TODTEM",
                                   "E01TODTED",
                                   "E01TODTEY",
                                   "E01NUMREC"
                                 };
  final static String fid = "1141126163540";
  final static String rid = "3E04E41F422D3";
  final static String fmtname = "EPV030001";
  final int FIELDCOUNT = 53;
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
  private CharacterField fieldE01UNCBNK = null;
  private DecimalField fieldE01UNCBRN = null;
  private DecimalField fieldE01UNCACC = null;
  private CharacterField fieldE01UNCFLG = null;
  private DecimalField fieldE01UNCAMN = null;
  private DecimalField fieldE01UNCCKN = null;
  private CharacterField fieldE01UNCF02 = null;
  private DecimalField fieldE01UNCDYS = null;
  private DecimalField fieldE01UNCRDM = null;
  private DecimalField fieldE01UNCRDD = null;
  private DecimalField fieldE01UNCRDY = null;
  private DecimalField fieldE01UNCMDM = null;
  private DecimalField fieldE01UNCMDD = null;
  private DecimalField fieldE01UNCMDY = null;
  private DecimalField fieldE01UNCCUN = null;
  private CharacterField fieldE01UNCRSN = null;
  private CharacterField fieldE01UNCSTA = null;
  private CharacterField fieldE01UNCCON = null;
  private CharacterField fieldE01UNCTEL = null;
  private DecimalField fieldE01UNCTSQ = null;
  private CharacterField fieldE01UNCKBK = null;
  private CharacterField fieldE01UNCKBR = null;
  private CharacterField fieldE01UNCKAC = null;
  private CharacterField fieldE01UNCDES = null;
  private CharacterField fieldE01UNCCRM = null;
  private DecimalField fieldE01UNCOBR = null;
  private CharacterField fieldE01UNCHTY = null;
  private DecimalField fieldE01UNCNRM = null;
  private CharacterField fieldE01UNCUSR = null;
  private CharacterField fieldE01UNCFUS = null;
  private CharacterField fieldE01UNCNA1 = null;
  private CharacterField fieldE01UNCACD = null;
  private CharacterField fieldE01UNCCCY = null;
  private CharacterField fieldE01UNCPRO = null;
  private CharacterField fieldE01DSCPRO = null;
  private CharacterField fieldE01UNCCNV = null;
  private CharacterField fieldE01DSCCNV = null;
  private DecimalField fieldE01FRMDTM = null;
  private DecimalField fieldE01FRMDTD = null;
  private DecimalField fieldE01FRMDTY = null;
  private DecimalField fieldE01TODTEM = null;
  private DecimalField fieldE01TODTED = null;
  private DecimalField fieldE01TODTEY = null;
  private DecimalField fieldE01NUMREC = null;

  /**
  * Constructor for EPV030001Message.
  */
  public EPV030001Message()
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
    recordsize = 473;
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
    fields[9] = fieldE01UNCBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01UNCBNK");
    fields[10] = fieldE01UNCBRN =
    new DecimalField(message, HEADERSIZE + 44, 5, 0, "E01UNCBRN");
    fields[11] = fieldE01UNCACC =
    new DecimalField(message, HEADERSIZE + 49, 13, 0, "E01UNCACC");
    fields[12] = fieldE01UNCFLG =
    new CharacterField(message, HEADERSIZE + 62, 1, "E01UNCFLG");
    fields[13] = fieldE01UNCAMN =
    new DecimalField(message, HEADERSIZE + 63, 17, 2, "E01UNCAMN");
    fields[14] = fieldE01UNCCKN =
    new DecimalField(message, HEADERSIZE + 80, 12, 0, "E01UNCCKN");
    fields[15] = fieldE01UNCF02 =
    new CharacterField(message, HEADERSIZE + 92, 1, "E01UNCF02");
    fields[16] = fieldE01UNCDYS =
    new DecimalField(message, HEADERSIZE + 93, 6, 0, "E01UNCDYS");
    fields[17] = fieldE01UNCRDM =
    new DecimalField(message, HEADERSIZE + 99, 3, 0, "E01UNCRDM");
    fields[18] = fieldE01UNCRDD =
    new DecimalField(message, HEADERSIZE + 102, 3, 0, "E01UNCRDD");
    fields[19] = fieldE01UNCRDY =
    new DecimalField(message, HEADERSIZE + 105, 5, 0, "E01UNCRDY");
    fields[20] = fieldE01UNCMDM =
    new DecimalField(message, HEADERSIZE + 110, 3, 0, "E01UNCMDM");
    fields[21] = fieldE01UNCMDD =
    new DecimalField(message, HEADERSIZE + 113, 3, 0, "E01UNCMDD");
    fields[22] = fieldE01UNCMDY =
    new DecimalField(message, HEADERSIZE + 116, 5, 0, "E01UNCMDY");
    fields[23] = fieldE01UNCCUN =
    new DecimalField(message, HEADERSIZE + 121, 10, 0, "E01UNCCUN");
    fields[24] = fieldE01UNCRSN =
    new CharacterField(message, HEADERSIZE + 131, 60, "E01UNCRSN");
    fields[25] = fieldE01UNCSTA =
    new CharacterField(message, HEADERSIZE + 191, 1, "E01UNCSTA");
    fields[26] = fieldE01UNCCON =
    new CharacterField(message, HEADERSIZE + 192, 4, "E01UNCCON");
    fields[27] = fieldE01UNCTEL =
    new CharacterField(message, HEADERSIZE + 196, 10, "E01UNCTEL");
    fields[28] = fieldE01UNCTSQ =
    new DecimalField(message, HEADERSIZE + 206, 8, 0, "E01UNCTSQ");
    fields[29] = fieldE01UNCKBK =
    new CharacterField(message, HEADERSIZE + 214, 4, "E01UNCKBK");
    fields[30] = fieldE01UNCKBR =
    new CharacterField(message, HEADERSIZE + 218, 4, "E01UNCKBR");
    fields[31] = fieldE01UNCKAC =
    new CharacterField(message, HEADERSIZE + 222, 25, "E01UNCKAC");
    fields[32] = fieldE01UNCDES =
    new CharacterField(message, HEADERSIZE + 247, 5, "E01UNCDES");
    fields[33] = fieldE01UNCCRM =
    new CharacterField(message, HEADERSIZE + 252, 3, "E01UNCCRM");
    fields[34] = fieldE01UNCOBR =
    new DecimalField(message, HEADERSIZE + 255, 5, 0, "E01UNCOBR");
    fields[35] = fieldE01UNCHTY =
    new CharacterField(message, HEADERSIZE + 260, 4, "E01UNCHTY");
    fields[36] = fieldE01UNCNRM =
    new DecimalField(message, HEADERSIZE + 264, 13, 0, "E01UNCNRM");
    fields[37] = fieldE01UNCUSR =
    new CharacterField(message, HEADERSIZE + 277, 4, "E01UNCUSR");
    fields[38] = fieldE01UNCFUS =
    new CharacterField(message, HEADERSIZE + 281, 1, "E01UNCFUS");
    fields[39] = fieldE01UNCNA1 =
    new CharacterField(message, HEADERSIZE + 282, 60, "E01UNCNA1");
    fields[40] = fieldE01UNCACD =
    new CharacterField(message, HEADERSIZE + 342, 2, "E01UNCACD");
    fields[41] = fieldE01UNCCCY =
    new CharacterField(message, HEADERSIZE + 344, 3, "E01UNCCCY");
    fields[42] = fieldE01UNCPRO =
    new CharacterField(message, HEADERSIZE + 347, 4, "E01UNCPRO");
    fields[43] = fieldE01DSCPRO =
    new CharacterField(message, HEADERSIZE + 351, 45, "E01DSCPRO");
    fields[44] = fieldE01UNCCNV =
    new CharacterField(message, HEADERSIZE + 396, 4, "E01UNCCNV");
    fields[45] = fieldE01DSCCNV =
    new CharacterField(message, HEADERSIZE + 400, 45, "E01DSCCNV");
    fields[46] = fieldE01FRMDTM =
    new DecimalField(message, HEADERSIZE + 445, 3, 0, "E01FRMDTM");
    fields[47] = fieldE01FRMDTD =
    new DecimalField(message, HEADERSIZE + 448, 3, 0, "E01FRMDTD");
    fields[48] = fieldE01FRMDTY =
    new DecimalField(message, HEADERSIZE + 451, 5, 0, "E01FRMDTY");
    fields[49] = fieldE01TODTEM =
    new DecimalField(message, HEADERSIZE + 456, 3, 0, "E01TODTEM");
    fields[50] = fieldE01TODTED =
    new DecimalField(message, HEADERSIZE + 459, 3, 0, "E01TODTED");
    fields[51] = fieldE01TODTEY =
    new DecimalField(message, HEADERSIZE + 462, 5, 0, "E01TODTEY");
    fields[52] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 467, 6, 0, "E01NUMREC");

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
  * Set field E01UNCBNK using a String value.
  */
  public void setE01UNCBNK(String newvalue)
  {
    fieldE01UNCBNK.setString(newvalue);
  }

  /**
  * Get value of field E01UNCBNK as a String.
  */
  public String getE01UNCBNK()
  {
    return fieldE01UNCBNK.getString();
  }

  /**
  * Set field E01UNCBRN using a String value.
  */
  public void setE01UNCBRN(String newvalue)
  {
    fieldE01UNCBRN.setString(newvalue);
  }

  /**
  * Get value of field E01UNCBRN as a String.
  */
  public String getE01UNCBRN()
  {
    return fieldE01UNCBRN.getString();
  }

  /**
  * Set numeric field E01UNCBRN using a BigDecimal value.
  */
  public void setE01UNCBRN(BigDecimal newvalue)
  {
    fieldE01UNCBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCBRN()
  {
    return fieldE01UNCBRN.getBigDecimal();
  }

  /**
  * Set field E01UNCACC using a String value.
  */
  public void setE01UNCACC(String newvalue)
  {
    fieldE01UNCACC.setString(newvalue);
  }

  /**
  * Get value of field E01UNCACC as a String.
  */
  public String getE01UNCACC()
  {
    return fieldE01UNCACC.getString();
  }

  /**
  * Set numeric field E01UNCACC using a BigDecimal value.
  */
  public void setE01UNCACC(BigDecimal newvalue)
  {
    fieldE01UNCACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCACC()
  {
    return fieldE01UNCACC.getBigDecimal();
  }

  /**
  * Set field E01UNCFLG using a String value.
  */
  public void setE01UNCFLG(String newvalue)
  {
    fieldE01UNCFLG.setString(newvalue);
  }

  /**
  * Get value of field E01UNCFLG as a String.
  */
  public String getE01UNCFLG()
  {
    return fieldE01UNCFLG.getString();
  }

  /**
  * Set field E01UNCAMN using a String value.
  */
  public void setE01UNCAMN(String newvalue)
  {
    fieldE01UNCAMN.setString(newvalue);
  }

  /**
  * Get value of field E01UNCAMN as a String.
  */
  public String getE01UNCAMN()
  {
    return fieldE01UNCAMN.getString();
  }

  /**
  * Set numeric field E01UNCAMN using a BigDecimal value.
  */
  public void setE01UNCAMN(BigDecimal newvalue)
  {
    fieldE01UNCAMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCAMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCAMN()
  {
    return fieldE01UNCAMN.getBigDecimal();
  }

  /**
  * Set field E01UNCCKN using a String value.
  */
  public void setE01UNCCKN(String newvalue)
  {
    fieldE01UNCCKN.setString(newvalue);
  }

  /**
  * Get value of field E01UNCCKN as a String.
  */
  public String getE01UNCCKN()
  {
    return fieldE01UNCCKN.getString();
  }

  /**
  * Set numeric field E01UNCCKN using a BigDecimal value.
  */
  public void setE01UNCCKN(BigDecimal newvalue)
  {
    fieldE01UNCCKN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCCKN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCCKN()
  {
    return fieldE01UNCCKN.getBigDecimal();
  }

  /**
  * Set field E01UNCF02 using a String value.
  */
  public void setE01UNCF02(String newvalue)
  {
    fieldE01UNCF02.setString(newvalue);
  }

  /**
  * Get value of field E01UNCF02 as a String.
  */
  public String getE01UNCF02()
  {
    return fieldE01UNCF02.getString();
  }

  /**
  * Set field E01UNCDYS using a String value.
  */
  public void setE01UNCDYS(String newvalue)
  {
    fieldE01UNCDYS.setString(newvalue);
  }

  /**
  * Get value of field E01UNCDYS as a String.
  */
  public String getE01UNCDYS()
  {
    return fieldE01UNCDYS.getString();
  }

  /**
  * Set numeric field E01UNCDYS using a BigDecimal value.
  */
  public void setE01UNCDYS(BigDecimal newvalue)
  {
    fieldE01UNCDYS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCDYS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCDYS()
  {
    return fieldE01UNCDYS.getBigDecimal();
  }

  /**
  * Set field E01UNCRDM using a String value.
  */
  public void setE01UNCRDM(String newvalue)
  {
    fieldE01UNCRDM.setString(newvalue);
  }

  /**
  * Get value of field E01UNCRDM as a String.
  */
  public String getE01UNCRDM()
  {
    return fieldE01UNCRDM.getString();
  }

  /**
  * Set numeric field E01UNCRDM using a BigDecimal value.
  */
  public void setE01UNCRDM(BigDecimal newvalue)
  {
    fieldE01UNCRDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCRDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCRDM()
  {
    return fieldE01UNCRDM.getBigDecimal();
  }

  /**
  * Set field E01UNCRDD using a String value.
  */
  public void setE01UNCRDD(String newvalue)
  {
    fieldE01UNCRDD.setString(newvalue);
  }

  /**
  * Get value of field E01UNCRDD as a String.
  */
  public String getE01UNCRDD()
  {
    return fieldE01UNCRDD.getString();
  }

  /**
  * Set numeric field E01UNCRDD using a BigDecimal value.
  */
  public void setE01UNCRDD(BigDecimal newvalue)
  {
    fieldE01UNCRDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCRDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCRDD()
  {
    return fieldE01UNCRDD.getBigDecimal();
  }

  /**
  * Set field E01UNCRDY using a String value.
  */
  public void setE01UNCRDY(String newvalue)
  {
    fieldE01UNCRDY.setString(newvalue);
  }

  /**
  * Get value of field E01UNCRDY as a String.
  */
  public String getE01UNCRDY()
  {
    return fieldE01UNCRDY.getString();
  }

  /**
  * Set numeric field E01UNCRDY using a BigDecimal value.
  */
  public void setE01UNCRDY(BigDecimal newvalue)
  {
    fieldE01UNCRDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCRDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCRDY()
  {
    return fieldE01UNCRDY.getBigDecimal();
  }

  /**
  * Set field E01UNCMDM using a String value.
  */
  public void setE01UNCMDM(String newvalue)
  {
    fieldE01UNCMDM.setString(newvalue);
  }

  /**
  * Get value of field E01UNCMDM as a String.
  */
  public String getE01UNCMDM()
  {
    return fieldE01UNCMDM.getString();
  }

  /**
  * Set numeric field E01UNCMDM using a BigDecimal value.
  */
  public void setE01UNCMDM(BigDecimal newvalue)
  {
    fieldE01UNCMDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCMDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCMDM()
  {
    return fieldE01UNCMDM.getBigDecimal();
  }

  /**
  * Set field E01UNCMDD using a String value.
  */
  public void setE01UNCMDD(String newvalue)
  {
    fieldE01UNCMDD.setString(newvalue);
  }

  /**
  * Get value of field E01UNCMDD as a String.
  */
  public String getE01UNCMDD()
  {
    return fieldE01UNCMDD.getString();
  }

  /**
  * Set numeric field E01UNCMDD using a BigDecimal value.
  */
  public void setE01UNCMDD(BigDecimal newvalue)
  {
    fieldE01UNCMDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCMDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCMDD()
  {
    return fieldE01UNCMDD.getBigDecimal();
  }

  /**
  * Set field E01UNCMDY using a String value.
  */
  public void setE01UNCMDY(String newvalue)
  {
    fieldE01UNCMDY.setString(newvalue);
  }

  /**
  * Get value of field E01UNCMDY as a String.
  */
  public String getE01UNCMDY()
  {
    return fieldE01UNCMDY.getString();
  }

  /**
  * Set numeric field E01UNCMDY using a BigDecimal value.
  */
  public void setE01UNCMDY(BigDecimal newvalue)
  {
    fieldE01UNCMDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCMDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCMDY()
  {
    return fieldE01UNCMDY.getBigDecimal();
  }

  /**
  * Set field E01UNCCUN using a String value.
  */
  public void setE01UNCCUN(String newvalue)
  {
    fieldE01UNCCUN.setString(newvalue);
  }

  /**
  * Get value of field E01UNCCUN as a String.
  */
  public String getE01UNCCUN()
  {
    return fieldE01UNCCUN.getString();
  }

  /**
  * Set numeric field E01UNCCUN using a BigDecimal value.
  */
  public void setE01UNCCUN(BigDecimal newvalue)
  {
    fieldE01UNCCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCCUN()
  {
    return fieldE01UNCCUN.getBigDecimal();
  }

  /**
  * Set field E01UNCRSN using a String value.
  */
  public void setE01UNCRSN(String newvalue)
  {
    fieldE01UNCRSN.setString(newvalue);
  }

  /**
  * Get value of field E01UNCRSN as a String.
  */
  public String getE01UNCRSN()
  {
    return fieldE01UNCRSN.getString();
  }

  /**
  * Set field E01UNCSTA using a String value.
  */
  public void setE01UNCSTA(String newvalue)
  {
    fieldE01UNCSTA.setString(newvalue);
  }

  /**
  * Get value of field E01UNCSTA as a String.
  */
  public String getE01UNCSTA()
  {
    return fieldE01UNCSTA.getString();
  }

  /**
  * Set field E01UNCCON using a String value.
  */
  public void setE01UNCCON(String newvalue)
  {
    fieldE01UNCCON.setString(newvalue);
  }

  /**
  * Get value of field E01UNCCON as a String.
  */
  public String getE01UNCCON()
  {
    return fieldE01UNCCON.getString();
  }

  /**
  * Set field E01UNCTEL using a String value.
  */
  public void setE01UNCTEL(String newvalue)
  {
    fieldE01UNCTEL.setString(newvalue);
  }

  /**
  * Get value of field E01UNCTEL as a String.
  */
  public String getE01UNCTEL()
  {
    return fieldE01UNCTEL.getString();
  }

  /**
  * Set field E01UNCTSQ using a String value.
  */
  public void setE01UNCTSQ(String newvalue)
  {
    fieldE01UNCTSQ.setString(newvalue);
  }

  /**
  * Get value of field E01UNCTSQ as a String.
  */
  public String getE01UNCTSQ()
  {
    return fieldE01UNCTSQ.getString();
  }

  /**
  * Set numeric field E01UNCTSQ using a BigDecimal value.
  */
  public void setE01UNCTSQ(BigDecimal newvalue)
  {
    fieldE01UNCTSQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCTSQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCTSQ()
  {
    return fieldE01UNCTSQ.getBigDecimal();
  }

  /**
  * Set field E01UNCKBK using a String value.
  */
  public void setE01UNCKBK(String newvalue)
  {
    fieldE01UNCKBK.setString(newvalue);
  }

  /**
  * Get value of field E01UNCKBK as a String.
  */
  public String getE01UNCKBK()
  {
    return fieldE01UNCKBK.getString();
  }

  /**
  * Set field E01UNCKBR using a String value.
  */
  public void setE01UNCKBR(String newvalue)
  {
    fieldE01UNCKBR.setString(newvalue);
  }

  /**
  * Get value of field E01UNCKBR as a String.
  */
  public String getE01UNCKBR()
  {
    return fieldE01UNCKBR.getString();
  }

  /**
  * Set field E01UNCKAC using a String value.
  */
  public void setE01UNCKAC(String newvalue)
  {
    fieldE01UNCKAC.setString(newvalue);
  }

  /**
  * Get value of field E01UNCKAC as a String.
  */
  public String getE01UNCKAC()
  {
    return fieldE01UNCKAC.getString();
  }

  /**
  * Set field E01UNCDES using a String value.
  */
  public void setE01UNCDES(String newvalue)
  {
    fieldE01UNCDES.setString(newvalue);
  }

  /**
  * Get value of field E01UNCDES as a String.
  */
  public String getE01UNCDES()
  {
    return fieldE01UNCDES.getString();
  }

  /**
  * Set field E01UNCCRM using a String value.
  */
  public void setE01UNCCRM(String newvalue)
  {
    fieldE01UNCCRM.setString(newvalue);
  }

  /**
  * Get value of field E01UNCCRM as a String.
  */
  public String getE01UNCCRM()
  {
    return fieldE01UNCCRM.getString();
  }

  /**
  * Set field E01UNCOBR using a String value.
  */
  public void setE01UNCOBR(String newvalue)
  {
    fieldE01UNCOBR.setString(newvalue);
  }

  /**
  * Get value of field E01UNCOBR as a String.
  */
  public String getE01UNCOBR()
  {
    return fieldE01UNCOBR.getString();
  }

  /**
  * Set numeric field E01UNCOBR using a BigDecimal value.
  */
  public void setE01UNCOBR(BigDecimal newvalue)
  {
    fieldE01UNCOBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCOBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCOBR()
  {
    return fieldE01UNCOBR.getBigDecimal();
  }

  /**
  * Set field E01UNCHTY using a String value.
  */
  public void setE01UNCHTY(String newvalue)
  {
    fieldE01UNCHTY.setString(newvalue);
  }

  /**
  * Get value of field E01UNCHTY as a String.
  */
  public String getE01UNCHTY()
  {
    return fieldE01UNCHTY.getString();
  }

  /**
  * Set field E01UNCNRM using a String value.
  */
  public void setE01UNCNRM(String newvalue)
  {
    fieldE01UNCNRM.setString(newvalue);
  }

  /**
  * Get value of field E01UNCNRM as a String.
  */
  public String getE01UNCNRM()
  {
    return fieldE01UNCNRM.getString();
  }

  /**
  * Set numeric field E01UNCNRM using a BigDecimal value.
  */
  public void setE01UNCNRM(BigDecimal newvalue)
  {
    fieldE01UNCNRM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01UNCNRM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01UNCNRM()
  {
    return fieldE01UNCNRM.getBigDecimal();
  }

  /**
  * Set field E01UNCUSR using a String value.
  */
  public void setE01UNCUSR(String newvalue)
  {
    fieldE01UNCUSR.setString(newvalue);
  }

  /**
  * Get value of field E01UNCUSR as a String.
  */
  public String getE01UNCUSR()
  {
    return fieldE01UNCUSR.getString();
  }

  /**
  * Set field E01UNCFUS using a String value.
  */
  public void setE01UNCFUS(String newvalue)
  {
    fieldE01UNCFUS.setString(newvalue);
  }

  /**
  * Get value of field E01UNCFUS as a String.
  */
  public String getE01UNCFUS()
  {
    return fieldE01UNCFUS.getString();
  }

  /**
  * Set field E01UNCNA1 using a String value.
  */
  public void setE01UNCNA1(String newvalue)
  {
    fieldE01UNCNA1.setString(newvalue);
  }

  /**
  * Get value of field E01UNCNA1 as a String.
  */
  public String getE01UNCNA1()
  {
    return fieldE01UNCNA1.getString();
  }

  /**
  * Set field E01UNCACD using a String value.
  */
  public void setE01UNCACD(String newvalue)
  {
    fieldE01UNCACD.setString(newvalue);
  }

  /**
  * Get value of field E01UNCACD as a String.
  */
  public String getE01UNCACD()
  {
    return fieldE01UNCACD.getString();
  }

  /**
  * Set field E01UNCCCY using a String value.
  */
  public void setE01UNCCCY(String newvalue)
  {
    fieldE01UNCCCY.setString(newvalue);
  }

  /**
  * Get value of field E01UNCCCY as a String.
  */
  public String getE01UNCCCY()
  {
    return fieldE01UNCCCY.getString();
  }

  /**
  * Set field E01UNCPRO using a String value.
  */
  public void setE01UNCPRO(String newvalue)
  {
    fieldE01UNCPRO.setString(newvalue);
  }

  /**
  * Get value of field E01UNCPRO as a String.
  */
  public String getE01UNCPRO()
  {
    return fieldE01UNCPRO.getString();
  }

  /**
  * Set field E01DSCPRO using a String value.
  */
  public void setE01DSCPRO(String newvalue)
  {
    fieldE01DSCPRO.setString(newvalue);
  }

  /**
  * Get value of field E01DSCPRO as a String.
  */
  public String getE01DSCPRO()
  {
    return fieldE01DSCPRO.getString();
  }

  /**
  * Set field E01UNCCNV using a String value.
  */
  public void setE01UNCCNV(String newvalue)
  {
    fieldE01UNCCNV.setString(newvalue);
  }

  /**
  * Get value of field E01UNCCNV as a String.
  */
  public String getE01UNCCNV()
  {
    return fieldE01UNCCNV.getString();
  }

  /**
  * Set field E01DSCCNV using a String value.
  */
  public void setE01DSCCNV(String newvalue)
  {
    fieldE01DSCCNV.setString(newvalue);
  }

  /**
  * Get value of field E01DSCCNV as a String.
  */
  public String getE01DSCCNV()
  {
    return fieldE01DSCCNV.getString();
  }

  /**
  * Set field E01FRMDTM using a String value.
  */
  public void setE01FRMDTM(String newvalue)
  {
    fieldE01FRMDTM.setString(newvalue);
  }

  /**
  * Get value of field E01FRMDTM as a String.
  */
  public String getE01FRMDTM()
  {
    return fieldE01FRMDTM.getString();
  }

  /**
  * Set numeric field E01FRMDTM using a BigDecimal value.
  */
  public void setE01FRMDTM(BigDecimal newvalue)
  {
    fieldE01FRMDTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FRMDTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FRMDTM()
  {
    return fieldE01FRMDTM.getBigDecimal();
  }

  /**
  * Set field E01FRMDTD using a String value.
  */
  public void setE01FRMDTD(String newvalue)
  {
    fieldE01FRMDTD.setString(newvalue);
  }

  /**
  * Get value of field E01FRMDTD as a String.
  */
  public String getE01FRMDTD()
  {
    return fieldE01FRMDTD.getString();
  }

  /**
  * Set numeric field E01FRMDTD using a BigDecimal value.
  */
  public void setE01FRMDTD(BigDecimal newvalue)
  {
    fieldE01FRMDTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FRMDTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FRMDTD()
  {
    return fieldE01FRMDTD.getBigDecimal();
  }

  /**
  * Set field E01FRMDTY using a String value.
  */
  public void setE01FRMDTY(String newvalue)
  {
    fieldE01FRMDTY.setString(newvalue);
  }

  /**
  * Get value of field E01FRMDTY as a String.
  */
  public String getE01FRMDTY()
  {
    return fieldE01FRMDTY.getString();
  }

  /**
  * Set numeric field E01FRMDTY using a BigDecimal value.
  */
  public void setE01FRMDTY(BigDecimal newvalue)
  {
    fieldE01FRMDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FRMDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FRMDTY()
  {
    return fieldE01FRMDTY.getBigDecimal();
  }

  /**
  * Set field E01TODTEM using a String value.
  */
  public void setE01TODTEM(String newvalue)
  {
    fieldE01TODTEM.setString(newvalue);
  }

  /**
  * Get value of field E01TODTEM as a String.
  */
  public String getE01TODTEM()
  {
    return fieldE01TODTEM.getString();
  }

  /**
  * Set numeric field E01TODTEM using a BigDecimal value.
  */
  public void setE01TODTEM(BigDecimal newvalue)
  {
    fieldE01TODTEM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TODTEM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TODTEM()
  {
    return fieldE01TODTEM.getBigDecimal();
  }

  /**
  * Set field E01TODTED using a String value.
  */
  public void setE01TODTED(String newvalue)
  {
    fieldE01TODTED.setString(newvalue);
  }

  /**
  * Get value of field E01TODTED as a String.
  */
  public String getE01TODTED()
  {
    return fieldE01TODTED.getString();
  }

  /**
  * Set numeric field E01TODTED using a BigDecimal value.
  */
  public void setE01TODTED(BigDecimal newvalue)
  {
    fieldE01TODTED.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TODTED as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TODTED()
  {
    return fieldE01TODTED.getBigDecimal();
  }

  /**
  * Set field E01TODTEY using a String value.
  */
  public void setE01TODTEY(String newvalue)
  {
    fieldE01TODTEY.setString(newvalue);
  }

  /**
  * Get value of field E01TODTEY as a String.
  */
  public String getE01TODTEY()
  {
    return fieldE01TODTEY.getString();
  }

  /**
  * Set numeric field E01TODTEY using a BigDecimal value.
  */
  public void setE01TODTEY(BigDecimal newvalue)
  {
    fieldE01TODTEY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TODTEY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TODTEY()
  {
    return fieldE01TODTEY.getBigDecimal();
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

}
