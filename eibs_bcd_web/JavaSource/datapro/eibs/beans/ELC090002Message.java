package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ELC090002 physical file definition.
* 
* File level identifier is 1130611113219.
* Record format level identifier is 37187D25F2E45.
*/

public class ELC090002Message extends MessageRecord
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
                                     "E02LCYBNK",
                                     "E02LCYACD",
                                     "E02LCYTYP",
                                     "E02SCHDTY",
                                     "E02TYPDSC",
                                     "E02LCYBDY",
                                     "E02LCYBDM",
                                     "E02LCYBDD",
                                     "E02COMAM1",
                                     "E02COMAM2",
                                     "E02COMAM3",
                                     "E02COMAM4",
                                     "E02COMAM5",
                                     "E02COMAM6",
                                     "E02COMAM7",
                                     "E02COMAM8",
                                     "E02COMAM9",
                                     "E02COMA10",
                                     "E02COMA11",
                                     "E02COMA12",
                                     "E02COMDS1",
                                     "E02COMDS2",
                                     "E02COMDS3",
                                     "E02COMDS4",
                                     "E02COMDS5",
                                     "E02COMDS6",
                                     "E02COMDS7",
                                     "E02COMDS8",
                                     "E02COMDS9",
                                     "E02COMD10",
                                     "E02COMD11",
                                     "E02COMD12"
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
                                   "E02LCYBNK",
                                   "E02LCYACD",
                                   "E02LCYTYP",
                                   "E02SCHDTY",
                                   "E02TYPDSC",
                                   "E02LCYBDY",
                                   "E02LCYBDM",
                                   "E02LCYBDD",
                                   "E02COMAM1",
                                   "E02COMAM2",
                                   "E02COMAM3",
                                   "E02COMAM4",
                                   "E02COMAM5",
                                   "E02COMAM6",
                                   "E02COMAM7",
                                   "E02COMAM8",
                                   "E02COMAM9",
                                   "E02COMA10",
                                   "E02COMA11",
                                   "E02COMA12",
                                   "E02COMDS1",
                                   "E02COMDS2",
                                   "E02COMDS3",
                                   "E02COMDS4",
                                   "E02COMDS5",
                                   "E02COMDS6",
                                   "E02COMDS7",
                                   "E02COMDS8",
                                   "E02COMDS9",
                                   "E02COMD10",
                                   "E02COMD11",
                                   "E02COMD12"
                                 };
  final static String fid = "1130611113219";
  final static String rid = "37187D25F2E45";
  final static String fmtname = "ELC090002";
  final int FIELDCOUNT = 41;
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
  private CharacterField fieldE02LCYBNK = null;
  private CharacterField fieldE02LCYACD = null;
  private CharacterField fieldE02LCYTYP = null;
  private DecimalField fieldE02SCHDTY = null;
  private CharacterField fieldE02TYPDSC = null;
  private DecimalField fieldE02LCYBDY = null;
  private DecimalField fieldE02LCYBDM = null;
  private DecimalField fieldE02LCYBDD = null;
  private DecimalField fieldE02COMAM1 = null;
  private DecimalField fieldE02COMAM2 = null;
  private DecimalField fieldE02COMAM3 = null;
  private DecimalField fieldE02COMAM4 = null;
  private DecimalField fieldE02COMAM5 = null;
  private DecimalField fieldE02COMAM6 = null;
  private DecimalField fieldE02COMAM7 = null;
  private DecimalField fieldE02COMAM8 = null;
  private DecimalField fieldE02COMAM9 = null;
  private DecimalField fieldE02COMA10 = null;
  private DecimalField fieldE02COMA11 = null;
  private DecimalField fieldE02COMA12 = null;
  private CharacterField fieldE02COMDS1 = null;
  private CharacterField fieldE02COMDS2 = null;
  private CharacterField fieldE02COMDS3 = null;
  private CharacterField fieldE02COMDS4 = null;
  private CharacterField fieldE02COMDS5 = null;
  private CharacterField fieldE02COMDS6 = null;
  private CharacterField fieldE02COMDS7 = null;
  private CharacterField fieldE02COMDS8 = null;
  private CharacterField fieldE02COMDS9 = null;
  private CharacterField fieldE02COMD10 = null;
  private CharacterField fieldE02COMD11 = null;
  private CharacterField fieldE02COMD12 = null;

  /**
  * Constructor for ELC090002Message.
  */
  public ELC090002Message()
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
    recordsize = 470;
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
    fields[9] = fieldE02LCYBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E02LCYBNK");
    fields[10] = fieldE02LCYACD =
    new CharacterField(message, HEADERSIZE + 44, 2, "E02LCYACD");
    fields[11] = fieldE02LCYTYP =
    new CharacterField(message, HEADERSIZE + 46, 1, "E02LCYTYP");
    fields[12] = fieldE02SCHDTY =
    new DecimalField(message, HEADERSIZE + 47, 5, 0, "E02SCHDTY");
    fields[13] = fieldE02TYPDSC =
    new CharacterField(message, HEADERSIZE + 52, 35, "E02TYPDSC");
    fields[14] = fieldE02LCYBDY =
    new DecimalField(message, HEADERSIZE + 87, 5, 0, "E02LCYBDY");
    fields[15] = fieldE02LCYBDM =
    new DecimalField(message, HEADERSIZE + 92, 3, 0, "E02LCYBDM");
    fields[16] = fieldE02LCYBDD =
    new DecimalField(message, HEADERSIZE + 95, 3, 0, "E02LCYBDD");
    fields[17] = fieldE02COMAM1 =
    new DecimalField(message, HEADERSIZE + 98, 15, 2, "E02COMAM1");
    fields[18] = fieldE02COMAM2 =
    new DecimalField(message, HEADERSIZE + 113, 15, 2, "E02COMAM2");
    fields[19] = fieldE02COMAM3 =
    new DecimalField(message, HEADERSIZE + 128, 15, 2, "E02COMAM3");
    fields[20] = fieldE02COMAM4 =
    new DecimalField(message, HEADERSIZE + 143, 15, 2, "E02COMAM4");
    fields[21] = fieldE02COMAM5 =
    new DecimalField(message, HEADERSIZE + 158, 15, 2, "E02COMAM5");
    fields[22] = fieldE02COMAM6 =
    new DecimalField(message, HEADERSIZE + 173, 15, 2, "E02COMAM6");
    fields[23] = fieldE02COMAM7 =
    new DecimalField(message, HEADERSIZE + 188, 15, 2, "E02COMAM7");
    fields[24] = fieldE02COMAM8 =
    new DecimalField(message, HEADERSIZE + 203, 15, 2, "E02COMAM8");
    fields[25] = fieldE02COMAM9 =
    new DecimalField(message, HEADERSIZE + 218, 15, 2, "E02COMAM9");
    fields[26] = fieldE02COMA10 =
    new DecimalField(message, HEADERSIZE + 233, 15, 2, "E02COMA10");
    fields[27] = fieldE02COMA11 =
    new DecimalField(message, HEADERSIZE + 248, 15, 2, "E02COMA11");
    fields[28] = fieldE02COMA12 =
    new DecimalField(message, HEADERSIZE + 263, 15, 2, "E02COMA12");
    fields[29] = fieldE02COMDS1 =
    new CharacterField(message, HEADERSIZE + 278, 16, "E02COMDS1");
    fields[30] = fieldE02COMDS2 =
    new CharacterField(message, HEADERSIZE + 294, 16, "E02COMDS2");
    fields[31] = fieldE02COMDS3 =
    new CharacterField(message, HEADERSIZE + 310, 16, "E02COMDS3");
    fields[32] = fieldE02COMDS4 =
    new CharacterField(message, HEADERSIZE + 326, 16, "E02COMDS4");
    fields[33] = fieldE02COMDS5 =
    new CharacterField(message, HEADERSIZE + 342, 16, "E02COMDS5");
    fields[34] = fieldE02COMDS6 =
    new CharacterField(message, HEADERSIZE + 358, 16, "E02COMDS6");
    fields[35] = fieldE02COMDS7 =
    new CharacterField(message, HEADERSIZE + 374, 16, "E02COMDS7");
    fields[36] = fieldE02COMDS8 =
    new CharacterField(message, HEADERSIZE + 390, 16, "E02COMDS8");
    fields[37] = fieldE02COMDS9 =
    new CharacterField(message, HEADERSIZE + 406, 16, "E02COMDS9");
    fields[38] = fieldE02COMD10 =
    new CharacterField(message, HEADERSIZE + 422, 16, "E02COMD10");
    fields[39] = fieldE02COMD11 =
    new CharacterField(message, HEADERSIZE + 438, 16, "E02COMD11");
    fields[40] = fieldE02COMD12 =
    new CharacterField(message, HEADERSIZE + 454, 16, "E02COMD12");

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
  * Set field E02LCYBNK using a String value.
  */
  public void setE02LCYBNK(String newvalue)
  {
    fieldE02LCYBNK.setString(newvalue);
  }

  /**
  * Get value of field E02LCYBNK as a String.
  */
  public String getE02LCYBNK()
  {
    return fieldE02LCYBNK.getString();
  }

  /**
  * Set field E02LCYACD using a String value.
  */
  public void setE02LCYACD(String newvalue)
  {
    fieldE02LCYACD.setString(newvalue);
  }

  /**
  * Get value of field E02LCYACD as a String.
  */
  public String getE02LCYACD()
  {
    return fieldE02LCYACD.getString();
  }

  /**
  * Set field E02LCYTYP using a String value.
  */
  public void setE02LCYTYP(String newvalue)
  {
    fieldE02LCYTYP.setString(newvalue);
  }

  /**
  * Get value of field E02LCYTYP as a String.
  */
  public String getE02LCYTYP()
  {
    return fieldE02LCYTYP.getString();
  }

  /**
  * Set field E02SCHDTY using a String value.
  */
  public void setE02SCHDTY(String newvalue)
  {
    fieldE02SCHDTY.setString(newvalue);
  }

  /**
  * Get value of field E02SCHDTY as a String.
  */
  public String getE02SCHDTY()
  {
    return fieldE02SCHDTY.getString();
  }

  /**
  * Set numeric field E02SCHDTY using a BigDecimal value.
  */
  public void setE02SCHDTY(BigDecimal newvalue)
  {
    fieldE02SCHDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SCHDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SCHDTY()
  {
    return fieldE02SCHDTY.getBigDecimal();
  }

  /**
  * Set field E02TYPDSC using a String value.
  */
  public void setE02TYPDSC(String newvalue)
  {
    fieldE02TYPDSC.setString(newvalue);
  }

  /**
  * Get value of field E02TYPDSC as a String.
  */
  public String getE02TYPDSC()
  {
    return fieldE02TYPDSC.getString();
  }

  /**
  * Set field E02LCYBDY using a String value.
  */
  public void setE02LCYBDY(String newvalue)
  {
    fieldE02LCYBDY.setString(newvalue);
  }

  /**
  * Get value of field E02LCYBDY as a String.
  */
  public String getE02LCYBDY()
  {
    return fieldE02LCYBDY.getString();
  }

  /**
  * Set numeric field E02LCYBDY using a BigDecimal value.
  */
  public void setE02LCYBDY(BigDecimal newvalue)
  {
    fieldE02LCYBDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LCYBDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LCYBDY()
  {
    return fieldE02LCYBDY.getBigDecimal();
  }

  /**
  * Set field E02LCYBDM using a String value.
  */
  public void setE02LCYBDM(String newvalue)
  {
    fieldE02LCYBDM.setString(newvalue);
  }

  /**
  * Get value of field E02LCYBDM as a String.
  */
  public String getE02LCYBDM()
  {
    return fieldE02LCYBDM.getString();
  }

  /**
  * Set numeric field E02LCYBDM using a BigDecimal value.
  */
  public void setE02LCYBDM(BigDecimal newvalue)
  {
    fieldE02LCYBDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LCYBDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LCYBDM()
  {
    return fieldE02LCYBDM.getBigDecimal();
  }

  /**
  * Set field E02LCYBDD using a String value.
  */
  public void setE02LCYBDD(String newvalue)
  {
    fieldE02LCYBDD.setString(newvalue);
  }

  /**
  * Get value of field E02LCYBDD as a String.
  */
  public String getE02LCYBDD()
  {
    return fieldE02LCYBDD.getString();
  }

  /**
  * Set numeric field E02LCYBDD using a BigDecimal value.
  */
  public void setE02LCYBDD(BigDecimal newvalue)
  {
    fieldE02LCYBDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LCYBDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LCYBDD()
  {
    return fieldE02LCYBDD.getBigDecimal();
  }

  /**
  * Set field E02COMAM1 using a String value.
  */
  public void setE02COMAM1(String newvalue)
  {
    fieldE02COMAM1.setString(newvalue);
  }

  /**
  * Get value of field E02COMAM1 as a String.
  */
  public String getE02COMAM1()
  {
    return fieldE02COMAM1.getString();
  }

  /**
  * Set numeric field E02COMAM1 using a BigDecimal value.
  */
  public void setE02COMAM1(BigDecimal newvalue)
  {
    fieldE02COMAM1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02COMAM1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02COMAM1()
  {
    return fieldE02COMAM1.getBigDecimal();
  }

  /**
  * Set field E02COMAM2 using a String value.
  */
  public void setE02COMAM2(String newvalue)
  {
    fieldE02COMAM2.setString(newvalue);
  }

  /**
  * Get value of field E02COMAM2 as a String.
  */
  public String getE02COMAM2()
  {
    return fieldE02COMAM2.getString();
  }

  /**
  * Set numeric field E02COMAM2 using a BigDecimal value.
  */
  public void setE02COMAM2(BigDecimal newvalue)
  {
    fieldE02COMAM2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02COMAM2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02COMAM2()
  {
    return fieldE02COMAM2.getBigDecimal();
  }

  /**
  * Set field E02COMAM3 using a String value.
  */
  public void setE02COMAM3(String newvalue)
  {
    fieldE02COMAM3.setString(newvalue);
  }

  /**
  * Get value of field E02COMAM3 as a String.
  */
  public String getE02COMAM3()
  {
    return fieldE02COMAM3.getString();
  }

  /**
  * Set numeric field E02COMAM3 using a BigDecimal value.
  */
  public void setE02COMAM3(BigDecimal newvalue)
  {
    fieldE02COMAM3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02COMAM3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02COMAM3()
  {
    return fieldE02COMAM3.getBigDecimal();
  }

  /**
  * Set field E02COMAM4 using a String value.
  */
  public void setE02COMAM4(String newvalue)
  {
    fieldE02COMAM4.setString(newvalue);
  }

  /**
  * Get value of field E02COMAM4 as a String.
  */
  public String getE02COMAM4()
  {
    return fieldE02COMAM4.getString();
  }

  /**
  * Set numeric field E02COMAM4 using a BigDecimal value.
  */
  public void setE02COMAM4(BigDecimal newvalue)
  {
    fieldE02COMAM4.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02COMAM4 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02COMAM4()
  {
    return fieldE02COMAM4.getBigDecimal();
  }

  /**
  * Set field E02COMAM5 using a String value.
  */
  public void setE02COMAM5(String newvalue)
  {
    fieldE02COMAM5.setString(newvalue);
  }

  /**
  * Get value of field E02COMAM5 as a String.
  */
  public String getE02COMAM5()
  {
    return fieldE02COMAM5.getString();
  }

  /**
  * Set numeric field E02COMAM5 using a BigDecimal value.
  */
  public void setE02COMAM5(BigDecimal newvalue)
  {
    fieldE02COMAM5.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02COMAM5 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02COMAM5()
  {
    return fieldE02COMAM5.getBigDecimal();
  }

  /**
  * Set field E02COMAM6 using a String value.
  */
  public void setE02COMAM6(String newvalue)
  {
    fieldE02COMAM6.setString(newvalue);
  }

  /**
  * Get value of field E02COMAM6 as a String.
  */
  public String getE02COMAM6()
  {
    return fieldE02COMAM6.getString();
  }

  /**
  * Set numeric field E02COMAM6 using a BigDecimal value.
  */
  public void setE02COMAM6(BigDecimal newvalue)
  {
    fieldE02COMAM6.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02COMAM6 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02COMAM6()
  {
    return fieldE02COMAM6.getBigDecimal();
  }

  /**
  * Set field E02COMAM7 using a String value.
  */
  public void setE02COMAM7(String newvalue)
  {
    fieldE02COMAM7.setString(newvalue);
  }

  /**
  * Get value of field E02COMAM7 as a String.
  */
  public String getE02COMAM7()
  {
    return fieldE02COMAM7.getString();
  }

  /**
  * Set numeric field E02COMAM7 using a BigDecimal value.
  */
  public void setE02COMAM7(BigDecimal newvalue)
  {
    fieldE02COMAM7.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02COMAM7 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02COMAM7()
  {
    return fieldE02COMAM7.getBigDecimal();
  }

  /**
  * Set field E02COMAM8 using a String value.
  */
  public void setE02COMAM8(String newvalue)
  {
    fieldE02COMAM8.setString(newvalue);
  }

  /**
  * Get value of field E02COMAM8 as a String.
  */
  public String getE02COMAM8()
  {
    return fieldE02COMAM8.getString();
  }

  /**
  * Set numeric field E02COMAM8 using a BigDecimal value.
  */
  public void setE02COMAM8(BigDecimal newvalue)
  {
    fieldE02COMAM8.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02COMAM8 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02COMAM8()
  {
    return fieldE02COMAM8.getBigDecimal();
  }

  /**
  * Set field E02COMAM9 using a String value.
  */
  public void setE02COMAM9(String newvalue)
  {
    fieldE02COMAM9.setString(newvalue);
  }

  /**
  * Get value of field E02COMAM9 as a String.
  */
  public String getE02COMAM9()
  {
    return fieldE02COMAM9.getString();
  }

  /**
  * Set numeric field E02COMAM9 using a BigDecimal value.
  */
  public void setE02COMAM9(BigDecimal newvalue)
  {
    fieldE02COMAM9.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02COMAM9 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02COMAM9()
  {
    return fieldE02COMAM9.getBigDecimal();
  }

  /**
  * Set field E02COMA10 using a String value.
  */
  public void setE02COMA10(String newvalue)
  {
    fieldE02COMA10.setString(newvalue);
  }

  /**
  * Get value of field E02COMA10 as a String.
  */
  public String getE02COMA10()
  {
    return fieldE02COMA10.getString();
  }

  /**
  * Set numeric field E02COMA10 using a BigDecimal value.
  */
  public void setE02COMA10(BigDecimal newvalue)
  {
    fieldE02COMA10.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02COMA10 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02COMA10()
  {
    return fieldE02COMA10.getBigDecimal();
  }

  /**
  * Set field E02COMA11 using a String value.
  */
  public void setE02COMA11(String newvalue)
  {
    fieldE02COMA11.setString(newvalue);
  }

  /**
  * Get value of field E02COMA11 as a String.
  */
  public String getE02COMA11()
  {
    return fieldE02COMA11.getString();
  }

  /**
  * Set numeric field E02COMA11 using a BigDecimal value.
  */
  public void setE02COMA11(BigDecimal newvalue)
  {
    fieldE02COMA11.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02COMA11 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02COMA11()
  {
    return fieldE02COMA11.getBigDecimal();
  }

  /**
  * Set field E02COMA12 using a String value.
  */
  public void setE02COMA12(String newvalue)
  {
    fieldE02COMA12.setString(newvalue);
  }

  /**
  * Get value of field E02COMA12 as a String.
  */
  public String getE02COMA12()
  {
    return fieldE02COMA12.getString();
  }

  /**
  * Set numeric field E02COMA12 using a BigDecimal value.
  */
  public void setE02COMA12(BigDecimal newvalue)
  {
    fieldE02COMA12.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02COMA12 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02COMA12()
  {
    return fieldE02COMA12.getBigDecimal();
  }

  /**
  * Set field E02COMDS1 using a String value.
  */
  public void setE02COMDS1(String newvalue)
  {
    fieldE02COMDS1.setString(newvalue);
  }

  /**
  * Get value of field E02COMDS1 as a String.
  */
  public String getE02COMDS1()
  {
    return fieldE02COMDS1.getString();
  }

  /**
  * Set field E02COMDS2 using a String value.
  */
  public void setE02COMDS2(String newvalue)
  {
    fieldE02COMDS2.setString(newvalue);
  }

  /**
  * Get value of field E02COMDS2 as a String.
  */
  public String getE02COMDS2()
  {
    return fieldE02COMDS2.getString();
  }

  /**
  * Set field E02COMDS3 using a String value.
  */
  public void setE02COMDS3(String newvalue)
  {
    fieldE02COMDS3.setString(newvalue);
  }

  /**
  * Get value of field E02COMDS3 as a String.
  */
  public String getE02COMDS3()
  {
    return fieldE02COMDS3.getString();
  }

  /**
  * Set field E02COMDS4 using a String value.
  */
  public void setE02COMDS4(String newvalue)
  {
    fieldE02COMDS4.setString(newvalue);
  }

  /**
  * Get value of field E02COMDS4 as a String.
  */
  public String getE02COMDS4()
  {
    return fieldE02COMDS4.getString();
  }

  /**
  * Set field E02COMDS5 using a String value.
  */
  public void setE02COMDS5(String newvalue)
  {
    fieldE02COMDS5.setString(newvalue);
  }

  /**
  * Get value of field E02COMDS5 as a String.
  */
  public String getE02COMDS5()
  {
    return fieldE02COMDS5.getString();
  }

  /**
  * Set field E02COMDS6 using a String value.
  */
  public void setE02COMDS6(String newvalue)
  {
    fieldE02COMDS6.setString(newvalue);
  }

  /**
  * Get value of field E02COMDS6 as a String.
  */
  public String getE02COMDS6()
  {
    return fieldE02COMDS6.getString();
  }

  /**
  * Set field E02COMDS7 using a String value.
  */
  public void setE02COMDS7(String newvalue)
  {
    fieldE02COMDS7.setString(newvalue);
  }

  /**
  * Get value of field E02COMDS7 as a String.
  */
  public String getE02COMDS7()
  {
    return fieldE02COMDS7.getString();
  }

  /**
  * Set field E02COMDS8 using a String value.
  */
  public void setE02COMDS8(String newvalue)
  {
    fieldE02COMDS8.setString(newvalue);
  }

  /**
  * Get value of field E02COMDS8 as a String.
  */
  public String getE02COMDS8()
  {
    return fieldE02COMDS8.getString();
  }

  /**
  * Set field E02COMDS9 using a String value.
  */
  public void setE02COMDS9(String newvalue)
  {
    fieldE02COMDS9.setString(newvalue);
  }

  /**
  * Get value of field E02COMDS9 as a String.
  */
  public String getE02COMDS9()
  {
    return fieldE02COMDS9.getString();
  }

  /**
  * Set field E02COMD10 using a String value.
  */
  public void setE02COMD10(String newvalue)
  {
    fieldE02COMD10.setString(newvalue);
  }

  /**
  * Get value of field E02COMD10 as a String.
  */
  public String getE02COMD10()
  {
    return fieldE02COMD10.getString();
  }

  /**
  * Set field E02COMD11 using a String value.
  */
  public void setE02COMD11(String newvalue)
  {
    fieldE02COMD11.setString(newvalue);
  }

  /**
  * Get value of field E02COMD11 as a String.
  */
  public String getE02COMD11()
  {
    return fieldE02COMD11.getString();
  }

  /**
  * Set field E02COMD12 using a String value.
  */
  public void setE02COMD12(String newvalue)
  {
    fieldE02COMD12.setString(newvalue);
  }

  /**
  * Get value of field E02COMD12 as a String.
  */
  public String getE02COMD12()
  {
    return fieldE02COMD12.getString();
  }

}
