package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ERA001103 physical file definition.
* 
* File level identifier is 1140715114328.
* Record format level identifier is 321B6BE132748.
*/

public class ERA001103Message extends MessageRecord
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
                                     "E03ROCBNK",
                                     "E03ROCCUN",
                                     "E03ROCREF",
                                     "E03ROCICN",
                                     "E03ROCICM",
                                     "E03ROCIPD",
                                     "E03ROCCIN",
                                     "E03ROCEMM",
                                     "E03ROCEMD",
                                     "E03ROCEMY",
                                     "E03ROCMDM",
                                     "E03ROCMDD",
                                     "E03ROCMDY",
                                     "E03ROCICY",
                                     "E03ROCIPA",
                                     "E03ROCCLF",
                                     "E03ROCRGK",
                                     "E03ROCEMB",
                                     "E03ROCUSC",
                                     "E03ROCCRR",
                                     "E03ROCDSC",
                                     "E03ROCEDO",
                                     "E03ROCTS1",
                                     "E03ROCTS2",
                                     "E03ROCTS3",
                                     "E03ROCTS4",
                                     "E03ROCTS5"
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
                                   "E03ROCBNK",
                                   "E03ROCCUN",
                                   "E03ROCREF",
                                   "E03ROCICN",
                                   "E03ROCICM",
                                   "E03ROCIPD",
                                   "E03ROCCIN",
                                   "E03ROCEMM",
                                   "E03ROCEMD",
                                   "E03ROCEMY",
                                   "E03ROCMDM",
                                   "E03ROCMDD",
                                   "E03ROCMDY",
                                   "E03ROCICY",
                                   "E03ROCIPA",
                                   "E03ROCCLF",
                                   "E03ROCRGK",
                                   "E03ROCEMB",
                                   "E03ROCUSC",
                                   "E03ROCCRR",
                                   "E03ROCDSC",
                                   "E03ROCEDO",
                                   "E03ROCTS1",
                                   "E03ROCTS2",
                                   "E03ROCTS3",
                                   "E03ROCTS4",
                                   "E03ROCTS5"
                                 };
  final static String fid = "1140715114328";
  final static String rid = "321B6BE132748";
  final static String fmtname = "ERA001103";
  final int FIELDCOUNT = 36;
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
  private CharacterField fieldE03ROCBNK = null;
  private DecimalField fieldE03ROCCUN = null;
  private DecimalField fieldE03ROCREF = null;
  private CharacterField fieldE03ROCICN = null;
  private CharacterField fieldE03ROCICM = null;
  private CharacterField fieldE03ROCIPD = null;
  private CharacterField fieldE03ROCCIN = null;
  private DecimalField fieldE03ROCEMM = null;
  private DecimalField fieldE03ROCEMD = null;
  private DecimalField fieldE03ROCEMY = null;
  private DecimalField fieldE03ROCMDM = null;
  private DecimalField fieldE03ROCMDD = null;
  private DecimalField fieldE03ROCMDY = null;
  private CharacterField fieldE03ROCICY = null;
  private DecimalField fieldE03ROCIPA = null;
  private CharacterField fieldE03ROCCLF = null;
  private CharacterField fieldE03ROCRGK = null;
  private CharacterField fieldE03ROCEMB = null;
  private CharacterField fieldE03ROCUSC = null;
  private CharacterField fieldE03ROCCRR = null;
  private CharacterField fieldE03ROCDSC = null;
  private CharacterField fieldE03ROCEDO = null;
  private CharacterField fieldE03ROCTS1 = null;
  private CharacterField fieldE03ROCTS2 = null;
  private CharacterField fieldE03ROCTS3 = null;
  private CharacterField fieldE03ROCTS4 = null;
  private CharacterField fieldE03ROCTS5 = null;

  /**
  * Constructor for ERA001103Message.
  */
  public ERA001103Message()
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
    recordsize = 338;
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
    fields[9] = fieldE03ROCBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E03ROCBNK");
    fields[10] = fieldE03ROCCUN =
    new DecimalField(message, HEADERSIZE + 44, 10, 0, "E03ROCCUN");
    fields[11] = fieldE03ROCREF =
    new DecimalField(message, HEADERSIZE + 54, 13, 0, "E03ROCREF");
    fields[12] = fieldE03ROCICN =
    new CharacterField(message, HEADERSIZE + 67, 4, "E03ROCICN");
    fields[13] = fieldE03ROCICM =
    new CharacterField(message, HEADERSIZE + 71, 45, "E03ROCICM");
    fields[14] = fieldE03ROCIPD =
    new CharacterField(message, HEADERSIZE + 116, 60, "E03ROCIPD");
    fields[15] = fieldE03ROCCIN =
    new CharacterField(message, HEADERSIZE + 176, 40, "E03ROCCIN");
    fields[16] = fieldE03ROCEMM =
    new DecimalField(message, HEADERSIZE + 216, 3, 0, "E03ROCEMM");
    fields[17] = fieldE03ROCEMD =
    new DecimalField(message, HEADERSIZE + 219, 3, 0, "E03ROCEMD");
    fields[18] = fieldE03ROCEMY =
    new DecimalField(message, HEADERSIZE + 222, 5, 0, "E03ROCEMY");
    fields[19] = fieldE03ROCMDM =
    new DecimalField(message, HEADERSIZE + 227, 3, 0, "E03ROCMDM");
    fields[20] = fieldE03ROCMDD =
    new DecimalField(message, HEADERSIZE + 230, 3, 0, "E03ROCMDD");
    fields[21] = fieldE03ROCMDY =
    new DecimalField(message, HEADERSIZE + 233, 5, 0, "E03ROCMDY");
    fields[22] = fieldE03ROCICY =
    new CharacterField(message, HEADERSIZE + 238, 3, "E03ROCICY");
    fields[23] = fieldE03ROCIPA =
    new DecimalField(message, HEADERSIZE + 241, 17, 2, "E03ROCIPA");
    fields[24] = fieldE03ROCCLF =
    new CharacterField(message, HEADERSIZE + 258, 1, "E03ROCCLF");
    fields[25] = fieldE03ROCRGK =
    new CharacterField(message, HEADERSIZE + 259, 1, "E03ROCRGK");
    fields[26] = fieldE03ROCEMB =
    new CharacterField(message, HEADERSIZE + 260, 4, "E03ROCEMB");
    fields[27] = fieldE03ROCUSC =
    new CharacterField(message, HEADERSIZE + 264, 4, "E03ROCUSC");
    fields[28] = fieldE03ROCCRR =
    new CharacterField(message, HEADERSIZE + 268, 4, "E03ROCCRR");
    fields[29] = fieldE03ROCDSC =
    new CharacterField(message, HEADERSIZE + 272, 60, "E03ROCDSC");
    fields[30] = fieldE03ROCEDO =
    new CharacterField(message, HEADERSIZE + 332, 1, "E03ROCEDO");
    fields[31] = fieldE03ROCTS1 =
    new CharacterField(message, HEADERSIZE + 333, 1, "E03ROCTS1");
    fields[32] = fieldE03ROCTS2 =
    new CharacterField(message, HEADERSIZE + 334, 1, "E03ROCTS2");
    fields[33] = fieldE03ROCTS3 =
    new CharacterField(message, HEADERSIZE + 335, 1, "E03ROCTS3");
    fields[34] = fieldE03ROCTS4 =
    new CharacterField(message, HEADERSIZE + 336, 1, "E03ROCTS4");
    fields[35] = fieldE03ROCTS5 =
    new CharacterField(message, HEADERSIZE + 337, 1, "E03ROCTS5");

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
  * Set field E03ROCBNK using a String value.
  */
  public void setE03ROCBNK(String newvalue)
  {
    fieldE03ROCBNK.setString(newvalue);
  }

  /**
  * Get value of field E03ROCBNK as a String.
  */
  public String getE03ROCBNK()
  {
    return fieldE03ROCBNK.getString();
  }

  /**
  * Set field E03ROCCUN using a String value.
  */
  public void setE03ROCCUN(String newvalue)
  {
    fieldE03ROCCUN.setString(newvalue);
  }

  /**
  * Get value of field E03ROCCUN as a String.
  */
  public String getE03ROCCUN()
  {
    return fieldE03ROCCUN.getString();
  }

  /**
  * Set numeric field E03ROCCUN using a BigDecimal value.
  */
  public void setE03ROCCUN(BigDecimal newvalue)
  {
    fieldE03ROCCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ROCCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ROCCUN()
  {
    return fieldE03ROCCUN.getBigDecimal();
  }

  /**
  * Set field E03ROCREF using a String value.
  */
  public void setE03ROCREF(String newvalue)
  {
    fieldE03ROCREF.setString(newvalue);
  }

  /**
  * Get value of field E03ROCREF as a String.
  */
  public String getE03ROCREF()
  {
    return fieldE03ROCREF.getString();
  }

  /**
  * Set numeric field E03ROCREF using a BigDecimal value.
  */
  public void setE03ROCREF(BigDecimal newvalue)
  {
    fieldE03ROCREF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ROCREF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ROCREF()
  {
    return fieldE03ROCREF.getBigDecimal();
  }

  /**
  * Set field E03ROCICN using a String value.
  */
  public void setE03ROCICN(String newvalue)
  {
    fieldE03ROCICN.setString(newvalue);
  }

  /**
  * Get value of field E03ROCICN as a String.
  */
  public String getE03ROCICN()
  {
    return fieldE03ROCICN.getString();
  }

  /**
  * Set field E03ROCICM using a String value.
  */
  public void setE03ROCICM(String newvalue)
  {
    fieldE03ROCICM.setString(newvalue);
  }

  /**
  * Get value of field E03ROCICM as a String.
  */
  public String getE03ROCICM()
  {
    return fieldE03ROCICM.getString();
  }

  /**
  * Set field E03ROCIPD using a String value.
  */
  public void setE03ROCIPD(String newvalue)
  {
    fieldE03ROCIPD.setString(newvalue);
  }

  /**
  * Get value of field E03ROCIPD as a String.
  */
  public String getE03ROCIPD()
  {
    return fieldE03ROCIPD.getString();
  }

  /**
  * Set field E03ROCCIN using a String value.
  */
  public void setE03ROCCIN(String newvalue)
  {
    fieldE03ROCCIN.setString(newvalue);
  }

  /**
  * Get value of field E03ROCCIN as a String.
  */
  public String getE03ROCCIN()
  {
    return fieldE03ROCCIN.getString();
  }

  /**
  * Set field E03ROCEMM using a String value.
  */
  public void setE03ROCEMM(String newvalue)
  {
    fieldE03ROCEMM.setString(newvalue);
  }

  /**
  * Get value of field E03ROCEMM as a String.
  */
  public String getE03ROCEMM()
  {
    return fieldE03ROCEMM.getString();
  }

  /**
  * Set numeric field E03ROCEMM using a BigDecimal value.
  */
  public void setE03ROCEMM(BigDecimal newvalue)
  {
    fieldE03ROCEMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ROCEMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ROCEMM()
  {
    return fieldE03ROCEMM.getBigDecimal();
  }

  /**
  * Set field E03ROCEMD using a String value.
  */
  public void setE03ROCEMD(String newvalue)
  {
    fieldE03ROCEMD.setString(newvalue);
  }

  /**
  * Get value of field E03ROCEMD as a String.
  */
  public String getE03ROCEMD()
  {
    return fieldE03ROCEMD.getString();
  }

  /**
  * Set numeric field E03ROCEMD using a BigDecimal value.
  */
  public void setE03ROCEMD(BigDecimal newvalue)
  {
    fieldE03ROCEMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ROCEMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ROCEMD()
  {
    return fieldE03ROCEMD.getBigDecimal();
  }

  /**
  * Set field E03ROCEMY using a String value.
  */
  public void setE03ROCEMY(String newvalue)
  {
    fieldE03ROCEMY.setString(newvalue);
  }

  /**
  * Get value of field E03ROCEMY as a String.
  */
  public String getE03ROCEMY()
  {
    return fieldE03ROCEMY.getString();
  }

  /**
  * Set numeric field E03ROCEMY using a BigDecimal value.
  */
  public void setE03ROCEMY(BigDecimal newvalue)
  {
    fieldE03ROCEMY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ROCEMY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ROCEMY()
  {
    return fieldE03ROCEMY.getBigDecimal();
  }

  /**
  * Set field E03ROCMDM using a String value.
  */
  public void setE03ROCMDM(String newvalue)
  {
    fieldE03ROCMDM.setString(newvalue);
  }

  /**
  * Get value of field E03ROCMDM as a String.
  */
  public String getE03ROCMDM()
  {
    return fieldE03ROCMDM.getString();
  }

  /**
  * Set numeric field E03ROCMDM using a BigDecimal value.
  */
  public void setE03ROCMDM(BigDecimal newvalue)
  {
    fieldE03ROCMDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ROCMDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ROCMDM()
  {
    return fieldE03ROCMDM.getBigDecimal();
  }

  /**
  * Set field E03ROCMDD using a String value.
  */
  public void setE03ROCMDD(String newvalue)
  {
    fieldE03ROCMDD.setString(newvalue);
  }

  /**
  * Get value of field E03ROCMDD as a String.
  */
  public String getE03ROCMDD()
  {
    return fieldE03ROCMDD.getString();
  }

  /**
  * Set numeric field E03ROCMDD using a BigDecimal value.
  */
  public void setE03ROCMDD(BigDecimal newvalue)
  {
    fieldE03ROCMDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ROCMDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ROCMDD()
  {
    return fieldE03ROCMDD.getBigDecimal();
  }

  /**
  * Set field E03ROCMDY using a String value.
  */
  public void setE03ROCMDY(String newvalue)
  {
    fieldE03ROCMDY.setString(newvalue);
  }

  /**
  * Get value of field E03ROCMDY as a String.
  */
  public String getE03ROCMDY()
  {
    return fieldE03ROCMDY.getString();
  }

  /**
  * Set numeric field E03ROCMDY using a BigDecimal value.
  */
  public void setE03ROCMDY(BigDecimal newvalue)
  {
    fieldE03ROCMDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ROCMDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ROCMDY()
  {
    return fieldE03ROCMDY.getBigDecimal();
  }

  /**
  * Set field E03ROCICY using a String value.
  */
  public void setE03ROCICY(String newvalue)
  {
    fieldE03ROCICY.setString(newvalue);
  }

  /**
  * Get value of field E03ROCICY as a String.
  */
  public String getE03ROCICY()
  {
    return fieldE03ROCICY.getString();
  }

  /**
  * Set field E03ROCIPA using a String value.
  */
  public void setE03ROCIPA(String newvalue)
  {
    fieldE03ROCIPA.setString(newvalue);
  }

  /**
  * Get value of field E03ROCIPA as a String.
  */
  public String getE03ROCIPA()
  {
    return fieldE03ROCIPA.getString();
  }

  /**
  * Set numeric field E03ROCIPA using a BigDecimal value.
  */
  public void setE03ROCIPA(BigDecimal newvalue)
  {
    fieldE03ROCIPA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ROCIPA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ROCIPA()
  {
    return fieldE03ROCIPA.getBigDecimal();
  }

  /**
  * Set field E03ROCCLF using a String value.
  */
  public void setE03ROCCLF(String newvalue)
  {
    fieldE03ROCCLF.setString(newvalue);
  }

  /**
  * Get value of field E03ROCCLF as a String.
  */
  public String getE03ROCCLF()
  {
    return fieldE03ROCCLF.getString();
  }

  /**
  * Set field E03ROCRGK using a String value.
  */
  public void setE03ROCRGK(String newvalue)
  {
    fieldE03ROCRGK.setString(newvalue);
  }

  /**
  * Get value of field E03ROCRGK as a String.
  */
  public String getE03ROCRGK()
  {
    return fieldE03ROCRGK.getString();
  }

  /**
  * Set field E03ROCEMB using a String value.
  */
  public void setE03ROCEMB(String newvalue)
  {
    fieldE03ROCEMB.setString(newvalue);
  }

  /**
  * Get value of field E03ROCEMB as a String.
  */
  public String getE03ROCEMB()
  {
    return fieldE03ROCEMB.getString();
  }

  /**
  * Set field E03ROCUSC using a String value.
  */
  public void setE03ROCUSC(String newvalue)
  {
    fieldE03ROCUSC.setString(newvalue);
  }

  /**
  * Get value of field E03ROCUSC as a String.
  */
  public String getE03ROCUSC()
  {
    return fieldE03ROCUSC.getString();
  }

  /**
  * Set field E03ROCCRR using a String value.
  */
  public void setE03ROCCRR(String newvalue)
  {
    fieldE03ROCCRR.setString(newvalue);
  }

  /**
  * Get value of field E03ROCCRR as a String.
  */
  public String getE03ROCCRR()
  {
    return fieldE03ROCCRR.getString();
  }

  /**
  * Set field E03ROCDSC using a String value.
  */
  public void setE03ROCDSC(String newvalue)
  {
    fieldE03ROCDSC.setString(newvalue);
  }

  /**
  * Get value of field E03ROCDSC as a String.
  */
  public String getE03ROCDSC()
  {
    return fieldE03ROCDSC.getString();
  }

  /**
  * Set field E03ROCEDO using a String value.
  */
  public void setE03ROCEDO(String newvalue)
  {
    fieldE03ROCEDO.setString(newvalue);
  }

  /**
  * Get value of field E03ROCEDO as a String.
  */
  public String getE03ROCEDO()
  {
    return fieldE03ROCEDO.getString();
  }

  /**
  * Set field E03ROCTS1 using a String value.
  */
  public void setE03ROCTS1(String newvalue)
  {
    fieldE03ROCTS1.setString(newvalue);
  }

  /**
  * Get value of field E03ROCTS1 as a String.
  */
  public String getE03ROCTS1()
  {
    return fieldE03ROCTS1.getString();
  }

  /**
  * Set field E03ROCTS2 using a String value.
  */
  public void setE03ROCTS2(String newvalue)
  {
    fieldE03ROCTS2.setString(newvalue);
  }

  /**
  * Get value of field E03ROCTS2 as a String.
  */
  public String getE03ROCTS2()
  {
    return fieldE03ROCTS2.getString();
  }

  /**
  * Set field E03ROCTS3 using a String value.
  */
  public void setE03ROCTS3(String newvalue)
  {
    fieldE03ROCTS3.setString(newvalue);
  }

  /**
  * Get value of field E03ROCTS3 as a String.
  */
  public String getE03ROCTS3()
  {
    return fieldE03ROCTS3.getString();
  }

  /**
  * Set field E03ROCTS4 using a String value.
  */
  public void setE03ROCTS4(String newvalue)
  {
    fieldE03ROCTS4.setString(newvalue);
  }

  /**
  * Get value of field E03ROCTS4 as a String.
  */
  public String getE03ROCTS4()
  {
    return fieldE03ROCTS4.getString();
  }

  /**
  * Set field E03ROCTS5 using a String value.
  */
  public void setE03ROCTS5(String newvalue)
  {
    fieldE03ROCTS5.setString(newvalue);
  }

  /**
  * Get value of field E03ROCTS5 as a String.
  */
  public String getE03ROCTS5()
  {
    return fieldE03ROCTS5.getString();
  }

}
