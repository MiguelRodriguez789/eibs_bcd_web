package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ETF501001 physical file definition.
* 
* File level identifier is 1130611113409.
* Record format level identifier is 532EF896C0CD7.
*/

public class ETF501001Message extends MessageRecord
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
                                     "H01CANALV",
                                     "H01MODEAC",
                                     "E01ERRC01",
                                     "E01ERRC02",
                                     "E01ERRC03",
                                     "E01ERRC04",
                                     "E01ERRC05",
                                     "E01ERRD01",
                                     "E01ERRD02",
                                     "E01ERRD03",
                                     "E01ERRD04",
                                     "E01ERRD05",
                                     "E01TRFORI",
                                     "E01TRFDST",
                                     "E01TRFSOB",
                                     "E01TRFEXC",
                                     "E01TRFAMT"
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
                                   "H01CANALV",
                                   "H01MODEAC",
                                   "E01ERRC01",
                                   "E01ERRC02",
                                   "E01ERRC03",
                                   "E01ERRC04",
                                   "E01ERRC05",
                                   "E01ERRD01",
                                   "E01ERRD02",
                                   "E01ERRD03",
                                   "E01ERRD04",
                                   "E01ERRD05",
                                   "E01TRFORI",
                                   "E01TRFDST",
                                   "E01TRFSOB",
                                   "E01TRFEXC",
                                   "E01TRFAMT"
                                 };
  final static String fid = "1130611113409";
  final static String rid = "532EF896C0CD7";
  final static String fmtname = "ETF501001";
  final int FIELDCOUNT = 26;
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
  private CharacterField fieldH01CANALV = null;
  private CharacterField fieldH01MODEAC = null;
  private DecimalField fieldE01ERRC01 = null;
  private DecimalField fieldE01ERRC02 = null;
  private DecimalField fieldE01ERRC03 = null;
  private DecimalField fieldE01ERRC04 = null;
  private DecimalField fieldE01ERRC05 = null;
  private CharacterField fieldE01ERRD01 = null;
  private CharacterField fieldE01ERRD02 = null;
  private CharacterField fieldE01ERRD03 = null;
  private CharacterField fieldE01ERRD04 = null;
  private CharacterField fieldE01ERRD05 = null;
  private DecimalField fieldE01TRFORI = null;
  private DecimalField fieldE01TRFDST = null;
  private CharacterField fieldE01TRFSOB = null;
  private CharacterField fieldE01TRFEXC = null;
  private DecimalField fieldE01TRFAMT = null;

  /**
  * Constructor for ETF501001Message.
  */
  public ETF501001Message()
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
    recordsize = 367;
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
    fields[9] = fieldH01CANALV =
    new CharacterField(message, HEADERSIZE + 42, 4, "H01CANALV");
    fields[10] = fieldH01MODEAC =
    new CharacterField(message, HEADERSIZE + 46, 1, "H01MODEAC");
    fields[11] = fieldE01ERRC01 =
    new DecimalField(message, HEADERSIZE + 47, 5, 0, "E01ERRC01");
    fields[12] = fieldE01ERRC02 =
    new DecimalField(message, HEADERSIZE + 52, 5, 0, "E01ERRC02");
    fields[13] = fieldE01ERRC03 =
    new DecimalField(message, HEADERSIZE + 57, 5, 0, "E01ERRC03");
    fields[14] = fieldE01ERRC04 =
    new DecimalField(message, HEADERSIZE + 62, 5, 0, "E01ERRC04");
    fields[15] = fieldE01ERRC05 =
    new DecimalField(message, HEADERSIZE + 67, 5, 0, "E01ERRC05");
    fields[16] = fieldE01ERRD01 =
    new CharacterField(message, HEADERSIZE + 72, 50, "E01ERRD01");
    fields[17] = fieldE01ERRD02 =
    new CharacterField(message, HEADERSIZE + 122, 50, "E01ERRD02");
    fields[18] = fieldE01ERRD03 =
    new CharacterField(message, HEADERSIZE + 172, 50, "E01ERRD03");
    fields[19] = fieldE01ERRD04 =
    new CharacterField(message, HEADERSIZE + 222, 50, "E01ERRD04");
    fields[20] = fieldE01ERRD05 =
    new CharacterField(message, HEADERSIZE + 272, 50, "E01ERRD05");
    fields[21] = fieldE01TRFORI =
    new DecimalField(message, HEADERSIZE + 322, 13, 0, "E01TRFORI");
    fields[22] = fieldE01TRFDST =
    new DecimalField(message, HEADERSIZE + 335, 13, 0, "E01TRFDST");
    fields[23] = fieldE01TRFSOB =
    new CharacterField(message, HEADERSIZE + 348, 1, "E01TRFSOB");
    fields[24] = fieldE01TRFEXC =
    new CharacterField(message, HEADERSIZE + 349, 1, "E01TRFEXC");
    fields[25] = fieldE01TRFAMT =
    new DecimalField(message, HEADERSIZE + 350, 17, 2, "E01TRFAMT");

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
  * Set field H01CANALV using a String value.
  */
  public void setH01CANALV(String newvalue)
  {
    fieldH01CANALV.setString(newvalue);
  }

  /**
  * Get value of field H01CANALV as a String.
  */
  public String getH01CANALV()
  {
    return fieldH01CANALV.getString();
  }

  /**
  * Set field H01MODEAC using a String value.
  */
  public void setH01MODEAC(String newvalue)
  {
    fieldH01MODEAC.setString(newvalue);
  }

  /**
  * Get value of field H01MODEAC as a String.
  */
  public String getH01MODEAC()
  {
    return fieldH01MODEAC.getString();
  }

  /**
  * Set field E01ERRC01 using a String value.
  */
  public void setE01ERRC01(String newvalue)
  {
    fieldE01ERRC01.setString(newvalue);
  }

  /**
  * Get value of field E01ERRC01 as a String.
  */
  public String getE01ERRC01()
  {
    return fieldE01ERRC01.getString();
  }

  /**
  * Set numeric field E01ERRC01 using a BigDecimal value.
  */
  public void setE01ERRC01(BigDecimal newvalue)
  {
    fieldE01ERRC01.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ERRC01 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ERRC01()
  {
    return fieldE01ERRC01.getBigDecimal();
  }

  /**
  * Set field E01ERRC02 using a String value.
  */
  public void setE01ERRC02(String newvalue)
  {
    fieldE01ERRC02.setString(newvalue);
  }

  /**
  * Get value of field E01ERRC02 as a String.
  */
  public String getE01ERRC02()
  {
    return fieldE01ERRC02.getString();
  }

  /**
  * Set numeric field E01ERRC02 using a BigDecimal value.
  */
  public void setE01ERRC02(BigDecimal newvalue)
  {
    fieldE01ERRC02.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ERRC02 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ERRC02()
  {
    return fieldE01ERRC02.getBigDecimal();
  }

  /**
  * Set field E01ERRC03 using a String value.
  */
  public void setE01ERRC03(String newvalue)
  {
    fieldE01ERRC03.setString(newvalue);
  }

  /**
  * Get value of field E01ERRC03 as a String.
  */
  public String getE01ERRC03()
  {
    return fieldE01ERRC03.getString();
  }

  /**
  * Set numeric field E01ERRC03 using a BigDecimal value.
  */
  public void setE01ERRC03(BigDecimal newvalue)
  {
    fieldE01ERRC03.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ERRC03 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ERRC03()
  {
    return fieldE01ERRC03.getBigDecimal();
  }

  /**
  * Set field E01ERRC04 using a String value.
  */
  public void setE01ERRC04(String newvalue)
  {
    fieldE01ERRC04.setString(newvalue);
  }

  /**
  * Get value of field E01ERRC04 as a String.
  */
  public String getE01ERRC04()
  {
    return fieldE01ERRC04.getString();
  }

  /**
  * Set numeric field E01ERRC04 using a BigDecimal value.
  */
  public void setE01ERRC04(BigDecimal newvalue)
  {
    fieldE01ERRC04.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ERRC04 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ERRC04()
  {
    return fieldE01ERRC04.getBigDecimal();
  }

  /**
  * Set field E01ERRC05 using a String value.
  */
  public void setE01ERRC05(String newvalue)
  {
    fieldE01ERRC05.setString(newvalue);
  }

  /**
  * Get value of field E01ERRC05 as a String.
  */
  public String getE01ERRC05()
  {
    return fieldE01ERRC05.getString();
  }

  /**
  * Set numeric field E01ERRC05 using a BigDecimal value.
  */
  public void setE01ERRC05(BigDecimal newvalue)
  {
    fieldE01ERRC05.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ERRC05 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ERRC05()
  {
    return fieldE01ERRC05.getBigDecimal();
  }

  /**
  * Set field E01ERRD01 using a String value.
  */
  public void setE01ERRD01(String newvalue)
  {
    fieldE01ERRD01.setString(newvalue);
  }

  /**
  * Get value of field E01ERRD01 as a String.
  */
  public String getE01ERRD01()
  {
    return fieldE01ERRD01.getString();
  }

  /**
  * Set field E01ERRD02 using a String value.
  */
  public void setE01ERRD02(String newvalue)
  {
    fieldE01ERRD02.setString(newvalue);
  }

  /**
  * Get value of field E01ERRD02 as a String.
  */
  public String getE01ERRD02()
  {
    return fieldE01ERRD02.getString();
  }

  /**
  * Set field E01ERRD03 using a String value.
  */
  public void setE01ERRD03(String newvalue)
  {
    fieldE01ERRD03.setString(newvalue);
  }

  /**
  * Get value of field E01ERRD03 as a String.
  */
  public String getE01ERRD03()
  {
    return fieldE01ERRD03.getString();
  }

  /**
  * Set field E01ERRD04 using a String value.
  */
  public void setE01ERRD04(String newvalue)
  {
    fieldE01ERRD04.setString(newvalue);
  }

  /**
  * Get value of field E01ERRD04 as a String.
  */
  public String getE01ERRD04()
  {
    return fieldE01ERRD04.getString();
  }

  /**
  * Set field E01ERRD05 using a String value.
  */
  public void setE01ERRD05(String newvalue)
  {
    fieldE01ERRD05.setString(newvalue);
  }

  /**
  * Get value of field E01ERRD05 as a String.
  */
  public String getE01ERRD05()
  {
    return fieldE01ERRD05.getString();
  }

  /**
  * Set field E01TRFORI using a String value.
  */
  public void setE01TRFORI(String newvalue)
  {
    fieldE01TRFORI.setString(newvalue);
  }

  /**
  * Get value of field E01TRFORI as a String.
  */
  public String getE01TRFORI()
  {
    return fieldE01TRFORI.getString();
  }

  /**
  * Set numeric field E01TRFORI using a BigDecimal value.
  */
  public void setE01TRFORI(BigDecimal newvalue)
  {
    fieldE01TRFORI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRFORI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRFORI()
  {
    return fieldE01TRFORI.getBigDecimal();
  }

  /**
  * Set field E01TRFDST using a String value.
  */
  public void setE01TRFDST(String newvalue)
  {
    fieldE01TRFDST.setString(newvalue);
  }

  /**
  * Get value of field E01TRFDST as a String.
  */
  public String getE01TRFDST()
  {
    return fieldE01TRFDST.getString();
  }

  /**
  * Set numeric field E01TRFDST using a BigDecimal value.
  */
  public void setE01TRFDST(BigDecimal newvalue)
  {
    fieldE01TRFDST.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRFDST as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRFDST()
  {
    return fieldE01TRFDST.getBigDecimal();
  }

  /**
  * Set field E01TRFSOB using a String value.
  */
  public void setE01TRFSOB(String newvalue)
  {
    fieldE01TRFSOB.setString(newvalue);
  }

  /**
  * Get value of field E01TRFSOB as a String.
  */
  public String getE01TRFSOB()
  {
    return fieldE01TRFSOB.getString();
  }

  /**
  * Set field E01TRFEXC using a String value.
  */
  public void setE01TRFEXC(String newvalue)
  {
    fieldE01TRFEXC.setString(newvalue);
  }

  /**
  * Get value of field E01TRFEXC as a String.
  */
  public String getE01TRFEXC()
  {
    return fieldE01TRFEXC.getString();
  }

  /**
  * Set field E01TRFAMT using a String value.
  */
  public void setE01TRFAMT(String newvalue)
  {
    fieldE01TRFAMT.setString(newvalue);
  }

  /**
  * Get value of field E01TRFAMT as a String.
  */
  public String getE01TRFAMT()
  {
    return fieldE01TRFAMT.getString();
  }

  /**
  * Set numeric field E01TRFAMT using a BigDecimal value.
  */
  public void setE01TRFAMT(BigDecimal newvalue)
  {
    fieldE01TRFAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRFAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRFAMT()
  {
    return fieldE01TRFAMT.getBigDecimal();
  }

}
