package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD043004 physical file definition.
* 
* File level identifier is 1170113120222.
* Record format level identifier is 42E6623EFC092.
*/

public class EDD043004Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H04USERID",
                                     "H04PROGRM",
                                     "H04TIMSYS",
                                     "H04SCRCOD",
                                     "H04OPECOD",
                                     "H04FLGMAS",
                                     "H04FLGWK1",
                                     "H04FLGWK2",
                                     "H04FLGWK3",
                                     "E04ACMACC",
                                     "E04ACMPRO",
                                     "E04ACMCUN",
                                     "E04CUSNA1",
                                     "E04INVRBK",
                                     "E04INVRBR",
                                     "E04INVRCY",
                                     "E04INVRGL",
                                     "E04INVRAC",
                                     "E04INVMUL",
                                     "E04INVMIN",
                                     "E04INVMAX",
                                     "E04INVBLS",
                                     "E04INVSDM",
                                     "E04INVSDD",
                                     "E04INVSDY",
                                     "E04INVMDM",
                                     "E04INVMDD",
                                     "E04INVMDY"
                                   };
  final static String tnames[] = {
                                   "H04USERID",
                                   "H04PROGRM",
                                   "H04TIMSYS",
                                   "H04SCRCOD",
                                   "H04OPECOD",
                                   "H04FLGMAS",
                                   "H04FLGWK1",
                                   "H04FLGWK2",
                                   "H04FLGWK3",
                                   "E04ACMACC",
                                   "E04ACMPRO",
                                   "E04ACMCUN",
                                   "E04CUSNA1",
                                   "E04INVRBK",
                                   "E04INVRBR",
                                   "E04INVRCY",
                                   "E04INVRGL",
                                   "E04INVRAC",
                                   "E04INVMUL",
                                   "E04INVMIN",
                                   "E04INVMAX",
                                   "E04INVBLS",
                                   "E04INVSDM",
                                   "E04INVSDD",
                                   "E04INVSDY",
                                   "E04INVMDM",
                                   "E04INVMDD",
                                   "E04INVMDY"
                                 };
  final static String fid = "1170113120222";
  final static String rid = "42E6623EFC092";
  final static String fmtname = "EDD043004";
  final int FIELDCOUNT = 28;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH04USERID = null;
  private CharacterField fieldH04PROGRM = null;
  private CharacterField fieldH04TIMSYS = null;
  private CharacterField fieldH04SCRCOD = null;
  private CharacterField fieldH04OPECOD = null;
  private CharacterField fieldH04FLGMAS = null;
  private CharacterField fieldH04FLGWK1 = null;
  private CharacterField fieldH04FLGWK2 = null;
  private CharacterField fieldH04FLGWK3 = null;
  private DecimalField fieldE04ACMACC = null;
  private CharacterField fieldE04ACMPRO = null;
  private DecimalField fieldE04ACMCUN = null;
  private CharacterField fieldE04CUSNA1 = null;
  private CharacterField fieldE04INVRBK = null;
  private DecimalField fieldE04INVRBR = null;
  private CharacterField fieldE04INVRCY = null;
  private DecimalField fieldE04INVRGL = null;
  private DecimalField fieldE04INVRAC = null;
  private DecimalField fieldE04INVMUL = null;
  private DecimalField fieldE04INVMIN = null;
  private DecimalField fieldE04INVMAX = null;
  private DecimalField fieldE04INVBLS = null;
  private DecimalField fieldE04INVSDM = null;
  private DecimalField fieldE04INVSDD = null;
  private DecimalField fieldE04INVSDY = null;
  private DecimalField fieldE04INVMDM = null;
  private DecimalField fieldE04INVMDD = null;
  private DecimalField fieldE04INVMDY = null;

  /**
  * Constructor for EDD043004Message.
  */
  public EDD043004Message()
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
    recordsize = 259;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH04USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H04USERID");
    fields[1] = fieldH04PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H04PROGRM");
    fields[2] = fieldH04TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H04TIMSYS");
    fields[3] = fieldH04SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H04SCRCOD");
    fields[4] = fieldH04OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H04OPECOD");
    fields[5] = fieldH04FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H04FLGMAS");
    fields[6] = fieldH04FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H04FLGWK1");
    fields[7] = fieldH04FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H04FLGWK2");
    fields[8] = fieldH04FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H04FLGWK3");
    fields[9] = fieldE04ACMACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E04ACMACC");
    fields[10] = fieldE04ACMPRO =
    new CharacterField(message, HEADERSIZE + 55, 4, "E04ACMPRO");
    fields[11] = fieldE04ACMCUN =
    new DecimalField(message, HEADERSIZE + 59, 10, 0, "E04ACMCUN");
    fields[12] = fieldE04CUSNA1 =
    new CharacterField(message, HEADERSIZE + 69, 60, "E04CUSNA1");
    fields[13] = fieldE04INVRBK =
    new CharacterField(message, HEADERSIZE + 129, 2, "E04INVRBK");
    fields[14] = fieldE04INVRBR =
    new DecimalField(message, HEADERSIZE + 131, 5, 0, "E04INVRBR");
    fields[15] = fieldE04INVRCY =
    new CharacterField(message, HEADERSIZE + 136, 3, "E04INVRCY");
    fields[16] = fieldE04INVRGL =
    new DecimalField(message, HEADERSIZE + 139, 17, 0, "E04INVRGL");
    fields[17] = fieldE04INVRAC =
    new DecimalField(message, HEADERSIZE + 156, 13, 0, "E04INVRAC");
    fields[18] = fieldE04INVMUL =
    new DecimalField(message, HEADERSIZE + 169, 17, 2, "E04INVMUL");
    fields[19] = fieldE04INVMIN =
    new DecimalField(message, HEADERSIZE + 186, 17, 2, "E04INVMIN");
    fields[20] = fieldE04INVMAX =
    new DecimalField(message, HEADERSIZE + 203, 17, 2, "E04INVMAX");
    fields[21] = fieldE04INVBLS =
    new DecimalField(message, HEADERSIZE + 220, 17, 2, "E04INVBLS");
    fields[22] = fieldE04INVSDM =
    new DecimalField(message, HEADERSIZE + 237, 3, 0, "E04INVSDM");
    fields[23] = fieldE04INVSDD =
    new DecimalField(message, HEADERSIZE + 240, 3, 0, "E04INVSDD");
    fields[24] = fieldE04INVSDY =
    new DecimalField(message, HEADERSIZE + 243, 5, 0, "E04INVSDY");
    fields[25] = fieldE04INVMDM =
    new DecimalField(message, HEADERSIZE + 248, 3, 0, "E04INVMDM");
    fields[26] = fieldE04INVMDD =
    new DecimalField(message, HEADERSIZE + 251, 3, 0, "E04INVMDD");
    fields[27] = fieldE04INVMDY =
    new DecimalField(message, HEADERSIZE + 254, 5, 0, "E04INVMDY");

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
  * Set field H04USERID using a String value.
  */
  public void setH04USERID(String newvalue)
  {
    fieldH04USERID.setString(newvalue);
  }

  /**
  * Get value of field H04USERID as a String.
  */
  public String getH04USERID()
  {
    return fieldH04USERID.getString();
  }

  /**
  * Set field H04PROGRM using a String value.
  */
  public void setH04PROGRM(String newvalue)
  {
    fieldH04PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H04PROGRM as a String.
  */
  public String getH04PROGRM()
  {
    return fieldH04PROGRM.getString();
  }

  /**
  * Set field H04TIMSYS using a String value.
  */
  public void setH04TIMSYS(String newvalue)
  {
    fieldH04TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H04TIMSYS as a String.
  */
  public String getH04TIMSYS()
  {
    return fieldH04TIMSYS.getString();
  }

  /**
  * Set field H04SCRCOD using a String value.
  */
  public void setH04SCRCOD(String newvalue)
  {
    fieldH04SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H04SCRCOD as a String.
  */
  public String getH04SCRCOD()
  {
    return fieldH04SCRCOD.getString();
  }

  /**
  * Set field H04OPECOD using a String value.
  */
  public void setH04OPECOD(String newvalue)
  {
    fieldH04OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H04OPECOD as a String.
  */
  public String getH04OPECOD()
  {
    return fieldH04OPECOD.getString();
  }

  /**
  * Set field H04FLGMAS using a String value.
  */
  public void setH04FLGMAS(String newvalue)
  {
    fieldH04FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H04FLGMAS as a String.
  */
  public String getH04FLGMAS()
  {
    return fieldH04FLGMAS.getString();
  }

  /**
  * Set field H04FLGWK1 using a String value.
  */
  public void setH04FLGWK1(String newvalue)
  {
    fieldH04FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H04FLGWK1 as a String.
  */
  public String getH04FLGWK1()
  {
    return fieldH04FLGWK1.getString();
  }

  /**
  * Set field H04FLGWK2 using a String value.
  */
  public void setH04FLGWK2(String newvalue)
  {
    fieldH04FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H04FLGWK2 as a String.
  */
  public String getH04FLGWK2()
  {
    return fieldH04FLGWK2.getString();
  }

  /**
  * Set field H04FLGWK3 using a String value.
  */
  public void setH04FLGWK3(String newvalue)
  {
    fieldH04FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H04FLGWK3 as a String.
  */
  public String getH04FLGWK3()
  {
    return fieldH04FLGWK3.getString();
  }

  /**
  * Set field E04ACMACC using a String value.
  */
  public void setE04ACMACC(String newvalue)
  {
    fieldE04ACMACC.setString(newvalue);
  }

  /**
  * Get value of field E04ACMACC as a String.
  */
  public String getE04ACMACC()
  {
    return fieldE04ACMACC.getString();
  }

  /**
  * Set numeric field E04ACMACC using a BigDecimal value.
  */
  public void setE04ACMACC(BigDecimal newvalue)
  {
    fieldE04ACMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04ACMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04ACMACC()
  {
    return fieldE04ACMACC.getBigDecimal();
  }

  /**
  * Set field E04ACMPRO using a String value.
  */
  public void setE04ACMPRO(String newvalue)
  {
    fieldE04ACMPRO.setString(newvalue);
  }

  /**
  * Get value of field E04ACMPRO as a String.
  */
  public String getE04ACMPRO()
  {
    return fieldE04ACMPRO.getString();
  }

  /**
  * Set field E04ACMCUN using a String value.
  */
  public void setE04ACMCUN(String newvalue)
  {
    fieldE04ACMCUN.setString(newvalue);
  }

  /**
  * Get value of field E04ACMCUN as a String.
  */
  public String getE04ACMCUN()
  {
    return fieldE04ACMCUN.getString();
  }

  /**
  * Set numeric field E04ACMCUN using a BigDecimal value.
  */
  public void setE04ACMCUN(BigDecimal newvalue)
  {
    fieldE04ACMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04ACMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04ACMCUN()
  {
    return fieldE04ACMCUN.getBigDecimal();
  }

  /**
  * Set field E04CUSNA1 using a String value.
  */
  public void setE04CUSNA1(String newvalue)
  {
    fieldE04CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E04CUSNA1 as a String.
  */
  public String getE04CUSNA1()
  {
    return fieldE04CUSNA1.getString();
  }

  /**
  * Set field E04INVRBK using a String value.
  */
  public void setE04INVRBK(String newvalue)
  {
    fieldE04INVRBK.setString(newvalue);
  }

  /**
  * Get value of field E04INVRBK as a String.
  */
  public String getE04INVRBK()
  {
    return fieldE04INVRBK.getString();
  }

  /**
  * Set field E04INVRBR using a String value.
  */
  public void setE04INVRBR(String newvalue)
  {
    fieldE04INVRBR.setString(newvalue);
  }

  /**
  * Get value of field E04INVRBR as a String.
  */
  public String getE04INVRBR()
  {
    return fieldE04INVRBR.getString();
  }

  /**
  * Set numeric field E04INVRBR using a BigDecimal value.
  */
  public void setE04INVRBR(BigDecimal newvalue)
  {
    fieldE04INVRBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04INVRBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04INVRBR()
  {
    return fieldE04INVRBR.getBigDecimal();
  }

  /**
  * Set field E04INVRCY using a String value.
  */
  public void setE04INVRCY(String newvalue)
  {
    fieldE04INVRCY.setString(newvalue);
  }

  /**
  * Get value of field E04INVRCY as a String.
  */
  public String getE04INVRCY()
  {
    return fieldE04INVRCY.getString();
  }

  /**
  * Set field E04INVRGL using a String value.
  */
  public void setE04INVRGL(String newvalue)
  {
    fieldE04INVRGL.setString(newvalue);
  }

  /**
  * Get value of field E04INVRGL as a String.
  */
  public String getE04INVRGL()
  {
    return fieldE04INVRGL.getString();
  }

  /**
  * Set numeric field E04INVRGL using a BigDecimal value.
  */
  public void setE04INVRGL(BigDecimal newvalue)
  {
    fieldE04INVRGL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04INVRGL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04INVRGL()
  {
    return fieldE04INVRGL.getBigDecimal();
  }

  /**
  * Set field E04INVRAC using a String value.
  */
  public void setE04INVRAC(String newvalue)
  {
    fieldE04INVRAC.setString(newvalue);
  }

  /**
  * Get value of field E04INVRAC as a String.
  */
  public String getE04INVRAC()
  {
    return fieldE04INVRAC.getString();
  }

  /**
  * Set numeric field E04INVRAC using a BigDecimal value.
  */
  public void setE04INVRAC(BigDecimal newvalue)
  {
    fieldE04INVRAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04INVRAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04INVRAC()
  {
    return fieldE04INVRAC.getBigDecimal();
  }

  /**
  * Set field E04INVMUL using a String value.
  */
  public void setE04INVMUL(String newvalue)
  {
    fieldE04INVMUL.setString(newvalue);
  }

  /**
  * Get value of field E04INVMUL as a String.
  */
  public String getE04INVMUL()
  {
    return fieldE04INVMUL.getString();
  }

  /**
  * Set numeric field E04INVMUL using a BigDecimal value.
  */
  public void setE04INVMUL(BigDecimal newvalue)
  {
    fieldE04INVMUL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04INVMUL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04INVMUL()
  {
    return fieldE04INVMUL.getBigDecimal();
  }

  /**
  * Set field E04INVMIN using a String value.
  */
  public void setE04INVMIN(String newvalue)
  {
    fieldE04INVMIN.setString(newvalue);
  }

  /**
  * Get value of field E04INVMIN as a String.
  */
  public String getE04INVMIN()
  {
    return fieldE04INVMIN.getString();
  }

  /**
  * Set numeric field E04INVMIN using a BigDecimal value.
  */
  public void setE04INVMIN(BigDecimal newvalue)
  {
    fieldE04INVMIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04INVMIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04INVMIN()
  {
    return fieldE04INVMIN.getBigDecimal();
  }

  /**
  * Set field E04INVMAX using a String value.
  */
  public void setE04INVMAX(String newvalue)
  {
    fieldE04INVMAX.setString(newvalue);
  }

  /**
  * Get value of field E04INVMAX as a String.
  */
  public String getE04INVMAX()
  {
    return fieldE04INVMAX.getString();
  }

  /**
  * Set numeric field E04INVMAX using a BigDecimal value.
  */
  public void setE04INVMAX(BigDecimal newvalue)
  {
    fieldE04INVMAX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04INVMAX as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04INVMAX()
  {
    return fieldE04INVMAX.getBigDecimal();
  }

  /**
  * Set field E04INVBLS using a String value.
  */
  public void setE04INVBLS(String newvalue)
  {
    fieldE04INVBLS.setString(newvalue);
  }

  /**
  * Get value of field E04INVBLS as a String.
  */
  public String getE04INVBLS()
  {
    return fieldE04INVBLS.getString();
  }

  /**
  * Set numeric field E04INVBLS using a BigDecimal value.
  */
  public void setE04INVBLS(BigDecimal newvalue)
  {
    fieldE04INVBLS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04INVBLS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04INVBLS()
  {
    return fieldE04INVBLS.getBigDecimal();
  }

  /**
  * Set field E04INVSDM using a String value.
  */
  public void setE04INVSDM(String newvalue)
  {
    fieldE04INVSDM.setString(newvalue);
  }

  /**
  * Get value of field E04INVSDM as a String.
  */
  public String getE04INVSDM()
  {
    return fieldE04INVSDM.getString();
  }

  /**
  * Set numeric field E04INVSDM using a BigDecimal value.
  */
  public void setE04INVSDM(BigDecimal newvalue)
  {
    fieldE04INVSDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04INVSDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04INVSDM()
  {
    return fieldE04INVSDM.getBigDecimal();
  }

  /**
  * Set field E04INVSDD using a String value.
  */
  public void setE04INVSDD(String newvalue)
  {
    fieldE04INVSDD.setString(newvalue);
  }

  /**
  * Get value of field E04INVSDD as a String.
  */
  public String getE04INVSDD()
  {
    return fieldE04INVSDD.getString();
  }

  /**
  * Set numeric field E04INVSDD using a BigDecimal value.
  */
  public void setE04INVSDD(BigDecimal newvalue)
  {
    fieldE04INVSDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04INVSDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04INVSDD()
  {
    return fieldE04INVSDD.getBigDecimal();
  }

  /**
  * Set field E04INVSDY using a String value.
  */
  public void setE04INVSDY(String newvalue)
  {
    fieldE04INVSDY.setString(newvalue);
  }

  /**
  * Get value of field E04INVSDY as a String.
  */
  public String getE04INVSDY()
  {
    return fieldE04INVSDY.getString();
  }

  /**
  * Set numeric field E04INVSDY using a BigDecimal value.
  */
  public void setE04INVSDY(BigDecimal newvalue)
  {
    fieldE04INVSDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04INVSDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04INVSDY()
  {
    return fieldE04INVSDY.getBigDecimal();
  }

  /**
  * Set field E04INVMDM using a String value.
  */
  public void setE04INVMDM(String newvalue)
  {
    fieldE04INVMDM.setString(newvalue);
  }

  /**
  * Get value of field E04INVMDM as a String.
  */
  public String getE04INVMDM()
  {
    return fieldE04INVMDM.getString();
  }

  /**
  * Set numeric field E04INVMDM using a BigDecimal value.
  */
  public void setE04INVMDM(BigDecimal newvalue)
  {
    fieldE04INVMDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04INVMDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04INVMDM()
  {
    return fieldE04INVMDM.getBigDecimal();
  }

  /**
  * Set field E04INVMDD using a String value.
  */
  public void setE04INVMDD(String newvalue)
  {
    fieldE04INVMDD.setString(newvalue);
  }

  /**
  * Get value of field E04INVMDD as a String.
  */
  public String getE04INVMDD()
  {
    return fieldE04INVMDD.getString();
  }

  /**
  * Set numeric field E04INVMDD using a BigDecimal value.
  */
  public void setE04INVMDD(BigDecimal newvalue)
  {
    fieldE04INVMDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04INVMDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04INVMDD()
  {
    return fieldE04INVMDD.getBigDecimal();
  }

  /**
  * Set field E04INVMDY using a String value.
  */
  public void setE04INVMDY(String newvalue)
  {
    fieldE04INVMDY.setString(newvalue);
  }

  /**
  * Get value of field E04INVMDY as a String.
  */
  public String getE04INVMDY()
  {
    return fieldE04INVMDY.getString();
  }

  /**
  * Set numeric field E04INVMDY using a BigDecimal value.
  */
  public void setE04INVMDY(BigDecimal newvalue)
  {
    fieldE04INVMDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04INVMDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04INVMDY()
  {
    return fieldE04INVMDY.getBigDecimal();
  }

}
