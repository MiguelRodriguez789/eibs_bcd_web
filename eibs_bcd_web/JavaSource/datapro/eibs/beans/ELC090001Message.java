package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ELC090001 physical file definition.
* 
* File level identifier is 1130611113219.
* Record format level identifier is 3D6516F4A2852.
*/

public class ELC090001Message extends MessageRecord
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
                                     "E01LCYBNK",
                                     "E01LCYACD",
                                     "E01LCYTYP",
                                     "E01SCHDTY",
                                     "E01TYPDSC",
                                     "E01LCYBDY",
                                     "E01LCYBDM",
                                     "E01LCYBDD",
                                     "E01LCYOPA",
                                     "E01LCYOPT",
                                     "E01LCYAMA",
                                     "E01LCYAMT",
                                     "E01LCYPYA",
                                     "E01LCYPYT",
                                     "E01LCYACA",
                                     "E01LCYACT",
                                     "E01LCYNGA",
                                     "E01LCYNGT",
                                     "E01LCYCAA",
                                     "E01LCYCAT",
                                     "E01LCYOTA",
                                     "E01LCYOTT"
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
                                   "E01LCYBNK",
                                   "E01LCYACD",
                                   "E01LCYTYP",
                                   "E01SCHDTY",
                                   "E01TYPDSC",
                                   "E01LCYBDY",
                                   "E01LCYBDM",
                                   "E01LCYBDD",
                                   "E01LCYOPA",
                                   "E01LCYOPT",
                                   "E01LCYAMA",
                                   "E01LCYAMT",
                                   "E01LCYPYA",
                                   "E01LCYPYT",
                                   "E01LCYACA",
                                   "E01LCYACT",
                                   "E01LCYNGA",
                                   "E01LCYNGT",
                                   "E01LCYCAA",
                                   "E01LCYCAT",
                                   "E01LCYOTA",
                                   "E01LCYOTT"
                                 };
  final static String fid = "1130611113219";
  final static String rid = "3D6516F4A2852";
  final static String fmtname = "ELC090001";
  final int FIELDCOUNT = 31;
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
  private CharacterField fieldE01LCYBNK = null;
  private CharacterField fieldE01LCYACD = null;
  private CharacterField fieldE01LCYTYP = null;
  private DecimalField fieldE01SCHDTY = null;
  private CharacterField fieldE01TYPDSC = null;
  private DecimalField fieldE01LCYBDY = null;
  private DecimalField fieldE01LCYBDM = null;
  private DecimalField fieldE01LCYBDD = null;
  private DecimalField fieldE01LCYOPA = null;
  private DecimalField fieldE01LCYOPT = null;
  private DecimalField fieldE01LCYAMA = null;
  private DecimalField fieldE01LCYAMT = null;
  private DecimalField fieldE01LCYPYA = null;
  private DecimalField fieldE01LCYPYT = null;
  private DecimalField fieldE01LCYACA = null;
  private DecimalField fieldE01LCYACT = null;
  private DecimalField fieldE01LCYNGA = null;
  private DecimalField fieldE01LCYNGT = null;
  private DecimalField fieldE01LCYCAA = null;
  private DecimalField fieldE01LCYCAT = null;
  private DecimalField fieldE01LCYOTA = null;
  private DecimalField fieldE01LCYOTT = null;

  /**
  * Constructor for ELC090001Message.
  */
  public ELC090001Message()
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
    recordsize = 245;
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
    fields[9] = fieldE01LCYBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01LCYBNK");
    fields[10] = fieldE01LCYACD =
    new CharacterField(message, HEADERSIZE + 44, 2, "E01LCYACD");
    fields[11] = fieldE01LCYTYP =
    new CharacterField(message, HEADERSIZE + 46, 1, "E01LCYTYP");
    fields[12] = fieldE01SCHDTY =
    new DecimalField(message, HEADERSIZE + 47, 5, 0, "E01SCHDTY");
    fields[13] = fieldE01TYPDSC =
    new CharacterField(message, HEADERSIZE + 52, 35, "E01TYPDSC");
    fields[14] = fieldE01LCYBDY =
    new DecimalField(message, HEADERSIZE + 87, 5, 0, "E01LCYBDY");
    fields[15] = fieldE01LCYBDM =
    new DecimalField(message, HEADERSIZE + 92, 3, 0, "E01LCYBDM");
    fields[16] = fieldE01LCYBDD =
    new DecimalField(message, HEADERSIZE + 95, 3, 0, "E01LCYBDD");
    fields[17] = fieldE01LCYOPA =
    new DecimalField(message, HEADERSIZE + 98, 15, 2, "E01LCYOPA");
    fields[18] = fieldE01LCYOPT =
    new DecimalField(message, HEADERSIZE + 113, 6, 0, "E01LCYOPT");
    fields[19] = fieldE01LCYAMA =
    new DecimalField(message, HEADERSIZE + 119, 15, 2, "E01LCYAMA");
    fields[20] = fieldE01LCYAMT =
    new DecimalField(message, HEADERSIZE + 134, 6, 0, "E01LCYAMT");
    fields[21] = fieldE01LCYPYA =
    new DecimalField(message, HEADERSIZE + 140, 15, 2, "E01LCYPYA");
    fields[22] = fieldE01LCYPYT =
    new DecimalField(message, HEADERSIZE + 155, 6, 0, "E01LCYPYT");
    fields[23] = fieldE01LCYACA =
    new DecimalField(message, HEADERSIZE + 161, 15, 2, "E01LCYACA");
    fields[24] = fieldE01LCYACT =
    new DecimalField(message, HEADERSIZE + 176, 6, 0, "E01LCYACT");
    fields[25] = fieldE01LCYNGA =
    new DecimalField(message, HEADERSIZE + 182, 15, 2, "E01LCYNGA");
    fields[26] = fieldE01LCYNGT =
    new DecimalField(message, HEADERSIZE + 197, 6, 0, "E01LCYNGT");
    fields[27] = fieldE01LCYCAA =
    new DecimalField(message, HEADERSIZE + 203, 15, 2, "E01LCYCAA");
    fields[28] = fieldE01LCYCAT =
    new DecimalField(message, HEADERSIZE + 218, 6, 0, "E01LCYCAT");
    fields[29] = fieldE01LCYOTA =
    new DecimalField(message, HEADERSIZE + 224, 15, 2, "E01LCYOTA");
    fields[30] = fieldE01LCYOTT =
    new DecimalField(message, HEADERSIZE + 239, 6, 0, "E01LCYOTT");

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
  * Set field E01LCYBNK using a String value.
  */
  public void setE01LCYBNK(String newvalue)
  {
    fieldE01LCYBNK.setString(newvalue);
  }

  /**
  * Get value of field E01LCYBNK as a String.
  */
  public String getE01LCYBNK()
  {
    return fieldE01LCYBNK.getString();
  }

  /**
  * Set field E01LCYACD using a String value.
  */
  public void setE01LCYACD(String newvalue)
  {
    fieldE01LCYACD.setString(newvalue);
  }

  /**
  * Get value of field E01LCYACD as a String.
  */
  public String getE01LCYACD()
  {
    return fieldE01LCYACD.getString();
  }

  /**
  * Set field E01LCYTYP using a String value.
  */
  public void setE01LCYTYP(String newvalue)
  {
    fieldE01LCYTYP.setString(newvalue);
  }

  /**
  * Get value of field E01LCYTYP as a String.
  */
  public String getE01LCYTYP()
  {
    return fieldE01LCYTYP.getString();
  }

  /**
  * Set field E01SCHDTY using a String value.
  */
  public void setE01SCHDTY(String newvalue)
  {
    fieldE01SCHDTY.setString(newvalue);
  }

  /**
  * Get value of field E01SCHDTY as a String.
  */
  public String getE01SCHDTY()
  {
    return fieldE01SCHDTY.getString();
  }

  /**
  * Set numeric field E01SCHDTY using a BigDecimal value.
  */
  public void setE01SCHDTY(BigDecimal newvalue)
  {
    fieldE01SCHDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SCHDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SCHDTY()
  {
    return fieldE01SCHDTY.getBigDecimal();
  }

  /**
  * Set field E01TYPDSC using a String value.
  */
  public void setE01TYPDSC(String newvalue)
  {
    fieldE01TYPDSC.setString(newvalue);
  }

  /**
  * Get value of field E01TYPDSC as a String.
  */
  public String getE01TYPDSC()
  {
    return fieldE01TYPDSC.getString();
  }

  /**
  * Set field E01LCYBDY using a String value.
  */
  public void setE01LCYBDY(String newvalue)
  {
    fieldE01LCYBDY.setString(newvalue);
  }

  /**
  * Get value of field E01LCYBDY as a String.
  */
  public String getE01LCYBDY()
  {
    return fieldE01LCYBDY.getString();
  }

  /**
  * Set numeric field E01LCYBDY using a BigDecimal value.
  */
  public void setE01LCYBDY(BigDecimal newvalue)
  {
    fieldE01LCYBDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCYBDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCYBDY()
  {
    return fieldE01LCYBDY.getBigDecimal();
  }

  /**
  * Set field E01LCYBDM using a String value.
  */
  public void setE01LCYBDM(String newvalue)
  {
    fieldE01LCYBDM.setString(newvalue);
  }

  /**
  * Get value of field E01LCYBDM as a String.
  */
  public String getE01LCYBDM()
  {
    return fieldE01LCYBDM.getString();
  }

  /**
  * Set numeric field E01LCYBDM using a BigDecimal value.
  */
  public void setE01LCYBDM(BigDecimal newvalue)
  {
    fieldE01LCYBDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCYBDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCYBDM()
  {
    return fieldE01LCYBDM.getBigDecimal();
  }

  /**
  * Set field E01LCYBDD using a String value.
  */
  public void setE01LCYBDD(String newvalue)
  {
    fieldE01LCYBDD.setString(newvalue);
  }

  /**
  * Get value of field E01LCYBDD as a String.
  */
  public String getE01LCYBDD()
  {
    return fieldE01LCYBDD.getString();
  }

  /**
  * Set numeric field E01LCYBDD using a BigDecimal value.
  */
  public void setE01LCYBDD(BigDecimal newvalue)
  {
    fieldE01LCYBDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCYBDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCYBDD()
  {
    return fieldE01LCYBDD.getBigDecimal();
  }

  /**
  * Set field E01LCYOPA using a String value.
  */
  public void setE01LCYOPA(String newvalue)
  {
    fieldE01LCYOPA.setString(newvalue);
  }

  /**
  * Get value of field E01LCYOPA as a String.
  */
  public String getE01LCYOPA()
  {
    return fieldE01LCYOPA.getString();
  }

  /**
  * Set numeric field E01LCYOPA using a BigDecimal value.
  */
  public void setE01LCYOPA(BigDecimal newvalue)
  {
    fieldE01LCYOPA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCYOPA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCYOPA()
  {
    return fieldE01LCYOPA.getBigDecimal();
  }

  /**
  * Set field E01LCYOPT using a String value.
  */
  public void setE01LCYOPT(String newvalue)
  {
    fieldE01LCYOPT.setString(newvalue);
  }

  /**
  * Get value of field E01LCYOPT as a String.
  */
  public String getE01LCYOPT()
  {
    return fieldE01LCYOPT.getString();
  }

  /**
  * Set numeric field E01LCYOPT using a BigDecimal value.
  */
  public void setE01LCYOPT(BigDecimal newvalue)
  {
    fieldE01LCYOPT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCYOPT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCYOPT()
  {
    return fieldE01LCYOPT.getBigDecimal();
  }

  /**
  * Set field E01LCYAMA using a String value.
  */
  public void setE01LCYAMA(String newvalue)
  {
    fieldE01LCYAMA.setString(newvalue);
  }

  /**
  * Get value of field E01LCYAMA as a String.
  */
  public String getE01LCYAMA()
  {
    return fieldE01LCYAMA.getString();
  }

  /**
  * Set numeric field E01LCYAMA using a BigDecimal value.
  */
  public void setE01LCYAMA(BigDecimal newvalue)
  {
    fieldE01LCYAMA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCYAMA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCYAMA()
  {
    return fieldE01LCYAMA.getBigDecimal();
  }

  /**
  * Set field E01LCYAMT using a String value.
  */
  public void setE01LCYAMT(String newvalue)
  {
    fieldE01LCYAMT.setString(newvalue);
  }

  /**
  * Get value of field E01LCYAMT as a String.
  */
  public String getE01LCYAMT()
  {
    return fieldE01LCYAMT.getString();
  }

  /**
  * Set numeric field E01LCYAMT using a BigDecimal value.
  */
  public void setE01LCYAMT(BigDecimal newvalue)
  {
    fieldE01LCYAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCYAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCYAMT()
  {
    return fieldE01LCYAMT.getBigDecimal();
  }

  /**
  * Set field E01LCYPYA using a String value.
  */
  public void setE01LCYPYA(String newvalue)
  {
    fieldE01LCYPYA.setString(newvalue);
  }

  /**
  * Get value of field E01LCYPYA as a String.
  */
  public String getE01LCYPYA()
  {
    return fieldE01LCYPYA.getString();
  }

  /**
  * Set numeric field E01LCYPYA using a BigDecimal value.
  */
  public void setE01LCYPYA(BigDecimal newvalue)
  {
    fieldE01LCYPYA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCYPYA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCYPYA()
  {
    return fieldE01LCYPYA.getBigDecimal();
  }

  /**
  * Set field E01LCYPYT using a String value.
  */
  public void setE01LCYPYT(String newvalue)
  {
    fieldE01LCYPYT.setString(newvalue);
  }

  /**
  * Get value of field E01LCYPYT as a String.
  */
  public String getE01LCYPYT()
  {
    return fieldE01LCYPYT.getString();
  }

  /**
  * Set numeric field E01LCYPYT using a BigDecimal value.
  */
  public void setE01LCYPYT(BigDecimal newvalue)
  {
    fieldE01LCYPYT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCYPYT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCYPYT()
  {
    return fieldE01LCYPYT.getBigDecimal();
  }

  /**
  * Set field E01LCYACA using a String value.
  */
  public void setE01LCYACA(String newvalue)
  {
    fieldE01LCYACA.setString(newvalue);
  }

  /**
  * Get value of field E01LCYACA as a String.
  */
  public String getE01LCYACA()
  {
    return fieldE01LCYACA.getString();
  }

  /**
  * Set numeric field E01LCYACA using a BigDecimal value.
  */
  public void setE01LCYACA(BigDecimal newvalue)
  {
    fieldE01LCYACA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCYACA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCYACA()
  {
    return fieldE01LCYACA.getBigDecimal();
  }

  /**
  * Set field E01LCYACT using a String value.
  */
  public void setE01LCYACT(String newvalue)
  {
    fieldE01LCYACT.setString(newvalue);
  }

  /**
  * Get value of field E01LCYACT as a String.
  */
  public String getE01LCYACT()
  {
    return fieldE01LCYACT.getString();
  }

  /**
  * Set numeric field E01LCYACT using a BigDecimal value.
  */
  public void setE01LCYACT(BigDecimal newvalue)
  {
    fieldE01LCYACT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCYACT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCYACT()
  {
    return fieldE01LCYACT.getBigDecimal();
  }

  /**
  * Set field E01LCYNGA using a String value.
  */
  public void setE01LCYNGA(String newvalue)
  {
    fieldE01LCYNGA.setString(newvalue);
  }

  /**
  * Get value of field E01LCYNGA as a String.
  */
  public String getE01LCYNGA()
  {
    return fieldE01LCYNGA.getString();
  }

  /**
  * Set numeric field E01LCYNGA using a BigDecimal value.
  */
  public void setE01LCYNGA(BigDecimal newvalue)
  {
    fieldE01LCYNGA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCYNGA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCYNGA()
  {
    return fieldE01LCYNGA.getBigDecimal();
  }

  /**
  * Set field E01LCYNGT using a String value.
  */
  public void setE01LCYNGT(String newvalue)
  {
    fieldE01LCYNGT.setString(newvalue);
  }

  /**
  * Get value of field E01LCYNGT as a String.
  */
  public String getE01LCYNGT()
  {
    return fieldE01LCYNGT.getString();
  }

  /**
  * Set numeric field E01LCYNGT using a BigDecimal value.
  */
  public void setE01LCYNGT(BigDecimal newvalue)
  {
    fieldE01LCYNGT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCYNGT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCYNGT()
  {
    return fieldE01LCYNGT.getBigDecimal();
  }

  /**
  * Set field E01LCYCAA using a String value.
  */
  public void setE01LCYCAA(String newvalue)
  {
    fieldE01LCYCAA.setString(newvalue);
  }

  /**
  * Get value of field E01LCYCAA as a String.
  */
  public String getE01LCYCAA()
  {
    return fieldE01LCYCAA.getString();
  }

  /**
  * Set numeric field E01LCYCAA using a BigDecimal value.
  */
  public void setE01LCYCAA(BigDecimal newvalue)
  {
    fieldE01LCYCAA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCYCAA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCYCAA()
  {
    return fieldE01LCYCAA.getBigDecimal();
  }

  /**
  * Set field E01LCYCAT using a String value.
  */
  public void setE01LCYCAT(String newvalue)
  {
    fieldE01LCYCAT.setString(newvalue);
  }

  /**
  * Get value of field E01LCYCAT as a String.
  */
  public String getE01LCYCAT()
  {
    return fieldE01LCYCAT.getString();
  }

  /**
  * Set numeric field E01LCYCAT using a BigDecimal value.
  */
  public void setE01LCYCAT(BigDecimal newvalue)
  {
    fieldE01LCYCAT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCYCAT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCYCAT()
  {
    return fieldE01LCYCAT.getBigDecimal();
  }

  /**
  * Set field E01LCYOTA using a String value.
  */
  public void setE01LCYOTA(String newvalue)
  {
    fieldE01LCYOTA.setString(newvalue);
  }

  /**
  * Get value of field E01LCYOTA as a String.
  */
  public String getE01LCYOTA()
  {
    return fieldE01LCYOTA.getString();
  }

  /**
  * Set numeric field E01LCYOTA using a BigDecimal value.
  */
  public void setE01LCYOTA(BigDecimal newvalue)
  {
    fieldE01LCYOTA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCYOTA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCYOTA()
  {
    return fieldE01LCYOTA.getBigDecimal();
  }

  /**
  * Set field E01LCYOTT using a String value.
  */
  public void setE01LCYOTT(String newvalue)
  {
    fieldE01LCYOTT.setString(newvalue);
  }

  /**
  * Get value of field E01LCYOTT as a String.
  */
  public String getE01LCYOTT()
  {
    return fieldE01LCYOTT.getString();
  }

  /**
  * Set numeric field E01LCYOTT using a BigDecimal value.
  */
  public void setE01LCYOTT(BigDecimal newvalue)
  {
    fieldE01LCYOTT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCYOTT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCYOTT()
  {
    return fieldE01LCYOTT.getBigDecimal();
  }

}