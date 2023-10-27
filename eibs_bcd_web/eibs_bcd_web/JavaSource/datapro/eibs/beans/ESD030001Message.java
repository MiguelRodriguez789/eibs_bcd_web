package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD030001 physical file definition.
* 
* File level identifier is 1130611113357.
* Record format level identifier is 3C9C8A1112C2A.
*/

public class ESD030001Message extends MessageRecord
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
                                     "E01SELBRN",
                                     "E01SELACC",
                                     "E01ACMACC",
                                     "E01ACMACD",
                                     "E01ACMCUN",
                                     "E01CUSNA1",
                                     "E01ACMPRO",
                                     "E01ACMBNK",
                                     "E01ACMBRN",
                                     "E01ACMCCY",
                                     "E01ACMGLN",
                                     "E01ACMCCN",
                                     "E01ACMNBL",
                                     "E01ACMDIB",
                                     "E01ACMUSR",
                                     "E01ACMMNB",
                                     "E01ACMMGB",
                                     "E01ACMOIA",
                                     "E01ACMCLI",
                                     "E01ACMUL1",
                                     "E01AVALBL",
                                     "E01ACMRMK"
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
                                   "E01SELBRN",
                                   "E01SELACC",
                                   "E01ACMACC",
                                   "E01ACMACD",
                                   "E01ACMCUN",
                                   "E01CUSNA1",
                                   "E01ACMPRO",
                                   "E01ACMBNK",
                                   "E01ACMBRN",
                                   "E01ACMCCY",
                                   "E01ACMGLN",
                                   "E01ACMCCN",
                                   "E01ACMNBL",
                                   "E01ACMDIB",
                                   "E01ACMUSR",
                                   "E01ACMMNB",
                                   "E01ACMMGB",
                                   "E01ACMOIA",
                                   "E01ACMCLI",
                                   "E01ACMUL1",
                                   "E01AVALBL",
                                   "E01ACMRMK"
                                 };
  final static String fid = "1130611113357";
  final static String rid = "3C9C8A1112C2A";
  final static String fmtname = "ESD030001";
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
  private DecimalField fieldE01SELBRN = null;
  private DecimalField fieldE01SELACC = null;
  private DecimalField fieldE01ACMACC = null;
  private CharacterField fieldE01ACMACD = null;
  private DecimalField fieldE01ACMCUN = null;
  private CharacterField fieldE01CUSNA1 = null;
  private CharacterField fieldE01ACMPRO = null;
  private CharacterField fieldE01ACMBNK = null;
  private DecimalField fieldE01ACMBRN = null;
  private CharacterField fieldE01ACMCCY = null;
  private DecimalField fieldE01ACMGLN = null;
  private DecimalField fieldE01ACMCCN = null;
  private DecimalField fieldE01ACMNBL = null;
  private DecimalField fieldE01ACMDIB = null;
  private CharacterField fieldE01ACMUSR = null;
  private DecimalField fieldE01ACMMNB = null;
  private DecimalField fieldE01ACMMGB = null;
  private DecimalField fieldE01ACMOIA = null;
  private DecimalField fieldE01ACMCLI = null;
  private DecimalField fieldE01ACMUL1 = null;
  private DecimalField fieldE01AVALBL = null;
  private CharacterField fieldE01ACMRMK = null;

  /**
  * Constructor for ESD030001Message.
  */
  public ESD030001Message()
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
    recordsize = 380;
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
    fields[9] = fieldE01SELBRN =
    new DecimalField(message, HEADERSIZE + 42, 5, 0, "E01SELBRN");
    fields[10] = fieldE01SELACC =
    new DecimalField(message, HEADERSIZE + 47, 13, 0, "E01SELACC");
    fields[11] = fieldE01ACMACC =
    new DecimalField(message, HEADERSIZE + 60, 13, 0, "E01ACMACC");
    fields[12] = fieldE01ACMACD =
    new CharacterField(message, HEADERSIZE + 73, 2, "E01ACMACD");
    fields[13] = fieldE01ACMCUN =
    new DecimalField(message, HEADERSIZE + 75, 10, 0, "E01ACMCUN");
    fields[14] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 85, 60, "E01CUSNA1");
    fields[15] = fieldE01ACMPRO =
    new CharacterField(message, HEADERSIZE + 145, 4, "E01ACMPRO");
    fields[16] = fieldE01ACMBNK =
    new CharacterField(message, HEADERSIZE + 149, 2, "E01ACMBNK");
    fields[17] = fieldE01ACMBRN =
    new DecimalField(message, HEADERSIZE + 151, 5, 0, "E01ACMBRN");
    fields[18] = fieldE01ACMCCY =
    new CharacterField(message, HEADERSIZE + 156, 3, "E01ACMCCY");
    fields[19] = fieldE01ACMGLN =
    new DecimalField(message, HEADERSIZE + 159, 17, 0, "E01ACMGLN");
    fields[20] = fieldE01ACMCCN =
    new DecimalField(message, HEADERSIZE + 176, 9, 0, "E01ACMCCN");
    fields[21] = fieldE01ACMNBL =
    new DecimalField(message, HEADERSIZE + 185, 17, 2, "E01ACMNBL");
    fields[22] = fieldE01ACMDIB =
    new DecimalField(message, HEADERSIZE + 202, 6, 0, "E01ACMDIB");
    fields[23] = fieldE01ACMUSR =
    new CharacterField(message, HEADERSIZE + 208, 10, "E01ACMUSR");
    fields[24] = fieldE01ACMMNB =
    new DecimalField(message, HEADERSIZE + 218, 17, 2, "E01ACMMNB");
    fields[25] = fieldE01ACMMGB =
    new DecimalField(message, HEADERSIZE + 235, 17, 2, "E01ACMMGB");
    fields[26] = fieldE01ACMOIA =
    new DecimalField(message, HEADERSIZE + 252, 17, 4, "E01ACMOIA");
    fields[27] = fieldE01ACMCLI =
    new DecimalField(message, HEADERSIZE + 269, 17, 2, "E01ACMCLI");
    fields[28] = fieldE01ACMUL1 =
    new DecimalField(message, HEADERSIZE + 286, 17, 2, "E01ACMUL1");
    fields[29] = fieldE01AVALBL =
    new DecimalField(message, HEADERSIZE + 303, 17, 2, "E01AVALBL");
    fields[30] = fieldE01ACMRMK =
    new CharacterField(message, HEADERSIZE + 320, 60, "E01ACMRMK");

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
  * Set field E01SELACC using a String value.
  */
  public void setE01SELACC(String newvalue)
  {
    fieldE01SELACC.setString(newvalue);
  }

  /**
  * Get value of field E01SELACC as a String.
  */
  public String getE01SELACC()
  {
    return fieldE01SELACC.getString();
  }

  /**
  * Set numeric field E01SELACC using a BigDecimal value.
  */
  public void setE01SELACC(BigDecimal newvalue)
  {
    fieldE01SELACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SELACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SELACC()
  {
    return fieldE01SELACC.getBigDecimal();
  }

  /**
  * Set field E01ACMACC using a String value.
  */
  public void setE01ACMACC(String newvalue)
  {
    fieldE01ACMACC.setString(newvalue);
  }

  /**
  * Get value of field E01ACMACC as a String.
  */
  public String getE01ACMACC()
  {
    return fieldE01ACMACC.getString();
  }

  /**
  * Set numeric field E01ACMACC using a BigDecimal value.
  */
  public void setE01ACMACC(BigDecimal newvalue)
  {
    fieldE01ACMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMACC()
  {
    return fieldE01ACMACC.getBigDecimal();
  }

  /**
  * Set field E01ACMACD using a String value.
  */
  public void setE01ACMACD(String newvalue)
  {
    fieldE01ACMACD.setString(newvalue);
  }

  /**
  * Get value of field E01ACMACD as a String.
  */
  public String getE01ACMACD()
  {
    return fieldE01ACMACD.getString();
  }

  /**
  * Set field E01ACMCUN using a String value.
  */
  public void setE01ACMCUN(String newvalue)
  {
    fieldE01ACMCUN.setString(newvalue);
  }

  /**
  * Get value of field E01ACMCUN as a String.
  */
  public String getE01ACMCUN()
  {
    return fieldE01ACMCUN.getString();
  }

  /**
  * Set numeric field E01ACMCUN using a BigDecimal value.
  */
  public void setE01ACMCUN(BigDecimal newvalue)
  {
    fieldE01ACMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMCUN()
  {
    return fieldE01ACMCUN.getBigDecimal();
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
  * Set field E01ACMPRO using a String value.
  */
  public void setE01ACMPRO(String newvalue)
  {
    fieldE01ACMPRO.setString(newvalue);
  }

  /**
  * Get value of field E01ACMPRO as a String.
  */
  public String getE01ACMPRO()
  {
    return fieldE01ACMPRO.getString();
  }

  /**
  * Set field E01ACMBNK using a String value.
  */
  public void setE01ACMBNK(String newvalue)
  {
    fieldE01ACMBNK.setString(newvalue);
  }

  /**
  * Get value of field E01ACMBNK as a String.
  */
  public String getE01ACMBNK()
  {
    return fieldE01ACMBNK.getString();
  }

  /**
  * Set field E01ACMBRN using a String value.
  */
  public void setE01ACMBRN(String newvalue)
  {
    fieldE01ACMBRN.setString(newvalue);
  }

  /**
  * Get value of field E01ACMBRN as a String.
  */
  public String getE01ACMBRN()
  {
    return fieldE01ACMBRN.getString();
  }

  /**
  * Set numeric field E01ACMBRN using a BigDecimal value.
  */
  public void setE01ACMBRN(BigDecimal newvalue)
  {
    fieldE01ACMBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMBRN()
  {
    return fieldE01ACMBRN.getBigDecimal();
  }

  /**
  * Set field E01ACMCCY using a String value.
  */
  public void setE01ACMCCY(String newvalue)
  {
    fieldE01ACMCCY.setString(newvalue);
  }

  /**
  * Get value of field E01ACMCCY as a String.
  */
  public String getE01ACMCCY()
  {
    return fieldE01ACMCCY.getString();
  }

  /**
  * Set field E01ACMGLN using a String value.
  */
  public void setE01ACMGLN(String newvalue)
  {
    fieldE01ACMGLN.setString(newvalue);
  }

  /**
  * Get value of field E01ACMGLN as a String.
  */
  public String getE01ACMGLN()
  {
    return fieldE01ACMGLN.getString();
  }

  /**
  * Set numeric field E01ACMGLN using a BigDecimal value.
  */
  public void setE01ACMGLN(BigDecimal newvalue)
  {
    fieldE01ACMGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMGLN()
  {
    return fieldE01ACMGLN.getBigDecimal();
  }

  /**
  * Set field E01ACMCCN using a String value.
  */
  public void setE01ACMCCN(String newvalue)
  {
    fieldE01ACMCCN.setString(newvalue);
  }

  /**
  * Get value of field E01ACMCCN as a String.
  */
  public String getE01ACMCCN()
  {
    return fieldE01ACMCCN.getString();
  }

  /**
  * Set numeric field E01ACMCCN using a BigDecimal value.
  */
  public void setE01ACMCCN(BigDecimal newvalue)
  {
    fieldE01ACMCCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMCCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMCCN()
  {
    return fieldE01ACMCCN.getBigDecimal();
  }

  /**
  * Set field E01ACMNBL using a String value.
  */
  public void setE01ACMNBL(String newvalue)
  {
    fieldE01ACMNBL.setString(newvalue);
  }

  /**
  * Get value of field E01ACMNBL as a String.
  */
  public String getE01ACMNBL()
  {
    return fieldE01ACMNBL.getString();
  }

  /**
  * Set numeric field E01ACMNBL using a BigDecimal value.
  */
  public void setE01ACMNBL(BigDecimal newvalue)
  {
    fieldE01ACMNBL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMNBL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMNBL()
  {
    return fieldE01ACMNBL.getBigDecimal();
  }

  /**
  * Set field E01ACMDIB using a String value.
  */
  public void setE01ACMDIB(String newvalue)
  {
    fieldE01ACMDIB.setString(newvalue);
  }

  /**
  * Get value of field E01ACMDIB as a String.
  */
  public String getE01ACMDIB()
  {
    return fieldE01ACMDIB.getString();
  }

  /**
  * Set numeric field E01ACMDIB using a BigDecimal value.
  */
  public void setE01ACMDIB(BigDecimal newvalue)
  {
    fieldE01ACMDIB.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMDIB as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMDIB()
  {
    return fieldE01ACMDIB.getBigDecimal();
  }

  /**
  * Set field E01ACMUSR using a String value.
  */
  public void setE01ACMUSR(String newvalue)
  {
    fieldE01ACMUSR.setString(newvalue);
  }

  /**
  * Get value of field E01ACMUSR as a String.
  */
  public String getE01ACMUSR()
  {
    return fieldE01ACMUSR.getString();
  }

  /**
  * Set field E01ACMMNB using a String value.
  */
  public void setE01ACMMNB(String newvalue)
  {
    fieldE01ACMMNB.setString(newvalue);
  }

  /**
  * Get value of field E01ACMMNB as a String.
  */
  public String getE01ACMMNB()
  {
    return fieldE01ACMMNB.getString();
  }

  /**
  * Set numeric field E01ACMMNB using a BigDecimal value.
  */
  public void setE01ACMMNB(BigDecimal newvalue)
  {
    fieldE01ACMMNB.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMMNB as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMMNB()
  {
    return fieldE01ACMMNB.getBigDecimal();
  }

  /**
  * Set field E01ACMMGB using a String value.
  */
  public void setE01ACMMGB(String newvalue)
  {
    fieldE01ACMMGB.setString(newvalue);
  }

  /**
  * Get value of field E01ACMMGB as a String.
  */
  public String getE01ACMMGB()
  {
    return fieldE01ACMMGB.getString();
  }

  /**
  * Set numeric field E01ACMMGB using a BigDecimal value.
  */
  public void setE01ACMMGB(BigDecimal newvalue)
  {
    fieldE01ACMMGB.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMMGB as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMMGB()
  {
    return fieldE01ACMMGB.getBigDecimal();
  }

  /**
  * Set field E01ACMOIA using a String value.
  */
  public void setE01ACMOIA(String newvalue)
  {
    fieldE01ACMOIA.setString(newvalue);
  }

  /**
  * Get value of field E01ACMOIA as a String.
  */
  public String getE01ACMOIA()
  {
    return fieldE01ACMOIA.getString();
  }

  /**
  * Set numeric field E01ACMOIA using a BigDecimal value.
  */
  public void setE01ACMOIA(BigDecimal newvalue)
  {
    fieldE01ACMOIA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMOIA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMOIA()
  {
    return fieldE01ACMOIA.getBigDecimal();
  }

  /**
  * Set field E01ACMCLI using a String value.
  */
  public void setE01ACMCLI(String newvalue)
  {
    fieldE01ACMCLI.setString(newvalue);
  }

  /**
  * Get value of field E01ACMCLI as a String.
  */
  public String getE01ACMCLI()
  {
    return fieldE01ACMCLI.getString();
  }

  /**
  * Set numeric field E01ACMCLI using a BigDecimal value.
  */
  public void setE01ACMCLI(BigDecimal newvalue)
  {
    fieldE01ACMCLI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMCLI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMCLI()
  {
    return fieldE01ACMCLI.getBigDecimal();
  }

  /**
  * Set field E01ACMUL1 using a String value.
  */
  public void setE01ACMUL1(String newvalue)
  {
    fieldE01ACMUL1.setString(newvalue);
  }

  /**
  * Get value of field E01ACMUL1 as a String.
  */
  public String getE01ACMUL1()
  {
    return fieldE01ACMUL1.getString();
  }

  /**
  * Set numeric field E01ACMUL1 using a BigDecimal value.
  */
  public void setE01ACMUL1(BigDecimal newvalue)
  {
    fieldE01ACMUL1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMUL1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMUL1()
  {
    return fieldE01ACMUL1.getBigDecimal();
  }

  /**
  * Set field E01AVALBL using a String value.
  */
  public void setE01AVALBL(String newvalue)
  {
    fieldE01AVALBL.setString(newvalue);
  }

  /**
  * Get value of field E01AVALBL as a String.
  */
  public String getE01AVALBL()
  {
    return fieldE01AVALBL.getString();
  }

  /**
  * Set numeric field E01AVALBL using a BigDecimal value.
  */
  public void setE01AVALBL(BigDecimal newvalue)
  {
    fieldE01AVALBL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01AVALBL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01AVALBL()
  {
    return fieldE01AVALBL.getBigDecimal();
  }

  /**
  * Set field E01ACMRMK using a String value.
  */
  public void setE01ACMRMK(String newvalue)
  {
    fieldE01ACMRMK.setString(newvalue);
  }

  /**
  * Get value of field E01ACMRMK as a String.
  */
  public String getE01ACMRMK()
  {
    return fieldE01ACMRMK.getString();
  }

}
