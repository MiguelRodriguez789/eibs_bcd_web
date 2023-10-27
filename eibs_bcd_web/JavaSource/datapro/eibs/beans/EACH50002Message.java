package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EACH50002 physical file definition.
* 
* File level identifier is 1130516182855.
* Record format level identifier is 5771601E241BA.
*/

public class EACH50002Message extends MessageRecord
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
                                     "E02REQTYP",
                                     "E02REQSTS",
                                     "E02REQNUM",
                                     "E02ACUBNK",
                                     "E02ACUNUM",
                                     "E02ACUCUN",
                                     "E02ACUACC",
                                     "E02ACUOCD",
                                     "E02ACUVDY",
                                     "E02ACUVDM",
                                     "E02ACUVDD",
                                     "E02ACUBTH",
                                     "E02ACUECD",
                                     "E02ACUROU",
                                     "E02ACUDAC",
                                     "E02ACUACT",
                                     "E02ACUCCY",
                                     "E02ACUAMT",
                                     "E02ACUCDE",
                                     "E02ACUIDN",
                                     "E02ACUNME",
                                     "E02ACUADR",
                                     "E02ACUCSZ",
                                     "E02ACUEMA",
                                     "E02ACURDY",
                                     "E02ACURDM",
                                     "E02ACURDD",
                                     "E02ACUSTS",
                                     "E02ACURTS",
                                     "E02ACUPTS",
                                     "E02ACUSTC",
                                     "E02CUNDSC",
                                     "E02OCDDSC",
                                     "E02ECDDSC",
                                     "E02CDEDSC",
                                     "E02ACUREF",
                                     "E02ACUAD1",
                                     "E02ACUAD2",
                                     "E02ACUAD3",
                                     "E02ACUAD4",
                                     "E02ACUAD5",
                                     "E02ACUAD6",
                                     "E02ACUAD7",
                                     "E02ACUAD8",
                                     "E02ACUAD9",
                                     "E02ACUADA",
                                     "E02ACUADB",
                                     "E02ACUADC"
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
                                   "E02REQTYP",
                                   "E02REQSTS",
                                   "E02REQNUM",
                                   "E02ACUBNK",
                                   "E02ACUNUM",
                                   "E02ACUCUN",
                                   "E02ACUACC",
                                   "E02ACUOCD",
                                   "E02ACUVDY",
                                   "E02ACUVDM",
                                   "E02ACUVDD",
                                   "E02ACUBTH",
                                   "E02ACUECD",
                                   "E02ACUROU",
                                   "E02ACUDAC",
                                   "E02ACUACT",
                                   "E02ACUCCY",
                                   "E02ACUAMT",
                                   "E02ACUCDE",
                                   "E02ACUIDN",
                                   "E02ACUNME",
                                   "E02ACUADR",
                                   "E02ACUCSZ",
                                   "E02ACUEMA",
                                   "E02ACURDY",
                                   "E02ACURDM",
                                   "E02ACURDD",
                                   "E02ACUSTS",
                                   "E02ACURTS",
                                   "E02ACUPTS",
                                   "E02ACUSTC",
                                   "E02CUNDSC",
                                   "E02OCDDSC",
                                   "E02ECDDSC",
                                   "E02CDEDSC",
                                   "E02ACUREF",
                                   "E02ACUAD1",
                                   "E02ACUAD2",
                                   "E02ACUAD3",
                                   "E02ACUAD4",
                                   "E02ACUAD5",
                                   "E02ACUAD6",
                                   "E02ACUAD7",
                                   "E02ACUAD8",
                                   "E02ACUAD9",
                                   "E02ACUADA",
                                   "E02ACUADB",
                                   "E02ACUADC"
                                 };
  final static String fid = "1130516182855";
  final static String rid = "5771601E241BA";
  final static String fmtname = "EACH50002";
  final int FIELDCOUNT = 57;
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
  private CharacterField fieldE02REQTYP = null;
  private CharacterField fieldE02REQSTS = null;
  private DecimalField fieldE02REQNUM = null;
  private CharacterField fieldE02ACUBNK = null;
  private DecimalField fieldE02ACUNUM = null;
  private DecimalField fieldE02ACUCUN = null;
  private DecimalField fieldE02ACUACC = null;
  private CharacterField fieldE02ACUOCD = null;
  private DecimalField fieldE02ACUVDY = null;
  private DecimalField fieldE02ACUVDM = null;
  private DecimalField fieldE02ACUVDD = null;
  private DecimalField fieldE02ACUBTH = null;
  private CharacterField fieldE02ACUECD = null;
  private CharacterField fieldE02ACUROU = null;
  private CharacterField fieldE02ACUDAC = null;
  private CharacterField fieldE02ACUACT = null;
  private CharacterField fieldE02ACUCCY = null;
  private DecimalField fieldE02ACUAMT = null;
  private CharacterField fieldE02ACUCDE = null;
  private CharacterField fieldE02ACUIDN = null;
  private CharacterField fieldE02ACUNME = null;
  private CharacterField fieldE02ACUADR = null;
  private CharacterField fieldE02ACUCSZ = null;
  private CharacterField fieldE02ACUEMA = null;
  private DecimalField fieldE02ACURDY = null;
  private DecimalField fieldE02ACURDM = null;
  private DecimalField fieldE02ACURDD = null;
  private CharacterField fieldE02ACUSTS = null;
  private DecimalField fieldE02ACURTS = null;
  private DecimalField fieldE02ACUPTS = null;
  private CharacterField fieldE02ACUSTC = null;
  private CharacterField fieldE02CUNDSC = null;
  private CharacterField fieldE02OCDDSC = null;
  private CharacterField fieldE02ECDDSC = null;
  private CharacterField fieldE02CDEDSC = null;
  private DecimalField fieldE02ACUREF = null;
  private CharacterField fieldE02ACUAD1 = null;
  private CharacterField fieldE02ACUAD2 = null;
  private CharacterField fieldE02ACUAD3 = null;
  private CharacterField fieldE02ACUAD4 = null;
  private CharacterField fieldE02ACUAD5 = null;
  private CharacterField fieldE02ACUAD6 = null;
  private CharacterField fieldE02ACUAD7 = null;
  private CharacterField fieldE02ACUAD8 = null;
  private CharacterField fieldE02ACUAD9 = null;
  private CharacterField fieldE02ACUADA = null;
  private CharacterField fieldE02ACUADB = null;
  private CharacterField fieldE02ACUADC = null;

  /**
  * Constructor for EACH50002Message.
  */
  public EACH50002Message()
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
    recordsize = 1709;
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
    fields[9] = fieldE02REQTYP =
    new CharacterField(message, HEADERSIZE + 42, 1, "E02REQTYP");
    fields[10] = fieldE02REQSTS =
    new CharacterField(message, HEADERSIZE + 43, 1, "E02REQSTS");
    fields[11] = fieldE02REQNUM =
    new DecimalField(message, HEADERSIZE + 44, 13, 0, "E02REQNUM");
    fields[12] = fieldE02ACUBNK =
    new CharacterField(message, HEADERSIZE + 57, 2, "E02ACUBNK");
    fields[13] = fieldE02ACUNUM =
    new DecimalField(message, HEADERSIZE + 59, 13, 0, "E02ACUNUM");
    fields[14] = fieldE02ACUCUN =
    new DecimalField(message, HEADERSIZE + 72, 10, 0, "E02ACUCUN");
    fields[15] = fieldE02ACUACC =
    new DecimalField(message, HEADERSIZE + 82, 17, 0, "E02ACUACC");
    fields[16] = fieldE02ACUOCD =
    new CharacterField(message, HEADERSIZE + 99, 10, "E02ACUOCD");
    fields[17] = fieldE02ACUVDY =
    new DecimalField(message, HEADERSIZE + 109, 5, 0, "E02ACUVDY");
    fields[18] = fieldE02ACUVDM =
    new DecimalField(message, HEADERSIZE + 114, 3, 0, "E02ACUVDM");
    fields[19] = fieldE02ACUVDD =
    new DecimalField(message, HEADERSIZE + 117, 3, 0, "E02ACUVDD");
    fields[20] = fieldE02ACUBTH =
    new DecimalField(message, HEADERSIZE + 120, 5, 0, "E02ACUBTH");
    fields[21] = fieldE02ACUECD =
    new CharacterField(message, HEADERSIZE + 125, 3, "E02ACUECD");
    fields[22] = fieldE02ACUROU =
    new CharacterField(message, HEADERSIZE + 128, 9, "E02ACUROU");
    fields[23] = fieldE02ACUDAC =
    new CharacterField(message, HEADERSIZE + 137, 17, "E02ACUDAC");
    fields[24] = fieldE02ACUACT =
    new CharacterField(message, HEADERSIZE + 154, 1, "E02ACUACT");
    fields[25] = fieldE02ACUCCY =
    new CharacterField(message, HEADERSIZE + 155, 3, "E02ACUCCY");
    fields[26] = fieldE02ACUAMT =
    new DecimalField(message, HEADERSIZE + 158, 17, 2, "E02ACUAMT");
    fields[27] = fieldE02ACUCDE =
    new CharacterField(message, HEADERSIZE + 175, 2, "E02ACUCDE");
    fields[28] = fieldE02ACUIDN =
    new CharacterField(message, HEADERSIZE + 177, 15, "E02ACUIDN");
    fields[29] = fieldE02ACUNME =
    new CharacterField(message, HEADERSIZE + 192, 45, "E02ACUNME");
    fields[30] = fieldE02ACUADR =
    new CharacterField(message, HEADERSIZE + 237, 45, "E02ACUADR");
    fields[31] = fieldE02ACUCSZ =
    new CharacterField(message, HEADERSIZE + 282, 45, "E02ACUCSZ");
    fields[32] = fieldE02ACUEMA =
    new CharacterField(message, HEADERSIZE + 327, 60, "E02ACUEMA");
    fields[33] = fieldE02ACURDY =
    new DecimalField(message, HEADERSIZE + 387, 5, 0, "E02ACURDY");
    fields[34] = fieldE02ACURDM =
    new DecimalField(message, HEADERSIZE + 392, 3, 0, "E02ACURDM");
    fields[35] = fieldE02ACURDD =
    new DecimalField(message, HEADERSIZE + 395, 3, 0, "E02ACURDD");
    fields[36] = fieldE02ACUSTS =
    new CharacterField(message, HEADERSIZE + 398, 1, "E02ACUSTS");
    fields[37] = fieldE02ACURTS =
    new DecimalField(message, HEADERSIZE + 399, 13, 0, "E02ACURTS");
    fields[38] = fieldE02ACUPTS =
    new DecimalField(message, HEADERSIZE + 412, 13, 0, "E02ACUPTS");
    fields[39] = fieldE02ACUSTC =
    new CharacterField(message, HEADERSIZE + 425, 3, "E02ACUSTC");
    fields[40] = fieldE02CUNDSC =
    new CharacterField(message, HEADERSIZE + 428, 35, "E02CUNDSC");
    fields[41] = fieldE02OCDDSC =
    new CharacterField(message, HEADERSIZE + 463, 35, "E02OCDDSC");
    fields[42] = fieldE02ECDDSC =
    new CharacterField(message, HEADERSIZE + 498, 35, "E02ECDDSC");
    fields[43] = fieldE02CDEDSC =
    new CharacterField(message, HEADERSIZE + 533, 35, "E02CDEDSC");
    fields[44] = fieldE02ACUREF =
    new DecimalField(message, HEADERSIZE + 568, 13, 0, "E02ACUREF");
    fields[45] = fieldE02ACUAD1 =
    new CharacterField(message, HEADERSIZE + 581, 94, "E02ACUAD1");
    fields[46] = fieldE02ACUAD2 =
    new CharacterField(message, HEADERSIZE + 675, 94, "E02ACUAD2");
    fields[47] = fieldE02ACUAD3 =
    new CharacterField(message, HEADERSIZE + 769, 94, "E02ACUAD3");
    fields[48] = fieldE02ACUAD4 =
    new CharacterField(message, HEADERSIZE + 863, 94, "E02ACUAD4");
    fields[49] = fieldE02ACUAD5 =
    new CharacterField(message, HEADERSIZE + 957, 94, "E02ACUAD5");
    fields[50] = fieldE02ACUAD6 =
    new CharacterField(message, HEADERSIZE + 1051, 94, "E02ACUAD6");
    fields[51] = fieldE02ACUAD7 =
    new CharacterField(message, HEADERSIZE + 1145, 94, "E02ACUAD7");
    fields[52] = fieldE02ACUAD8 =
    new CharacterField(message, HEADERSIZE + 1239, 94, "E02ACUAD8");
    fields[53] = fieldE02ACUAD9 =
    new CharacterField(message, HEADERSIZE + 1333, 94, "E02ACUAD9");
    fields[54] = fieldE02ACUADA =
    new CharacterField(message, HEADERSIZE + 1427, 94, "E02ACUADA");
    fields[55] = fieldE02ACUADB =
    new CharacterField(message, HEADERSIZE + 1521, 94, "E02ACUADB");
    fields[56] = fieldE02ACUADC =
    new CharacterField(message, HEADERSIZE + 1615, 94, "E02ACUADC");

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
  * Set field E02REQTYP using a String value.
  */
  public void setE02REQTYP(String newvalue)
  {
    fieldE02REQTYP.setString(newvalue);
  }

  /**
  * Get value of field E02REQTYP as a String.
  */
  public String getE02REQTYP()
  {
    return fieldE02REQTYP.getString();
  }

  /**
  * Set field E02REQSTS using a String value.
  */
  public void setE02REQSTS(String newvalue)
  {
    fieldE02REQSTS.setString(newvalue);
  }

  /**
  * Get value of field E02REQSTS as a String.
  */
  public String getE02REQSTS()
  {
    return fieldE02REQSTS.getString();
  }

  /**
  * Set field E02REQNUM using a String value.
  */
  public void setE02REQNUM(String newvalue)
  {
    fieldE02REQNUM.setString(newvalue);
  }

  /**
  * Get value of field E02REQNUM as a String.
  */
  public String getE02REQNUM()
  {
    return fieldE02REQNUM.getString();
  }

  /**
  * Set numeric field E02REQNUM using a BigDecimal value.
  */
  public void setE02REQNUM(BigDecimal newvalue)
  {
    fieldE02REQNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02REQNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02REQNUM()
  {
    return fieldE02REQNUM.getBigDecimal();
  }

  /**
  * Set field E02ACUBNK using a String value.
  */
  public void setE02ACUBNK(String newvalue)
  {
    fieldE02ACUBNK.setString(newvalue);
  }

  /**
  * Get value of field E02ACUBNK as a String.
  */
  public String getE02ACUBNK()
  {
    return fieldE02ACUBNK.getString();
  }

  /**
  * Set field E02ACUNUM using a String value.
  */
  public void setE02ACUNUM(String newvalue)
  {
    fieldE02ACUNUM.setString(newvalue);
  }

  /**
  * Get value of field E02ACUNUM as a String.
  */
  public String getE02ACUNUM()
  {
    return fieldE02ACUNUM.getString();
  }

  /**
  * Set numeric field E02ACUNUM using a BigDecimal value.
  */
  public void setE02ACUNUM(BigDecimal newvalue)
  {
    fieldE02ACUNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACUNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACUNUM()
  {
    return fieldE02ACUNUM.getBigDecimal();
  }

  /**
  * Set field E02ACUCUN using a String value.
  */
  public void setE02ACUCUN(String newvalue)
  {
    fieldE02ACUCUN.setString(newvalue);
  }

  /**
  * Get value of field E02ACUCUN as a String.
  */
  public String getE02ACUCUN()
  {
    return fieldE02ACUCUN.getString();
  }

  /**
  * Set numeric field E02ACUCUN using a BigDecimal value.
  */
  public void setE02ACUCUN(BigDecimal newvalue)
  {
    fieldE02ACUCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACUCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACUCUN()
  {
    return fieldE02ACUCUN.getBigDecimal();
  }

  /**
  * Set field E02ACUACC using a String value.
  */
  public void setE02ACUACC(String newvalue)
  {
    fieldE02ACUACC.setString(newvalue);
  }

  /**
  * Get value of field E02ACUACC as a String.
  */
  public String getE02ACUACC()
  {
    return fieldE02ACUACC.getString();
  }

  /**
  * Set numeric field E02ACUACC using a BigDecimal value.
  */
  public void setE02ACUACC(BigDecimal newvalue)
  {
    fieldE02ACUACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACUACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACUACC()
  {
    return fieldE02ACUACC.getBigDecimal();
  }

  /**
  * Set field E02ACUOCD using a String value.
  */
  public void setE02ACUOCD(String newvalue)
  {
    fieldE02ACUOCD.setString(newvalue);
  }

  /**
  * Get value of field E02ACUOCD as a String.
  */
  public String getE02ACUOCD()
  {
    return fieldE02ACUOCD.getString();
  }

  /**
  * Set field E02ACUVDY using a String value.
  */
  public void setE02ACUVDY(String newvalue)
  {
    fieldE02ACUVDY.setString(newvalue);
  }

  /**
  * Get value of field E02ACUVDY as a String.
  */
  public String getE02ACUVDY()
  {
    return fieldE02ACUVDY.getString();
  }

  /**
  * Set numeric field E02ACUVDY using a BigDecimal value.
  */
  public void setE02ACUVDY(BigDecimal newvalue)
  {
    fieldE02ACUVDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACUVDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACUVDY()
  {
    return fieldE02ACUVDY.getBigDecimal();
  }

  /**
  * Set field E02ACUVDM using a String value.
  */
  public void setE02ACUVDM(String newvalue)
  {
    fieldE02ACUVDM.setString(newvalue);
  }

  /**
  * Get value of field E02ACUVDM as a String.
  */
  public String getE02ACUVDM()
  {
    return fieldE02ACUVDM.getString();
  }

  /**
  * Set numeric field E02ACUVDM using a BigDecimal value.
  */
  public void setE02ACUVDM(BigDecimal newvalue)
  {
    fieldE02ACUVDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACUVDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACUVDM()
  {
    return fieldE02ACUVDM.getBigDecimal();
  }

  /**
  * Set field E02ACUVDD using a String value.
  */
  public void setE02ACUVDD(String newvalue)
  {
    fieldE02ACUVDD.setString(newvalue);
  }

  /**
  * Get value of field E02ACUVDD as a String.
  */
  public String getE02ACUVDD()
  {
    return fieldE02ACUVDD.getString();
  }

  /**
  * Set numeric field E02ACUVDD using a BigDecimal value.
  */
  public void setE02ACUVDD(BigDecimal newvalue)
  {
    fieldE02ACUVDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACUVDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACUVDD()
  {
    return fieldE02ACUVDD.getBigDecimal();
  }

  /**
  * Set field E02ACUBTH using a String value.
  */
  public void setE02ACUBTH(String newvalue)
  {
    fieldE02ACUBTH.setString(newvalue);
  }

  /**
  * Get value of field E02ACUBTH as a String.
  */
  public String getE02ACUBTH()
  {
    return fieldE02ACUBTH.getString();
  }

  /**
  * Set numeric field E02ACUBTH using a BigDecimal value.
  */
  public void setE02ACUBTH(BigDecimal newvalue)
  {
    fieldE02ACUBTH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACUBTH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACUBTH()
  {
    return fieldE02ACUBTH.getBigDecimal();
  }

  /**
  * Set field E02ACUECD using a String value.
  */
  public void setE02ACUECD(String newvalue)
  {
    fieldE02ACUECD.setString(newvalue);
  }

  /**
  * Get value of field E02ACUECD as a String.
  */
  public String getE02ACUECD()
  {
    return fieldE02ACUECD.getString();
  }

  /**
  * Set field E02ACUROU using a String value.
  */
  public void setE02ACUROU(String newvalue)
  {
    fieldE02ACUROU.setString(newvalue);
  }

  /**
  * Get value of field E02ACUROU as a String.
  */
  public String getE02ACUROU()
  {
    return fieldE02ACUROU.getString();
  }

  /**
  * Set field E02ACUDAC using a String value.
  */
  public void setE02ACUDAC(String newvalue)
  {
    fieldE02ACUDAC.setString(newvalue);
  }

  /**
  * Get value of field E02ACUDAC as a String.
  */
  public String getE02ACUDAC()
  {
    return fieldE02ACUDAC.getString();
  }

  /**
  * Set field E02ACUACT using a String value.
  */
  public void setE02ACUACT(String newvalue)
  {
    fieldE02ACUACT.setString(newvalue);
  }

  /**
  * Get value of field E02ACUACT as a String.
  */
  public String getE02ACUACT()
  {
    return fieldE02ACUACT.getString();
  }

  /**
  * Set field E02ACUCCY using a String value.
  */
  public void setE02ACUCCY(String newvalue)
  {
    fieldE02ACUCCY.setString(newvalue);
  }

  /**
  * Get value of field E02ACUCCY as a String.
  */
  public String getE02ACUCCY()
  {
    return fieldE02ACUCCY.getString();
  }

  /**
  * Set field E02ACUAMT using a String value.
  */
  public void setE02ACUAMT(String newvalue)
  {
    fieldE02ACUAMT.setString(newvalue);
  }

  /**
  * Get value of field E02ACUAMT as a String.
  */
  public String getE02ACUAMT()
  {
    return fieldE02ACUAMT.getString();
  }

  /**
  * Set numeric field E02ACUAMT using a BigDecimal value.
  */
  public void setE02ACUAMT(BigDecimal newvalue)
  {
    fieldE02ACUAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACUAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACUAMT()
  {
    return fieldE02ACUAMT.getBigDecimal();
  }

  /**
  * Set field E02ACUCDE using a String value.
  */
  public void setE02ACUCDE(String newvalue)
  {
    fieldE02ACUCDE.setString(newvalue);
  }

  /**
  * Get value of field E02ACUCDE as a String.
  */
  public String getE02ACUCDE()
  {
    return fieldE02ACUCDE.getString();
  }

  /**
  * Set field E02ACUIDN using a String value.
  */
  public void setE02ACUIDN(String newvalue)
  {
    fieldE02ACUIDN.setString(newvalue);
  }

  /**
  * Get value of field E02ACUIDN as a String.
  */
  public String getE02ACUIDN()
  {
    return fieldE02ACUIDN.getString();
  }

  /**
  * Set field E02ACUNME using a String value.
  */
  public void setE02ACUNME(String newvalue)
  {
    fieldE02ACUNME.setString(newvalue);
  }

  /**
  * Get value of field E02ACUNME as a String.
  */
  public String getE02ACUNME()
  {
    return fieldE02ACUNME.getString();
  }

  /**
  * Set field E02ACUADR using a String value.
  */
  public void setE02ACUADR(String newvalue)
  {
    fieldE02ACUADR.setString(newvalue);
  }

  /**
  * Get value of field E02ACUADR as a String.
  */
  public String getE02ACUADR()
  {
    return fieldE02ACUADR.getString();
  }

  /**
  * Set field E02ACUCSZ using a String value.
  */
  public void setE02ACUCSZ(String newvalue)
  {
    fieldE02ACUCSZ.setString(newvalue);
  }

  /**
  * Get value of field E02ACUCSZ as a String.
  */
  public String getE02ACUCSZ()
  {
    return fieldE02ACUCSZ.getString();
  }

  /**
  * Set field E02ACUEMA using a String value.
  */
  public void setE02ACUEMA(String newvalue)
  {
    fieldE02ACUEMA.setString(newvalue);
  }

  /**
  * Get value of field E02ACUEMA as a String.
  */
  public String getE02ACUEMA()
  {
    return fieldE02ACUEMA.getString();
  }

  /**
  * Set field E02ACURDY using a String value.
  */
  public void setE02ACURDY(String newvalue)
  {
    fieldE02ACURDY.setString(newvalue);
  }

  /**
  * Get value of field E02ACURDY as a String.
  */
  public String getE02ACURDY()
  {
    return fieldE02ACURDY.getString();
  }

  /**
  * Set numeric field E02ACURDY using a BigDecimal value.
  */
  public void setE02ACURDY(BigDecimal newvalue)
  {
    fieldE02ACURDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACURDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACURDY()
  {
    return fieldE02ACURDY.getBigDecimal();
  }

  /**
  * Set field E02ACURDM using a String value.
  */
  public void setE02ACURDM(String newvalue)
  {
    fieldE02ACURDM.setString(newvalue);
  }

  /**
  * Get value of field E02ACURDM as a String.
  */
  public String getE02ACURDM()
  {
    return fieldE02ACURDM.getString();
  }

  /**
  * Set numeric field E02ACURDM using a BigDecimal value.
  */
  public void setE02ACURDM(BigDecimal newvalue)
  {
    fieldE02ACURDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACURDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACURDM()
  {
    return fieldE02ACURDM.getBigDecimal();
  }

  /**
  * Set field E02ACURDD using a String value.
  */
  public void setE02ACURDD(String newvalue)
  {
    fieldE02ACURDD.setString(newvalue);
  }

  /**
  * Get value of field E02ACURDD as a String.
  */
  public String getE02ACURDD()
  {
    return fieldE02ACURDD.getString();
  }

  /**
  * Set numeric field E02ACURDD using a BigDecimal value.
  */
  public void setE02ACURDD(BigDecimal newvalue)
  {
    fieldE02ACURDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACURDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACURDD()
  {
    return fieldE02ACURDD.getBigDecimal();
  }

  /**
  * Set field E02ACUSTS using a String value.
  */
  public void setE02ACUSTS(String newvalue)
  {
    fieldE02ACUSTS.setString(newvalue);
  }

  /**
  * Get value of field E02ACUSTS as a String.
  */
  public String getE02ACUSTS()
  {
    return fieldE02ACUSTS.getString();
  }

  /**
  * Set field E02ACURTS using a String value.
  */
  public void setE02ACURTS(String newvalue)
  {
    fieldE02ACURTS.setString(newvalue);
  }

  /**
  * Get value of field E02ACURTS as a String.
  */
  public String getE02ACURTS()
  {
    return fieldE02ACURTS.getString();
  }

  /**
  * Set numeric field E02ACURTS using a BigDecimal value.
  */
  public void setE02ACURTS(BigDecimal newvalue)
  {
    fieldE02ACURTS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACURTS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACURTS()
  {
    return fieldE02ACURTS.getBigDecimal();
  }

  /**
  * Set field E02ACUPTS using a String value.
  */
  public void setE02ACUPTS(String newvalue)
  {
    fieldE02ACUPTS.setString(newvalue);
  }

  /**
  * Get value of field E02ACUPTS as a String.
  */
  public String getE02ACUPTS()
  {
    return fieldE02ACUPTS.getString();
  }

  /**
  * Set numeric field E02ACUPTS using a BigDecimal value.
  */
  public void setE02ACUPTS(BigDecimal newvalue)
  {
    fieldE02ACUPTS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACUPTS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACUPTS()
  {
    return fieldE02ACUPTS.getBigDecimal();
  }

  /**
  * Set field E02ACUSTC using a String value.
  */
  public void setE02ACUSTC(String newvalue)
  {
    fieldE02ACUSTC.setString(newvalue);
  }

  /**
  * Get value of field E02ACUSTC as a String.
  */
  public String getE02ACUSTC()
  {
    return fieldE02ACUSTC.getString();
  }

  /**
  * Set field E02CUNDSC using a String value.
  */
  public void setE02CUNDSC(String newvalue)
  {
    fieldE02CUNDSC.setString(newvalue);
  }

  /**
  * Get value of field E02CUNDSC as a String.
  */
  public String getE02CUNDSC()
  {
    return fieldE02CUNDSC.getString();
  }

  /**
  * Set field E02OCDDSC using a String value.
  */
  public void setE02OCDDSC(String newvalue)
  {
    fieldE02OCDDSC.setString(newvalue);
  }

  /**
  * Get value of field E02OCDDSC as a String.
  */
  public String getE02OCDDSC()
  {
    return fieldE02OCDDSC.getString();
  }

  /**
  * Set field E02ECDDSC using a String value.
  */
  public void setE02ECDDSC(String newvalue)
  {
    fieldE02ECDDSC.setString(newvalue);
  }

  /**
  * Get value of field E02ECDDSC as a String.
  */
  public String getE02ECDDSC()
  {
    return fieldE02ECDDSC.getString();
  }

  /**
  * Set field E02CDEDSC using a String value.
  */
  public void setE02CDEDSC(String newvalue)
  {
    fieldE02CDEDSC.setString(newvalue);
  }

  /**
  * Get value of field E02CDEDSC as a String.
  */
  public String getE02CDEDSC()
  {
    return fieldE02CDEDSC.getString();
  }

  /**
  * Set field E02ACUREF using a String value.
  */
  public void setE02ACUREF(String newvalue)
  {
    fieldE02ACUREF.setString(newvalue);
  }

  /**
  * Get value of field E02ACUREF as a String.
  */
  public String getE02ACUREF()
  {
    return fieldE02ACUREF.getString();
  }

  /**
  * Set numeric field E02ACUREF using a BigDecimal value.
  */
  public void setE02ACUREF(BigDecimal newvalue)
  {
    fieldE02ACUREF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02ACUREF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02ACUREF()
  {
    return fieldE02ACUREF.getBigDecimal();
  }

  /**
  * Set field E02ACUAD1 using a String value.
  */
  public void setE02ACUAD1(String newvalue)
  {
    fieldE02ACUAD1.setString(newvalue);
  }

  /**
  * Get value of field E02ACUAD1 as a String.
  */
  public String getE02ACUAD1()
  {
    return fieldE02ACUAD1.getString();
  }

  /**
  * Set field E02ACUAD2 using a String value.
  */
  public void setE02ACUAD2(String newvalue)
  {
    fieldE02ACUAD2.setString(newvalue);
  }

  /**
  * Get value of field E02ACUAD2 as a String.
  */
  public String getE02ACUAD2()
  {
    return fieldE02ACUAD2.getString();
  }

  /**
  * Set field E02ACUAD3 using a String value.
  */
  public void setE02ACUAD3(String newvalue)
  {
    fieldE02ACUAD3.setString(newvalue);
  }

  /**
  * Get value of field E02ACUAD3 as a String.
  */
  public String getE02ACUAD3()
  {
    return fieldE02ACUAD3.getString();
  }

  /**
  * Set field E02ACUAD4 using a String value.
  */
  public void setE02ACUAD4(String newvalue)
  {
    fieldE02ACUAD4.setString(newvalue);
  }

  /**
  * Get value of field E02ACUAD4 as a String.
  */
  public String getE02ACUAD4()
  {
    return fieldE02ACUAD4.getString();
  }

  /**
  * Set field E02ACUAD5 using a String value.
  */
  public void setE02ACUAD5(String newvalue)
  {
    fieldE02ACUAD5.setString(newvalue);
  }

  /**
  * Get value of field E02ACUAD5 as a String.
  */
  public String getE02ACUAD5()
  {
    return fieldE02ACUAD5.getString();
  }

  /**
  * Set field E02ACUAD6 using a String value.
  */
  public void setE02ACUAD6(String newvalue)
  {
    fieldE02ACUAD6.setString(newvalue);
  }

  /**
  * Get value of field E02ACUAD6 as a String.
  */
  public String getE02ACUAD6()
  {
    return fieldE02ACUAD6.getString();
  }

  /**
  * Set field E02ACUAD7 using a String value.
  */
  public void setE02ACUAD7(String newvalue)
  {
    fieldE02ACUAD7.setString(newvalue);
  }

  /**
  * Get value of field E02ACUAD7 as a String.
  */
  public String getE02ACUAD7()
  {
    return fieldE02ACUAD7.getString();
  }

  /**
  * Set field E02ACUAD8 using a String value.
  */
  public void setE02ACUAD8(String newvalue)
  {
    fieldE02ACUAD8.setString(newvalue);
  }

  /**
  * Get value of field E02ACUAD8 as a String.
  */
  public String getE02ACUAD8()
  {
    return fieldE02ACUAD8.getString();
  }

  /**
  * Set field E02ACUAD9 using a String value.
  */
  public void setE02ACUAD9(String newvalue)
  {
    fieldE02ACUAD9.setString(newvalue);
  }

  /**
  * Get value of field E02ACUAD9 as a String.
  */
  public String getE02ACUAD9()
  {
    return fieldE02ACUAD9.getString();
  }

  /**
  * Set field E02ACUADA using a String value.
  */
  public void setE02ACUADA(String newvalue)
  {
    fieldE02ACUADA.setString(newvalue);
  }

  /**
  * Get value of field E02ACUADA as a String.
  */
  public String getE02ACUADA()
  {
    return fieldE02ACUADA.getString();
  }

  /**
  * Set field E02ACUADB using a String value.
  */
  public void setE02ACUADB(String newvalue)
  {
    fieldE02ACUADB.setString(newvalue);
  }

  /**
  * Get value of field E02ACUADB as a String.
  */
  public String getE02ACUADB()
  {
    return fieldE02ACUADB.getString();
  }

  /**
  * Set field E02ACUADC using a String value.
  */
  public void setE02ACUADC(String newvalue)
  {
    fieldE02ACUADC.setString(newvalue);
  }

  /**
  * Get value of field E02ACUADC as a String.
  */
  public String getE02ACUADC()
  {
    return fieldE02ACUADC.getString();
  }

}
