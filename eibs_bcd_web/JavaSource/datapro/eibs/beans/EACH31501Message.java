package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EACH31501 physical file definition.
* 
* File level identifier is 1180115100346.
* Record format level identifier is 2A9647AB219BF.
*/

public class EACH31501Message extends MessageRecord
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
                                     "E01ACUBNK",
                                     "E01ACUBRN",
                                     "E01ACUNUM",
                                     "E01ACUCUN",
                                     "E01ACUACC",
                                     "E01ACUOCD",
                                     "E01ACUVDY",
                                     "E01ACUVDM",
                                     "E01ACUVDD",
                                     "E01ACUBTH",
                                     "E01ACUECD",
                                     "E01ACUROU",
                                     "E01ACUDAC",
                                     "E01ACUACT",
                                     "E01ACUCCY",
                                     "E01ACUAMT",
                                     "E01ACUADD",
                                     "E01ACUCDE",
                                     "E01ACUIDN",
                                     "E01ACUTID",
                                     "E01ACUNME",
                                     "E01ACUADR",
                                     "E01ACUCSZ",
                                     "E01ACUEMA",
                                     "E01ACUORN",
                                     "E01ACUORI",
                                     "E01ACUORC",
                                     "E01ACURDY",
                                     "E01ACURDM",
                                     "E01ACURDD",
                                     "E01ACUSTS",
                                     "E01ACURTS",
                                     "E01ACUPTS",
                                     "E01ACUSTC",
                                     "E01CUNDSC",
                                     "E01OCDDSC",
                                     "E01ECDDSC",
                                     "E01CDEDSC",
                                     "E01ACUGMF",
                                     "E01ACT",
                                     "E01NUMREC",
                                     "E01INDOPE"
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
                                   "E01ACUBNK",
                                   "E01ACUBRN",
                                   "E01ACUNUM",
                                   "E01ACUCUN",
                                   "E01ACUACC",
                                   "E01ACUOCD",
                                   "E01ACUVDY",
                                   "E01ACUVDM",
                                   "E01ACUVDD",
                                   "E01ACUBTH",
                                   "E01ACUECD",
                                   "E01ACUROU",
                                   "E01ACUDAC",
                                   "E01ACUACT",
                                   "E01ACUCCY",
                                   "E01ACUAMT",
                                   "E01ACUADD",
                                   "E01ACUCDE",
                                   "E01ACUIDN",
                                   "E01ACUTID",
                                   "E01ACUNME",
                                   "E01ACUADR",
                                   "E01ACUCSZ",
                                   "E01ACUEMA",
                                   "E01ACUORN",
                                   "E01ACUORI",
                                   "E01ACUORC",
                                   "E01ACURDY",
                                   "E01ACURDM",
                                   "E01ACURDD",
                                   "E01ACUSTS",
                                   "E01ACURTS",
                                   "E01ACUPTS",
                                   "E01ACUSTC",
                                   "E01CUNDSC",
                                   "E01OCDDSC",
                                   "E01ECDDSC",
                                   "E01CDEDSC",
                                   "E01ACUGMF",
                                   "E01ACT",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1180115100346";
  final static String rid = "2A9647AB219BF";
  final static String fmtname = "EACH31501";
  final int FIELDCOUNT = 51;
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
  private CharacterField fieldE01ACUBNK = null;
  private DecimalField fieldE01ACUBRN = null;
  private DecimalField fieldE01ACUNUM = null;
  private DecimalField fieldE01ACUCUN = null;
  private DecimalField fieldE01ACUACC = null;
  private CharacterField fieldE01ACUOCD = null;
  private DecimalField fieldE01ACUVDY = null;
  private DecimalField fieldE01ACUVDM = null;
  private DecimalField fieldE01ACUVDD = null;
  private DecimalField fieldE01ACUBTH = null;
  private CharacterField fieldE01ACUECD = null;
  private CharacterField fieldE01ACUROU = null;
  private CharacterField fieldE01ACUDAC = null;
  private CharacterField fieldE01ACUACT = null;
  private CharacterField fieldE01ACUCCY = null;
  private DecimalField fieldE01ACUAMT = null;
  private CharacterField fieldE01ACUADD = null;
  private CharacterField fieldE01ACUCDE = null;
  private CharacterField fieldE01ACUIDN = null;
  private CharacterField fieldE01ACUTID = null;
  private CharacterField fieldE01ACUNME = null;
  private CharacterField fieldE01ACUADR = null;
  private CharacterField fieldE01ACUCSZ = null;
  private CharacterField fieldE01ACUEMA = null;
  private CharacterField fieldE01ACUORN = null;
  private CharacterField fieldE01ACUORI = null;
  private CharacterField fieldE01ACUORC = null;
  private DecimalField fieldE01ACURDY = null;
  private DecimalField fieldE01ACURDM = null;
  private DecimalField fieldE01ACURDD = null;
  private CharacterField fieldE01ACUSTS = null;
  private DecimalField fieldE01ACURTS = null;
  private DecimalField fieldE01ACUPTS = null;
  private CharacterField fieldE01ACUSTC = null;
  private CharacterField fieldE01CUNDSC = null;
  private CharacterField fieldE01OCDDSC = null;
  private CharacterField fieldE01ECDDSC = null;
  private CharacterField fieldE01CDEDSC = null;
  private CharacterField fieldE01ACUGMF = null;
  private CharacterField fieldE01ACT = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for EACH31501Message.
  */
  public EACH31501Message()
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
    recordsize = 744;
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
    fields[9] = fieldE01ACUBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01ACUBNK");
    fields[10] = fieldE01ACUBRN =
    new DecimalField(message, HEADERSIZE + 44, 5, 0, "E01ACUBRN");
    fields[11] = fieldE01ACUNUM =
    new DecimalField(message, HEADERSIZE + 49, 13, 0, "E01ACUNUM");
    fields[12] = fieldE01ACUCUN =
    new DecimalField(message, HEADERSIZE + 62, 10, 0, "E01ACUCUN");
    fields[13] = fieldE01ACUACC =
    new DecimalField(message, HEADERSIZE + 72, 17, 0, "E01ACUACC");
    fields[14] = fieldE01ACUOCD =
    new CharacterField(message, HEADERSIZE + 89, 10, "E01ACUOCD");
    fields[15] = fieldE01ACUVDY =
    new DecimalField(message, HEADERSIZE + 99, 5, 0, "E01ACUVDY");
    fields[16] = fieldE01ACUVDM =
    new DecimalField(message, HEADERSIZE + 104, 3, 0, "E01ACUVDM");
    fields[17] = fieldE01ACUVDD =
    new DecimalField(message, HEADERSIZE + 107, 3, 0, "E01ACUVDD");
    fields[18] = fieldE01ACUBTH =
    new DecimalField(message, HEADERSIZE + 110, 6, 0, "E01ACUBTH");
    fields[19] = fieldE01ACUECD =
    new CharacterField(message, HEADERSIZE + 116, 3, "E01ACUECD");
    fields[20] = fieldE01ACUROU =
    new CharacterField(message, HEADERSIZE + 119, 9, "E01ACUROU");
    fields[21] = fieldE01ACUDAC =
    new CharacterField(message, HEADERSIZE + 128, 17, "E01ACUDAC");
    fields[22] = fieldE01ACUACT =
    new CharacterField(message, HEADERSIZE + 145, 1, "E01ACUACT");
    fields[23] = fieldE01ACUCCY =
    new CharacterField(message, HEADERSIZE + 146, 3, "E01ACUCCY");
    fields[24] = fieldE01ACUAMT =
    new DecimalField(message, HEADERSIZE + 149, 17, 2, "E01ACUAMT");
    fields[25] = fieldE01ACUADD =
    new CharacterField(message, HEADERSIZE + 166, 80, "E01ACUADD");
    fields[26] = fieldE01ACUCDE =
    new CharacterField(message, HEADERSIZE + 246, 2, "E01ACUCDE");
    fields[27] = fieldE01ACUIDN =
    new CharacterField(message, HEADERSIZE + 248, 25, "E01ACUIDN");
    fields[28] = fieldE01ACUTID =
    new CharacterField(message, HEADERSIZE + 273, 4, "E01ACUTID");
    fields[29] = fieldE01ACUNME =
    new CharacterField(message, HEADERSIZE + 277, 45, "E01ACUNME");
    fields[30] = fieldE01ACUADR =
    new CharacterField(message, HEADERSIZE + 322, 45, "E01ACUADR");
    fields[31] = fieldE01ACUCSZ =
    new CharacterField(message, HEADERSIZE + 367, 45, "E01ACUCSZ");
    fields[32] = fieldE01ACUEMA =
    new CharacterField(message, HEADERSIZE + 412, 60, "E01ACUEMA");
    fields[33] = fieldE01ACUORN =
    new CharacterField(message, HEADERSIZE + 472, 16, "E01ACUORN");
    fields[34] = fieldE01ACUORI =
    new CharacterField(message, HEADERSIZE + 488, 20, "E01ACUORI");
    fields[35] = fieldE01ACUORC =
    new CharacterField(message, HEADERSIZE + 508, 4, "E01ACUORC");
    fields[36] = fieldE01ACURDY =
    new DecimalField(message, HEADERSIZE + 512, 5, 0, "E01ACURDY");
    fields[37] = fieldE01ACURDM =
    new DecimalField(message, HEADERSIZE + 517, 3, 0, "E01ACURDM");
    fields[38] = fieldE01ACURDD =
    new DecimalField(message, HEADERSIZE + 520, 3, 0, "E01ACURDD");
    fields[39] = fieldE01ACUSTS =
    new CharacterField(message, HEADERSIZE + 523, 1, "E01ACUSTS");
    fields[40] = fieldE01ACURTS =
    new DecimalField(message, HEADERSIZE + 524, 13, 0, "E01ACURTS");
    fields[41] = fieldE01ACUPTS =
    new DecimalField(message, HEADERSIZE + 537, 13, 0, "E01ACUPTS");
    fields[42] = fieldE01ACUSTC =
    new CharacterField(message, HEADERSIZE + 550, 3, "E01ACUSTC");
    fields[43] = fieldE01CUNDSC =
    new CharacterField(message, HEADERSIZE + 553, 45, "E01CUNDSC");
    fields[44] = fieldE01OCDDSC =
    new CharacterField(message, HEADERSIZE + 598, 45, "E01OCDDSC");
    fields[45] = fieldE01ECDDSC =
    new CharacterField(message, HEADERSIZE + 643, 45, "E01ECDDSC");
    fields[46] = fieldE01CDEDSC =
    new CharacterField(message, HEADERSIZE + 688, 45, "E01CDEDSC");
    fields[47] = fieldE01ACUGMF =
    new CharacterField(message, HEADERSIZE + 733, 1, "E01ACUGMF");
    fields[48] = fieldE01ACT =
    new CharacterField(message, HEADERSIZE + 734, 1, "E01ACT");
    fields[49] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 735, 8, 0, "E01NUMREC");
    fields[50] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 743, 1, "E01INDOPE");

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
  * Set field E01ACUBNK using a String value.
  */
  public void setE01ACUBNK(String newvalue)
  {
    fieldE01ACUBNK.setString(newvalue);
  }

  /**
  * Get value of field E01ACUBNK as a String.
  */
  public String getE01ACUBNK()
  {
    return fieldE01ACUBNK.getString();
  }

  /**
  * Set field E01ACUBRN using a String value.
  */
  public void setE01ACUBRN(String newvalue)
  {
    fieldE01ACUBRN.setString(newvalue);
  }

  /**
  * Get value of field E01ACUBRN as a String.
  */
  public String getE01ACUBRN()
  {
    return fieldE01ACUBRN.getString();
  }

  /**
  * Set numeric field E01ACUBRN using a BigDecimal value.
  */
  public void setE01ACUBRN(BigDecimal newvalue)
  {
    fieldE01ACUBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACUBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACUBRN()
  {
    return fieldE01ACUBRN.getBigDecimal();
  }

  /**
  * Set field E01ACUNUM using a String value.
  */
  public void setE01ACUNUM(String newvalue)
  {
    fieldE01ACUNUM.setString(newvalue);
  }

  /**
  * Get value of field E01ACUNUM as a String.
  */
  public String getE01ACUNUM()
  {
    return fieldE01ACUNUM.getString();
  }

  /**
  * Set numeric field E01ACUNUM using a BigDecimal value.
  */
  public void setE01ACUNUM(BigDecimal newvalue)
  {
    fieldE01ACUNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACUNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACUNUM()
  {
    return fieldE01ACUNUM.getBigDecimal();
  }

  /**
  * Set field E01ACUCUN using a String value.
  */
  public void setE01ACUCUN(String newvalue)
  {
    fieldE01ACUCUN.setString(newvalue);
  }

  /**
  * Get value of field E01ACUCUN as a String.
  */
  public String getE01ACUCUN()
  {
    return fieldE01ACUCUN.getString();
  }

  /**
  * Set numeric field E01ACUCUN using a BigDecimal value.
  */
  public void setE01ACUCUN(BigDecimal newvalue)
  {
    fieldE01ACUCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACUCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACUCUN()
  {
    return fieldE01ACUCUN.getBigDecimal();
  }

  /**
  * Set field E01ACUACC using a String value.
  */
  public void setE01ACUACC(String newvalue)
  {
    fieldE01ACUACC.setString(newvalue);
  }

  /**
  * Get value of field E01ACUACC as a String.
  */
  public String getE01ACUACC()
  {
    return fieldE01ACUACC.getString();
  }

  /**
  * Set numeric field E01ACUACC using a BigDecimal value.
  */
  public void setE01ACUACC(BigDecimal newvalue)
  {
    fieldE01ACUACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACUACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACUACC()
  {
    return fieldE01ACUACC.getBigDecimal();
  }

  /**
  * Set field E01ACUOCD using a String value.
  */
  public void setE01ACUOCD(String newvalue)
  {
    fieldE01ACUOCD.setString(newvalue);
  }

  /**
  * Get value of field E01ACUOCD as a String.
  */
  public String getE01ACUOCD()
  {
    return fieldE01ACUOCD.getString();
  }

  /**
  * Set field E01ACUVDY using a String value.
  */
  public void setE01ACUVDY(String newvalue)
  {
    fieldE01ACUVDY.setString(newvalue);
  }

  /**
  * Get value of field E01ACUVDY as a String.
  */
  public String getE01ACUVDY()
  {
    return fieldE01ACUVDY.getString();
  }

  /**
  * Set numeric field E01ACUVDY using a BigDecimal value.
  */
  public void setE01ACUVDY(BigDecimal newvalue)
  {
    fieldE01ACUVDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACUVDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACUVDY()
  {
    return fieldE01ACUVDY.getBigDecimal();
  }

  /**
  * Set field E01ACUVDM using a String value.
  */
  public void setE01ACUVDM(String newvalue)
  {
    fieldE01ACUVDM.setString(newvalue);
  }

  /**
  * Get value of field E01ACUVDM as a String.
  */
  public String getE01ACUVDM()
  {
    return fieldE01ACUVDM.getString();
  }

  /**
  * Set numeric field E01ACUVDM using a BigDecimal value.
  */
  public void setE01ACUVDM(BigDecimal newvalue)
  {
    fieldE01ACUVDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACUVDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACUVDM()
  {
    return fieldE01ACUVDM.getBigDecimal();
  }

  /**
  * Set field E01ACUVDD using a String value.
  */
  public void setE01ACUVDD(String newvalue)
  {
    fieldE01ACUVDD.setString(newvalue);
  }

  /**
  * Get value of field E01ACUVDD as a String.
  */
  public String getE01ACUVDD()
  {
    return fieldE01ACUVDD.getString();
  }

  /**
  * Set numeric field E01ACUVDD using a BigDecimal value.
  */
  public void setE01ACUVDD(BigDecimal newvalue)
  {
    fieldE01ACUVDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACUVDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACUVDD()
  {
    return fieldE01ACUVDD.getBigDecimal();
  }

  /**
  * Set field E01ACUBTH using a String value.
  */
  public void setE01ACUBTH(String newvalue)
  {
    fieldE01ACUBTH.setString(newvalue);
  }

  /**
  * Get value of field E01ACUBTH as a String.
  */
  public String getE01ACUBTH()
  {
    return fieldE01ACUBTH.getString();
  }

  /**
  * Set numeric field E01ACUBTH using a BigDecimal value.
  */
  public void setE01ACUBTH(BigDecimal newvalue)
  {
    fieldE01ACUBTH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACUBTH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACUBTH()
  {
    return fieldE01ACUBTH.getBigDecimal();
  }

  /**
  * Set field E01ACUECD using a String value.
  */
  public void setE01ACUECD(String newvalue)
  {
    fieldE01ACUECD.setString(newvalue);
  }

  /**
  * Get value of field E01ACUECD as a String.
  */
  public String getE01ACUECD()
  {
    return fieldE01ACUECD.getString();
  }

  /**
  * Set field E01ACUROU using a String value.
  */
  public void setE01ACUROU(String newvalue)
  {
    fieldE01ACUROU.setString(newvalue);
  }

  /**
  * Get value of field E01ACUROU as a String.
  */
  public String getE01ACUROU()
  {
    return fieldE01ACUROU.getString();
  }

  /**
  * Set field E01ACUDAC using a String value.
  */
  public void setE01ACUDAC(String newvalue)
  {
    fieldE01ACUDAC.setString(newvalue);
  }

  /**
  * Get value of field E01ACUDAC as a String.
  */
  public String getE01ACUDAC()
  {
    return fieldE01ACUDAC.getString();
  }

  /**
  * Set field E01ACUACT using a String value.
  */
  public void setE01ACUACT(String newvalue)
  {
    fieldE01ACUACT.setString(newvalue);
  }

  /**
  * Get value of field E01ACUACT as a String.
  */
  public String getE01ACUACT()
  {
    return fieldE01ACUACT.getString();
  }

  /**
  * Set field E01ACUCCY using a String value.
  */
  public void setE01ACUCCY(String newvalue)
  {
    fieldE01ACUCCY.setString(newvalue);
  }

  /**
  * Get value of field E01ACUCCY as a String.
  */
  public String getE01ACUCCY()
  {
    return fieldE01ACUCCY.getString();
  }

  /**
  * Set field E01ACUAMT using a String value.
  */
  public void setE01ACUAMT(String newvalue)
  {
    fieldE01ACUAMT.setString(newvalue);
  }

  /**
  * Get value of field E01ACUAMT as a String.
  */
  public String getE01ACUAMT()
  {
    return fieldE01ACUAMT.getString();
  }

  /**
  * Set numeric field E01ACUAMT using a BigDecimal value.
  */
  public void setE01ACUAMT(BigDecimal newvalue)
  {
    fieldE01ACUAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACUAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACUAMT()
  {
    return fieldE01ACUAMT.getBigDecimal();
  }

  /**
  * Set field E01ACUADD using a String value.
  */
  public void setE01ACUADD(String newvalue)
  {
    fieldE01ACUADD.setString(newvalue);
  }

  /**
  * Get value of field E01ACUADD as a String.
  */
  public String getE01ACUADD()
  {
    return fieldE01ACUADD.getString();
  }

  /**
  * Set field E01ACUCDE using a String value.
  */
  public void setE01ACUCDE(String newvalue)
  {
    fieldE01ACUCDE.setString(newvalue);
  }

  /**
  * Get value of field E01ACUCDE as a String.
  */
  public String getE01ACUCDE()
  {
    return fieldE01ACUCDE.getString();
  }

  /**
  * Set field E01ACUIDN using a String value.
  */
  public void setE01ACUIDN(String newvalue)
  {
    fieldE01ACUIDN.setString(newvalue);
  }

  /**
  * Get value of field E01ACUIDN as a String.
  */
  public String getE01ACUIDN()
  {
    return fieldE01ACUIDN.getString();
  }

  /**
  * Set field E01ACUTID using a String value.
  */
  public void setE01ACUTID(String newvalue)
  {
    fieldE01ACUTID.setString(newvalue);
  }

  /**
  * Get value of field E01ACUTID as a String.
  */
  public String getE01ACUTID()
  {
    return fieldE01ACUTID.getString();
  }

  /**
  * Set field E01ACUNME using a String value.
  */
  public void setE01ACUNME(String newvalue)
  {
    fieldE01ACUNME.setString(newvalue);
  }

  /**
  * Get value of field E01ACUNME as a String.
  */
  public String getE01ACUNME()
  {
    return fieldE01ACUNME.getString();
  }

  /**
  * Set field E01ACUADR using a String value.
  */
  public void setE01ACUADR(String newvalue)
  {
    fieldE01ACUADR.setString(newvalue);
  }

  /**
  * Get value of field E01ACUADR as a String.
  */
  public String getE01ACUADR()
  {
    return fieldE01ACUADR.getString();
  }

  /**
  * Set field E01ACUCSZ using a String value.
  */
  public void setE01ACUCSZ(String newvalue)
  {
    fieldE01ACUCSZ.setString(newvalue);
  }

  /**
  * Get value of field E01ACUCSZ as a String.
  */
  public String getE01ACUCSZ()
  {
    return fieldE01ACUCSZ.getString();
  }

  /**
  * Set field E01ACUEMA using a String value.
  */
  public void setE01ACUEMA(String newvalue)
  {
    fieldE01ACUEMA.setString(newvalue);
  }

  /**
  * Get value of field E01ACUEMA as a String.
  */
  public String getE01ACUEMA()
  {
    return fieldE01ACUEMA.getString();
  }

  /**
  * Set field E01ACUORN using a String value.
  */
  public void setE01ACUORN(String newvalue)
  {
    fieldE01ACUORN.setString(newvalue);
  }

  /**
  * Get value of field E01ACUORN as a String.
  */
  public String getE01ACUORN()
  {
    return fieldE01ACUORN.getString();
  }

  /**
  * Set field E01ACUORI using a String value.
  */
  public void setE01ACUORI(String newvalue)
  {
    fieldE01ACUORI.setString(newvalue);
  }

  /**
  * Get value of field E01ACUORI as a String.
  */
  public String getE01ACUORI()
  {
    return fieldE01ACUORI.getString();
  }

  /**
  * Set field E01ACUORC using a String value.
  */
  public void setE01ACUORC(String newvalue)
  {
    fieldE01ACUORC.setString(newvalue);
  }

  /**
  * Get value of field E01ACUORC as a String.
  */
  public String getE01ACUORC()
  {
    return fieldE01ACUORC.getString();
  }

  /**
  * Set field E01ACURDY using a String value.
  */
  public void setE01ACURDY(String newvalue)
  {
    fieldE01ACURDY.setString(newvalue);
  }

  /**
  * Get value of field E01ACURDY as a String.
  */
  public String getE01ACURDY()
  {
    return fieldE01ACURDY.getString();
  }

  /**
  * Set numeric field E01ACURDY using a BigDecimal value.
  */
  public void setE01ACURDY(BigDecimal newvalue)
  {
    fieldE01ACURDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACURDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACURDY()
  {
    return fieldE01ACURDY.getBigDecimal();
  }

  /**
  * Set field E01ACURDM using a String value.
  */
  public void setE01ACURDM(String newvalue)
  {
    fieldE01ACURDM.setString(newvalue);
  }

  /**
  * Get value of field E01ACURDM as a String.
  */
  public String getE01ACURDM()
  {
    return fieldE01ACURDM.getString();
  }

  /**
  * Set numeric field E01ACURDM using a BigDecimal value.
  */
  public void setE01ACURDM(BigDecimal newvalue)
  {
    fieldE01ACURDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACURDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACURDM()
  {
    return fieldE01ACURDM.getBigDecimal();
  }

  /**
  * Set field E01ACURDD using a String value.
  */
  public void setE01ACURDD(String newvalue)
  {
    fieldE01ACURDD.setString(newvalue);
  }

  /**
  * Get value of field E01ACURDD as a String.
  */
  public String getE01ACURDD()
  {
    return fieldE01ACURDD.getString();
  }

  /**
  * Set numeric field E01ACURDD using a BigDecimal value.
  */
  public void setE01ACURDD(BigDecimal newvalue)
  {
    fieldE01ACURDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACURDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACURDD()
  {
    return fieldE01ACURDD.getBigDecimal();
  }

  /**
  * Set field E01ACUSTS using a String value.
  */
  public void setE01ACUSTS(String newvalue)
  {
    fieldE01ACUSTS.setString(newvalue);
  }

  /**
  * Get value of field E01ACUSTS as a String.
  */
  public String getE01ACUSTS()
  {
    return fieldE01ACUSTS.getString();
  }

  /**
  * Set field E01ACURTS using a String value.
  */
  public void setE01ACURTS(String newvalue)
  {
    fieldE01ACURTS.setString(newvalue);
  }

  /**
  * Get value of field E01ACURTS as a String.
  */
  public String getE01ACURTS()
  {
    return fieldE01ACURTS.getString();
  }

  /**
  * Set numeric field E01ACURTS using a BigDecimal value.
  */
  public void setE01ACURTS(BigDecimal newvalue)
  {
    fieldE01ACURTS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACURTS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACURTS()
  {
    return fieldE01ACURTS.getBigDecimal();
  }

  /**
  * Set field E01ACUPTS using a String value.
  */
  public void setE01ACUPTS(String newvalue)
  {
    fieldE01ACUPTS.setString(newvalue);
  }

  /**
  * Get value of field E01ACUPTS as a String.
  */
  public String getE01ACUPTS()
  {
    return fieldE01ACUPTS.getString();
  }

  /**
  * Set numeric field E01ACUPTS using a BigDecimal value.
  */
  public void setE01ACUPTS(BigDecimal newvalue)
  {
    fieldE01ACUPTS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACUPTS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACUPTS()
  {
    return fieldE01ACUPTS.getBigDecimal();
  }

  /**
  * Set field E01ACUSTC using a String value.
  */
  public void setE01ACUSTC(String newvalue)
  {
    fieldE01ACUSTC.setString(newvalue);
  }

  /**
  * Get value of field E01ACUSTC as a String.
  */
  public String getE01ACUSTC()
  {
    return fieldE01ACUSTC.getString();
  }

  /**
  * Set field E01CUNDSC using a String value.
  */
  public void setE01CUNDSC(String newvalue)
  {
    fieldE01CUNDSC.setString(newvalue);
  }

  /**
  * Get value of field E01CUNDSC as a String.
  */
  public String getE01CUNDSC()
  {
    return fieldE01CUNDSC.getString();
  }

  /**
  * Set field E01OCDDSC using a String value.
  */
  public void setE01OCDDSC(String newvalue)
  {
    fieldE01OCDDSC.setString(newvalue);
  }

  /**
  * Get value of field E01OCDDSC as a String.
  */
  public String getE01OCDDSC()
  {
    return fieldE01OCDDSC.getString();
  }

  /**
  * Set field E01ECDDSC using a String value.
  */
  public void setE01ECDDSC(String newvalue)
  {
    fieldE01ECDDSC.setString(newvalue);
  }

  /**
  * Get value of field E01ECDDSC as a String.
  */
  public String getE01ECDDSC()
  {
    return fieldE01ECDDSC.getString();
  }

  /**
  * Set field E01CDEDSC using a String value.
  */
  public void setE01CDEDSC(String newvalue)
  {
    fieldE01CDEDSC.setString(newvalue);
  }

  /**
  * Get value of field E01CDEDSC as a String.
  */
  public String getE01CDEDSC()
  {
    return fieldE01CDEDSC.getString();
  }

  /**
  * Set field E01ACUGMF using a String value.
  */
  public void setE01ACUGMF(String newvalue)
  {
    fieldE01ACUGMF.setString(newvalue);
  }

  /**
  * Get value of field E01ACUGMF as a String.
  */
  public String getE01ACUGMF()
  {
    return fieldE01ACUGMF.getString();
  }

  /**
  * Set field E01ACT using a String value.
  */
  public void setE01ACT(String newvalue)
  {
    fieldE01ACT.setString(newvalue);
  }

  /**
  * Get value of field E01ACT as a String.
  */
  public String getE01ACT()
  {
    return fieldE01ACT.getString();
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

  /**
  * Set field E01INDOPE using a String value.
  */
  public void setE01INDOPE(String newvalue)
  {
    fieldE01INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E01INDOPE as a String.
  */
  public String getE01INDOPE()
  {
    return fieldE01INDOPE.getString();
  }

}
