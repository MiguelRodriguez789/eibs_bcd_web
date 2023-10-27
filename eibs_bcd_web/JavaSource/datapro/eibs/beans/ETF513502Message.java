package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ETF513502 physical file definition.
* 
* File level identifier is 1130611113409.
* Record format level identifier is 48CCE341F2DD6.
*/

public class ETF513502Message extends MessageRecord
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
                                     "H02CANALV",
                                     "H02MODEAC",
                                     "E02ERRC01",
                                     "E02ERRC02",
                                     "E02ERRC03",
                                     "E02ERRC04",
                                     "E02ERRC05",
                                     "E02ERRD01",
                                     "E02ERRD02",
                                     "E02ERRD03",
                                     "E02ERRD04",
                                     "E02ERRD05",
                                     "E02DEAACC",
                                     "E02DEABRN",
                                     "E02DEAREB",
                                     "E02DEARPR",
                                     "E02DEARPC",
                                     "E02DEARGL",
                                     "E02DEANAR",
                                     "E02DEATCD"
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
                                   "H02CANALV",
                                   "H02MODEAC",
                                   "E02ERRC01",
                                   "E02ERRC02",
                                   "E02ERRC03",
                                   "E02ERRC04",
                                   "E02ERRC05",
                                   "E02ERRD01",
                                   "E02ERRD02",
                                   "E02ERRD03",
                                   "E02ERRD04",
                                   "E02ERRD05",
                                   "E02DEAACC",
                                   "E02DEABRN",
                                   "E02DEAREB",
                                   "E02DEARPR",
                                   "E02DEARPC",
                                   "E02DEARGL",
                                   "E02DEANAR",
                                   "E02DEATCD"
                                 };
  final static String fid = "1130611113409";
  final static String rid = "48CCE341F2DD6";
  final static String fmtname = "ETF513502";
  final int FIELDCOUNT = 29;
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
  private CharacterField fieldH02CANALV = null;
  private CharacterField fieldH02MODEAC = null;
  private DecimalField fieldE02ERRC01 = null;
  private DecimalField fieldE02ERRC02 = null;
  private DecimalField fieldE02ERRC03 = null;
  private DecimalField fieldE02ERRC04 = null;
  private DecimalField fieldE02ERRC05 = null;
  private CharacterField fieldE02ERRD01 = null;
  private CharacterField fieldE02ERRD02 = null;
  private CharacterField fieldE02ERRD03 = null;
  private CharacterField fieldE02ERRD04 = null;
  private CharacterField fieldE02ERRD05 = null;
  private DecimalField fieldE02DEAACC = null;
  private DecimalField fieldE02DEABRN = null;
  private CharacterField fieldE02DEAREB = null;
  private DecimalField fieldE02DEARPR = null;
  private CharacterField fieldE02DEARPC = null;
  private DecimalField fieldE02DEARGL = null;
  private CharacterField fieldE02DEANAR = null;
  private CharacterField fieldE02DEATCD = null;

  /**
  * Constructor for ETF513502Message.
  */
  public ETF513502Message()
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
    recordsize = 431;
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
    fields[9] = fieldH02CANALV =
    new CharacterField(message, HEADERSIZE + 42, 4, "H02CANALV");
    fields[10] = fieldH02MODEAC =
    new CharacterField(message, HEADERSIZE + 46, 1, "H02MODEAC");
    fields[11] = fieldE02ERRC01 =
    new DecimalField(message, HEADERSIZE + 47, 5, 0, "E02ERRC01");
    fields[12] = fieldE02ERRC02 =
    new DecimalField(message, HEADERSIZE + 52, 5, 0, "E02ERRC02");
    fields[13] = fieldE02ERRC03 =
    new DecimalField(message, HEADERSIZE + 57, 5, 0, "E02ERRC03");
    fields[14] = fieldE02ERRC04 =
    new DecimalField(message, HEADERSIZE + 62, 5, 0, "E02ERRC04");
    fields[15] = fieldE02ERRC05 =
    new DecimalField(message, HEADERSIZE + 67, 5, 0, "E02ERRC05");
    fields[16] = fieldE02ERRD01 =
    new CharacterField(message, HEADERSIZE + 72, 50, "E02ERRD01");
    fields[17] = fieldE02ERRD02 =
    new CharacterField(message, HEADERSIZE + 122, 50, "E02ERRD02");
    fields[18] = fieldE02ERRD03 =
    new CharacterField(message, HEADERSIZE + 172, 50, "E02ERRD03");
    fields[19] = fieldE02ERRD04 =
    new CharacterField(message, HEADERSIZE + 222, 50, "E02ERRD04");
    fields[20] = fieldE02ERRD05 =
    new CharacterField(message, HEADERSIZE + 272, 50, "E02ERRD05");
    fields[21] = fieldE02DEAACC =
    new DecimalField(message, HEADERSIZE + 322, 13, 0, "E02DEAACC");
    fields[22] = fieldE02DEABRN =
    new DecimalField(message, HEADERSIZE + 335, 5, 0, "E02DEABRN");
    fields[23] = fieldE02DEAREB =
    new CharacterField(message, HEADERSIZE + 340, 2, "E02DEAREB");
    fields[24] = fieldE02DEARPR =
    new DecimalField(message, HEADERSIZE + 342, 5, 0, "E02DEARPR");
    fields[25] = fieldE02DEARPC =
    new CharacterField(message, HEADERSIZE + 347, 3, "E02DEARPC");
    fields[26] = fieldE02DEARGL =
    new DecimalField(message, HEADERSIZE + 350, 17, 0, "E02DEARGL");
    fields[27] = fieldE02DEANAR =
    new CharacterField(message, HEADERSIZE + 367, 60, "E02DEANAR");
    fields[28] = fieldE02DEATCD =
    new CharacterField(message, HEADERSIZE + 427, 4, "E02DEATCD");

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
  * Set field H02CANALV using a String value.
  */
  public void setH02CANALV(String newvalue)
  {
    fieldH02CANALV.setString(newvalue);
  }

  /**
  * Get value of field H02CANALV as a String.
  */
  public String getH02CANALV()
  {
    return fieldH02CANALV.getString();
  }

  /**
  * Set field H02MODEAC using a String value.
  */
  public void setH02MODEAC(String newvalue)
  {
    fieldH02MODEAC.setString(newvalue);
  }

  /**
  * Get value of field H02MODEAC as a String.
  */
  public String getH02MODEAC()
  {
    return fieldH02MODEAC.getString();
  }

  /**
  * Set field E02ERRC01 using a String value.
  */
  public void setE02ERRC01(String newvalue)
  {
    fieldE02ERRC01.setString(newvalue);
  }

  /**
  * Get value of field E02ERRC01 as a String.
  */
  public String getE02ERRC01()
  {
    return fieldE02ERRC01.getString();
  }

  /**
  * Set numeric field E02ERRC01 using a BigDecimal value.
  */
  public void setE02ERRC01(BigDecimal newvalue)
  {
    fieldE02ERRC01.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ERRC01 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ERRC01()
  {
    return fieldE02ERRC01.getBigDecimal();
  }

  /**
  * Set field E02ERRC02 using a String value.
  */
  public void setE02ERRC02(String newvalue)
  {
    fieldE02ERRC02.setString(newvalue);
  }

  /**
  * Get value of field E02ERRC02 as a String.
  */
  public String getE02ERRC02()
  {
    return fieldE02ERRC02.getString();
  }

  /**
  * Set numeric field E02ERRC02 using a BigDecimal value.
  */
  public void setE02ERRC02(BigDecimal newvalue)
  {
    fieldE02ERRC02.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ERRC02 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ERRC02()
  {
    return fieldE02ERRC02.getBigDecimal();
  }

  /**
  * Set field E02ERRC03 using a String value.
  */
  public void setE02ERRC03(String newvalue)
  {
    fieldE02ERRC03.setString(newvalue);
  }

  /**
  * Get value of field E02ERRC03 as a String.
  */
  public String getE02ERRC03()
  {
    return fieldE02ERRC03.getString();
  }

  /**
  * Set numeric field E02ERRC03 using a BigDecimal value.
  */
  public void setE02ERRC03(BigDecimal newvalue)
  {
    fieldE02ERRC03.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ERRC03 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ERRC03()
  {
    return fieldE02ERRC03.getBigDecimal();
  }

  /**
  * Set field E02ERRC04 using a String value.
  */
  public void setE02ERRC04(String newvalue)
  {
    fieldE02ERRC04.setString(newvalue);
  }

  /**
  * Get value of field E02ERRC04 as a String.
  */
  public String getE02ERRC04()
  {
    return fieldE02ERRC04.getString();
  }

  /**
  * Set numeric field E02ERRC04 using a BigDecimal value.
  */
  public void setE02ERRC04(BigDecimal newvalue)
  {
    fieldE02ERRC04.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ERRC04 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ERRC04()
  {
    return fieldE02ERRC04.getBigDecimal();
  }

  /**
  * Set field E02ERRC05 using a String value.
  */
  public void setE02ERRC05(String newvalue)
  {
    fieldE02ERRC05.setString(newvalue);
  }

  /**
  * Get value of field E02ERRC05 as a String.
  */
  public String getE02ERRC05()
  {
    return fieldE02ERRC05.getString();
  }

  /**
  * Set numeric field E02ERRC05 using a BigDecimal value.
  */
  public void setE02ERRC05(BigDecimal newvalue)
  {
    fieldE02ERRC05.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ERRC05 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ERRC05()
  {
    return fieldE02ERRC05.getBigDecimal();
  }

  /**
  * Set field E02ERRD01 using a String value.
  */
  public void setE02ERRD01(String newvalue)
  {
    fieldE02ERRD01.setString(newvalue);
  }

  /**
  * Get value of field E02ERRD01 as a String.
  */
  public String getE02ERRD01()
  {
    return fieldE02ERRD01.getString();
  }

  /**
  * Set field E02ERRD02 using a String value.
  */
  public void setE02ERRD02(String newvalue)
  {
    fieldE02ERRD02.setString(newvalue);
  }

  /**
  * Get value of field E02ERRD02 as a String.
  */
  public String getE02ERRD02()
  {
    return fieldE02ERRD02.getString();
  }

  /**
  * Set field E02ERRD03 using a String value.
  */
  public void setE02ERRD03(String newvalue)
  {
    fieldE02ERRD03.setString(newvalue);
  }

  /**
  * Get value of field E02ERRD03 as a String.
  */
  public String getE02ERRD03()
  {
    return fieldE02ERRD03.getString();
  }

  /**
  * Set field E02ERRD04 using a String value.
  */
  public void setE02ERRD04(String newvalue)
  {
    fieldE02ERRD04.setString(newvalue);
  }

  /**
  * Get value of field E02ERRD04 as a String.
  */
  public String getE02ERRD04()
  {
    return fieldE02ERRD04.getString();
  }

  /**
  * Set field E02ERRD05 using a String value.
  */
  public void setE02ERRD05(String newvalue)
  {
    fieldE02ERRD05.setString(newvalue);
  }

  /**
  * Get value of field E02ERRD05 as a String.
  */
  public String getE02ERRD05()
  {
    return fieldE02ERRD05.getString();
  }

  /**
  * Set field E02DEAACC using a String value.
  */
  public void setE02DEAACC(String newvalue)
  {
    fieldE02DEAACC.setString(newvalue);
  }

  /**
  * Get value of field E02DEAACC as a String.
  */
  public String getE02DEAACC()
  {
    return fieldE02DEAACC.getString();
  }

  /**
  * Set numeric field E02DEAACC using a BigDecimal value.
  */
  public void setE02DEAACC(BigDecimal newvalue)
  {
    fieldE02DEAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DEAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DEAACC()
  {
    return fieldE02DEAACC.getBigDecimal();
  }

  /**
  * Set field E02DEABRN using a String value.
  */
  public void setE02DEABRN(String newvalue)
  {
    fieldE02DEABRN.setString(newvalue);
  }

  /**
  * Get value of field E02DEABRN as a String.
  */
  public String getE02DEABRN()
  {
    return fieldE02DEABRN.getString();
  }

  /**
  * Set numeric field E02DEABRN using a BigDecimal value.
  */
  public void setE02DEABRN(BigDecimal newvalue)
  {
    fieldE02DEABRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DEABRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DEABRN()
  {
    return fieldE02DEABRN.getBigDecimal();
  }

  /**
  * Set field E02DEAREB using a String value.
  */
  public void setE02DEAREB(String newvalue)
  {
    fieldE02DEAREB.setString(newvalue);
  }

  /**
  * Get value of field E02DEAREB as a String.
  */
  public String getE02DEAREB()
  {
    return fieldE02DEAREB.getString();
  }

  /**
  * Set field E02DEARPR using a String value.
  */
  public void setE02DEARPR(String newvalue)
  {
    fieldE02DEARPR.setString(newvalue);
  }

  /**
  * Get value of field E02DEARPR as a String.
  */
  public String getE02DEARPR()
  {
    return fieldE02DEARPR.getString();
  }

  /**
  * Set numeric field E02DEARPR using a BigDecimal value.
  */
  public void setE02DEARPR(BigDecimal newvalue)
  {
    fieldE02DEARPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DEARPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DEARPR()
  {
    return fieldE02DEARPR.getBigDecimal();
  }

  /**
  * Set field E02DEARPC using a String value.
  */
  public void setE02DEARPC(String newvalue)
  {
    fieldE02DEARPC.setString(newvalue);
  }

  /**
  * Get value of field E02DEARPC as a String.
  */
  public String getE02DEARPC()
  {
    return fieldE02DEARPC.getString();
  }

  /**
  * Set field E02DEARGL using a String value.
  */
  public void setE02DEARGL(String newvalue)
  {
    fieldE02DEARGL.setString(newvalue);
  }

  /**
  * Get value of field E02DEARGL as a String.
  */
  public String getE02DEARGL()
  {
    return fieldE02DEARGL.getString();
  }

  /**
  * Set numeric field E02DEARGL using a BigDecimal value.
  */
  public void setE02DEARGL(BigDecimal newvalue)
  {
    fieldE02DEARGL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DEARGL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DEARGL()
  {
    return fieldE02DEARGL.getBigDecimal();
  }

  /**
  * Set field E02DEANAR using a String value.
  */
  public void setE02DEANAR(String newvalue)
  {
    fieldE02DEANAR.setString(newvalue);
  }

  /**
  * Get value of field E02DEANAR as a String.
  */
  public String getE02DEANAR()
  {
    return fieldE02DEANAR.getString();
  }

  /**
  * Set field E02DEATCD using a String value.
  */
  public void setE02DEATCD(String newvalue)
  {
    fieldE02DEATCD.setString(newvalue);
  }

  /**
  * Get value of field E02DEATCD as a String.
  */
  public String getE02DEATCD()
  {
    return fieldE02DEATCD.getString();
  }

}
