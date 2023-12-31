package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV117003 physical file definition.
* 
* File level identifier is 1161101092422.
* Record format level identifier is 3339BE91AF556.
*/

public class EPV117003Message extends MessageRecord
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
                                     "E03PTVCUN",
                                     "E03PTVNUM",
                                     "E03PTVSEQ",
                                     "E03PTVCAM",
                                     "E03PTVNCA",
                                     "E03PTVPRD",
                                     "E03PTVCTV",
                                     "E03PTVNME",
                                     "E03PTVMAR",
                                     "E03PTVMOD",
                                     "E03PTVVAU",
                                     "E03PTVCAN",
                                     "E03PTVSTO",
                                     "E03PTVCEN",
                                     "E03PTVPTO",
                                     "E03RUTEJE",
                                     "E03FECPRD",
                                     "E03FECPRM",
                                     "E03FECPRY"
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
                                   "E03PTVCUN",
                                   "E03PTVNUM",
                                   "E03PTVSEQ",
                                   "E03PTVCAM",
                                   "E03PTVNCA",
                                   "E03PTVPRD",
                                   "E03PTVCTV",
                                   "E03PTVNME",
                                   "E03PTVMAR",
                                   "E03PTVMOD",
                                   "E03PTVVAU",
                                   "E03PTVCAN",
                                   "E03PTVSTO",
                                   "E03PTVCEN",
                                   "E03PTVPTO",
                                   "E03RUTEJE",
                                   "E03FECPRD",
                                   "E03FECPRM",
                                   "E03FECPRY"
                                 };
  final static String fid = "1161101092422";
  final static String rid = "3339BE91AF556";
  final static String fmtname = "EPV117003";
  final int FIELDCOUNT = 28;
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
  private DecimalField fieldE03PTVCUN = null;
  private DecimalField fieldE03PTVNUM = null;
  private DecimalField fieldE03PTVSEQ = null;
  private CharacterField fieldE03PTVCAM = null;
  private CharacterField fieldE03PTVNCA = null;
  private CharacterField fieldE03PTVPRD = null;
  private CharacterField fieldE03PTVCTV = null;
  private CharacterField fieldE03PTVNME = null;
  private CharacterField fieldE03PTVMAR = null;
  private CharacterField fieldE03PTVMOD = null;
  private DecimalField fieldE03PTVVAU = null;
  private DecimalField fieldE03PTVCAN = null;
  private DecimalField fieldE03PTVSTO = null;
  private DecimalField fieldE03PTVCEN = null;
  private DecimalField fieldE03PTVPTO = null;
  private CharacterField fieldE03RUTEJE = null;
  private DecimalField fieldE03FECPRD = null;
  private DecimalField fieldE03FECPRM = null;
  private DecimalField fieldE03FECPRY = null;

  /**
  * Constructor for EPV117003Message.
  */
  public EPV117003Message()
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
    recordsize = 371;
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
    fields[9] = fieldE03PTVCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E03PTVCUN");
    fields[10] = fieldE03PTVNUM =
    new DecimalField(message, HEADERSIZE + 52, 13, 0, "E03PTVNUM");
    fields[11] = fieldE03PTVSEQ =
    new DecimalField(message, HEADERSIZE + 65, 3, 0, "E03PTVSEQ");
    fields[12] = fieldE03PTVCAM =
    new CharacterField(message, HEADERSIZE + 68, 10, "E03PTVCAM");
    fields[13] = fieldE03PTVNCA =
    new CharacterField(message, HEADERSIZE + 78, 45, "E03PTVNCA");
    fields[14] = fieldE03PTVPRD =
    new CharacterField(message, HEADERSIZE + 123, 10, "E03PTVPRD");
    fields[15] = fieldE03PTVCTV =
    new CharacterField(message, HEADERSIZE + 133, 4, "E03PTVCTV");
    fields[16] = fieldE03PTVNME =
    new CharacterField(message, HEADERSIZE + 137, 45, "E03PTVNME");
    fields[17] = fieldE03PTVMAR =
    new CharacterField(message, HEADERSIZE + 182, 45, "E03PTVMAR");
    fields[18] = fieldE03PTVMOD =
    new CharacterField(message, HEADERSIZE + 227, 45, "E03PTVMOD");
    fields[19] = fieldE03PTVVAU =
    new DecimalField(message, HEADERSIZE + 272, 17, 2, "E03PTVVAU");
    fields[20] = fieldE03PTVCAN =
    new DecimalField(message, HEADERSIZE + 289, 6, 0, "E03PTVCAN");
    fields[21] = fieldE03PTVSTO =
    new DecimalField(message, HEADERSIZE + 295, 6, 0, "E03PTVSTO");
    fields[22] = fieldE03PTVCEN =
    new DecimalField(message, HEADERSIZE + 301, 17, 2, "E03PTVCEN");
    fields[23] = fieldE03PTVPTO =
    new DecimalField(message, HEADERSIZE + 318, 17, 2, "E03PTVPTO");
    fields[24] = fieldE03RUTEJE =
    new CharacterField(message, HEADERSIZE + 335, 25, "E03RUTEJE");
    fields[25] = fieldE03FECPRD =
    new DecimalField(message, HEADERSIZE + 360, 3, 0, "E03FECPRD");
    fields[26] = fieldE03FECPRM =
    new DecimalField(message, HEADERSIZE + 363, 3, 0, "E03FECPRM");
    fields[27] = fieldE03FECPRY =
    new DecimalField(message, HEADERSIZE + 366, 5, 0, "E03FECPRY");

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
  * Set field E03PTVCUN using a String value.
  */
  public void setE03PTVCUN(String newvalue)
  {
    fieldE03PTVCUN.setString(newvalue);
  }

  /**
  * Get value of field E03PTVCUN as a String.
  */
  public String getE03PTVCUN()
  {
    return fieldE03PTVCUN.getString();
  }

  /**
  * Set numeric field E03PTVCUN using a BigDecimal value.
  */
  public void setE03PTVCUN(BigDecimal newvalue)
  {
    fieldE03PTVCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PTVCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PTVCUN()
  {
    return fieldE03PTVCUN.getBigDecimal();
  }

  /**
  * Set field E03PTVNUM using a String value.
  */
  public void setE03PTVNUM(String newvalue)
  {
    fieldE03PTVNUM.setString(newvalue);
  }

  /**
  * Get value of field E03PTVNUM as a String.
  */
  public String getE03PTVNUM()
  {
    return fieldE03PTVNUM.getString();
  }

  /**
  * Set numeric field E03PTVNUM using a BigDecimal value.
  */
  public void setE03PTVNUM(BigDecimal newvalue)
  {
    fieldE03PTVNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PTVNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PTVNUM()
  {
    return fieldE03PTVNUM.getBigDecimal();
  }

  /**
  * Set field E03PTVSEQ using a String value.
  */
  public void setE03PTVSEQ(String newvalue)
  {
    fieldE03PTVSEQ.setString(newvalue);
  }

  /**
  * Get value of field E03PTVSEQ as a String.
  */
  public String getE03PTVSEQ()
  {
    return fieldE03PTVSEQ.getString();
  }

  /**
  * Set numeric field E03PTVSEQ using a BigDecimal value.
  */
  public void setE03PTVSEQ(BigDecimal newvalue)
  {
    fieldE03PTVSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PTVSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PTVSEQ()
  {
    return fieldE03PTVSEQ.getBigDecimal();
  }

  /**
  * Set field E03PTVCAM using a String value.
  */
  public void setE03PTVCAM(String newvalue)
  {
    fieldE03PTVCAM.setString(newvalue);
  }

  /**
  * Get value of field E03PTVCAM as a String.
  */
  public String getE03PTVCAM()
  {
    return fieldE03PTVCAM.getString();
  }

  /**
  * Set field E03PTVNCA using a String value.
  */
  public void setE03PTVNCA(String newvalue)
  {
    fieldE03PTVNCA.setString(newvalue);
  }

  /**
  * Get value of field E03PTVNCA as a String.
  */
  public String getE03PTVNCA()
  {
    return fieldE03PTVNCA.getString();
  }

  /**
  * Set field E03PTVPRD using a String value.
  */
  public void setE03PTVPRD(String newvalue)
  {
    fieldE03PTVPRD.setString(newvalue);
  }

  /**
  * Get value of field E03PTVPRD as a String.
  */
  public String getE03PTVPRD()
  {
    return fieldE03PTVPRD.getString();
  }

  /**
  * Set field E03PTVCTV using a String value.
  */
  public void setE03PTVCTV(String newvalue)
  {
    fieldE03PTVCTV.setString(newvalue);
  }

  /**
  * Get value of field E03PTVCTV as a String.
  */
  public String getE03PTVCTV()
  {
    return fieldE03PTVCTV.getString();
  }

  /**
  * Set field E03PTVNME using a String value.
  */
  public void setE03PTVNME(String newvalue)
  {
    fieldE03PTVNME.setString(newvalue);
  }

  /**
  * Get value of field E03PTVNME as a String.
  */
  public String getE03PTVNME()
  {
    return fieldE03PTVNME.getString();
  }

  /**
  * Set field E03PTVMAR using a String value.
  */
  public void setE03PTVMAR(String newvalue)
  {
    fieldE03PTVMAR.setString(newvalue);
  }

  /**
  * Get value of field E03PTVMAR as a String.
  */
  public String getE03PTVMAR()
  {
    return fieldE03PTVMAR.getString();
  }

  /**
  * Set field E03PTVMOD using a String value.
  */
  public void setE03PTVMOD(String newvalue)
  {
    fieldE03PTVMOD.setString(newvalue);
  }

  /**
  * Get value of field E03PTVMOD as a String.
  */
  public String getE03PTVMOD()
  {
    return fieldE03PTVMOD.getString();
  }

  /**
  * Set field E03PTVVAU using a String value.
  */
  public void setE03PTVVAU(String newvalue)
  {
    fieldE03PTVVAU.setString(newvalue);
  }

  /**
  * Get value of field E03PTVVAU as a String.
  */
  public String getE03PTVVAU()
  {
    return fieldE03PTVVAU.getString();
  }

  /**
  * Set numeric field E03PTVVAU using a BigDecimal value.
  */
  public void setE03PTVVAU(BigDecimal newvalue)
  {
    fieldE03PTVVAU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PTVVAU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PTVVAU()
  {
    return fieldE03PTVVAU.getBigDecimal();
  }

  /**
  * Set field E03PTVCAN using a String value.
  */
  public void setE03PTVCAN(String newvalue)
  {
    fieldE03PTVCAN.setString(newvalue);
  }

  /**
  * Get value of field E03PTVCAN as a String.
  */
  public String getE03PTVCAN()
  {
    return fieldE03PTVCAN.getString();
  }

  /**
  * Set numeric field E03PTVCAN using a BigDecimal value.
  */
  public void setE03PTVCAN(BigDecimal newvalue)
  {
    fieldE03PTVCAN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PTVCAN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PTVCAN()
  {
    return fieldE03PTVCAN.getBigDecimal();
  }

  /**
  * Set field E03PTVSTO using a String value.
  */
  public void setE03PTVSTO(String newvalue)
  {
    fieldE03PTVSTO.setString(newvalue);
  }

  /**
  * Get value of field E03PTVSTO as a String.
  */
  public String getE03PTVSTO()
  {
    return fieldE03PTVSTO.getString();
  }

  /**
  * Set numeric field E03PTVSTO using a BigDecimal value.
  */
  public void setE03PTVSTO(BigDecimal newvalue)
  {
    fieldE03PTVSTO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PTVSTO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PTVSTO()
  {
    return fieldE03PTVSTO.getBigDecimal();
  }

  /**
  * Set field E03PTVCEN using a String value.
  */
  public void setE03PTVCEN(String newvalue)
  {
    fieldE03PTVCEN.setString(newvalue);
  }

  /**
  * Get value of field E03PTVCEN as a String.
  */
  public String getE03PTVCEN()
  {
    return fieldE03PTVCEN.getString();
  }

  /**
  * Set numeric field E03PTVCEN using a BigDecimal value.
  */
  public void setE03PTVCEN(BigDecimal newvalue)
  {
    fieldE03PTVCEN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PTVCEN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PTVCEN()
  {
    return fieldE03PTVCEN.getBigDecimal();
  }

  /**
  * Set field E03PTVPTO using a String value.
  */
  public void setE03PTVPTO(String newvalue)
  {
    fieldE03PTVPTO.setString(newvalue);
  }

  /**
  * Get value of field E03PTVPTO as a String.
  */
  public String getE03PTVPTO()
  {
    return fieldE03PTVPTO.getString();
  }

  /**
  * Set numeric field E03PTVPTO using a BigDecimal value.
  */
  public void setE03PTVPTO(BigDecimal newvalue)
  {
    fieldE03PTVPTO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PTVPTO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PTVPTO()
  {
    return fieldE03PTVPTO.getBigDecimal();
  }

  /**
  * Set field E03RUTEJE using a String value.
  */
  public void setE03RUTEJE(String newvalue)
  {
    fieldE03RUTEJE.setString(newvalue);
  }

  /**
  * Get value of field E03RUTEJE as a String.
  */
  public String getE03RUTEJE()
  {
    return fieldE03RUTEJE.getString();
  }

  /**
  * Set field E03FECPRD using a String value.
  */
  public void setE03FECPRD(String newvalue)
  {
    fieldE03FECPRD.setString(newvalue);
  }

  /**
  * Get value of field E03FECPRD as a String.
  */
  public String getE03FECPRD()
  {
    return fieldE03FECPRD.getString();
  }

  /**
  * Set numeric field E03FECPRD using a BigDecimal value.
  */
  public void setE03FECPRD(BigDecimal newvalue)
  {
    fieldE03FECPRD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03FECPRD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03FECPRD()
  {
    return fieldE03FECPRD.getBigDecimal();
  }

  /**
  * Set field E03FECPRM using a String value.
  */
  public void setE03FECPRM(String newvalue)
  {
    fieldE03FECPRM.setString(newvalue);
  }

  /**
  * Get value of field E03FECPRM as a String.
  */
  public String getE03FECPRM()
  {
    return fieldE03FECPRM.getString();
  }

  /**
  * Set numeric field E03FECPRM using a BigDecimal value.
  */
  public void setE03FECPRM(BigDecimal newvalue)
  {
    fieldE03FECPRM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03FECPRM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03FECPRM()
  {
    return fieldE03FECPRM.getBigDecimal();
  }

  /**
  * Set field E03FECPRY using a String value.
  */
  public void setE03FECPRY(String newvalue)
  {
    fieldE03FECPRY.setString(newvalue);
  }

  /**
  * Get value of field E03FECPRY as a String.
  */
  public String getE03FECPRY()
  {
    return fieldE03FECPRY.getString();
  }

  /**
  * Set numeric field E03FECPRY using a BigDecimal value.
  */
  public void setE03FECPRY(BigDecimal newvalue)
  {
    fieldE03FECPRY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03FECPRY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03FECPRY()
  {
    return fieldE03FECPRY.getBigDecimal();
  }

}
