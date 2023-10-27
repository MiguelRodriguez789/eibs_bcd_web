package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECO024003 physical file definition.
* 
* File level identifier is 1151006160755.
* Record format level identifier is 373A4F2F62FFB.
*/

public class ECO024003Message extends MessageRecord
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
                                     "E03PLDCDE",
                                     "E03PLDNUM",
                                     "E03PLDACC",
                                     "E03PLDRCY",
                                     "E03PLDCUN",
                                     "E03PLDIDE",
                                     "E03PLDNME",
                                     "E03PLDROC",
                                     "E03PLDCCY",
                                     "E03PLDACD",
                                     "E03PLDTYP",
                                     "E03PLDPRD",
                                     "E03PLDFVM",
                                     "E03PLDFVD",
                                     "E03PLDFVY",
                                     "E03PLDPNU",
                                     "E03PLDMCO",
                                     "E03PLDMPG",
                                     "E03PLDCNV",
                                     "E03PLDCAC",
                                     "E03PLDSTS"
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
                                   "E03PLDCDE",
                                   "E03PLDNUM",
                                   "E03PLDACC",
                                   "E03PLDRCY",
                                   "E03PLDCUN",
                                   "E03PLDIDE",
                                   "E03PLDNME",
                                   "E03PLDROC",
                                   "E03PLDCCY",
                                   "E03PLDACD",
                                   "E03PLDTYP",
                                   "E03PLDPRD",
                                   "E03PLDFVM",
                                   "E03PLDFVD",
                                   "E03PLDFVY",
                                   "E03PLDPNU",
                                   "E03PLDMCO",
                                   "E03PLDMPG",
                                   "E03PLDCNV",
                                   "E03PLDCAC",
                                   "E03PLDSTS"
                                 };
  final static String fid = "1151006160755";
  final static String rid = "373A4F2F62FFB";
  final static String fmtname = "ECO024003";
  final int FIELDCOUNT = 30;
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
  private CharacterField fieldE03PLDCDE = null;
  private DecimalField fieldE03PLDNUM = null;
  private DecimalField fieldE03PLDACC = null;
  private CharacterField fieldE03PLDRCY = null;
  private DecimalField fieldE03PLDCUN = null;
  private CharacterField fieldE03PLDIDE = null;
  private CharacterField fieldE03PLDNME = null;
  private CharacterField fieldE03PLDROC = null;
  private CharacterField fieldE03PLDCCY = null;
  private CharacterField fieldE03PLDACD = null;
  private CharacterField fieldE03PLDTYP = null;
  private CharacterField fieldE03PLDPRD = null;
  private DecimalField fieldE03PLDFVM = null;
  private DecimalField fieldE03PLDFVD = null;
  private DecimalField fieldE03PLDFVY = null;
  private DecimalField fieldE03PLDPNU = null;
  private DecimalField fieldE03PLDMCO = null;
  private DecimalField fieldE03PLDMPG = null;
  private CharacterField fieldE03PLDCNV = null;
  private CharacterField fieldE03PLDCAC = null;
  private CharacterField fieldE03PLDSTS = null;

  /**
  * Constructor for ECO024003Message.
  */
  public ECO024003Message()
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
    recordsize = 247;
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
    fields[9] = fieldE03PLDCDE =
    new CharacterField(message, HEADERSIZE + 42, 4, "E03PLDCDE");
    fields[10] = fieldE03PLDNUM =
    new DecimalField(message, HEADERSIZE + 46, 13, 0, "E03PLDNUM");
    fields[11] = fieldE03PLDACC =
    new DecimalField(message, HEADERSIZE + 59, 13, 0, "E03PLDACC");
    fields[12] = fieldE03PLDRCY =
    new CharacterField(message, HEADERSIZE + 72, 3, "E03PLDRCY");
    fields[13] = fieldE03PLDCUN =
    new DecimalField(message, HEADERSIZE + 75, 10, 0, "E03PLDCUN");
    fields[14] = fieldE03PLDIDE =
    new CharacterField(message, HEADERSIZE + 85, 25, "E03PLDIDE");
    fields[15] = fieldE03PLDNME =
    new CharacterField(message, HEADERSIZE + 110, 60, "E03PLDNME");
    fields[16] = fieldE03PLDROC =
    new CharacterField(message, HEADERSIZE + 170, 10, "E03PLDROC");
    fields[17] = fieldE03PLDCCY =
    new CharacterField(message, HEADERSIZE + 180, 3, "E03PLDCCY");
    fields[18] = fieldE03PLDACD =
    new CharacterField(message, HEADERSIZE + 183, 2, "E03PLDACD");
    fields[19] = fieldE03PLDTYP =
    new CharacterField(message, HEADERSIZE + 185, 4, "E03PLDTYP");
    fields[20] = fieldE03PLDPRD =
    new CharacterField(message, HEADERSIZE + 189, 4, "E03PLDPRD");
    fields[21] = fieldE03PLDFVM =
    new DecimalField(message, HEADERSIZE + 193, 3, 0, "E03PLDFVM");
    fields[22] = fieldE03PLDFVD =
    new DecimalField(message, HEADERSIZE + 196, 3, 0, "E03PLDFVD");
    fields[23] = fieldE03PLDFVY =
    new DecimalField(message, HEADERSIZE + 199, 5, 0, "E03PLDFVY");
    fields[24] = fieldE03PLDPNU =
    new DecimalField(message, HEADERSIZE + 204, 6, 0, "E03PLDPNU");
    fields[25] = fieldE03PLDMCO =
    new DecimalField(message, HEADERSIZE + 210, 17, 2, "E03PLDMCO");
    fields[26] = fieldE03PLDMPG =
    new DecimalField(message, HEADERSIZE + 227, 17, 2, "E03PLDMPG");
    fields[27] = fieldE03PLDCNV =
    new CharacterField(message, HEADERSIZE + 244, 1, "E03PLDCNV");
    fields[28] = fieldE03PLDCAC =
    new CharacterField(message, HEADERSIZE + 245, 1, "E03PLDCAC");
    fields[29] = fieldE03PLDSTS =
    new CharacterField(message, HEADERSIZE + 246, 1, "E03PLDSTS");

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
  * Set field E03PLDCDE using a String value.
  */
  public void setE03PLDCDE(String newvalue)
  {
    fieldE03PLDCDE.setString(newvalue);
  }

  /**
  * Get value of field E03PLDCDE as a String.
  */
  public String getE03PLDCDE()
  {
    return fieldE03PLDCDE.getString();
  }

  /**
  * Set field E03PLDNUM using a String value.
  */
  public void setE03PLDNUM(String newvalue)
  {
    fieldE03PLDNUM.setString(newvalue);
  }

  /**
  * Get value of field E03PLDNUM as a String.
  */
  public String getE03PLDNUM()
  {
    return fieldE03PLDNUM.getString();
  }

  /**
  * Set numeric field E03PLDNUM using a BigDecimal value.
  */
  public void setE03PLDNUM(BigDecimal newvalue)
  {
    fieldE03PLDNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PLDNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PLDNUM()
  {
    return fieldE03PLDNUM.getBigDecimal();
  }

  /**
  * Set field E03PLDACC using a String value.
  */
  public void setE03PLDACC(String newvalue)
  {
    fieldE03PLDACC.setString(newvalue);
  }

  /**
  * Get value of field E03PLDACC as a String.
  */
  public String getE03PLDACC()
  {
    return fieldE03PLDACC.getString();
  }

  /**
  * Set numeric field E03PLDACC using a BigDecimal value.
  */
  public void setE03PLDACC(BigDecimal newvalue)
  {
    fieldE03PLDACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PLDACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PLDACC()
  {
    return fieldE03PLDACC.getBigDecimal();
  }

  /**
  * Set field E03PLDRCY using a String value.
  */
  public void setE03PLDRCY(String newvalue)
  {
    fieldE03PLDRCY.setString(newvalue);
  }

  /**
  * Get value of field E03PLDRCY as a String.
  */
  public String getE03PLDRCY()
  {
    return fieldE03PLDRCY.getString();
  }

  /**
  * Set field E03PLDCUN using a String value.
  */
  public void setE03PLDCUN(String newvalue)
  {
    fieldE03PLDCUN.setString(newvalue);
  }

  /**
  * Get value of field E03PLDCUN as a String.
  */
  public String getE03PLDCUN()
  {
    return fieldE03PLDCUN.getString();
  }

  /**
  * Set numeric field E03PLDCUN using a BigDecimal value.
  */
  public void setE03PLDCUN(BigDecimal newvalue)
  {
    fieldE03PLDCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PLDCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PLDCUN()
  {
    return fieldE03PLDCUN.getBigDecimal();
  }

  /**
  * Set field E03PLDIDE using a String value.
  */
  public void setE03PLDIDE(String newvalue)
  {
    fieldE03PLDIDE.setString(newvalue);
  }

  /**
  * Get value of field E03PLDIDE as a String.
  */
  public String getE03PLDIDE()
  {
    return fieldE03PLDIDE.getString();
  }

  /**
  * Set field E03PLDNME using a String value.
  */
  public void setE03PLDNME(String newvalue)
  {
    fieldE03PLDNME.setString(newvalue);
  }

  /**
  * Get value of field E03PLDNME as a String.
  */
  public String getE03PLDNME()
  {
    return fieldE03PLDNME.getString();
  }

  /**
  * Set field E03PLDROC using a String value.
  */
  public void setE03PLDROC(String newvalue)
  {
    fieldE03PLDROC.setString(newvalue);
  }

  /**
  * Get value of field E03PLDROC as a String.
  */
  public String getE03PLDROC()
  {
    return fieldE03PLDROC.getString();
  }

  /**
  * Set field E03PLDCCY using a String value.
  */
  public void setE03PLDCCY(String newvalue)
  {
    fieldE03PLDCCY.setString(newvalue);
  }

  /**
  * Get value of field E03PLDCCY as a String.
  */
  public String getE03PLDCCY()
  {
    return fieldE03PLDCCY.getString();
  }

  /**
  * Set field E03PLDACD using a String value.
  */
  public void setE03PLDACD(String newvalue)
  {
    fieldE03PLDACD.setString(newvalue);
  }

  /**
  * Get value of field E03PLDACD as a String.
  */
  public String getE03PLDACD()
  {
    return fieldE03PLDACD.getString();
  }

  /**
  * Set field E03PLDTYP using a String value.
  */
  public void setE03PLDTYP(String newvalue)
  {
    fieldE03PLDTYP.setString(newvalue);
  }

  /**
  * Get value of field E03PLDTYP as a String.
  */
  public String getE03PLDTYP()
  {
    return fieldE03PLDTYP.getString();
  }

  /**
  * Set field E03PLDPRD using a String value.
  */
  public void setE03PLDPRD(String newvalue)
  {
    fieldE03PLDPRD.setString(newvalue);
  }

  /**
  * Get value of field E03PLDPRD as a String.
  */
  public String getE03PLDPRD()
  {
    return fieldE03PLDPRD.getString();
  }

  /**
  * Set field E03PLDFVM using a String value.
  */
  public void setE03PLDFVM(String newvalue)
  {
    fieldE03PLDFVM.setString(newvalue);
  }

  /**
  * Get value of field E03PLDFVM as a String.
  */
  public String getE03PLDFVM()
  {
    return fieldE03PLDFVM.getString();
  }

  /**
  * Set numeric field E03PLDFVM using a BigDecimal value.
  */
  public void setE03PLDFVM(BigDecimal newvalue)
  {
    fieldE03PLDFVM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PLDFVM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PLDFVM()
  {
    return fieldE03PLDFVM.getBigDecimal();
  }

  /**
  * Set field E03PLDFVD using a String value.
  */
  public void setE03PLDFVD(String newvalue)
  {
    fieldE03PLDFVD.setString(newvalue);
  }

  /**
  * Get value of field E03PLDFVD as a String.
  */
  public String getE03PLDFVD()
  {
    return fieldE03PLDFVD.getString();
  }

  /**
  * Set numeric field E03PLDFVD using a BigDecimal value.
  */
  public void setE03PLDFVD(BigDecimal newvalue)
  {
    fieldE03PLDFVD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PLDFVD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PLDFVD()
  {
    return fieldE03PLDFVD.getBigDecimal();
  }

  /**
  * Set field E03PLDFVY using a String value.
  */
  public void setE03PLDFVY(String newvalue)
  {
    fieldE03PLDFVY.setString(newvalue);
  }

  /**
  * Get value of field E03PLDFVY as a String.
  */
  public String getE03PLDFVY()
  {
    return fieldE03PLDFVY.getString();
  }

  /**
  * Set numeric field E03PLDFVY using a BigDecimal value.
  */
  public void setE03PLDFVY(BigDecimal newvalue)
  {
    fieldE03PLDFVY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PLDFVY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PLDFVY()
  {
    return fieldE03PLDFVY.getBigDecimal();
  }

  /**
  * Set field E03PLDPNU using a String value.
  */
  public void setE03PLDPNU(String newvalue)
  {
    fieldE03PLDPNU.setString(newvalue);
  }

  /**
  * Get value of field E03PLDPNU as a String.
  */
  public String getE03PLDPNU()
  {
    return fieldE03PLDPNU.getString();
  }

  /**
  * Set numeric field E03PLDPNU using a BigDecimal value.
  */
  public void setE03PLDPNU(BigDecimal newvalue)
  {
    fieldE03PLDPNU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PLDPNU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PLDPNU()
  {
    return fieldE03PLDPNU.getBigDecimal();
  }

  /**
  * Set field E03PLDMCO using a String value.
  */
  public void setE03PLDMCO(String newvalue)
  {
    fieldE03PLDMCO.setString(newvalue);
  }

  /**
  * Get value of field E03PLDMCO as a String.
  */
  public String getE03PLDMCO()
  {
    return fieldE03PLDMCO.getString();
  }

  /**
  * Set numeric field E03PLDMCO using a BigDecimal value.
  */
  public void setE03PLDMCO(BigDecimal newvalue)
  {
    fieldE03PLDMCO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PLDMCO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PLDMCO()
  {
    return fieldE03PLDMCO.getBigDecimal();
  }

  /**
  * Set field E03PLDMPG using a String value.
  */
  public void setE03PLDMPG(String newvalue)
  {
    fieldE03PLDMPG.setString(newvalue);
  }

  /**
  * Get value of field E03PLDMPG as a String.
  */
  public String getE03PLDMPG()
  {
    return fieldE03PLDMPG.getString();
  }

  /**
  * Set numeric field E03PLDMPG using a BigDecimal value.
  */
  public void setE03PLDMPG(BigDecimal newvalue)
  {
    fieldE03PLDMPG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PLDMPG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PLDMPG()
  {
    return fieldE03PLDMPG.getBigDecimal();
  }

  /**
  * Set field E03PLDCNV using a String value.
  */
  public void setE03PLDCNV(String newvalue)
  {
    fieldE03PLDCNV.setString(newvalue);
  }

  /**
  * Get value of field E03PLDCNV as a String.
  */
  public String getE03PLDCNV()
  {
    return fieldE03PLDCNV.getString();
  }

  /**
  * Set field E03PLDCAC using a String value.
  */
  public void setE03PLDCAC(String newvalue)
  {
    fieldE03PLDCAC.setString(newvalue);
  }

  /**
  * Get value of field E03PLDCAC as a String.
  */
  public String getE03PLDCAC()
  {
    return fieldE03PLDCAC.getString();
  }

  /**
  * Set field E03PLDSTS using a String value.
  */
  public void setE03PLDSTS(String newvalue)
  {
    fieldE03PLDSTS.setString(newvalue);
  }

  /**
  * Get value of field E03PLDSTS as a String.
  */
  public String getE03PLDSTS()
  {
    return fieldE03PLDSTS.getString();
  }

}
