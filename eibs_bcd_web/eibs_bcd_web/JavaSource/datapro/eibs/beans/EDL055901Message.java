package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL055901 physical file definition.
* 
* File level identifier is 1180907152018.
* Record format level identifier is 21F6A3143E3E8.
*/

public class EDL055901Message extends MessageRecord
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
                                     "E01HDIACC",
                                     "E01HDICUN",
                                     "E01HDINA1",
                                     "E01HDIPRO",
                                     "E01HDITYP",
                                     "E01HDICCY",
                                     "E01DEAACC",
                                     "E01DEALMY",
                                     "E01DEALMM",
                                     "E01DEALMD",
                                     "E01DEAUQI",
                                     "E01DEARZN",
                                     "E01FMDTMM",
                                     "E01FMDTDD",
                                     "E01FMDTYY",
                                     "E01TODTMM",
                                     "E01TODTDD",
                                     "E01TODTYY"
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
                                   "E01HDIACC",
                                   "E01HDICUN",
                                   "E01HDINA1",
                                   "E01HDIPRO",
                                   "E01HDITYP",
                                   "E01HDICCY",
                                   "E01DEAACC",
                                   "E01DEALMY",
                                   "E01DEALMM",
                                   "E01DEALMD",
                                   "E01DEAUQI",
                                   "E01DEARZN",
                                   "E01FMDTMM",
                                   "E01FMDTDD",
                                   "E01FMDTYY",
                                   "E01TODTMM",
                                   "E01TODTDD",
                                   "E01TODTYY"
                                 };
  final static String fid = "1180907152018";
  final static String rid = "21F6A3143E3E8";
  final static String fmtname = "EDL055901";
  final int FIELDCOUNT = 27;
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
  private DecimalField fieldE01HDIACC = null;
  private DecimalField fieldE01HDICUN = null;
  private CharacterField fieldE01HDINA1 = null;
  private CharacterField fieldE01HDIPRO = null;
  private CharacterField fieldE01HDITYP = null;
  private CharacterField fieldE01HDICCY = null;
  private DecimalField fieldE01DEAACC = null;
  private DecimalField fieldE01DEALMY = null;
  private DecimalField fieldE01DEALMM = null;
  private DecimalField fieldE01DEALMD = null;
  private DecimalField fieldE01DEAUQI = null;
  private CharacterField fieldE01DEARZN = null;
  private DecimalField fieldE01FMDTMM = null;
  private DecimalField fieldE01FMDTDD = null;
  private DecimalField fieldE01FMDTYY = null;
  private DecimalField fieldE01TODTMM = null;
  private DecimalField fieldE01TODTDD = null;
  private DecimalField fieldE01TODTYY = null;

  /**
  * Constructor for EDL055901Message.
  */
  public EDL055901Message()
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
    recordsize = 196;
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
    fields[9] = fieldE01HDIACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01HDIACC");
    fields[10] = fieldE01HDICUN =
    new DecimalField(message, HEADERSIZE + 55, 10, 0, "E01HDICUN");
    fields[11] = fieldE01HDINA1 =
    new CharacterField(message, HEADERSIZE + 65, 60, "E01HDINA1");
    fields[12] = fieldE01HDIPRO =
    new CharacterField(message, HEADERSIZE + 125, 4, "E01HDIPRO");
    fields[13] = fieldE01HDITYP =
    new CharacterField(message, HEADERSIZE + 129, 4, "E01HDITYP");
    fields[14] = fieldE01HDICCY =
    new CharacterField(message, HEADERSIZE + 133, 3, "E01HDICCY");
    fields[15] = fieldE01DEAACC =
    new DecimalField(message, HEADERSIZE + 136, 13, 0, "E01DEAACC");
    fields[16] = fieldE01DEALMY =
    new DecimalField(message, HEADERSIZE + 149, 5, 0, "E01DEALMY");
    fields[17] = fieldE01DEALMM =
    new DecimalField(message, HEADERSIZE + 154, 3, 0, "E01DEALMM");
    fields[18] = fieldE01DEALMD =
    new DecimalField(message, HEADERSIZE + 157, 3, 0, "E01DEALMD");
    fields[19] = fieldE01DEAUQI =
    new DecimalField(message, HEADERSIZE + 160, 13, 0, "E01DEAUQI");
    fields[20] = fieldE01DEARZN =
    new CharacterField(message, HEADERSIZE + 173, 1, "E01DEARZN");
    fields[21] = fieldE01FMDTMM =
    new DecimalField(message, HEADERSIZE + 174, 3, 0, "E01FMDTMM");
    fields[22] = fieldE01FMDTDD =
    new DecimalField(message, HEADERSIZE + 177, 3, 0, "E01FMDTDD");
    fields[23] = fieldE01FMDTYY =
    new DecimalField(message, HEADERSIZE + 180, 5, 0, "E01FMDTYY");
    fields[24] = fieldE01TODTMM =
    new DecimalField(message, HEADERSIZE + 185, 3, 0, "E01TODTMM");
    fields[25] = fieldE01TODTDD =
    new DecimalField(message, HEADERSIZE + 188, 3, 0, "E01TODTDD");
    fields[26] = fieldE01TODTYY =
    new DecimalField(message, HEADERSIZE + 191, 5, 0, "E01TODTYY");

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
  * Set field E01HDIACC using a String value.
  */
  public void setE01HDIACC(String newvalue)
  {
    fieldE01HDIACC.setString(newvalue);
  }

  /**
  * Get value of field E01HDIACC as a String.
  */
  public String getE01HDIACC()
  {
    return fieldE01HDIACC.getString();
  }

  /**
  * Set numeric field E01HDIACC using a BigDecimal value.
  */
  public void setE01HDIACC(BigDecimal newvalue)
  {
    fieldE01HDIACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01HDIACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01HDIACC()
  {
    return fieldE01HDIACC.getBigDecimal();
  }

  /**
  * Set field E01HDICUN using a String value.
  */
  public void setE01HDICUN(String newvalue)
  {
    fieldE01HDICUN.setString(newvalue);
  }

  /**
  * Get value of field E01HDICUN as a String.
  */
  public String getE01HDICUN()
  {
    return fieldE01HDICUN.getString();
  }

  /**
  * Set numeric field E01HDICUN using a BigDecimal value.
  */
  public void setE01HDICUN(BigDecimal newvalue)
  {
    fieldE01HDICUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01HDICUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01HDICUN()
  {
    return fieldE01HDICUN.getBigDecimal();
  }

  /**
  * Set field E01HDINA1 using a String value.
  */
  public void setE01HDINA1(String newvalue)
  {
    fieldE01HDINA1.setString(newvalue);
  }

  /**
  * Get value of field E01HDINA1 as a String.
  */
  public String getE01HDINA1()
  {
    return fieldE01HDINA1.getString();
  }

  /**
  * Set field E01HDIPRO using a String value.
  */
  public void setE01HDIPRO(String newvalue)
  {
    fieldE01HDIPRO.setString(newvalue);
  }

  /**
  * Get value of field E01HDIPRO as a String.
  */
  public String getE01HDIPRO()
  {
    return fieldE01HDIPRO.getString();
  }

  /**
  * Set field E01HDITYP using a String value.
  */
  public void setE01HDITYP(String newvalue)
  {
    fieldE01HDITYP.setString(newvalue);
  }

  /**
  * Get value of field E01HDITYP as a String.
  */
  public String getE01HDITYP()
  {
    return fieldE01HDITYP.getString();
  }

  /**
  * Set field E01HDICCY using a String value.
  */
  public void setE01HDICCY(String newvalue)
  {
    fieldE01HDICCY.setString(newvalue);
  }

  /**
  * Get value of field E01HDICCY as a String.
  */
  public String getE01HDICCY()
  {
    return fieldE01HDICCY.getString();
  }

  /**
  * Set field E01DEAACC using a String value.
  */
  public void setE01DEAACC(String newvalue)
  {
    fieldE01DEAACC.setString(newvalue);
  }

  /**
  * Get value of field E01DEAACC as a String.
  */
  public String getE01DEAACC()
  {
    return fieldE01DEAACC.getString();
  }

  /**
  * Set numeric field E01DEAACC using a BigDecimal value.
  */
  public void setE01DEAACC(BigDecimal newvalue)
  {
    fieldE01DEAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAACC()
  {
    return fieldE01DEAACC.getBigDecimal();
  }

  /**
  * Set field E01DEALMY using a String value.
  */
  public void setE01DEALMY(String newvalue)
  {
    fieldE01DEALMY.setString(newvalue);
  }

  /**
  * Get value of field E01DEALMY as a String.
  */
  public String getE01DEALMY()
  {
    return fieldE01DEALMY.getString();
  }

  /**
  * Set numeric field E01DEALMY using a BigDecimal value.
  */
  public void setE01DEALMY(BigDecimal newvalue)
  {
    fieldE01DEALMY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEALMY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEALMY()
  {
    return fieldE01DEALMY.getBigDecimal();
  }

  /**
  * Set field E01DEALMM using a String value.
  */
  public void setE01DEALMM(String newvalue)
  {
    fieldE01DEALMM.setString(newvalue);
  }

  /**
  * Get value of field E01DEALMM as a String.
  */
  public String getE01DEALMM()
  {
    return fieldE01DEALMM.getString();
  }

  /**
  * Set numeric field E01DEALMM using a BigDecimal value.
  */
  public void setE01DEALMM(BigDecimal newvalue)
  {
    fieldE01DEALMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEALMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEALMM()
  {
    return fieldE01DEALMM.getBigDecimal();
  }

  /**
  * Set field E01DEALMD using a String value.
  */
  public void setE01DEALMD(String newvalue)
  {
    fieldE01DEALMD.setString(newvalue);
  }

  /**
  * Get value of field E01DEALMD as a String.
  */
  public String getE01DEALMD()
  {
    return fieldE01DEALMD.getString();
  }

  /**
  * Set numeric field E01DEALMD using a BigDecimal value.
  */
  public void setE01DEALMD(BigDecimal newvalue)
  {
    fieldE01DEALMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEALMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEALMD()
  {
    return fieldE01DEALMD.getBigDecimal();
  }

  /**
  * Set field E01DEAUQI using a String value.
  */
  public void setE01DEAUQI(String newvalue)
  {
    fieldE01DEAUQI.setString(newvalue);
  }

  /**
  * Get value of field E01DEAUQI as a String.
  */
  public String getE01DEAUQI()
  {
    return fieldE01DEAUQI.getString();
  }

  /**
  * Set numeric field E01DEAUQI using a BigDecimal value.
  */
  public void setE01DEAUQI(BigDecimal newvalue)
  {
    fieldE01DEAUQI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAUQI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAUQI()
  {
    return fieldE01DEAUQI.getBigDecimal();
  }

  /**
  * Set field E01DEARZN using a String value.
  */
  public void setE01DEARZN(String newvalue)
  {
    fieldE01DEARZN.setString(newvalue);
  }

  /**
  * Get value of field E01DEARZN as a String.
  */
  public String getE01DEARZN()
  {
    return fieldE01DEARZN.getString();
  }

  /**
  * Set field E01FMDTMM using a String value.
  */
  public void setE01FMDTMM(String newvalue)
  {
    fieldE01FMDTMM.setString(newvalue);
  }

  /**
  * Get value of field E01FMDTMM as a String.
  */
  public String getE01FMDTMM()
  {
    return fieldE01FMDTMM.getString();
  }

  /**
  * Set numeric field E01FMDTMM using a BigDecimal value.
  */
  public void setE01FMDTMM(BigDecimal newvalue)
  {
    fieldE01FMDTMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FMDTMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FMDTMM()
  {
    return fieldE01FMDTMM.getBigDecimal();
  }

  /**
  * Set field E01FMDTDD using a String value.
  */
  public void setE01FMDTDD(String newvalue)
  {
    fieldE01FMDTDD.setString(newvalue);
  }

  /**
  * Get value of field E01FMDTDD as a String.
  */
  public String getE01FMDTDD()
  {
    return fieldE01FMDTDD.getString();
  }

  /**
  * Set numeric field E01FMDTDD using a BigDecimal value.
  */
  public void setE01FMDTDD(BigDecimal newvalue)
  {
    fieldE01FMDTDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FMDTDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FMDTDD()
  {
    return fieldE01FMDTDD.getBigDecimal();
  }

  /**
  * Set field E01FMDTYY using a String value.
  */
  public void setE01FMDTYY(String newvalue)
  {
    fieldE01FMDTYY.setString(newvalue);
  }

  /**
  * Get value of field E01FMDTYY as a String.
  */
  public String getE01FMDTYY()
  {
    return fieldE01FMDTYY.getString();
  }

  /**
  * Set numeric field E01FMDTYY using a BigDecimal value.
  */
  public void setE01FMDTYY(BigDecimal newvalue)
  {
    fieldE01FMDTYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FMDTYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FMDTYY()
  {
    return fieldE01FMDTYY.getBigDecimal();
  }

  /**
  * Set field E01TODTMM using a String value.
  */
  public void setE01TODTMM(String newvalue)
  {
    fieldE01TODTMM.setString(newvalue);
  }

  /**
  * Get value of field E01TODTMM as a String.
  */
  public String getE01TODTMM()
  {
    return fieldE01TODTMM.getString();
  }

  /**
  * Set numeric field E01TODTMM using a BigDecimal value.
  */
  public void setE01TODTMM(BigDecimal newvalue)
  {
    fieldE01TODTMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TODTMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TODTMM()
  {
    return fieldE01TODTMM.getBigDecimal();
  }

  /**
  * Set field E01TODTDD using a String value.
  */
  public void setE01TODTDD(String newvalue)
  {
    fieldE01TODTDD.setString(newvalue);
  }

  /**
  * Get value of field E01TODTDD as a String.
  */
  public String getE01TODTDD()
  {
    return fieldE01TODTDD.getString();
  }

  /**
  * Set numeric field E01TODTDD using a BigDecimal value.
  */
  public void setE01TODTDD(BigDecimal newvalue)
  {
    fieldE01TODTDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TODTDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TODTDD()
  {
    return fieldE01TODTDD.getBigDecimal();
  }

  /**
  * Set field E01TODTYY using a String value.
  */
  public void setE01TODTYY(String newvalue)
  {
    fieldE01TODTYY.setString(newvalue);
  }

  /**
  * Get value of field E01TODTYY as a String.
  */
  public String getE01TODTYY()
  {
    return fieldE01TODTYY.getString();
  }

  /**
  * Set numeric field E01TODTYY using a BigDecimal value.
  */
  public void setE01TODTYY(BigDecimal newvalue)
  {
    fieldE01TODTYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TODTYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TODTYY()
  {
    return fieldE01TODTYY.getBigDecimal();
  }

}
