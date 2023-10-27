package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV015407 physical file definition.
* 
* File level identifier is 1210422184744.
* Record format level identifier is 26F3F275ECFEB.
*/

public class EPV015407Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H07USERID",
                                     "H07PROGRM",
                                     "H07TIMSYS",
                                     "H07SCRCOD",
                                     "H07OPECOD",
                                     "H07FLGMAS",
                                     "H07FLGWK1",
                                     "H07FLGWK2",
                                     "H07FLGWK3",
                                     "E07HEVACC",
                                     "E07HEVRDY",
                                     "E07HEVRDM",
                                     "E07HEVRDD",
                                     "E07HEVTYP",
                                     "E07HEVAMT",
                                     "E07HEVPRI",
                                     "E07HEVDIS",
                                     "E07HEVRTE",
                                     "E07HEVSTS",
                                     "E07HEVMTV",
                                     "E07HEVRMK",
                                     "E07FMDTMM",
                                     "E07FMDTDD",
                                     "E07FMDTYY",
                                     "E07TODTMM",
                                     "E07TODTDD",
                                     "E07TODTYY",
                                     "E07DSCMTV"
                                   };
  final static String tnames[] = {
                                   "H07USERID",
                                   "H07PROGRM",
                                   "H07TIMSYS",
                                   "H07SCRCOD",
                                   "H07OPECOD",
                                   "H07FLGMAS",
                                   "H07FLGWK1",
                                   "H07FLGWK2",
                                   "H07FLGWK3",
                                   "E07HEVACC",
                                   "E07HEVRDY",
                                   "E07HEVRDM",
                                   "E07HEVRDD",
                                   "E07HEVTYP",
                                   "E07HEVAMT",
                                   "E07HEVPRI",
                                   "E07HEVDIS",
                                   "E07HEVRTE",
                                   "E07HEVSTS",
                                   "E07HEVMTV",
                                   "E07HEVRMK",
                                   "E07FMDTMM",
                                   "E07FMDTDD",
                                   "E07FMDTYY",
                                   "E07TODTMM",
                                   "E07TODTDD",
                                   "E07TODTYY",
                                   "E07DSCMTV"
                                 };
  final static String fid = "1210422184744";
  final static String rid = "26F3F275ECFEB";
  final static String fmtname = "EPV015407";
  final int FIELDCOUNT = 28;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH07USERID = null;
  private CharacterField fieldH07PROGRM = null;
  private CharacterField fieldH07TIMSYS = null;
  private CharacterField fieldH07SCRCOD = null;
  private CharacterField fieldH07OPECOD = null;
  private CharacterField fieldH07FLGMAS = null;
  private CharacterField fieldH07FLGWK1 = null;
  private CharacterField fieldH07FLGWK2 = null;
  private CharacterField fieldH07FLGWK3 = null;
  private DecimalField fieldE07HEVACC = null;
  private DecimalField fieldE07HEVRDY = null;
  private DecimalField fieldE07HEVRDM = null;
  private DecimalField fieldE07HEVRDD = null;
  private CharacterField fieldE07HEVTYP = null;
  private DecimalField fieldE07HEVAMT = null;
  private DecimalField fieldE07HEVPRI = null;
  private DecimalField fieldE07HEVDIS = null;
  private DecimalField fieldE07HEVRTE = null;
  private CharacterField fieldE07HEVSTS = null;
  private CharacterField fieldE07HEVMTV = null;
  private CharacterField fieldE07HEVRMK = null;
  private DecimalField fieldE07FMDTMM = null;
  private DecimalField fieldE07FMDTDD = null;
  private DecimalField fieldE07FMDTYY = null;
  private DecimalField fieldE07TODTMM = null;
  private DecimalField fieldE07TODTDD = null;
  private DecimalField fieldE07TODTYY = null;
  private CharacterField fieldE07DSCMTV = null;

  /**
  * Constructor for EPV015407Message.
  */
  public EPV015407Message()
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
    recordsize = 472;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH07USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H07USERID");
    fields[1] = fieldH07PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H07PROGRM");
    fields[2] = fieldH07TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H07TIMSYS");
    fields[3] = fieldH07SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H07SCRCOD");
    fields[4] = fieldH07OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H07OPECOD");
    fields[5] = fieldH07FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H07FLGMAS");
    fields[6] = fieldH07FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H07FLGWK1");
    fields[7] = fieldH07FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H07FLGWK2");
    fields[8] = fieldH07FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H07FLGWK3");
    fields[9] = fieldE07HEVACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E07HEVACC");
    fields[10] = fieldE07HEVRDY =
    new DecimalField(message, HEADERSIZE + 55, 5, 0, "E07HEVRDY");
    fields[11] = fieldE07HEVRDM =
    new DecimalField(message, HEADERSIZE + 60, 3, 0, "E07HEVRDM");
    fields[12] = fieldE07HEVRDD =
    new DecimalField(message, HEADERSIZE + 63, 3, 0, "E07HEVRDD");
    fields[13] = fieldE07HEVTYP =
    new CharacterField(message, HEADERSIZE + 66, 1, "E07HEVTYP");
    fields[14] = fieldE07HEVAMT =
    new DecimalField(message, HEADERSIZE + 67, 17, 2, "E07HEVAMT");
    fields[15] = fieldE07HEVPRI =
    new DecimalField(message, HEADERSIZE + 84, 17, 2, "E07HEVPRI");
    fields[16] = fieldE07HEVDIS =
    new DecimalField(message, HEADERSIZE + 101, 17, 2, "E07HEVDIS");
    fields[17] = fieldE07HEVRTE =
    new DecimalField(message, HEADERSIZE + 118, 11, 6, "E07HEVRTE");
    fields[18] = fieldE07HEVSTS =
    new CharacterField(message, HEADERSIZE + 129, 1, "E07HEVSTS");
    fields[19] = fieldE07HEVMTV =
    new CharacterField(message, HEADERSIZE + 130, 4, "E07HEVMTV");
    fields[20] = fieldE07HEVRMK =
    new CharacterField(message, HEADERSIZE + 134, 256, "E07HEVRMK");
    fields[21] = fieldE07FMDTMM =
    new DecimalField(message, HEADERSIZE + 390, 3, 0, "E07FMDTMM");
    fields[22] = fieldE07FMDTDD =
    new DecimalField(message, HEADERSIZE + 393, 3, 0, "E07FMDTDD");
    fields[23] = fieldE07FMDTYY =
    new DecimalField(message, HEADERSIZE + 396, 5, 0, "E07FMDTYY");
    fields[24] = fieldE07TODTMM =
    new DecimalField(message, HEADERSIZE + 401, 3, 0, "E07TODTMM");
    fields[25] = fieldE07TODTDD =
    new DecimalField(message, HEADERSIZE + 404, 3, 0, "E07TODTDD");
    fields[26] = fieldE07TODTYY =
    new DecimalField(message, HEADERSIZE + 407, 5, 0, "E07TODTYY");
    fields[27] = fieldE07DSCMTV =
    new CharacterField(message, HEADERSIZE + 412, 60, "E07DSCMTV");

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
  * Set field H07USERID using a String value.
  */
  public void setH07USERID(String newvalue)
  {
    fieldH07USERID.setString(newvalue);
  }

  /**
  * Get value of field H07USERID as a String.
  */
  public String getH07USERID()
  {
    return fieldH07USERID.getString();
  }

  /**
  * Set field H07PROGRM using a String value.
  */
  public void setH07PROGRM(String newvalue)
  {
    fieldH07PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H07PROGRM as a String.
  */
  public String getH07PROGRM()
  {
    return fieldH07PROGRM.getString();
  }

  /**
  * Set field H07TIMSYS using a String value.
  */
  public void setH07TIMSYS(String newvalue)
  {
    fieldH07TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H07TIMSYS as a String.
  */
  public String getH07TIMSYS()
  {
    return fieldH07TIMSYS.getString();
  }

  /**
  * Set field H07SCRCOD using a String value.
  */
  public void setH07SCRCOD(String newvalue)
  {
    fieldH07SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H07SCRCOD as a String.
  */
  public String getH07SCRCOD()
  {
    return fieldH07SCRCOD.getString();
  }

  /**
  * Set field H07OPECOD using a String value.
  */
  public void setH07OPECOD(String newvalue)
  {
    fieldH07OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H07OPECOD as a String.
  */
  public String getH07OPECOD()
  {
    return fieldH07OPECOD.getString();
  }

  /**
  * Set field H07FLGMAS using a String value.
  */
  public void setH07FLGMAS(String newvalue)
  {
    fieldH07FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H07FLGMAS as a String.
  */
  public String getH07FLGMAS()
  {
    return fieldH07FLGMAS.getString();
  }

  /**
  * Set field H07FLGWK1 using a String value.
  */
  public void setH07FLGWK1(String newvalue)
  {
    fieldH07FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H07FLGWK1 as a String.
  */
  public String getH07FLGWK1()
  {
    return fieldH07FLGWK1.getString();
  }

  /**
  * Set field H07FLGWK2 using a String value.
  */
  public void setH07FLGWK2(String newvalue)
  {
    fieldH07FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H07FLGWK2 as a String.
  */
  public String getH07FLGWK2()
  {
    return fieldH07FLGWK2.getString();
  }

  /**
  * Set field H07FLGWK3 using a String value.
  */
  public void setH07FLGWK3(String newvalue)
  {
    fieldH07FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H07FLGWK3 as a String.
  */
  public String getH07FLGWK3()
  {
    return fieldH07FLGWK3.getString();
  }

  /**
  * Set field E07HEVACC using a String value.
  */
  public void setE07HEVACC(String newvalue)
  {
    fieldE07HEVACC.setString(newvalue);
  }

  /**
  * Get value of field E07HEVACC as a String.
  */
  public String getE07HEVACC()
  {
    return fieldE07HEVACC.getString();
  }

  /**
  * Set numeric field E07HEVACC using a BigDecimal value.
  */
  public void setE07HEVACC(BigDecimal newvalue)
  {
    fieldE07HEVACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07HEVACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07HEVACC()
  {
    return fieldE07HEVACC.getBigDecimal();
  }

  /**
  * Set field E07HEVRDY using a String value.
  */
  public void setE07HEVRDY(String newvalue)
  {
    fieldE07HEVRDY.setString(newvalue);
  }

  /**
  * Get value of field E07HEVRDY as a String.
  */
  public String getE07HEVRDY()
  {
    return fieldE07HEVRDY.getString();
  }

  /**
  * Set numeric field E07HEVRDY using a BigDecimal value.
  */
  public void setE07HEVRDY(BigDecimal newvalue)
  {
    fieldE07HEVRDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07HEVRDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07HEVRDY()
  {
    return fieldE07HEVRDY.getBigDecimal();
  }

  /**
  * Set field E07HEVRDM using a String value.
  */
  public void setE07HEVRDM(String newvalue)
  {
    fieldE07HEVRDM.setString(newvalue);
  }

  /**
  * Get value of field E07HEVRDM as a String.
  */
  public String getE07HEVRDM()
  {
    return fieldE07HEVRDM.getString();
  }

  /**
  * Set numeric field E07HEVRDM using a BigDecimal value.
  */
  public void setE07HEVRDM(BigDecimal newvalue)
  {
    fieldE07HEVRDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07HEVRDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07HEVRDM()
  {
    return fieldE07HEVRDM.getBigDecimal();
  }

  /**
  * Set field E07HEVRDD using a String value.
  */
  public void setE07HEVRDD(String newvalue)
  {
    fieldE07HEVRDD.setString(newvalue);
  }

  /**
  * Get value of field E07HEVRDD as a String.
  */
  public String getE07HEVRDD()
  {
    return fieldE07HEVRDD.getString();
  }

  /**
  * Set numeric field E07HEVRDD using a BigDecimal value.
  */
  public void setE07HEVRDD(BigDecimal newvalue)
  {
    fieldE07HEVRDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07HEVRDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07HEVRDD()
  {
    return fieldE07HEVRDD.getBigDecimal();
  }

  /**
  * Set field E07HEVTYP using a String value.
  */
  public void setE07HEVTYP(String newvalue)
  {
    fieldE07HEVTYP.setString(newvalue);
  }

  /**
  * Get value of field E07HEVTYP as a String.
  */
  public String getE07HEVTYP()
  {
    return fieldE07HEVTYP.getString();
  }

  /**
  * Set field E07HEVAMT using a String value.
  */
  public void setE07HEVAMT(String newvalue)
  {
    fieldE07HEVAMT.setString(newvalue);
  }

  /**
  * Get value of field E07HEVAMT as a String.
  */
  public String getE07HEVAMT()
  {
    return fieldE07HEVAMT.getString();
  }

  /**
  * Set numeric field E07HEVAMT using a BigDecimal value.
  */
  public void setE07HEVAMT(BigDecimal newvalue)
  {
    fieldE07HEVAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07HEVAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07HEVAMT()
  {
    return fieldE07HEVAMT.getBigDecimal();
  }

  /**
  * Set field E07HEVPRI using a String value.
  */
  public void setE07HEVPRI(String newvalue)
  {
    fieldE07HEVPRI.setString(newvalue);
  }

  /**
  * Get value of field E07HEVPRI as a String.
  */
  public String getE07HEVPRI()
  {
    return fieldE07HEVPRI.getString();
  }

  /**
  * Set numeric field E07HEVPRI using a BigDecimal value.
  */
  public void setE07HEVPRI(BigDecimal newvalue)
  {
    fieldE07HEVPRI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07HEVPRI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07HEVPRI()
  {
    return fieldE07HEVPRI.getBigDecimal();
  }

  /**
  * Set field E07HEVDIS using a String value.
  */
  public void setE07HEVDIS(String newvalue)
  {
    fieldE07HEVDIS.setString(newvalue);
  }

  /**
  * Get value of field E07HEVDIS as a String.
  */
  public String getE07HEVDIS()
  {
    return fieldE07HEVDIS.getString();
  }

  /**
  * Set numeric field E07HEVDIS using a BigDecimal value.
  */
  public void setE07HEVDIS(BigDecimal newvalue)
  {
    fieldE07HEVDIS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07HEVDIS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07HEVDIS()
  {
    return fieldE07HEVDIS.getBigDecimal();
  }

  /**
  * Set field E07HEVRTE using a String value.
  */
  public void setE07HEVRTE(String newvalue)
  {
    fieldE07HEVRTE.setString(newvalue);
  }

  /**
  * Get value of field E07HEVRTE as a String.
  */
  public String getE07HEVRTE()
  {
    return fieldE07HEVRTE.getString();
  }

  /**
  * Set numeric field E07HEVRTE using a BigDecimal value.
  */
  public void setE07HEVRTE(BigDecimal newvalue)
  {
    fieldE07HEVRTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07HEVRTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07HEVRTE()
  {
    return fieldE07HEVRTE.getBigDecimal();
  }

  /**
  * Set field E07HEVSTS using a String value.
  */
  public void setE07HEVSTS(String newvalue)
  {
    fieldE07HEVSTS.setString(newvalue);
  }

  /**
  * Get value of field E07HEVSTS as a String.
  */
  public String getE07HEVSTS()
  {
    return fieldE07HEVSTS.getString();
  }

  /**
  * Set field E07HEVMTV using a String value.
  */
  public void setE07HEVMTV(String newvalue)
  {
    fieldE07HEVMTV.setString(newvalue);
  }

  /**
  * Get value of field E07HEVMTV as a String.
  */
  public String getE07HEVMTV()
  {
    return fieldE07HEVMTV.getString();
  }

  /**
  * Set field E07HEVRMK using a String value.
  */
  public void setE07HEVRMK(String newvalue)
  {
    fieldE07HEVRMK.setString(newvalue);
  }

  /**
  * Get value of field E07HEVRMK as a String.
  */
  public String getE07HEVRMK()
  {
    return fieldE07HEVRMK.getString();
  }

  /**
  * Set field E07FMDTMM using a String value.
  */
  public void setE07FMDTMM(String newvalue)
  {
    fieldE07FMDTMM.setString(newvalue);
  }

  /**
  * Get value of field E07FMDTMM as a String.
  */
  public String getE07FMDTMM()
  {
    return fieldE07FMDTMM.getString();
  }

  /**
  * Set numeric field E07FMDTMM using a BigDecimal value.
  */
  public void setE07FMDTMM(BigDecimal newvalue)
  {
    fieldE07FMDTMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07FMDTMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07FMDTMM()
  {
    return fieldE07FMDTMM.getBigDecimal();
  }

  /**
  * Set field E07FMDTDD using a String value.
  */
  public void setE07FMDTDD(String newvalue)
  {
    fieldE07FMDTDD.setString(newvalue);
  }

  /**
  * Get value of field E07FMDTDD as a String.
  */
  public String getE07FMDTDD()
  {
    return fieldE07FMDTDD.getString();
  }

  /**
  * Set numeric field E07FMDTDD using a BigDecimal value.
  */
  public void setE07FMDTDD(BigDecimal newvalue)
  {
    fieldE07FMDTDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07FMDTDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07FMDTDD()
  {
    return fieldE07FMDTDD.getBigDecimal();
  }

  /**
  * Set field E07FMDTYY using a String value.
  */
  public void setE07FMDTYY(String newvalue)
  {
    fieldE07FMDTYY.setString(newvalue);
  }

  /**
  * Get value of field E07FMDTYY as a String.
  */
  public String getE07FMDTYY()
  {
    return fieldE07FMDTYY.getString();
  }

  /**
  * Set numeric field E07FMDTYY using a BigDecimal value.
  */
  public void setE07FMDTYY(BigDecimal newvalue)
  {
    fieldE07FMDTYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07FMDTYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07FMDTYY()
  {
    return fieldE07FMDTYY.getBigDecimal();
  }

  /**
  * Set field E07TODTMM using a String value.
  */
  public void setE07TODTMM(String newvalue)
  {
    fieldE07TODTMM.setString(newvalue);
  }

  /**
  * Get value of field E07TODTMM as a String.
  */
  public String getE07TODTMM()
  {
    return fieldE07TODTMM.getString();
  }

  /**
  * Set numeric field E07TODTMM using a BigDecimal value.
  */
  public void setE07TODTMM(BigDecimal newvalue)
  {
    fieldE07TODTMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07TODTMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07TODTMM()
  {
    return fieldE07TODTMM.getBigDecimal();
  }

  /**
  * Set field E07TODTDD using a String value.
  */
  public void setE07TODTDD(String newvalue)
  {
    fieldE07TODTDD.setString(newvalue);
  }

  /**
  * Get value of field E07TODTDD as a String.
  */
  public String getE07TODTDD()
  {
    return fieldE07TODTDD.getString();
  }

  /**
  * Set numeric field E07TODTDD using a BigDecimal value.
  */
  public void setE07TODTDD(BigDecimal newvalue)
  {
    fieldE07TODTDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07TODTDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07TODTDD()
  {
    return fieldE07TODTDD.getBigDecimal();
  }

  /**
  * Set field E07TODTYY using a String value.
  */
  public void setE07TODTYY(String newvalue)
  {
    fieldE07TODTYY.setString(newvalue);
  }

  /**
  * Get value of field E07TODTYY as a String.
  */
  public String getE07TODTYY()
  {
    return fieldE07TODTYY.getString();
  }

  /**
  * Set numeric field E07TODTYY using a BigDecimal value.
  */
  public void setE07TODTYY(BigDecimal newvalue)
  {
    fieldE07TODTYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E07TODTYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE07TODTYY()
  {
    return fieldE07TODTYY.getBigDecimal();
  }

  /**
  * Set field E07DSCMTV using a String value.
  */
  public void setE07DSCMTV(String newvalue)
  {
    fieldE07DSCMTV.setString(newvalue);
  }

  /**
  * Get value of field E07DSCMTV as a String.
  */
  public String getE07DSCMTV()
  {
    return fieldE07DSCMTV.getString();
  }

}