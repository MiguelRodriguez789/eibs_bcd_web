package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDEN13001 physical file definition.
* 
* File level identifier is 1150930160344.
* Record format level identifier is 3F92D22F2F4E4.
*/

public class EDEN13001Message extends MessageRecord
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
                                     "E01REQTYP",
                                     "E01REQORD",
                                     "E01REQSTS",
                                     "E01REQFRM",
                                     "E01REQPDY",
                                     "E01REQPDM",
                                     "E01REQPDD",
                                     "E01OFANRO",
                                     "E01OFAPRO",
                                     "E01OFAIDN",
                                     "E01OFATID",
                                     "E01OFAPID",
                                     "E01OFANME",
                                     "E01OFANA1",
                                     "E01OFANA2",
                                     "E01OFANA3",
                                     "E01OFANA4",
                                     "E01OFAMOD",
                                     "E01OFARTP",
                                     "E01OFABNK",
                                     "E01OFABRN",
                                     "E01OFAACC",
                                     "E01OFACUN",
                                     "E01OFAARE",
                                     "E01OFASTA",
                                     "E01OFASTS",
                                     "E01OFANOT",
                                     "E01OFACDM",
                                     "E01OFACDD",
                                     "E01OFACDY",
                                     "E01OFACTM",
                                     "E01OFACUS",
                                     "E01OFALMM",
                                     "E01OFALMD",
                                     "E01OFALMY",
                                     "E01OFALMT",
                                     "E01OFALMU",
                                     "E01OFAPGM",
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
                                   "E01REQTYP",
                                   "E01REQORD",
                                   "E01REQSTS",
                                   "E01REQFRM",
                                   "E01REQPDY",
                                   "E01REQPDM",
                                   "E01REQPDD",
                                   "E01OFANRO",
                                   "E01OFAPRO",
                                   "E01OFAIDN",
                                   "E01OFATID",
                                   "E01OFAPID",
                                   "E01OFANME",
                                   "E01OFANA1",
                                   "E01OFANA2",
                                   "E01OFANA3",
                                   "E01OFANA4",
                                   "E01OFAMOD",
                                   "E01OFARTP",
                                   "E01OFABNK",
                                   "E01OFABRN",
                                   "E01OFAACC",
                                   "E01OFACUN",
                                   "E01OFAARE",
                                   "E01OFASTA",
                                   "E01OFASTS",
                                   "E01OFANOT",
                                   "E01OFACDM",
                                   "E01OFACDD",
                                   "E01OFACDY",
                                   "E01OFACTM",
                                   "E01OFACUS",
                                   "E01OFALMM",
                                   "E01OFALMD",
                                   "E01OFALMY",
                                   "E01OFALMT",
                                   "E01OFALMU",
                                   "E01OFAPGM",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1150930160344";
  final static String rid = "3F92D22F2F4E4";
  final static String fmtname = "EDEN13001";
  final int FIELDCOUNT = 49;
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
  private CharacterField fieldE01REQTYP = null;
  private CharacterField fieldE01REQORD = null;
  private CharacterField fieldE01REQSTS = null;
  private CharacterField fieldE01REQFRM = null;
  private DecimalField fieldE01REQPDY = null;
  private DecimalField fieldE01REQPDM = null;
  private DecimalField fieldE01REQPDD = null;
  private DecimalField fieldE01OFANRO = null;
  private CharacterField fieldE01OFAPRO = null;
  private CharacterField fieldE01OFAIDN = null;
  private CharacterField fieldE01OFATID = null;
  private CharacterField fieldE01OFAPID = null;
  private CharacterField fieldE01OFANME = null;
  private CharacterField fieldE01OFANA1 = null;
  private CharacterField fieldE01OFANA2 = null;
  private CharacterField fieldE01OFANA3 = null;
  private CharacterField fieldE01OFANA4 = null;
  private CharacterField fieldE01OFAMOD = null;
  private CharacterField fieldE01OFARTP = null;
  private CharacterField fieldE01OFABNK = null;
  private DecimalField fieldE01OFABRN = null;
  private DecimalField fieldE01OFAACC = null;
  private DecimalField fieldE01OFACUN = null;
  private CharacterField fieldE01OFAARE = null;
  private CharacterField fieldE01OFASTA = null;
  private CharacterField fieldE01OFASTS = null;
  private CharacterField fieldE01OFANOT = null;
  private DecimalField fieldE01OFACDM = null;
  private DecimalField fieldE01OFACDD = null;
  private DecimalField fieldE01OFACDY = null;
  private CharacterField fieldE01OFACTM = null;
  private CharacterField fieldE01OFACUS = null;
  private DecimalField fieldE01OFALMM = null;
  private DecimalField fieldE01OFALMD = null;
  private DecimalField fieldE01OFALMY = null;
  private CharacterField fieldE01OFALMT = null;
  private CharacterField fieldE01OFALMU = null;
  private CharacterField fieldE01OFAPGM = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for EDEN13001Message.
  */
  public EDEN13001Message()
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
    recordsize = 1694;
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
    fields[9] = fieldE01REQTYP =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01REQTYP");
    fields[10] = fieldE01REQORD =
    new CharacterField(message, HEADERSIZE + 43, 1, "E01REQORD");
    fields[11] = fieldE01REQSTS =
    new CharacterField(message, HEADERSIZE + 44, 1, "E01REQSTS");
    fields[12] = fieldE01REQFRM =
    new CharacterField(message, HEADERSIZE + 45, 60, "E01REQFRM");
    fields[13] = fieldE01REQPDY =
    new DecimalField(message, HEADERSIZE + 105, 5, 0, "E01REQPDY");
    fields[14] = fieldE01REQPDM =
    new DecimalField(message, HEADERSIZE + 110, 3, 0, "E01REQPDM");
    fields[15] = fieldE01REQPDD =
    new DecimalField(message, HEADERSIZE + 113, 3, 0, "E01REQPDD");
    fields[16] = fieldE01OFANRO =
    new DecimalField(message, HEADERSIZE + 116, 13, 0, "E01OFANRO");
    fields[17] = fieldE01OFAPRO =
    new CharacterField(message, HEADERSIZE + 129, 1, "E01OFAPRO");
    fields[18] = fieldE01OFAIDN =
    new CharacterField(message, HEADERSIZE + 130, 25, "E01OFAIDN");
    fields[19] = fieldE01OFATID =
    new CharacterField(message, HEADERSIZE + 155, 4, "E01OFATID");
    fields[20] = fieldE01OFAPID =
    new CharacterField(message, HEADERSIZE + 159, 4, "E01OFAPID");
    fields[21] = fieldE01OFANME =
    new CharacterField(message, HEADERSIZE + 163, 140, "E01OFANME");
    fields[22] = fieldE01OFANA1 =
    new CharacterField(message, HEADERSIZE + 303, 60, "E01OFANA1");
    fields[23] = fieldE01OFANA2 =
    new CharacterField(message, HEADERSIZE + 363, 45, "E01OFANA2");
    fields[24] = fieldE01OFANA3 =
    new CharacterField(message, HEADERSIZE + 408, 45, "E01OFANA3");
    fields[25] = fieldE01OFANA4 =
    new CharacterField(message, HEADERSIZE + 453, 45, "E01OFANA4");
    fields[26] = fieldE01OFAMOD =
    new CharacterField(message, HEADERSIZE + 498, 1, "E01OFAMOD");
    fields[27] = fieldE01OFARTP =
    new CharacterField(message, HEADERSIZE + 499, 1, "E01OFARTP");
    fields[28] = fieldE01OFABNK =
    new CharacterField(message, HEADERSIZE + 500, 2, "E01OFABNK");
    fields[29] = fieldE01OFABRN =
    new DecimalField(message, HEADERSIZE + 502, 5, 0, "E01OFABRN");
    fields[30] = fieldE01OFAACC =
    new DecimalField(message, HEADERSIZE + 507, 13, 0, "E01OFAACC");
    fields[31] = fieldE01OFACUN =
    new DecimalField(message, HEADERSIZE + 520, 10, 0, "E01OFACUN");
    fields[32] = fieldE01OFAARE =
    new CharacterField(message, HEADERSIZE + 530, 40, "E01OFAARE");
    fields[33] = fieldE01OFASTA =
    new CharacterField(message, HEADERSIZE + 570, 10, "E01OFASTA");
    fields[34] = fieldE01OFASTS =
    new CharacterField(message, HEADERSIZE + 580, 1, "E01OFASTS");
    fields[35] = fieldE01OFANOT =
    new CharacterField(message, HEADERSIZE + 581, 1000, "E01OFANOT");
    fields[36] = fieldE01OFACDM =
    new DecimalField(message, HEADERSIZE + 1581, 3, 0, "E01OFACDM");
    fields[37] = fieldE01OFACDD =
    new DecimalField(message, HEADERSIZE + 1584, 3, 0, "E01OFACDD");
    fields[38] = fieldE01OFACDY =
    new DecimalField(message, HEADERSIZE + 1587, 5, 0, "E01OFACDY");
    fields[39] = fieldE01OFACTM =
    new CharacterField(message, HEADERSIZE + 1592, 26, "E01OFACTM");
    fields[40] = fieldE01OFACUS =
    new CharacterField(message, HEADERSIZE + 1618, 10, "E01OFACUS");
    fields[41] = fieldE01OFALMM =
    new DecimalField(message, HEADERSIZE + 1628, 3, 0, "E01OFALMM");
    fields[42] = fieldE01OFALMD =
    new DecimalField(message, HEADERSIZE + 1631, 3, 0, "E01OFALMD");
    fields[43] = fieldE01OFALMY =
    new DecimalField(message, HEADERSIZE + 1634, 5, 0, "E01OFALMY");
    fields[44] = fieldE01OFALMT =
    new CharacterField(message, HEADERSIZE + 1639, 26, "E01OFALMT");
    fields[45] = fieldE01OFALMU =
    new CharacterField(message, HEADERSIZE + 1665, 10, "E01OFALMU");
    fields[46] = fieldE01OFAPGM =
    new CharacterField(message, HEADERSIZE + 1675, 10, "E01OFAPGM");
    fields[47] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 1685, 8, 0, "E01NUMREC");
    fields[48] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 1693, 1, "E01INDOPE");

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
  * Set field E01REQTYP using a String value.
  */
  public void setE01REQTYP(String newvalue)
  {
    fieldE01REQTYP.setString(newvalue);
  }

  /**
  * Get value of field E01REQTYP as a String.
  */
  public String getE01REQTYP()
  {
    return fieldE01REQTYP.getString();
  }

  /**
  * Set field E01REQORD using a String value.
  */
  public void setE01REQORD(String newvalue)
  {
    fieldE01REQORD.setString(newvalue);
  }

  /**
  * Get value of field E01REQORD as a String.
  */
  public String getE01REQORD()
  {
    return fieldE01REQORD.getString();
  }

  /**
  * Set field E01REQSTS using a String value.
  */
  public void setE01REQSTS(String newvalue)
  {
    fieldE01REQSTS.setString(newvalue);
  }

  /**
  * Get value of field E01REQSTS as a String.
  */
  public String getE01REQSTS()
  {
    return fieldE01REQSTS.getString();
  }

  /**
  * Set field E01REQFRM using a String value.
  */
  public void setE01REQFRM(String newvalue)
  {
    fieldE01REQFRM.setString(newvalue);
  }

  /**
  * Get value of field E01REQFRM as a String.
  */
  public String getE01REQFRM()
  {
    return fieldE01REQFRM.getString();
  }

  /**
  * Set field E01REQPDY using a String value.
  */
  public void setE01REQPDY(String newvalue)
  {
    fieldE01REQPDY.setString(newvalue);
  }

  /**
  * Get value of field E01REQPDY as a String.
  */
  public String getE01REQPDY()
  {
    return fieldE01REQPDY.getString();
  }

  /**
  * Set numeric field E01REQPDY using a BigDecimal value.
  */
  public void setE01REQPDY(BigDecimal newvalue)
  {
    fieldE01REQPDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REQPDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REQPDY()
  {
    return fieldE01REQPDY.getBigDecimal();
  }

  /**
  * Set field E01REQPDM using a String value.
  */
  public void setE01REQPDM(String newvalue)
  {
    fieldE01REQPDM.setString(newvalue);
  }

  /**
  * Get value of field E01REQPDM as a String.
  */
  public String getE01REQPDM()
  {
    return fieldE01REQPDM.getString();
  }

  /**
  * Set numeric field E01REQPDM using a BigDecimal value.
  */
  public void setE01REQPDM(BigDecimal newvalue)
  {
    fieldE01REQPDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REQPDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REQPDM()
  {
    return fieldE01REQPDM.getBigDecimal();
  }

  /**
  * Set field E01REQPDD using a String value.
  */
  public void setE01REQPDD(String newvalue)
  {
    fieldE01REQPDD.setString(newvalue);
  }

  /**
  * Get value of field E01REQPDD as a String.
  */
  public String getE01REQPDD()
  {
    return fieldE01REQPDD.getString();
  }

  /**
  * Set numeric field E01REQPDD using a BigDecimal value.
  */
  public void setE01REQPDD(BigDecimal newvalue)
  {
    fieldE01REQPDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01REQPDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01REQPDD()
  {
    return fieldE01REQPDD.getBigDecimal();
  }

  /**
  * Set field E01OFANRO using a String value.
  */
  public void setE01OFANRO(String newvalue)
  {
    fieldE01OFANRO.setString(newvalue);
  }

  /**
  * Get value of field E01OFANRO as a String.
  */
  public String getE01OFANRO()
  {
    return fieldE01OFANRO.getString();
  }

  /**
  * Set numeric field E01OFANRO using a BigDecimal value.
  */
  public void setE01OFANRO(BigDecimal newvalue)
  {
    fieldE01OFANRO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OFANRO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OFANRO()
  {
    return fieldE01OFANRO.getBigDecimal();
  }

  /**
  * Set field E01OFAPRO using a String value.
  */
  public void setE01OFAPRO(String newvalue)
  {
    fieldE01OFAPRO.setString(newvalue);
  }

  /**
  * Get value of field E01OFAPRO as a String.
  */
  public String getE01OFAPRO()
  {
    return fieldE01OFAPRO.getString();
  }

  /**
  * Set field E01OFAIDN using a String value.
  */
  public void setE01OFAIDN(String newvalue)
  {
    fieldE01OFAIDN.setString(newvalue);
  }

  /**
  * Get value of field E01OFAIDN as a String.
  */
  public String getE01OFAIDN()
  {
    return fieldE01OFAIDN.getString();
  }

  /**
  * Set field E01OFATID using a String value.
  */
  public void setE01OFATID(String newvalue)
  {
    fieldE01OFATID.setString(newvalue);
  }

  /**
  * Get value of field E01OFATID as a String.
  */
  public String getE01OFATID()
  {
    return fieldE01OFATID.getString();
  }

  /**
  * Set field E01OFAPID using a String value.
  */
  public void setE01OFAPID(String newvalue)
  {
    fieldE01OFAPID.setString(newvalue);
  }

  /**
  * Get value of field E01OFAPID as a String.
  */
  public String getE01OFAPID()
  {
    return fieldE01OFAPID.getString();
  }

  /**
  * Set field E01OFANME using a String value.
  */
  public void setE01OFANME(String newvalue)
  {
    fieldE01OFANME.setString(newvalue);
  }

  /**
  * Get value of field E01OFANME as a String.
  */
  public String getE01OFANME()
  {
    return fieldE01OFANME.getString();
  }

  /**
  * Set field E01OFANA1 using a String value.
  */
  public void setE01OFANA1(String newvalue)
  {
    fieldE01OFANA1.setString(newvalue);
  }

  /**
  * Get value of field E01OFANA1 as a String.
  */
  public String getE01OFANA1()
  {
    return fieldE01OFANA1.getString();
  }

  /**
  * Set field E01OFANA2 using a String value.
  */
  public void setE01OFANA2(String newvalue)
  {
    fieldE01OFANA2.setString(newvalue);
  }

  /**
  * Get value of field E01OFANA2 as a String.
  */
  public String getE01OFANA2()
  {
    return fieldE01OFANA2.getString();
  }

  /**
  * Set field E01OFANA3 using a String value.
  */
  public void setE01OFANA3(String newvalue)
  {
    fieldE01OFANA3.setString(newvalue);
  }

  /**
  * Get value of field E01OFANA3 as a String.
  */
  public String getE01OFANA3()
  {
    return fieldE01OFANA3.getString();
  }

  /**
  * Set field E01OFANA4 using a String value.
  */
  public void setE01OFANA4(String newvalue)
  {
    fieldE01OFANA4.setString(newvalue);
  }

  /**
  * Get value of field E01OFANA4 as a String.
  */
  public String getE01OFANA4()
  {
    return fieldE01OFANA4.getString();
  }

  /**
  * Set field E01OFAMOD using a String value.
  */
  public void setE01OFAMOD(String newvalue)
  {
    fieldE01OFAMOD.setString(newvalue);
  }

  /**
  * Get value of field E01OFAMOD as a String.
  */
  public String getE01OFAMOD()
  {
    return fieldE01OFAMOD.getString();
  }

  /**
  * Set field E01OFARTP using a String value.
  */
  public void setE01OFARTP(String newvalue)
  {
    fieldE01OFARTP.setString(newvalue);
  }

  /**
  * Get value of field E01OFARTP as a String.
  */
  public String getE01OFARTP()
  {
    return fieldE01OFARTP.getString();
  }

  /**
  * Set field E01OFABNK using a String value.
  */
  public void setE01OFABNK(String newvalue)
  {
    fieldE01OFABNK.setString(newvalue);
  }

  /**
  * Get value of field E01OFABNK as a String.
  */
  public String getE01OFABNK()
  {
    return fieldE01OFABNK.getString();
  }

  /**
  * Set field E01OFABRN using a String value.
  */
  public void setE01OFABRN(String newvalue)
  {
    fieldE01OFABRN.setString(newvalue);
  }

  /**
  * Get value of field E01OFABRN as a String.
  */
  public String getE01OFABRN()
  {
    return fieldE01OFABRN.getString();
  }

  /**
  * Set numeric field E01OFABRN using a BigDecimal value.
  */
  public void setE01OFABRN(BigDecimal newvalue)
  {
    fieldE01OFABRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OFABRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OFABRN()
  {
    return fieldE01OFABRN.getBigDecimal();
  }

  /**
  * Set field E01OFAACC using a String value.
  */
  public void setE01OFAACC(String newvalue)
  {
    fieldE01OFAACC.setString(newvalue);
  }

  /**
  * Get value of field E01OFAACC as a String.
  */
  public String getE01OFAACC()
  {
    return fieldE01OFAACC.getString();
  }

  /**
  * Set numeric field E01OFAACC using a BigDecimal value.
  */
  public void setE01OFAACC(BigDecimal newvalue)
  {
    fieldE01OFAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OFAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OFAACC()
  {
    return fieldE01OFAACC.getBigDecimal();
  }

  /**
  * Set field E01OFACUN using a String value.
  */
  public void setE01OFACUN(String newvalue)
  {
    fieldE01OFACUN.setString(newvalue);
  }

  /**
  * Get value of field E01OFACUN as a String.
  */
  public String getE01OFACUN()
  {
    return fieldE01OFACUN.getString();
  }

  /**
  * Set numeric field E01OFACUN using a BigDecimal value.
  */
  public void setE01OFACUN(BigDecimal newvalue)
  {
    fieldE01OFACUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OFACUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OFACUN()
  {
    return fieldE01OFACUN.getBigDecimal();
  }

  /**
  * Set field E01OFAARE using a String value.
  */
  public void setE01OFAARE(String newvalue)
  {
    fieldE01OFAARE.setString(newvalue);
  }

  /**
  * Get value of field E01OFAARE as a String.
  */
  public String getE01OFAARE()
  {
    return fieldE01OFAARE.getString();
  }

  /**
  * Set field E01OFASTA using a String value.
  */
  public void setE01OFASTA(String newvalue)
  {
    fieldE01OFASTA.setString(newvalue);
  }

  /**
  * Get value of field E01OFASTA as a String.
  */
  public String getE01OFASTA()
  {
    return fieldE01OFASTA.getString();
  }

  /**
  * Set field E01OFASTS using a String value.
  */
  public void setE01OFASTS(String newvalue)
  {
    fieldE01OFASTS.setString(newvalue);
  }

  /**
  * Get value of field E01OFASTS as a String.
  */
  public String getE01OFASTS()
  {
    return fieldE01OFASTS.getString();
  }

  /**
  * Set field E01OFANOT using a String value.
  */
  public void setE01OFANOT(String newvalue)
  {
    fieldE01OFANOT.setString(newvalue);
  }

  /**
  * Get value of field E01OFANOT as a String.
  */
  public String getE01OFANOT()
  {
    return fieldE01OFANOT.getString();
  }

  /**
  * Set field E01OFACDM using a String value.
  */
  public void setE01OFACDM(String newvalue)
  {
    fieldE01OFACDM.setString(newvalue);
  }

  /**
  * Get value of field E01OFACDM as a String.
  */
  public String getE01OFACDM()
  {
    return fieldE01OFACDM.getString();
  }

  /**
  * Set numeric field E01OFACDM using a BigDecimal value.
  */
  public void setE01OFACDM(BigDecimal newvalue)
  {
    fieldE01OFACDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OFACDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OFACDM()
  {
    return fieldE01OFACDM.getBigDecimal();
  }

  /**
  * Set field E01OFACDD using a String value.
  */
  public void setE01OFACDD(String newvalue)
  {
    fieldE01OFACDD.setString(newvalue);
  }

  /**
  * Get value of field E01OFACDD as a String.
  */
  public String getE01OFACDD()
  {
    return fieldE01OFACDD.getString();
  }

  /**
  * Set numeric field E01OFACDD using a BigDecimal value.
  */
  public void setE01OFACDD(BigDecimal newvalue)
  {
    fieldE01OFACDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OFACDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OFACDD()
  {
    return fieldE01OFACDD.getBigDecimal();
  }

  /**
  * Set field E01OFACDY using a String value.
  */
  public void setE01OFACDY(String newvalue)
  {
    fieldE01OFACDY.setString(newvalue);
  }

  /**
  * Get value of field E01OFACDY as a String.
  */
  public String getE01OFACDY()
  {
    return fieldE01OFACDY.getString();
  }

  /**
  * Set numeric field E01OFACDY using a BigDecimal value.
  */
  public void setE01OFACDY(BigDecimal newvalue)
  {
    fieldE01OFACDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OFACDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OFACDY()
  {
    return fieldE01OFACDY.getBigDecimal();
  }

  /**
  * Set field E01OFACTM using a String value.
  */
  public void setE01OFACTM(String newvalue)
  {
    fieldE01OFACTM.setString(newvalue);
  }

  /**
  * Get value of field E01OFACTM as a String.
  */
  public String getE01OFACTM()
  {
    return fieldE01OFACTM.getString();
  }

  /**
  * Set field E01OFACUS using a String value.
  */
  public void setE01OFACUS(String newvalue)
  {
    fieldE01OFACUS.setString(newvalue);
  }

  /**
  * Get value of field E01OFACUS as a String.
  */
  public String getE01OFACUS()
  {
    return fieldE01OFACUS.getString();
  }

  /**
  * Set field E01OFALMM using a String value.
  */
  public void setE01OFALMM(String newvalue)
  {
    fieldE01OFALMM.setString(newvalue);
  }

  /**
  * Get value of field E01OFALMM as a String.
  */
  public String getE01OFALMM()
  {
    return fieldE01OFALMM.getString();
  }

  /**
  * Set numeric field E01OFALMM using a BigDecimal value.
  */
  public void setE01OFALMM(BigDecimal newvalue)
  {
    fieldE01OFALMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OFALMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OFALMM()
  {
    return fieldE01OFALMM.getBigDecimal();
  }

  /**
  * Set field E01OFALMD using a String value.
  */
  public void setE01OFALMD(String newvalue)
  {
    fieldE01OFALMD.setString(newvalue);
  }

  /**
  * Get value of field E01OFALMD as a String.
  */
  public String getE01OFALMD()
  {
    return fieldE01OFALMD.getString();
  }

  /**
  * Set numeric field E01OFALMD using a BigDecimal value.
  */
  public void setE01OFALMD(BigDecimal newvalue)
  {
    fieldE01OFALMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OFALMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OFALMD()
  {
    return fieldE01OFALMD.getBigDecimal();
  }

  /**
  * Set field E01OFALMY using a String value.
  */
  public void setE01OFALMY(String newvalue)
  {
    fieldE01OFALMY.setString(newvalue);
  }

  /**
  * Get value of field E01OFALMY as a String.
  */
  public String getE01OFALMY()
  {
    return fieldE01OFALMY.getString();
  }

  /**
  * Set numeric field E01OFALMY using a BigDecimal value.
  */
  public void setE01OFALMY(BigDecimal newvalue)
  {
    fieldE01OFALMY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OFALMY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OFALMY()
  {
    return fieldE01OFALMY.getBigDecimal();
  }

  /**
  * Set field E01OFALMT using a String value.
  */
  public void setE01OFALMT(String newvalue)
  {
    fieldE01OFALMT.setString(newvalue);
  }

  /**
  * Get value of field E01OFALMT as a String.
  */
  public String getE01OFALMT()
  {
    return fieldE01OFALMT.getString();
  }

  /**
  * Set field E01OFALMU using a String value.
  */
  public void setE01OFALMU(String newvalue)
  {
    fieldE01OFALMU.setString(newvalue);
  }

  /**
  * Get value of field E01OFALMU as a String.
  */
  public String getE01OFALMU()
  {
    return fieldE01OFALMU.getString();
  }

  /**
  * Set field E01OFAPGM using a String value.
  */
  public void setE01OFAPGM(String newvalue)
  {
    fieldE01OFAPGM.setString(newvalue);
  }

  /**
  * Get value of field E01OFAPGM as a String.
  */
  public String getE01OFAPGM()
  {
    return fieldE01OFAPGM.getString();
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