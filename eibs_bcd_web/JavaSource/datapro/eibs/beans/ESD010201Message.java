package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD010201 physical file definition.
* 
* File level identifier is 1170224103242.
* Record format level identifier is 4743741D392CD.
*/

public class ESD010201Message extends MessageRecord
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
                                     "E01PRFCUN",
                                     "E01CUSNME",
                                     "E01PRFNUM",
                                     "E01PRFDSC",
                                     "E01PRFBNK",
                                     "E01PRFHBK",
                                     "E01PRFHBR",
                                     "E01PRFHCY",
                                     "E01PRFHGL",
                                     "E01PRFHAC",
                                     "E01PRFHCC",
                                     "E01PRFOFC",
                                     "E01OFCNME",
                                     "E01PRFCMT",
                                     "E01PRFOPM",
                                     "E01PRFOPD",
                                     "E01PRFOPY",
                                     "E01PRFVCY",
                                     "E01PRFUSR",
                                     "E01PRFUPM",
                                     "E01PRFUPD",
                                     "E01PRFUPY",
                                     "E01PRFCNF",
                                     "E01CNFDSC",
                                     "E01PRFOPE",
                                     "E01OPEDSC",
                                     "E01PRFDLT",
                                     "E01PRFREJ",
                                     "E01PRFRMK"
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
                                   "E01PRFCUN",
                                   "E01CUSNME",
                                   "E01PRFNUM",
                                   "E01PRFDSC",
                                   "E01PRFBNK",
                                   "E01PRFHBK",
                                   "E01PRFHBR",
                                   "E01PRFHCY",
                                   "E01PRFHGL",
                                   "E01PRFHAC",
                                   "E01PRFHCC",
                                   "E01PRFOFC",
                                   "E01OFCNME",
                                   "E01PRFCMT",
                                   "E01PRFOPM",
                                   "E01PRFOPD",
                                   "E01PRFOPY",
                                   "E01PRFVCY",
                                   "E01PRFUSR",
                                   "E01PRFUPM",
                                   "E01PRFUPD",
                                   "E01PRFUPY",
                                   "E01PRFCNF",
                                   "E01CNFDSC",
                                   "E01PRFOPE",
                                   "E01OPEDSC",
                                   "E01PRFDLT",
                                   "E01PRFREJ",
                                   "E01PRFRMK"
                                 };
  final static String fid = "1170224103242";
  final static String rid = "4743741D392CD";
  final static String fmtname = "ESD010201";
  final int FIELDCOUNT = 38;
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
  private DecimalField fieldE01PRFCUN = null;
  private CharacterField fieldE01CUSNME = null;
  private DecimalField fieldE01PRFNUM = null;
  private CharacterField fieldE01PRFDSC = null;
  private CharacterField fieldE01PRFBNK = null;
  private CharacterField fieldE01PRFHBK = null;
  private DecimalField fieldE01PRFHBR = null;
  private CharacterField fieldE01PRFHCY = null;
  private DecimalField fieldE01PRFHGL = null;
  private DecimalField fieldE01PRFHAC = null;
  private DecimalField fieldE01PRFHCC = null;
  private CharacterField fieldE01PRFOFC = null;
  private CharacterField fieldE01OFCNME = null;
  private CharacterField fieldE01PRFCMT = null;
  private DecimalField fieldE01PRFOPM = null;
  private DecimalField fieldE01PRFOPD = null;
  private DecimalField fieldE01PRFOPY = null;
  private CharacterField fieldE01PRFVCY = null;
  private CharacterField fieldE01PRFUSR = null;
  private DecimalField fieldE01PRFUPM = null;
  private DecimalField fieldE01PRFUPD = null;
  private DecimalField fieldE01PRFUPY = null;
  private CharacterField fieldE01PRFCNF = null;
  private CharacterField fieldE01CNFDSC = null;
  private CharacterField fieldE01PRFOPE = null;
  private CharacterField fieldE01OPEDSC = null;
  private CharacterField fieldE01PRFDLT = null;
  private CharacterField fieldE01PRFREJ = null;
  private CharacterField fieldE01PRFRMK = null;

  /**
  * Constructor for ESD010201Message.
  */
  public ESD010201Message()
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
    recordsize = 938;
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
    fields[9] = fieldE01PRFCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E01PRFCUN");
    fields[10] = fieldE01CUSNME =
    new CharacterField(message, HEADERSIZE + 52, 45, "E01CUSNME");
    fields[11] = fieldE01PRFNUM =
    new DecimalField(message, HEADERSIZE + 97, 10, 0, "E01PRFNUM");
    fields[12] = fieldE01PRFDSC =
    new CharacterField(message, HEADERSIZE + 107, 60, "E01PRFDSC");
    fields[13] = fieldE01PRFBNK =
    new CharacterField(message, HEADERSIZE + 167, 2, "E01PRFBNK");
    fields[14] = fieldE01PRFHBK =
    new CharacterField(message, HEADERSIZE + 169, 2, "E01PRFHBK");
    fields[15] = fieldE01PRFHBR =
    new DecimalField(message, HEADERSIZE + 171, 5, 0, "E01PRFHBR");
    fields[16] = fieldE01PRFHCY =
    new CharacterField(message, HEADERSIZE + 176, 3, "E01PRFHCY");
    fields[17] = fieldE01PRFHGL =
    new DecimalField(message, HEADERSIZE + 179, 17, 0, "E01PRFHGL");
    fields[18] = fieldE01PRFHAC =
    new DecimalField(message, HEADERSIZE + 196, 13, 0, "E01PRFHAC");
    fields[19] = fieldE01PRFHCC =
    new DecimalField(message, HEADERSIZE + 209, 9, 0, "E01PRFHCC");
    fields[20] = fieldE01PRFOFC =
    new CharacterField(message, HEADERSIZE + 218, 4, "E01PRFOFC");
    fields[21] = fieldE01OFCNME =
    new CharacterField(message, HEADERSIZE + 222, 45, "E01OFCNME");
    fields[22] = fieldE01PRFCMT =
    new CharacterField(message, HEADERSIZE + 267, 512, "E01PRFCMT");
    fields[23] = fieldE01PRFOPM =
    new DecimalField(message, HEADERSIZE + 779, 3, 0, "E01PRFOPM");
    fields[24] = fieldE01PRFOPD =
    new DecimalField(message, HEADERSIZE + 782, 3, 0, "E01PRFOPD");
    fields[25] = fieldE01PRFOPY =
    new DecimalField(message, HEADERSIZE + 785, 5, 0, "E01PRFOPY");
    fields[26] = fieldE01PRFVCY =
    new CharacterField(message, HEADERSIZE + 790, 3, "E01PRFVCY");
    fields[27] = fieldE01PRFUSR =
    new CharacterField(message, HEADERSIZE + 793, 10, "E01PRFUSR");
    fields[28] = fieldE01PRFUPM =
    new DecimalField(message, HEADERSIZE + 803, 3, 0, "E01PRFUPM");
    fields[29] = fieldE01PRFUPD =
    new DecimalField(message, HEADERSIZE + 806, 3, 0, "E01PRFUPD");
    fields[30] = fieldE01PRFUPY =
    new DecimalField(message, HEADERSIZE + 809, 5, 0, "E01PRFUPY");
    fields[31] = fieldE01PRFCNF =
    new CharacterField(message, HEADERSIZE + 814, 1, "E01PRFCNF");
    fields[32] = fieldE01CNFDSC =
    new CharacterField(message, HEADERSIZE + 815, 15, "E01CNFDSC");
    fields[33] = fieldE01PRFOPE =
    new CharacterField(message, HEADERSIZE + 830, 1, "E01PRFOPE");
    fields[34] = fieldE01OPEDSC =
    new CharacterField(message, HEADERSIZE + 831, 45, "E01OPEDSC");
    fields[35] = fieldE01PRFDLT =
    new CharacterField(message, HEADERSIZE + 876, 1, "E01PRFDLT");
    fields[36] = fieldE01PRFREJ =
    new CharacterField(message, HEADERSIZE + 877, 1, "E01PRFREJ");
    fields[37] = fieldE01PRFRMK =
    new CharacterField(message, HEADERSIZE + 878, 60, "E01PRFRMK");

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
  * Set field E01PRFCUN using a String value.
  */
  public void setE01PRFCUN(String newvalue)
  {
    fieldE01PRFCUN.setString(newvalue);
  }

  /**
  * Get value of field E01PRFCUN as a String.
  */
  public String getE01PRFCUN()
  {
    return fieldE01PRFCUN.getString();
  }

  /**
  * Set numeric field E01PRFCUN using a BigDecimal value.
  */
  public void setE01PRFCUN(BigDecimal newvalue)
  {
    fieldE01PRFCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFCUN()
  {
    return fieldE01PRFCUN.getBigDecimal();
  }

  /**
  * Set field E01CUSNME using a String value.
  */
  public void setE01CUSNME(String newvalue)
  {
    fieldE01CUSNME.setString(newvalue);
  }

  /**
  * Get value of field E01CUSNME as a String.
  */
  public String getE01CUSNME()
  {
    return fieldE01CUSNME.getString();
  }

  /**
  * Set field E01PRFNUM using a String value.
  */
  public void setE01PRFNUM(String newvalue)
  {
    fieldE01PRFNUM.setString(newvalue);
  }

  /**
  * Get value of field E01PRFNUM as a String.
  */
  public String getE01PRFNUM()
  {
    return fieldE01PRFNUM.getString();
  }

  /**
  * Set numeric field E01PRFNUM using a BigDecimal value.
  */
  public void setE01PRFNUM(BigDecimal newvalue)
  {
    fieldE01PRFNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFNUM()
  {
    return fieldE01PRFNUM.getBigDecimal();
  }

  /**
  * Set field E01PRFDSC using a String value.
  */
  public void setE01PRFDSC(String newvalue)
  {
    fieldE01PRFDSC.setString(newvalue);
  }

  /**
  * Get value of field E01PRFDSC as a String.
  */
  public String getE01PRFDSC()
  {
    return fieldE01PRFDSC.getString();
  }

  /**
  * Set field E01PRFBNK using a String value.
  */
  public void setE01PRFBNK(String newvalue)
  {
    fieldE01PRFBNK.setString(newvalue);
  }

  /**
  * Get value of field E01PRFBNK as a String.
  */
  public String getE01PRFBNK()
  {
    return fieldE01PRFBNK.getString();
  }

  /**
  * Set field E01PRFHBK using a String value.
  */
  public void setE01PRFHBK(String newvalue)
  {
    fieldE01PRFHBK.setString(newvalue);
  }

  /**
  * Get value of field E01PRFHBK as a String.
  */
  public String getE01PRFHBK()
  {
    return fieldE01PRFHBK.getString();
  }

  /**
  * Set field E01PRFHBR using a String value.
  */
  public void setE01PRFHBR(String newvalue)
  {
    fieldE01PRFHBR.setString(newvalue);
  }

  /**
  * Get value of field E01PRFHBR as a String.
  */
  public String getE01PRFHBR()
  {
    return fieldE01PRFHBR.getString();
  }

  /**
  * Set numeric field E01PRFHBR using a BigDecimal value.
  */
  public void setE01PRFHBR(BigDecimal newvalue)
  {
    fieldE01PRFHBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFHBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFHBR()
  {
    return fieldE01PRFHBR.getBigDecimal();
  }

  /**
  * Set field E01PRFHCY using a String value.
  */
  public void setE01PRFHCY(String newvalue)
  {
    fieldE01PRFHCY.setString(newvalue);
  }

  /**
  * Get value of field E01PRFHCY as a String.
  */
  public String getE01PRFHCY()
  {
    return fieldE01PRFHCY.getString();
  }

  /**
  * Set field E01PRFHGL using a String value.
  */
  public void setE01PRFHGL(String newvalue)
  {
    fieldE01PRFHGL.setString(newvalue);
  }

  /**
  * Get value of field E01PRFHGL as a String.
  */
  public String getE01PRFHGL()
  {
    return fieldE01PRFHGL.getString();
  }

  /**
  * Set numeric field E01PRFHGL using a BigDecimal value.
  */
  public void setE01PRFHGL(BigDecimal newvalue)
  {
    fieldE01PRFHGL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFHGL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFHGL()
  {
    return fieldE01PRFHGL.getBigDecimal();
  }

  /**
  * Set field E01PRFHAC using a String value.
  */
  public void setE01PRFHAC(String newvalue)
  {
    fieldE01PRFHAC.setString(newvalue);
  }

  /**
  * Get value of field E01PRFHAC as a String.
  */
  public String getE01PRFHAC()
  {
    return fieldE01PRFHAC.getString();
  }

  /**
  * Set numeric field E01PRFHAC using a BigDecimal value.
  */
  public void setE01PRFHAC(BigDecimal newvalue)
  {
    fieldE01PRFHAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFHAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFHAC()
  {
    return fieldE01PRFHAC.getBigDecimal();
  }

  /**
  * Set field E01PRFHCC using a String value.
  */
  public void setE01PRFHCC(String newvalue)
  {
    fieldE01PRFHCC.setString(newvalue);
  }

  /**
  * Get value of field E01PRFHCC as a String.
  */
  public String getE01PRFHCC()
  {
    return fieldE01PRFHCC.getString();
  }

  /**
  * Set numeric field E01PRFHCC using a BigDecimal value.
  */
  public void setE01PRFHCC(BigDecimal newvalue)
  {
    fieldE01PRFHCC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFHCC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFHCC()
  {
    return fieldE01PRFHCC.getBigDecimal();
  }

  /**
  * Set field E01PRFOFC using a String value.
  */
  public void setE01PRFOFC(String newvalue)
  {
    fieldE01PRFOFC.setString(newvalue);
  }

  /**
  * Get value of field E01PRFOFC as a String.
  */
  public String getE01PRFOFC()
  {
    return fieldE01PRFOFC.getString();
  }

  /**
  * Set field E01OFCNME using a String value.
  */
  public void setE01OFCNME(String newvalue)
  {
    fieldE01OFCNME.setString(newvalue);
  }

  /**
  * Get value of field E01OFCNME as a String.
  */
  public String getE01OFCNME()
  {
    return fieldE01OFCNME.getString();
  }

  /**
  * Set field E01PRFCMT using a String value.
  */
  public void setE01PRFCMT(String newvalue)
  {
    fieldE01PRFCMT.setString(newvalue);
  }

  /**
  * Get value of field E01PRFCMT as a String.
  */
  public String getE01PRFCMT()
  {
    return fieldE01PRFCMT.getString();
  }

  /**
  * Set field E01PRFOPM using a String value.
  */
  public void setE01PRFOPM(String newvalue)
  {
    fieldE01PRFOPM.setString(newvalue);
  }

  /**
  * Get value of field E01PRFOPM as a String.
  */
  public String getE01PRFOPM()
  {
    return fieldE01PRFOPM.getString();
  }

  /**
  * Set numeric field E01PRFOPM using a BigDecimal value.
  */
  public void setE01PRFOPM(BigDecimal newvalue)
  {
    fieldE01PRFOPM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFOPM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFOPM()
  {
    return fieldE01PRFOPM.getBigDecimal();
  }

  /**
  * Set field E01PRFOPD using a String value.
  */
  public void setE01PRFOPD(String newvalue)
  {
    fieldE01PRFOPD.setString(newvalue);
  }

  /**
  * Get value of field E01PRFOPD as a String.
  */
  public String getE01PRFOPD()
  {
    return fieldE01PRFOPD.getString();
  }

  /**
  * Set numeric field E01PRFOPD using a BigDecimal value.
  */
  public void setE01PRFOPD(BigDecimal newvalue)
  {
    fieldE01PRFOPD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFOPD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFOPD()
  {
    return fieldE01PRFOPD.getBigDecimal();
  }

  /**
  * Set field E01PRFOPY using a String value.
  */
  public void setE01PRFOPY(String newvalue)
  {
    fieldE01PRFOPY.setString(newvalue);
  }

  /**
  * Get value of field E01PRFOPY as a String.
  */
  public String getE01PRFOPY()
  {
    return fieldE01PRFOPY.getString();
  }

  /**
  * Set numeric field E01PRFOPY using a BigDecimal value.
  */
  public void setE01PRFOPY(BigDecimal newvalue)
  {
    fieldE01PRFOPY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFOPY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFOPY()
  {
    return fieldE01PRFOPY.getBigDecimal();
  }

  /**
  * Set field E01PRFVCY using a String value.
  */
  public void setE01PRFVCY(String newvalue)
  {
    fieldE01PRFVCY.setString(newvalue);
  }

  /**
  * Get value of field E01PRFVCY as a String.
  */
  public String getE01PRFVCY()
  {
    return fieldE01PRFVCY.getString();
  }

  /**
  * Set field E01PRFUSR using a String value.
  */
  public void setE01PRFUSR(String newvalue)
  {
    fieldE01PRFUSR.setString(newvalue);
  }

  /**
  * Get value of field E01PRFUSR as a String.
  */
  public String getE01PRFUSR()
  {
    return fieldE01PRFUSR.getString();
  }

  /**
  * Set field E01PRFUPM using a String value.
  */
  public void setE01PRFUPM(String newvalue)
  {
    fieldE01PRFUPM.setString(newvalue);
  }

  /**
  * Get value of field E01PRFUPM as a String.
  */
  public String getE01PRFUPM()
  {
    return fieldE01PRFUPM.getString();
  }

  /**
  * Set numeric field E01PRFUPM using a BigDecimal value.
  */
  public void setE01PRFUPM(BigDecimal newvalue)
  {
    fieldE01PRFUPM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFUPM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFUPM()
  {
    return fieldE01PRFUPM.getBigDecimal();
  }

  /**
  * Set field E01PRFUPD using a String value.
  */
  public void setE01PRFUPD(String newvalue)
  {
    fieldE01PRFUPD.setString(newvalue);
  }

  /**
  * Get value of field E01PRFUPD as a String.
  */
  public String getE01PRFUPD()
  {
    return fieldE01PRFUPD.getString();
  }

  /**
  * Set numeric field E01PRFUPD using a BigDecimal value.
  */
  public void setE01PRFUPD(BigDecimal newvalue)
  {
    fieldE01PRFUPD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFUPD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFUPD()
  {
    return fieldE01PRFUPD.getBigDecimal();
  }

  /**
  * Set field E01PRFUPY using a String value.
  */
  public void setE01PRFUPY(String newvalue)
  {
    fieldE01PRFUPY.setString(newvalue);
  }

  /**
  * Get value of field E01PRFUPY as a String.
  */
  public String getE01PRFUPY()
  {
    return fieldE01PRFUPY.getString();
  }

  /**
  * Set numeric field E01PRFUPY using a BigDecimal value.
  */
  public void setE01PRFUPY(BigDecimal newvalue)
  {
    fieldE01PRFUPY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFUPY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFUPY()
  {
    return fieldE01PRFUPY.getBigDecimal();
  }

  /**
  * Set field E01PRFCNF using a String value.
  */
  public void setE01PRFCNF(String newvalue)
  {
    fieldE01PRFCNF.setString(newvalue);
  }

  /**
  * Get value of field E01PRFCNF as a String.
  */
  public String getE01PRFCNF()
  {
    return fieldE01PRFCNF.getString();
  }

  /**
  * Set field E01CNFDSC using a String value.
  */
  public void setE01CNFDSC(String newvalue)
  {
    fieldE01CNFDSC.setString(newvalue);
  }

  /**
  * Get value of field E01CNFDSC as a String.
  */
  public String getE01CNFDSC()
  {
    return fieldE01CNFDSC.getString();
  }

  /**
  * Set field E01PRFOPE using a String value.
  */
  public void setE01PRFOPE(String newvalue)
  {
    fieldE01PRFOPE.setString(newvalue);
  }

  /**
  * Get value of field E01PRFOPE as a String.
  */
  public String getE01PRFOPE()
  {
    return fieldE01PRFOPE.getString();
  }

  /**
  * Set field E01OPEDSC using a String value.
  */
  public void setE01OPEDSC(String newvalue)
  {
    fieldE01OPEDSC.setString(newvalue);
  }

  /**
  * Get value of field E01OPEDSC as a String.
  */
  public String getE01OPEDSC()
  {
    return fieldE01OPEDSC.getString();
  }

  /**
  * Set field E01PRFDLT using a String value.
  */
  public void setE01PRFDLT(String newvalue)
  {
    fieldE01PRFDLT.setString(newvalue);
  }

  /**
  * Get value of field E01PRFDLT as a String.
  */
  public String getE01PRFDLT()
  {
    return fieldE01PRFDLT.getString();
  }

  /**
  * Set field E01PRFREJ using a String value.
  */
  public void setE01PRFREJ(String newvalue)
  {
    fieldE01PRFREJ.setString(newvalue);
  }

  /**
  * Get value of field E01PRFREJ as a String.
  */
  public String getE01PRFREJ()
  {
    return fieldE01PRFREJ.getString();
  }

  /**
  * Set field E01PRFRMK using a String value.
  */
  public void setE01PRFRMK(String newvalue)
  {
    fieldE01PRFRMK.setString(newvalue);
  }

  /**
  * Get value of field E01PRFRMK as a String.
  */
  public String getE01PRFRMK()
  {
    return fieldE01PRFRMK.getString();
  }

}
