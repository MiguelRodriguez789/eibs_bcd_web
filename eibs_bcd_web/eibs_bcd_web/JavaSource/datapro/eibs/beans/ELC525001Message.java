package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ELC525001 physical file definition.
* 
* File level identifier is 1160930132952.
* Record format level identifier is 4729D15C7098C.
*/

public class ELC525001Message extends MessageRecord
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
                                     "E01SELCUN",
                                     "E01SELIDN",
                                     "E01SELNME",
                                     "E01SELTYP",
                                     "E01SELPRD",
                                     "E01SELBRN",
                                     "E01SELCCY",
                                     "E01LCMACC",
                                     "E01LCMACD",
                                     "E01LCMCUN",
                                     "E01CUSNA1",
                                     "E01LCMATY",
                                     "E01LCMPRO",
                                     "E01LCMBNK",
                                     "E01LCMBRN",
                                     "E01LCMCCY",
                                     "E01LCMGLN",
                                     "E01LCMCCN",
                                     "E01LCMAMT",
                                     "E01LCMUBT",
                                     "E01LCMUSR",
                                     "E01LCMRMK",
                                     "E01FLGBUS",
                                     "E01FLGTYP",
                                     "E01FLGIBF",
                                     "E01FLGAPB"
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
                                   "E01SELCUN",
                                   "E01SELIDN",
                                   "E01SELNME",
                                   "E01SELTYP",
                                   "E01SELPRD",
                                   "E01SELBRN",
                                   "E01SELCCY",
                                   "E01LCMACC",
                                   "E01LCMACD",
                                   "E01LCMCUN",
                                   "E01CUSNA1",
                                   "E01LCMATY",
                                   "E01LCMPRO",
                                   "E01LCMBNK",
                                   "E01LCMBRN",
                                   "E01LCMCCY",
                                   "E01LCMGLN",
                                   "E01LCMCCN",
                                   "E01LCMAMT",
                                   "E01LCMUBT",
                                   "E01LCMUSR",
                                   "E01LCMRMK",
                                   "E01FLGBUS",
                                   "E01FLGTYP",
                                   "E01FLGIBF",
                                   "E01FLGAPB"
                                 };
  final static String fid = "1160930132952";
  final static String rid = "4729D15C7098C";
  final static String fmtname = "ELC525001";
  final int FIELDCOUNT = 35;
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
  private DecimalField fieldE01SELCUN = null;
  private CharacterField fieldE01SELIDN = null;
  private CharacterField fieldE01SELNME = null;
  private CharacterField fieldE01SELTYP = null;
  private CharacterField fieldE01SELPRD = null;
  private DecimalField fieldE01SELBRN = null;
  private CharacterField fieldE01SELCCY = null;
  private DecimalField fieldE01LCMACC = null;
  private CharacterField fieldE01LCMACD = null;
  private DecimalField fieldE01LCMCUN = null;
  private CharacterField fieldE01CUSNA1 = null;
  private CharacterField fieldE01LCMATY = null;
  private CharacterField fieldE01LCMPRO = null;
  private CharacterField fieldE01LCMBNK = null;
  private DecimalField fieldE01LCMBRN = null;
  private CharacterField fieldE01LCMCCY = null;
  private DecimalField fieldE01LCMGLN = null;
  private DecimalField fieldE01LCMCCN = null;
  private DecimalField fieldE01LCMAMT = null;
  private DecimalField fieldE01LCMUBT = null;
  private CharacterField fieldE01LCMUSR = null;
  private CharacterField fieldE01LCMRMK = null;
  private CharacterField fieldE01FLGBUS = null;
  private CharacterField fieldE01FLGTYP = null;
  private CharacterField fieldE01FLGIBF = null;
  private CharacterField fieldE01FLGAPB = null;

  /**
  * Constructor for ELC525001Message.
  */
  public ELC525001Message()
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
    fields[9] = fieldE01SELCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E01SELCUN");
    fields[10] = fieldE01SELIDN =
    new CharacterField(message, HEADERSIZE + 52, 25, "E01SELIDN");
    fields[11] = fieldE01SELNME =
    new CharacterField(message, HEADERSIZE + 77, 45, "E01SELNME");
    fields[12] = fieldE01SELTYP =
    new CharacterField(message, HEADERSIZE + 122, 4, "E01SELTYP");
    fields[13] = fieldE01SELPRD =
    new CharacterField(message, HEADERSIZE + 126, 4, "E01SELPRD");
    fields[14] = fieldE01SELBRN =
    new DecimalField(message, HEADERSIZE + 130, 5, 0, "E01SELBRN");
    fields[15] = fieldE01SELCCY =
    new CharacterField(message, HEADERSIZE + 135, 3, "E01SELCCY");
    fields[16] = fieldE01LCMACC =
    new DecimalField(message, HEADERSIZE + 138, 13, 0, "E01LCMACC");
    fields[17] = fieldE01LCMACD =
    new CharacterField(message, HEADERSIZE + 151, 2, "E01LCMACD");
    fields[18] = fieldE01LCMCUN =
    new DecimalField(message, HEADERSIZE + 153, 10, 0, "E01LCMCUN");
    fields[19] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 163, 60, "E01CUSNA1");
    fields[20] = fieldE01LCMATY =
    new CharacterField(message, HEADERSIZE + 223, 4, "E01LCMATY");
    fields[21] = fieldE01LCMPRO =
    new CharacterField(message, HEADERSIZE + 227, 4, "E01LCMPRO");
    fields[22] = fieldE01LCMBNK =
    new CharacterField(message, HEADERSIZE + 231, 2, "E01LCMBNK");
    fields[23] = fieldE01LCMBRN =
    new DecimalField(message, HEADERSIZE + 233, 5, 0, "E01LCMBRN");
    fields[24] = fieldE01LCMCCY =
    new CharacterField(message, HEADERSIZE + 238, 3, "E01LCMCCY");
    fields[25] = fieldE01LCMGLN =
    new DecimalField(message, HEADERSIZE + 241, 17, 0, "E01LCMGLN");
    fields[26] = fieldE01LCMCCN =
    new DecimalField(message, HEADERSIZE + 258, 9, 0, "E01LCMCCN");
    fields[27] = fieldE01LCMAMT =
    new DecimalField(message, HEADERSIZE + 267, 17, 2, "E01LCMAMT");
    fields[28] = fieldE01LCMUBT =
    new DecimalField(message, HEADERSIZE + 284, 6, 0, "E01LCMUBT");
    fields[29] = fieldE01LCMUSR =
    new CharacterField(message, HEADERSIZE + 290, 10, "E01LCMUSR");
    fields[30] = fieldE01LCMRMK =
    new CharacterField(message, HEADERSIZE + 300, 60, "E01LCMRMK");
    fields[31] = fieldE01FLGBUS =
    new CharacterField(message, HEADERSIZE + 360, 4, "E01FLGBUS");
    fields[32] = fieldE01FLGTYP =
    new CharacterField(message, HEADERSIZE + 364, 1, "E01FLGTYP");
    fields[33] = fieldE01FLGIBF =
    new CharacterField(message, HEADERSIZE + 365, 1, "E01FLGIBF");
    fields[34] = fieldE01FLGAPB =
    new CharacterField(message, HEADERSIZE + 366, 1, "E01FLGAPB");

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
  * Set field E01SELCUN using a String value.
  */
  public void setE01SELCUN(String newvalue)
  {
    fieldE01SELCUN.setString(newvalue);
  }

  /**
  * Get value of field E01SELCUN as a String.
  */
  public String getE01SELCUN()
  {
    return fieldE01SELCUN.getString();
  }

  /**
  * Set numeric field E01SELCUN using a BigDecimal value.
  */
  public void setE01SELCUN(BigDecimal newvalue)
  {
    fieldE01SELCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SELCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SELCUN()
  {
    return fieldE01SELCUN.getBigDecimal();
  }

  /**
  * Set field E01SELIDN using a String value.
  */
  public void setE01SELIDN(String newvalue)
  {
    fieldE01SELIDN.setString(newvalue);
  }

  /**
  * Get value of field E01SELIDN as a String.
  */
  public String getE01SELIDN()
  {
    return fieldE01SELIDN.getString();
  }

  /**
  * Set field E01SELNME using a String value.
  */
  public void setE01SELNME(String newvalue)
  {
    fieldE01SELNME.setString(newvalue);
  }

  /**
  * Get value of field E01SELNME as a String.
  */
  public String getE01SELNME()
  {
    return fieldE01SELNME.getString();
  }

  /**
  * Set field E01SELTYP using a String value.
  */
  public void setE01SELTYP(String newvalue)
  {
    fieldE01SELTYP.setString(newvalue);
  }

  /**
  * Get value of field E01SELTYP as a String.
  */
  public String getE01SELTYP()
  {
    return fieldE01SELTYP.getString();
  }

  /**
  * Set field E01SELPRD using a String value.
  */
  public void setE01SELPRD(String newvalue)
  {
    fieldE01SELPRD.setString(newvalue);
  }

  /**
  * Get value of field E01SELPRD as a String.
  */
  public String getE01SELPRD()
  {
    return fieldE01SELPRD.getString();
  }

  /**
  * Set field E01SELBRN using a String value.
  */
  public void setE01SELBRN(String newvalue)
  {
    fieldE01SELBRN.setString(newvalue);
  }

  /**
  * Get value of field E01SELBRN as a String.
  */
  public String getE01SELBRN()
  {
    return fieldE01SELBRN.getString();
  }

  /**
  * Set numeric field E01SELBRN using a BigDecimal value.
  */
  public void setE01SELBRN(BigDecimal newvalue)
  {
    fieldE01SELBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SELBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SELBRN()
  {
    return fieldE01SELBRN.getBigDecimal();
  }

  /**
  * Set field E01SELCCY using a String value.
  */
  public void setE01SELCCY(String newvalue)
  {
    fieldE01SELCCY.setString(newvalue);
  }

  /**
  * Get value of field E01SELCCY as a String.
  */
  public String getE01SELCCY()
  {
    return fieldE01SELCCY.getString();
  }

  /**
  * Set field E01LCMACC using a String value.
  */
  public void setE01LCMACC(String newvalue)
  {
    fieldE01LCMACC.setString(newvalue);
  }

  /**
  * Get value of field E01LCMACC as a String.
  */
  public String getE01LCMACC()
  {
    return fieldE01LCMACC.getString();
  }

  /**
  * Set numeric field E01LCMACC using a BigDecimal value.
  */
  public void setE01LCMACC(BigDecimal newvalue)
  {
    fieldE01LCMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCMACC()
  {
    return fieldE01LCMACC.getBigDecimal();
  }

  /**
  * Set field E01LCMACD using a String value.
  */
  public void setE01LCMACD(String newvalue)
  {
    fieldE01LCMACD.setString(newvalue);
  }

  /**
  * Get value of field E01LCMACD as a String.
  */
  public String getE01LCMACD()
  {
    return fieldE01LCMACD.getString();
  }

  /**
  * Set field E01LCMCUN using a String value.
  */
  public void setE01LCMCUN(String newvalue)
  {
    fieldE01LCMCUN.setString(newvalue);
  }

  /**
  * Get value of field E01LCMCUN as a String.
  */
  public String getE01LCMCUN()
  {
    return fieldE01LCMCUN.getString();
  }

  /**
  * Set numeric field E01LCMCUN using a BigDecimal value.
  */
  public void setE01LCMCUN(BigDecimal newvalue)
  {
    fieldE01LCMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCMCUN()
  {
    return fieldE01LCMCUN.getBigDecimal();
  }

  /**
  * Set field E01CUSNA1 using a String value.
  */
  public void setE01CUSNA1(String newvalue)
  {
    fieldE01CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E01CUSNA1 as a String.
  */
  public String getE01CUSNA1()
  {
    return fieldE01CUSNA1.getString();
  }

  /**
  * Set field E01LCMATY using a String value.
  */
  public void setE01LCMATY(String newvalue)
  {
    fieldE01LCMATY.setString(newvalue);
  }

  /**
  * Get value of field E01LCMATY as a String.
  */
  public String getE01LCMATY()
  {
    return fieldE01LCMATY.getString();
  }

  /**
  * Set field E01LCMPRO using a String value.
  */
  public void setE01LCMPRO(String newvalue)
  {
    fieldE01LCMPRO.setString(newvalue);
  }

  /**
  * Get value of field E01LCMPRO as a String.
  */
  public String getE01LCMPRO()
  {
    return fieldE01LCMPRO.getString();
  }

  /**
  * Set field E01LCMBNK using a String value.
  */
  public void setE01LCMBNK(String newvalue)
  {
    fieldE01LCMBNK.setString(newvalue);
  }

  /**
  * Get value of field E01LCMBNK as a String.
  */
  public String getE01LCMBNK()
  {
    return fieldE01LCMBNK.getString();
  }

  /**
  * Set field E01LCMBRN using a String value.
  */
  public void setE01LCMBRN(String newvalue)
  {
    fieldE01LCMBRN.setString(newvalue);
  }

  /**
  * Get value of field E01LCMBRN as a String.
  */
  public String getE01LCMBRN()
  {
    return fieldE01LCMBRN.getString();
  }

  /**
  * Set numeric field E01LCMBRN using a BigDecimal value.
  */
  public void setE01LCMBRN(BigDecimal newvalue)
  {
    fieldE01LCMBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCMBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCMBRN()
  {
    return fieldE01LCMBRN.getBigDecimal();
  }

  /**
  * Set field E01LCMCCY using a String value.
  */
  public void setE01LCMCCY(String newvalue)
  {
    fieldE01LCMCCY.setString(newvalue);
  }

  /**
  * Get value of field E01LCMCCY as a String.
  */
  public String getE01LCMCCY()
  {
    return fieldE01LCMCCY.getString();
  }

  /**
  * Set field E01LCMGLN using a String value.
  */
  public void setE01LCMGLN(String newvalue)
  {
    fieldE01LCMGLN.setString(newvalue);
  }

  /**
  * Get value of field E01LCMGLN as a String.
  */
  public String getE01LCMGLN()
  {
    return fieldE01LCMGLN.getString();
  }

  /**
  * Set numeric field E01LCMGLN using a BigDecimal value.
  */
  public void setE01LCMGLN(BigDecimal newvalue)
  {
    fieldE01LCMGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCMGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCMGLN()
  {
    return fieldE01LCMGLN.getBigDecimal();
  }

  /**
  * Set field E01LCMCCN using a String value.
  */
  public void setE01LCMCCN(String newvalue)
  {
    fieldE01LCMCCN.setString(newvalue);
  }

  /**
  * Get value of field E01LCMCCN as a String.
  */
  public String getE01LCMCCN()
  {
    return fieldE01LCMCCN.getString();
  }

  /**
  * Set numeric field E01LCMCCN using a BigDecimal value.
  */
  public void setE01LCMCCN(BigDecimal newvalue)
  {
    fieldE01LCMCCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCMCCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCMCCN()
  {
    return fieldE01LCMCCN.getBigDecimal();
  }

  /**
  * Set field E01LCMAMT using a String value.
  */
  public void setE01LCMAMT(String newvalue)
  {
    fieldE01LCMAMT.setString(newvalue);
  }

  /**
  * Get value of field E01LCMAMT as a String.
  */
  public String getE01LCMAMT()
  {
    return fieldE01LCMAMT.getString();
  }

  /**
  * Set numeric field E01LCMAMT using a BigDecimal value.
  */
  public void setE01LCMAMT(BigDecimal newvalue)
  {
    fieldE01LCMAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCMAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCMAMT()
  {
    return fieldE01LCMAMT.getBigDecimal();
  }

  /**
  * Set field E01LCMUBT using a String value.
  */
  public void setE01LCMUBT(String newvalue)
  {
    fieldE01LCMUBT.setString(newvalue);
  }

  /**
  * Get value of field E01LCMUBT as a String.
  */
  public String getE01LCMUBT()
  {
    return fieldE01LCMUBT.getString();
  }

  /**
  * Set numeric field E01LCMUBT using a BigDecimal value.
  */
  public void setE01LCMUBT(BigDecimal newvalue)
  {
    fieldE01LCMUBT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCMUBT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCMUBT()
  {
    return fieldE01LCMUBT.getBigDecimal();
  }

  /**
  * Set field E01LCMUSR using a String value.
  */
  public void setE01LCMUSR(String newvalue)
  {
    fieldE01LCMUSR.setString(newvalue);
  }

  /**
  * Get value of field E01LCMUSR as a String.
  */
  public String getE01LCMUSR()
  {
    return fieldE01LCMUSR.getString();
  }

  /**
  * Set field E01LCMRMK using a String value.
  */
  public void setE01LCMRMK(String newvalue)
  {
    fieldE01LCMRMK.setString(newvalue);
  }

  /**
  * Get value of field E01LCMRMK as a String.
  */
  public String getE01LCMRMK()
  {
    return fieldE01LCMRMK.getString();
  }

  /**
  * Set field E01FLGBUS using a String value.
  */
  public void setE01FLGBUS(String newvalue)
  {
    fieldE01FLGBUS.setString(newvalue);
  }

  /**
  * Get value of field E01FLGBUS as a String.
  */
  public String getE01FLGBUS()
  {
    return fieldE01FLGBUS.getString();
  }

  /**
  * Set field E01FLGTYP using a String value.
  */
  public void setE01FLGTYP(String newvalue)
  {
    fieldE01FLGTYP.setString(newvalue);
  }

  /**
  * Get value of field E01FLGTYP as a String.
  */
  public String getE01FLGTYP()
  {
    return fieldE01FLGTYP.getString();
  }

  /**
  * Set field E01FLGIBF using a String value.
  */
  public void setE01FLGIBF(String newvalue)
  {
    fieldE01FLGIBF.setString(newvalue);
  }

  /**
  * Get value of field E01FLGIBF as a String.
  */
  public String getE01FLGIBF()
  {
    return fieldE01FLGIBF.getString();
  }

  /**
  * Set field E01FLGAPB using a String value.
  */
  public void setE01FLGAPB(String newvalue)
  {
    fieldE01FLGAPB.setString(newvalue);
  }

  /**
  * Get value of field E01FLGAPB as a String.
  */
  public String getE01FLGAPB()
  {
    return fieldE01FLGAPB.getString();
  }

}