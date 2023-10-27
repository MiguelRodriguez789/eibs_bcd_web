package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ERA001003 physical file definition.
* 
* File level identifier is 1140714185623.
* Record format level identifier is 47280B4D75B6E.
*/

public class ERA001003Message extends MessageRecord
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
                                     "E03ROCSEQ",
                                     "E03ROCICN",
                                     "E03ROCICM",
                                     "E03ROCIPD",
                                     "E03ROCIP2",
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
                                     "E03ROCEDO",
                                     "E03ROCTS1",
                                     "E03ROCTS2",
                                     "E03ROCTS3",
                                     "E03ROCTS4",
                                     "E03ROCTS5",
                                     "F03ROCBNK",
                                     "F03ROCCUN",
                                     "F03ROCREF",
                                     "F03ROCSEQ",
                                     "F03ROCICN",
                                     "F03ROCICM",
                                     "F03ROCIPD",
                                     "F03ROCIP2",
                                     "F03ROCCIN",
                                     "F03ROCEMM",
                                     "F03ROCEMD",
                                     "F03ROCEMY",
                                     "F03ROCMD1",
                                     "F03ROCMD2",
                                     "F03ROCMD3",
                                     "F03ROCICY",
                                     "F03ROCIPA",
                                     "F03ROCCLF",
                                     "F03ROCRGK",
                                     "F03ROCEMB",
                                     "F03ROCUSC",
                                     "F03ROCCRR",
                                     "F03ROCEDO",
                                     "F03ROCTS1",
                                     "F03ROCTS2",
                                     "F03ROCTS3",
                                     "F03ROCTS4",
                                     "F03ROCTS5"
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
                                   "E03ROCSEQ",
                                   "E03ROCICN",
                                   "E03ROCICM",
                                   "E03ROCIPD",
                                   "E03ROCIP2",
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
                                   "E03ROCEDO",
                                   "E03ROCTS1",
                                   "E03ROCTS2",
                                   "E03ROCTS3",
                                   "E03ROCTS4",
                                   "E03ROCTS5",
                                   "F03ROCBNK",
                                   "F03ROCCUN",
                                   "F03ROCREF",
                                   "F03ROCSEQ",
                                   "F03ROCICN",
                                   "F03ROCICM",
                                   "F03ROCIPD",
                                   "F03ROCIP2",
                                   "F03ROCCIN",
                                   "F03ROCEMM",
                                   "F03ROCEMD",
                                   "F03ROCEMY",
                                   "F03ROCMD1",
                                   "F03ROCMD2",
                                   "F03ROCMD3",
                                   "F03ROCICY",
                                   "F03ROCIPA",
                                   "F03ROCCLF",
                                   "F03ROCRGK",
                                   "F03ROCEMB",
                                   "F03ROCUSC",
                                   "F03ROCCRR",
                                   "F03ROCEDO",
                                   "F03ROCTS1",
                                   "F03ROCTS2",
                                   "F03ROCTS3",
                                   "F03ROCTS4",
                                   "F03ROCTS5"
                                 };
  final static String fid = "1140714185623";
  final static String rid = "47280B4D75B6E";
  final static String fmtname = "ERA001003";
  final int FIELDCOUNT = 65;
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
  private DecimalField fieldE03ROCSEQ = null;
  private DecimalField fieldE03ROCICN = null;
  private CharacterField fieldE03ROCICM = null;
  private CharacterField fieldE03ROCIPD = null;
  private CharacterField fieldE03ROCIP2 = null;
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
  private CharacterField fieldE03ROCEDO = null;
  private CharacterField fieldE03ROCTS1 = null;
  private CharacterField fieldE03ROCTS2 = null;
  private CharacterField fieldE03ROCTS3 = null;
  private CharacterField fieldE03ROCTS4 = null;
  private CharacterField fieldE03ROCTS5 = null;
  private CharacterField fieldF03ROCBNK = null;
  private CharacterField fieldF03ROCCUN = null;
  private CharacterField fieldF03ROCREF = null;
  private CharacterField fieldF03ROCSEQ = null;
  private CharacterField fieldF03ROCICN = null;
  private CharacterField fieldF03ROCICM = null;
  private CharacterField fieldF03ROCIPD = null;
  private CharacterField fieldF03ROCIP2 = null;
  private CharacterField fieldF03ROCCIN = null;
  private CharacterField fieldF03ROCEMM = null;
  private CharacterField fieldF03ROCEMD = null;
  private CharacterField fieldF03ROCEMY = null;
  private CharacterField fieldF03ROCMD1 = null;
  private CharacterField fieldF03ROCMD2 = null;
  private CharacterField fieldF03ROCMD3 = null;
  private CharacterField fieldF03ROCICY = null;
  private CharacterField fieldF03ROCIPA = null;
  private CharacterField fieldF03ROCCLF = null;
  private CharacterField fieldF03ROCRGK = null;
  private CharacterField fieldF03ROCEMB = null;
  private CharacterField fieldF03ROCUSC = null;
  private CharacterField fieldF03ROCCRR = null;
  private CharacterField fieldF03ROCEDO = null;
  private CharacterField fieldF03ROCTS1 = null;
  private CharacterField fieldF03ROCTS2 = null;
  private CharacterField fieldF03ROCTS3 = null;
  private CharacterField fieldF03ROCTS4 = null;
  private CharacterField fieldF03ROCTS5 = null;

  /**
  * Constructor for ERA001003Message.
  */
  public ERA001003Message()
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
    recordsize = 346;
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
    fields[12] = fieldE03ROCSEQ =
    new DecimalField(message, HEADERSIZE + 67, 3, 0, "E03ROCSEQ");
    fields[13] = fieldE03ROCICN =
    new DecimalField(message, HEADERSIZE + 70, 6, 0, "E03ROCICN");
    fields[14] = fieldE03ROCICM =
    new CharacterField(message, HEADERSIZE + 76, 45, "E03ROCICM");
    fields[15] = fieldE03ROCIPD =
    new CharacterField(message, HEADERSIZE + 121, 45, "E03ROCIPD");
    fields[16] = fieldE03ROCIP2 =
    new CharacterField(message, HEADERSIZE + 166, 45, "E03ROCIP2");
    fields[17] = fieldE03ROCCIN =
    new CharacterField(message, HEADERSIZE + 211, 45, "E03ROCCIN");
    fields[18] = fieldE03ROCEMM =
    new DecimalField(message, HEADERSIZE + 256, 3, 0, "E03ROCEMM");
    fields[19] = fieldE03ROCEMD =
    new DecimalField(message, HEADERSIZE + 259, 3, 0, "E03ROCEMD");
    fields[20] = fieldE03ROCEMY =
    new DecimalField(message, HEADERSIZE + 262, 5, 0, "E03ROCEMY");
    fields[21] = fieldE03ROCMDM =
    new DecimalField(message, HEADERSIZE + 267, 3, 0, "E03ROCMDM");
    fields[22] = fieldE03ROCMDD =
    new DecimalField(message, HEADERSIZE + 270, 3, 0, "E03ROCMDD");
    fields[23] = fieldE03ROCMDY =
    new DecimalField(message, HEADERSIZE + 273, 5, 0, "E03ROCMDY");
    fields[24] = fieldE03ROCICY =
    new CharacterField(message, HEADERSIZE + 278, 3, "E03ROCICY");
    fields[25] = fieldE03ROCIPA =
    new DecimalField(message, HEADERSIZE + 281, 17, 2, "E03ROCIPA");
    fields[26] = fieldE03ROCCLF =
    new CharacterField(message, HEADERSIZE + 298, 1, "E03ROCCLF");
    fields[27] = fieldE03ROCRGK =
    new CharacterField(message, HEADERSIZE + 299, 1, "E03ROCRGK");
    fields[28] = fieldE03ROCEMB =
    new CharacterField(message, HEADERSIZE + 300, 4, "E03ROCEMB");
    fields[29] = fieldE03ROCUSC =
    new CharacterField(message, HEADERSIZE + 304, 4, "E03ROCUSC");
    fields[30] = fieldE03ROCCRR =
    new CharacterField(message, HEADERSIZE + 308, 4, "E03ROCCRR");
    fields[31] = fieldE03ROCEDO =
    new CharacterField(message, HEADERSIZE + 312, 1, "E03ROCEDO");
    fields[32] = fieldE03ROCTS1 =
    new CharacterField(message, HEADERSIZE + 313, 1, "E03ROCTS1");
    fields[33] = fieldE03ROCTS2 =
    new CharacterField(message, HEADERSIZE + 314, 1, "E03ROCTS2");
    fields[34] = fieldE03ROCTS3 =
    new CharacterField(message, HEADERSIZE + 315, 1, "E03ROCTS3");
    fields[35] = fieldE03ROCTS4 =
    new CharacterField(message, HEADERSIZE + 316, 1, "E03ROCTS4");
    fields[36] = fieldE03ROCTS5 =
    new CharacterField(message, HEADERSIZE + 317, 1, "E03ROCTS5");
    fields[37] = fieldF03ROCBNK =
    new CharacterField(message, HEADERSIZE + 318, 1, "F03ROCBNK");
    fields[38] = fieldF03ROCCUN =
    new CharacterField(message, HEADERSIZE + 319, 1, "F03ROCCUN");
    fields[39] = fieldF03ROCREF =
    new CharacterField(message, HEADERSIZE + 320, 1, "F03ROCREF");
    fields[40] = fieldF03ROCSEQ =
    new CharacterField(message, HEADERSIZE + 321, 1, "F03ROCSEQ");
    fields[41] = fieldF03ROCICN =
    new CharacterField(message, HEADERSIZE + 322, 1, "F03ROCICN");
    fields[42] = fieldF03ROCICM =
    new CharacterField(message, HEADERSIZE + 323, 1, "F03ROCICM");
    fields[43] = fieldF03ROCIPD =
    new CharacterField(message, HEADERSIZE + 324, 1, "F03ROCIPD");
    fields[44] = fieldF03ROCIP2 =
    new CharacterField(message, HEADERSIZE + 325, 1, "F03ROCIP2");
    fields[45] = fieldF03ROCCIN =
    new CharacterField(message, HEADERSIZE + 326, 1, "F03ROCCIN");
    fields[46] = fieldF03ROCEMM =
    new CharacterField(message, HEADERSIZE + 327, 1, "F03ROCEMM");
    fields[47] = fieldF03ROCEMD =
    new CharacterField(message, HEADERSIZE + 328, 1, "F03ROCEMD");
    fields[48] = fieldF03ROCEMY =
    new CharacterField(message, HEADERSIZE + 329, 1, "F03ROCEMY");
    fields[49] = fieldF03ROCMD1 =
    new CharacterField(message, HEADERSIZE + 330, 1, "F03ROCMD1");
    fields[50] = fieldF03ROCMD2 =
    new CharacterField(message, HEADERSIZE + 331, 1, "F03ROCMD2");
    fields[51] = fieldF03ROCMD3 =
    new CharacterField(message, HEADERSIZE + 332, 1, "F03ROCMD3");
    fields[52] = fieldF03ROCICY =
    new CharacterField(message, HEADERSIZE + 333, 1, "F03ROCICY");
    fields[53] = fieldF03ROCIPA =
    new CharacterField(message, HEADERSIZE + 334, 1, "F03ROCIPA");
    fields[54] = fieldF03ROCCLF =
    new CharacterField(message, HEADERSIZE + 335, 1, "F03ROCCLF");
    fields[55] = fieldF03ROCRGK =
    new CharacterField(message, HEADERSIZE + 336, 1, "F03ROCRGK");
    fields[56] = fieldF03ROCEMB =
    new CharacterField(message, HEADERSIZE + 337, 1, "F03ROCEMB");
    fields[57] = fieldF03ROCUSC =
    new CharacterField(message, HEADERSIZE + 338, 1, "F03ROCUSC");
    fields[58] = fieldF03ROCCRR =
    new CharacterField(message, HEADERSIZE + 339, 1, "F03ROCCRR");
    fields[59] = fieldF03ROCEDO =
    new CharacterField(message, HEADERSIZE + 340, 1, "F03ROCEDO");
    fields[60] = fieldF03ROCTS1 =
    new CharacterField(message, HEADERSIZE + 341, 1, "F03ROCTS1");
    fields[61] = fieldF03ROCTS2 =
    new CharacterField(message, HEADERSIZE + 342, 1, "F03ROCTS2");
    fields[62] = fieldF03ROCTS3 =
    new CharacterField(message, HEADERSIZE + 343, 1, "F03ROCTS3");
    fields[63] = fieldF03ROCTS4 =
    new CharacterField(message, HEADERSIZE + 344, 1, "F03ROCTS4");
    fields[64] = fieldF03ROCTS5 =
    new CharacterField(message, HEADERSIZE + 345, 1, "F03ROCTS5");

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
  * Set field E03ROCSEQ using a String value.
  */
  public void setE03ROCSEQ(String newvalue)
  {
    fieldE03ROCSEQ.setString(newvalue);
  }

  /**
  * Get value of field E03ROCSEQ as a String.
  */
  public String getE03ROCSEQ()
  {
    return fieldE03ROCSEQ.getString();
  }

  /**
  * Set numeric field E03ROCSEQ using a BigDecimal value.
  */
  public void setE03ROCSEQ(BigDecimal newvalue)
  {
    fieldE03ROCSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ROCSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ROCSEQ()
  {
    return fieldE03ROCSEQ.getBigDecimal();
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
  * Set numeric field E03ROCICN using a BigDecimal value.
  */
  public void setE03ROCICN(BigDecimal newvalue)
  {
    fieldE03ROCICN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ROCICN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ROCICN()
  {
    return fieldE03ROCICN.getBigDecimal();
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
  * Set field E03ROCIP2 using a String value.
  */
  public void setE03ROCIP2(String newvalue)
  {
    fieldE03ROCIP2.setString(newvalue);
  }

  /**
  * Get value of field E03ROCIP2 as a String.
  */
  public String getE03ROCIP2()
  {
    return fieldE03ROCIP2.getString();
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

  /**
  * Set field F03ROCBNK using a String value.
  */
  public void setF03ROCBNK(String newvalue)
  {
    fieldF03ROCBNK.setString(newvalue);
  }

  /**
  * Get value of field F03ROCBNK as a String.
  */
  public String getF03ROCBNK()
  {
    return fieldF03ROCBNK.getString();
  }

  /**
  * Set field F03ROCCUN using a String value.
  */
  public void setF03ROCCUN(String newvalue)
  {
    fieldF03ROCCUN.setString(newvalue);
  }

  /**
  * Get value of field F03ROCCUN as a String.
  */
  public String getF03ROCCUN()
  {
    return fieldF03ROCCUN.getString();
  }

  /**
  * Set field F03ROCREF using a String value.
  */
  public void setF03ROCREF(String newvalue)
  {
    fieldF03ROCREF.setString(newvalue);
  }

  /**
  * Get value of field F03ROCREF as a String.
  */
  public String getF03ROCREF()
  {
    return fieldF03ROCREF.getString();
  }

  /**
  * Set field F03ROCSEQ using a String value.
  */
  public void setF03ROCSEQ(String newvalue)
  {
    fieldF03ROCSEQ.setString(newvalue);
  }

  /**
  * Get value of field F03ROCSEQ as a String.
  */
  public String getF03ROCSEQ()
  {
    return fieldF03ROCSEQ.getString();
  }

  /**
  * Set field F03ROCICN using a String value.
  */
  public void setF03ROCICN(String newvalue)
  {
    fieldF03ROCICN.setString(newvalue);
  }

  /**
  * Get value of field F03ROCICN as a String.
  */
  public String getF03ROCICN()
  {
    return fieldF03ROCICN.getString();
  }

  /**
  * Set field F03ROCICM using a String value.
  */
  public void setF03ROCICM(String newvalue)
  {
    fieldF03ROCICM.setString(newvalue);
  }

  /**
  * Get value of field F03ROCICM as a String.
  */
  public String getF03ROCICM()
  {
    return fieldF03ROCICM.getString();
  }

  /**
  * Set field F03ROCIPD using a String value.
  */
  public void setF03ROCIPD(String newvalue)
  {
    fieldF03ROCIPD.setString(newvalue);
  }

  /**
  * Get value of field F03ROCIPD as a String.
  */
  public String getF03ROCIPD()
  {
    return fieldF03ROCIPD.getString();
  }

  /**
  * Set field F03ROCIP2 using a String value.
  */
  public void setF03ROCIP2(String newvalue)
  {
    fieldF03ROCIP2.setString(newvalue);
  }

  /**
  * Get value of field F03ROCIP2 as a String.
  */
  public String getF03ROCIP2()
  {
    return fieldF03ROCIP2.getString();
  }

  /**
  * Set field F03ROCCIN using a String value.
  */
  public void setF03ROCCIN(String newvalue)
  {
    fieldF03ROCCIN.setString(newvalue);
  }

  /**
  * Get value of field F03ROCCIN as a String.
  */
  public String getF03ROCCIN()
  {
    return fieldF03ROCCIN.getString();
  }

  /**
  * Set field F03ROCEMM using a String value.
  */
  public void setF03ROCEMM(String newvalue)
  {
    fieldF03ROCEMM.setString(newvalue);
  }

  /**
  * Get value of field F03ROCEMM as a String.
  */
  public String getF03ROCEMM()
  {
    return fieldF03ROCEMM.getString();
  }

  /**
  * Set field F03ROCEMD using a String value.
  */
  public void setF03ROCEMD(String newvalue)
  {
    fieldF03ROCEMD.setString(newvalue);
  }

  /**
  * Get value of field F03ROCEMD as a String.
  */
  public String getF03ROCEMD()
  {
    return fieldF03ROCEMD.getString();
  }

  /**
  * Set field F03ROCEMY using a String value.
  */
  public void setF03ROCEMY(String newvalue)
  {
    fieldF03ROCEMY.setString(newvalue);
  }

  /**
  * Get value of field F03ROCEMY as a String.
  */
  public String getF03ROCEMY()
  {
    return fieldF03ROCEMY.getString();
  }

  /**
  * Set field F03ROCMD1 using a String value.
  */
  public void setF03ROCMD1(String newvalue)
  {
    fieldF03ROCMD1.setString(newvalue);
  }

  /**
  * Get value of field F03ROCMD1 as a String.
  */
  public String getF03ROCMD1()
  {
    return fieldF03ROCMD1.getString();
  }

  /**
  * Set field F03ROCMD2 using a String value.
  */
  public void setF03ROCMD2(String newvalue)
  {
    fieldF03ROCMD2.setString(newvalue);
  }

  /**
  * Get value of field F03ROCMD2 as a String.
  */
  public String getF03ROCMD2()
  {
    return fieldF03ROCMD2.getString();
  }

  /**
  * Set field F03ROCMD3 using a String value.
  */
  public void setF03ROCMD3(String newvalue)
  {
    fieldF03ROCMD3.setString(newvalue);
  }

  /**
  * Get value of field F03ROCMD3 as a String.
  */
  public String getF03ROCMD3()
  {
    return fieldF03ROCMD3.getString();
  }

  /**
  * Set field F03ROCICY using a String value.
  */
  public void setF03ROCICY(String newvalue)
  {
    fieldF03ROCICY.setString(newvalue);
  }

  /**
  * Get value of field F03ROCICY as a String.
  */
  public String getF03ROCICY()
  {
    return fieldF03ROCICY.getString();
  }

  /**
  * Set field F03ROCIPA using a String value.
  */
  public void setF03ROCIPA(String newvalue)
  {
    fieldF03ROCIPA.setString(newvalue);
  }

  /**
  * Get value of field F03ROCIPA as a String.
  */
  public String getF03ROCIPA()
  {
    return fieldF03ROCIPA.getString();
  }

  /**
  * Set field F03ROCCLF using a String value.
  */
  public void setF03ROCCLF(String newvalue)
  {
    fieldF03ROCCLF.setString(newvalue);
  }

  /**
  * Get value of field F03ROCCLF as a String.
  */
  public String getF03ROCCLF()
  {
    return fieldF03ROCCLF.getString();
  }

  /**
  * Set field F03ROCRGK using a String value.
  */
  public void setF03ROCRGK(String newvalue)
  {
    fieldF03ROCRGK.setString(newvalue);
  }

  /**
  * Get value of field F03ROCRGK as a String.
  */
  public String getF03ROCRGK()
  {
    return fieldF03ROCRGK.getString();
  }

  /**
  * Set field F03ROCEMB using a String value.
  */
  public void setF03ROCEMB(String newvalue)
  {
    fieldF03ROCEMB.setString(newvalue);
  }

  /**
  * Get value of field F03ROCEMB as a String.
  */
  public String getF03ROCEMB()
  {
    return fieldF03ROCEMB.getString();
  }

  /**
  * Set field F03ROCUSC using a String value.
  */
  public void setF03ROCUSC(String newvalue)
  {
    fieldF03ROCUSC.setString(newvalue);
  }

  /**
  * Get value of field F03ROCUSC as a String.
  */
  public String getF03ROCUSC()
  {
    return fieldF03ROCUSC.getString();
  }

  /**
  * Set field F03ROCCRR using a String value.
  */
  public void setF03ROCCRR(String newvalue)
  {
    fieldF03ROCCRR.setString(newvalue);
  }

  /**
  * Get value of field F03ROCCRR as a String.
  */
  public String getF03ROCCRR()
  {
    return fieldF03ROCCRR.getString();
  }

  /**
  * Set field F03ROCEDO using a String value.
  */
  public void setF03ROCEDO(String newvalue)
  {
    fieldF03ROCEDO.setString(newvalue);
  }

  /**
  * Get value of field F03ROCEDO as a String.
  */
  public String getF03ROCEDO()
  {
    return fieldF03ROCEDO.getString();
  }

  /**
  * Set field F03ROCTS1 using a String value.
  */
  public void setF03ROCTS1(String newvalue)
  {
    fieldF03ROCTS1.setString(newvalue);
  }

  /**
  * Get value of field F03ROCTS1 as a String.
  */
  public String getF03ROCTS1()
  {
    return fieldF03ROCTS1.getString();
  }

  /**
  * Set field F03ROCTS2 using a String value.
  */
  public void setF03ROCTS2(String newvalue)
  {
    fieldF03ROCTS2.setString(newvalue);
  }

  /**
  * Get value of field F03ROCTS2 as a String.
  */
  public String getF03ROCTS2()
  {
    return fieldF03ROCTS2.getString();
  }

  /**
  * Set field F03ROCTS3 using a String value.
  */
  public void setF03ROCTS3(String newvalue)
  {
    fieldF03ROCTS3.setString(newvalue);
  }

  /**
  * Get value of field F03ROCTS3 as a String.
  */
  public String getF03ROCTS3()
  {
    return fieldF03ROCTS3.getString();
  }

  /**
  * Set field F03ROCTS4 using a String value.
  */
  public void setF03ROCTS4(String newvalue)
  {
    fieldF03ROCTS4.setString(newvalue);
  }

  /**
  * Get value of field F03ROCTS4 as a String.
  */
  public String getF03ROCTS4()
  {
    return fieldF03ROCTS4.getString();
  }

  /**
  * Set field F03ROCTS5 using a String value.
  */
  public void setF03ROCTS5(String newvalue)
  {
    fieldF03ROCTS5.setString(newvalue);
  }

  /**
  * Get value of field F03ROCTS5 as a String.
  */
  public String getF03ROCTS5()
  {
    return fieldF03ROCTS5.getString();
  }

}