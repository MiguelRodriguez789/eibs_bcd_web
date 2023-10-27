package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL015003 physical file definition.
* 
* File level identifier is 1170117130740.
* Record format level identifier is 334313BA74940.
*/

public class EDL015003Message extends MessageRecord
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
                                     "E03DEAACC",
                                     "E03DEAACD",
                                     "E03DEAPRO",
                                     "E03DEACUN",
                                     "E03DEABNK",
                                     "E03DEABRN",
                                     "E03DEACCY",
                                     "E03DEAGLN",
                                     "E03CUSNA1",
                                     "E03DLPPNU",
                                     "E03DLPPDM",
                                     "E03DLPPDD",
                                     "E03DLPPDY",
                                     "E03DLPPRI",
                                     "E03DLPINT",
                                     "E03DLPIIP",
                                     "F03DLPPNU",
                                     "F03DLPPDM",
                                     "F03DLPPDD",
                                     "F03DLPPDY",
                                     "F03DLPPRI",
                                     "F03DLPINT",
                                     "F03DLPIIP"
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
                                   "E03DEAACC",
                                   "E03DEAACD",
                                   "E03DEAPRO",
                                   "E03DEACUN",
                                   "E03DEABNK",
                                   "E03DEABRN",
                                   "E03DEACCY",
                                   "E03DEAGLN",
                                   "E03CUSNA1",
                                   "E03DLPPNU",
                                   "E03DLPPDM",
                                   "E03DLPPDD",
                                   "E03DLPPDY",
                                   "E03DLPPRI",
                                   "E03DLPINT",
                                   "E03DLPIIP",
                                   "F03DLPPNU",
                                   "F03DLPPDM",
                                   "F03DLPPDD",
                                   "F03DLPPDY",
                                   "F03DLPPRI",
                                   "F03DLPINT",
                                   "F03DLPIIP"
                                 };
  final static String fid = "1170117130740";
  final static String rid = "334313BA74940";
  final static String fmtname = "EDL015003";
  final int FIELDCOUNT = 32;
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
  private DecimalField fieldE03DEAACC = null;
  private CharacterField fieldE03DEAACD = null;
  private CharacterField fieldE03DEAPRO = null;
  private DecimalField fieldE03DEACUN = null;
  private CharacterField fieldE03DEABNK = null;
  private DecimalField fieldE03DEABRN = null;
  private CharacterField fieldE03DEACCY = null;
  private DecimalField fieldE03DEAGLN = null;
  private CharacterField fieldE03CUSNA1 = null;
  private DecimalField fieldE03DLPPNU = null;
  private DecimalField fieldE03DLPPDM = null;
  private DecimalField fieldE03DLPPDD = null;
  private DecimalField fieldE03DLPPDY = null;
  private DecimalField fieldE03DLPPRI = null;
  private DecimalField fieldE03DLPINT = null;
  private CharacterField fieldE03DLPIIP = null;
  private CharacterField fieldF03DLPPNU = null;
  private CharacterField fieldF03DLPPDM = null;
  private CharacterField fieldF03DLPPDD = null;
  private CharacterField fieldF03DLPPDY = null;
  private CharacterField fieldF03DLPPRI = null;
  private CharacterField fieldF03DLPINT = null;
  private CharacterField fieldF03DLPIIP = null;

  /**
  * Constructor for EDL015003Message.
  */
  public EDL015003Message()
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
    recordsize = 215;
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
    fields[9] = fieldE03DEAACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E03DEAACC");
    fields[10] = fieldE03DEAACD =
    new CharacterField(message, HEADERSIZE + 55, 2, "E03DEAACD");
    fields[11] = fieldE03DEAPRO =
    new CharacterField(message, HEADERSIZE + 57, 4, "E03DEAPRO");
    fields[12] = fieldE03DEACUN =
    new DecimalField(message, HEADERSIZE + 61, 10, 0, "E03DEACUN");
    fields[13] = fieldE03DEABNK =
    new CharacterField(message, HEADERSIZE + 71, 2, "E03DEABNK");
    fields[14] = fieldE03DEABRN =
    new DecimalField(message, HEADERSIZE + 73, 5, 0, "E03DEABRN");
    fields[15] = fieldE03DEACCY =
    new CharacterField(message, HEADERSIZE + 78, 3, "E03DEACCY");
    fields[16] = fieldE03DEAGLN =
    new DecimalField(message, HEADERSIZE + 81, 17, 0, "E03DEAGLN");
    fields[17] = fieldE03CUSNA1 =
    new CharacterField(message, HEADERSIZE + 98, 60, "E03CUSNA1");
    fields[18] = fieldE03DLPPNU =
    new DecimalField(message, HEADERSIZE + 158, 4, 0, "E03DLPPNU");
    fields[19] = fieldE03DLPPDM =
    new DecimalField(message, HEADERSIZE + 162, 3, 0, "E03DLPPDM");
    fields[20] = fieldE03DLPPDD =
    new DecimalField(message, HEADERSIZE + 165, 3, 0, "E03DLPPDD");
    fields[21] = fieldE03DLPPDY =
    new DecimalField(message, HEADERSIZE + 168, 5, 0, "E03DLPPDY");
    fields[22] = fieldE03DLPPRI =
    new DecimalField(message, HEADERSIZE + 173, 17, 2, "E03DLPPRI");
    fields[23] = fieldE03DLPINT =
    new DecimalField(message, HEADERSIZE + 190, 17, 2, "E03DLPINT");
    fields[24] = fieldE03DLPIIP =
    new CharacterField(message, HEADERSIZE + 207, 1, "E03DLPIIP");
    fields[25] = fieldF03DLPPNU =
    new CharacterField(message, HEADERSIZE + 208, 1, "F03DLPPNU");
    fields[26] = fieldF03DLPPDM =
    new CharacterField(message, HEADERSIZE + 209, 1, "F03DLPPDM");
    fields[27] = fieldF03DLPPDD =
    new CharacterField(message, HEADERSIZE + 210, 1, "F03DLPPDD");
    fields[28] = fieldF03DLPPDY =
    new CharacterField(message, HEADERSIZE + 211, 1, "F03DLPPDY");
    fields[29] = fieldF03DLPPRI =
    new CharacterField(message, HEADERSIZE + 212, 1, "F03DLPPRI");
    fields[30] = fieldF03DLPINT =
    new CharacterField(message, HEADERSIZE + 213, 1, "F03DLPINT");
    fields[31] = fieldF03DLPIIP =
    new CharacterField(message, HEADERSIZE + 214, 1, "F03DLPIIP");

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
  * Set field E03DEAACC using a String value.
  */
  public void setE03DEAACC(String newvalue)
  {
    fieldE03DEAACC.setString(newvalue);
  }

  /**
  * Get value of field E03DEAACC as a String.
  */
  public String getE03DEAACC()
  {
    return fieldE03DEAACC.getString();
  }

  /**
  * Set numeric field E03DEAACC using a BigDecimal value.
  */
  public void setE03DEAACC(BigDecimal newvalue)
  {
    fieldE03DEAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DEAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DEAACC()
  {
    return fieldE03DEAACC.getBigDecimal();
  }

  /**
  * Set field E03DEAACD using a String value.
  */
  public void setE03DEAACD(String newvalue)
  {
    fieldE03DEAACD.setString(newvalue);
  }

  /**
  * Get value of field E03DEAACD as a String.
  */
  public String getE03DEAACD()
  {
    return fieldE03DEAACD.getString();
  }

  /**
  * Set field E03DEAPRO using a String value.
  */
  public void setE03DEAPRO(String newvalue)
  {
    fieldE03DEAPRO.setString(newvalue);
  }

  /**
  * Get value of field E03DEAPRO as a String.
  */
  public String getE03DEAPRO()
  {
    return fieldE03DEAPRO.getString();
  }

  /**
  * Set field E03DEACUN using a String value.
  */
  public void setE03DEACUN(String newvalue)
  {
    fieldE03DEACUN.setString(newvalue);
  }

  /**
  * Get value of field E03DEACUN as a String.
  */
  public String getE03DEACUN()
  {
    return fieldE03DEACUN.getString();
  }

  /**
  * Set numeric field E03DEACUN using a BigDecimal value.
  */
  public void setE03DEACUN(BigDecimal newvalue)
  {
    fieldE03DEACUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DEACUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DEACUN()
  {
    return fieldE03DEACUN.getBigDecimal();
  }

  /**
  * Set field E03DEABNK using a String value.
  */
  public void setE03DEABNK(String newvalue)
  {
    fieldE03DEABNK.setString(newvalue);
  }

  /**
  * Get value of field E03DEABNK as a String.
  */
  public String getE03DEABNK()
  {
    return fieldE03DEABNK.getString();
  }

  /**
  * Set field E03DEABRN using a String value.
  */
  public void setE03DEABRN(String newvalue)
  {
    fieldE03DEABRN.setString(newvalue);
  }

  /**
  * Get value of field E03DEABRN as a String.
  */
  public String getE03DEABRN()
  {
    return fieldE03DEABRN.getString();
  }

  /**
  * Set numeric field E03DEABRN using a BigDecimal value.
  */
  public void setE03DEABRN(BigDecimal newvalue)
  {
    fieldE03DEABRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DEABRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DEABRN()
  {
    return fieldE03DEABRN.getBigDecimal();
  }

  /**
  * Set field E03DEACCY using a String value.
  */
  public void setE03DEACCY(String newvalue)
  {
    fieldE03DEACCY.setString(newvalue);
  }

  /**
  * Get value of field E03DEACCY as a String.
  */
  public String getE03DEACCY()
  {
    return fieldE03DEACCY.getString();
  }

  /**
  * Set field E03DEAGLN using a String value.
  */
  public void setE03DEAGLN(String newvalue)
  {
    fieldE03DEAGLN.setString(newvalue);
  }

  /**
  * Get value of field E03DEAGLN as a String.
  */
  public String getE03DEAGLN()
  {
    return fieldE03DEAGLN.getString();
  }

  /**
  * Set numeric field E03DEAGLN using a BigDecimal value.
  */
  public void setE03DEAGLN(BigDecimal newvalue)
  {
    fieldE03DEAGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DEAGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DEAGLN()
  {
    return fieldE03DEAGLN.getBigDecimal();
  }

  /**
  * Set field E03CUSNA1 using a String value.
  */
  public void setE03CUSNA1(String newvalue)
  {
    fieldE03CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E03CUSNA1 as a String.
  */
  public String getE03CUSNA1()
  {
    return fieldE03CUSNA1.getString();
  }

  /**
  * Set field E03DLPPNU using a String value.
  */
  public void setE03DLPPNU(String newvalue)
  {
    fieldE03DLPPNU.setString(newvalue);
  }

  /**
  * Get value of field E03DLPPNU as a String.
  */
  public String getE03DLPPNU()
  {
    return fieldE03DLPPNU.getString();
  }

  /**
  * Set numeric field E03DLPPNU using a BigDecimal value.
  */
  public void setE03DLPPNU(BigDecimal newvalue)
  {
    fieldE03DLPPNU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DLPPNU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DLPPNU()
  {
    return fieldE03DLPPNU.getBigDecimal();
  }

  /**
  * Set field E03DLPPDM using a String value.
  */
  public void setE03DLPPDM(String newvalue)
  {
    fieldE03DLPPDM.setString(newvalue);
  }

  /**
  * Get value of field E03DLPPDM as a String.
  */
  public String getE03DLPPDM()
  {
    return fieldE03DLPPDM.getString();
  }

  /**
  * Set numeric field E03DLPPDM using a BigDecimal value.
  */
  public void setE03DLPPDM(BigDecimal newvalue)
  {
    fieldE03DLPPDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DLPPDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DLPPDM()
  {
    return fieldE03DLPPDM.getBigDecimal();
  }

  /**
  * Set field E03DLPPDD using a String value.
  */
  public void setE03DLPPDD(String newvalue)
  {
    fieldE03DLPPDD.setString(newvalue);
  }

  /**
  * Get value of field E03DLPPDD as a String.
  */
  public String getE03DLPPDD()
  {
    return fieldE03DLPPDD.getString();
  }

  /**
  * Set numeric field E03DLPPDD using a BigDecimal value.
  */
  public void setE03DLPPDD(BigDecimal newvalue)
  {
    fieldE03DLPPDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DLPPDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DLPPDD()
  {
    return fieldE03DLPPDD.getBigDecimal();
  }

  /**
  * Set field E03DLPPDY using a String value.
  */
  public void setE03DLPPDY(String newvalue)
  {
    fieldE03DLPPDY.setString(newvalue);
  }

  /**
  * Get value of field E03DLPPDY as a String.
  */
  public String getE03DLPPDY()
  {
    return fieldE03DLPPDY.getString();
  }

  /**
  * Set numeric field E03DLPPDY using a BigDecimal value.
  */
  public void setE03DLPPDY(BigDecimal newvalue)
  {
    fieldE03DLPPDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DLPPDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DLPPDY()
  {
    return fieldE03DLPPDY.getBigDecimal();
  }

  /**
  * Set field E03DLPPRI using a String value.
  */
  public void setE03DLPPRI(String newvalue)
  {
    fieldE03DLPPRI.setString(newvalue);
  }

  /**
  * Get value of field E03DLPPRI as a String.
  */
  public String getE03DLPPRI()
  {
    return fieldE03DLPPRI.getString();
  }

  /**
  * Set numeric field E03DLPPRI using a BigDecimal value.
  */
  public void setE03DLPPRI(BigDecimal newvalue)
  {
    fieldE03DLPPRI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DLPPRI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DLPPRI()
  {
    return fieldE03DLPPRI.getBigDecimal();
  }

  /**
  * Set field E03DLPINT using a String value.
  */
  public void setE03DLPINT(String newvalue)
  {
    fieldE03DLPINT.setString(newvalue);
  }

  /**
  * Get value of field E03DLPINT as a String.
  */
  public String getE03DLPINT()
  {
    return fieldE03DLPINT.getString();
  }

  /**
  * Set numeric field E03DLPINT using a BigDecimal value.
  */
  public void setE03DLPINT(BigDecimal newvalue)
  {
    fieldE03DLPINT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DLPINT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DLPINT()
  {
    return fieldE03DLPINT.getBigDecimal();
  }

  /**
  * Set field E03DLPIIP using a String value.
  */
  public void setE03DLPIIP(String newvalue)
  {
    fieldE03DLPIIP.setString(newvalue);
  }

  /**
  * Get value of field E03DLPIIP as a String.
  */
  public String getE03DLPIIP()
  {
    return fieldE03DLPIIP.getString();
  }

  /**
  * Set field F03DLPPNU using a String value.
  */
  public void setF03DLPPNU(String newvalue)
  {
    fieldF03DLPPNU.setString(newvalue);
  }

  /**
  * Get value of field F03DLPPNU as a String.
  */
  public String getF03DLPPNU()
  {
    return fieldF03DLPPNU.getString();
  }

  /**
  * Set field F03DLPPDM using a String value.
  */
  public void setF03DLPPDM(String newvalue)
  {
    fieldF03DLPPDM.setString(newvalue);
  }

  /**
  * Get value of field F03DLPPDM as a String.
  */
  public String getF03DLPPDM()
  {
    return fieldF03DLPPDM.getString();
  }

  /**
  * Set field F03DLPPDD using a String value.
  */
  public void setF03DLPPDD(String newvalue)
  {
    fieldF03DLPPDD.setString(newvalue);
  }

  /**
  * Get value of field F03DLPPDD as a String.
  */
  public String getF03DLPPDD()
  {
    return fieldF03DLPPDD.getString();
  }

  /**
  * Set field F03DLPPDY using a String value.
  */
  public void setF03DLPPDY(String newvalue)
  {
    fieldF03DLPPDY.setString(newvalue);
  }

  /**
  * Get value of field F03DLPPDY as a String.
  */
  public String getF03DLPPDY()
  {
    return fieldF03DLPPDY.getString();
  }

  /**
  * Set field F03DLPPRI using a String value.
  */
  public void setF03DLPPRI(String newvalue)
  {
    fieldF03DLPPRI.setString(newvalue);
  }

  /**
  * Get value of field F03DLPPRI as a String.
  */
  public String getF03DLPPRI()
  {
    return fieldF03DLPPRI.getString();
  }

  /**
  * Set field F03DLPINT using a String value.
  */
  public void setF03DLPINT(String newvalue)
  {
    fieldF03DLPINT.setString(newvalue);
  }

  /**
  * Get value of field F03DLPINT as a String.
  */
  public String getF03DLPINT()
  {
    return fieldF03DLPINT.getString();
  }

  /**
  * Set field F03DLPIIP using a String value.
  */
  public void setF03DLPIIP(String newvalue)
  {
    fieldF03DLPIIP.setString(newvalue);
  }

  /**
  * Get value of field F03DLPIIP as a String.
  */
  public String getF03DLPIIP()
  {
    return fieldF03DLPIIP.getString();
  }

}
