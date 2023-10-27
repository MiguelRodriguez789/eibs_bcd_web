package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EBP014201 physical file definition.
* 
* File level identifier is 1161222173026.
* Record format level identifier is 4B7A4851AB1E2.
*/

public class EBP014201Message extends MessageRecord
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
                                     "E01BPYNUM",
                                     "E01BPYSEQ",
                                     "E01BPYBSQ",
                                     "E01BPYCOD",
                                     "E01BPYORD",
                                     "E01BPYTYP",
                                     "E01BPYTYPD",
                                     "E01BPYNM1",
                                     "E01BPYNM2",
                                     "E01BPYRSN",
                                     "E01BPYRSND",
                                     "E01BPYAMT",
                                     "E01BPYPDM",
                                     "E01BPYPDD",
                                     "E01BPYPDY",
                                     "E01BPYREF",
                                     "E01BPYPYM",
                                     "E01BPYUSR",
                                     "E01BPYAUS",
                                     "E01BPYSTS",
                                     "E01BPYSTSD",
                                     "E01ACT",
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
                                   "E01BPYNUM",
                                   "E01BPYSEQ",
                                   "E01BPYBSQ",
                                   "E01BPYCOD",
                                   "E01BPYORD",
                                   "E01BPYTYP",
                                   "E01BPYTYPD",
                                   "E01BPYNM1",
                                   "E01BPYNM2",
                                   "E01BPYRSN",
                                   "E01BPYRSND",
                                   "E01BPYAMT",
                                   "E01BPYPDM",
                                   "E01BPYPDD",
                                   "E01BPYPDY",
                                   "E01BPYREF",
                                   "E01BPYPYM",
                                   "E01BPYUSR",
                                   "E01BPYAUS",
                                   "E01BPYSTS",
                                   "E01BPYSTSD",
                                   "E01ACT",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1161222173026";
  final static String rid = "4B7A4851AB1E2";
  final static String fmtname = "EBP014201";
  final int FIELDCOUNT = 33;
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
  private DecimalField fieldE01BPYNUM = null;
  private DecimalField fieldE01BPYSEQ = null;
  private DecimalField fieldE01BPYBSQ = null;
  private DecimalField fieldE01BPYCOD = null;
  private DecimalField fieldE01BPYORD = null;
  private CharacterField fieldE01BPYTYP = null;
  private CharacterField fieldE01BPYTYPD = null;
  private CharacterField fieldE01BPYNM1 = null;
  private CharacterField fieldE01BPYNM2 = null;
  private CharacterField fieldE01BPYRSN = null;
  private CharacterField fieldE01BPYRSND = null;
  private DecimalField fieldE01BPYAMT = null;
  private DecimalField fieldE01BPYPDM = null;
  private DecimalField fieldE01BPYPDD = null;
  private DecimalField fieldE01BPYPDY = null;
  private DecimalField fieldE01BPYREF = null;
  private DecimalField fieldE01BPYPYM = null;
  private CharacterField fieldE01BPYUSR = null;
  private CharacterField fieldE01BPYAUS = null;
  private CharacterField fieldE01BPYSTS = null;
  private CharacterField fieldE01BPYSTSD = null;
  private CharacterField fieldE01ACT = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for EBP014201Message.
  */
  public EBP014201Message()
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
    recordsize = 434;
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
    fields[9] = fieldE01BPYNUM =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01BPYNUM");
    fields[10] = fieldE01BPYSEQ =
    new DecimalField(message, HEADERSIZE + 55, 4, 0, "E01BPYSEQ");
    fields[11] = fieldE01BPYBSQ =
    new DecimalField(message, HEADERSIZE + 59, 3, 0, "E01BPYBSQ");
    fields[12] = fieldE01BPYCOD =
    new DecimalField(message, HEADERSIZE + 62, 10, 0, "E01BPYCOD");
    fields[13] = fieldE01BPYORD =
    new DecimalField(message, HEADERSIZE + 72, 13, 0, "E01BPYORD");
    fields[14] = fieldE01BPYTYP =
    new CharacterField(message, HEADERSIZE + 85, 1, "E01BPYTYP");
    fields[15] = fieldE01BPYTYPD =
    new CharacterField(message, HEADERSIZE + 86, 45, "E01BPYTYPD");
    fields[16] = fieldE01BPYNM1 =
    new CharacterField(message, HEADERSIZE + 131, 60, "E01BPYNM1");
    fields[17] = fieldE01BPYNM2 =
    new CharacterField(message, HEADERSIZE + 191, 60, "E01BPYNM2");
    fields[18] = fieldE01BPYRSN =
    new CharacterField(message, HEADERSIZE + 251, 4, "E01BPYRSN");
    fields[19] = fieldE01BPYRSND =
    new CharacterField(message, HEADERSIZE + 255, 45, "E01BPYRSND");
    fields[20] = fieldE01BPYAMT =
    new DecimalField(message, HEADERSIZE + 300, 17, 2, "E01BPYAMT");
    fields[21] = fieldE01BPYPDM =
    new DecimalField(message, HEADERSIZE + 317, 3, 0, "E01BPYPDM");
    fields[22] = fieldE01BPYPDD =
    new DecimalField(message, HEADERSIZE + 320, 3, 0, "E01BPYPDD");
    fields[23] = fieldE01BPYPDY =
    new DecimalField(message, HEADERSIZE + 323, 5, 0, "E01BPYPDY");
    fields[24] = fieldE01BPYREF =
    new DecimalField(message, HEADERSIZE + 328, 17, 0, "E01BPYREF");
    fields[25] = fieldE01BPYPYM =
    new DecimalField(message, HEADERSIZE + 345, 13, 0, "E01BPYPYM");
    fields[26] = fieldE01BPYUSR =
    new CharacterField(message, HEADERSIZE + 358, 10, "E01BPYUSR");
    fields[27] = fieldE01BPYAUS =
    new CharacterField(message, HEADERSIZE + 368, 10, "E01BPYAUS");
    fields[28] = fieldE01BPYSTS =
    new CharacterField(message, HEADERSIZE + 378, 1, "E01BPYSTS");
    fields[29] = fieldE01BPYSTSD =
    new CharacterField(message, HEADERSIZE + 379, 45, "E01BPYSTSD");
    fields[30] = fieldE01ACT =
    new CharacterField(message, HEADERSIZE + 424, 1, "E01ACT");
    fields[31] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 425, 8, 0, "E01NUMREC");
    fields[32] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 433, 1, "E01INDOPE");

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
  * Set field E01BPYNUM using a String value.
  */
  public void setE01BPYNUM(String newvalue)
  {
    fieldE01BPYNUM.setString(newvalue);
  }

  /**
  * Get value of field E01BPYNUM as a String.
  */
  public String getE01BPYNUM()
  {
    return fieldE01BPYNUM.getString();
  }

  /**
  * Set numeric field E01BPYNUM using a BigDecimal value.
  */
  public void setE01BPYNUM(BigDecimal newvalue)
  {
    fieldE01BPYNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPYNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPYNUM()
  {
    return fieldE01BPYNUM.getBigDecimal();
  }

  /**
  * Set field E01BPYSEQ using a String value.
  */
  public void setE01BPYSEQ(String newvalue)
  {
    fieldE01BPYSEQ.setString(newvalue);
  }

  /**
  * Get value of field E01BPYSEQ as a String.
  */
  public String getE01BPYSEQ()
  {
    return fieldE01BPYSEQ.getString();
  }

  /**
  * Set numeric field E01BPYSEQ using a BigDecimal value.
  */
  public void setE01BPYSEQ(BigDecimal newvalue)
  {
    fieldE01BPYSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPYSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPYSEQ()
  {
    return fieldE01BPYSEQ.getBigDecimal();
  }

  /**
  * Set field E01BPYBSQ using a String value.
  */
  public void setE01BPYBSQ(String newvalue)
  {
    fieldE01BPYBSQ.setString(newvalue);
  }

  /**
  * Get value of field E01BPYBSQ as a String.
  */
  public String getE01BPYBSQ()
  {
    return fieldE01BPYBSQ.getString();
  }

  /**
  * Set numeric field E01BPYBSQ using a BigDecimal value.
  */
  public void setE01BPYBSQ(BigDecimal newvalue)
  {
    fieldE01BPYBSQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPYBSQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPYBSQ()
  {
    return fieldE01BPYBSQ.getBigDecimal();
  }

  /**
  * Set field E01BPYCOD using a String value.
  */
  public void setE01BPYCOD(String newvalue)
  {
    fieldE01BPYCOD.setString(newvalue);
  }

  /**
  * Get value of field E01BPYCOD as a String.
  */
  public String getE01BPYCOD()
  {
    return fieldE01BPYCOD.getString();
  }

  /**
  * Set numeric field E01BPYCOD using a BigDecimal value.
  */
  public void setE01BPYCOD(BigDecimal newvalue)
  {
    fieldE01BPYCOD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPYCOD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPYCOD()
  {
    return fieldE01BPYCOD.getBigDecimal();
  }

  /**
  * Set field E01BPYORD using a String value.
  */
  public void setE01BPYORD(String newvalue)
  {
    fieldE01BPYORD.setString(newvalue);
  }

  /**
  * Get value of field E01BPYORD as a String.
  */
  public String getE01BPYORD()
  {
    return fieldE01BPYORD.getString();
  }

  /**
  * Set numeric field E01BPYORD using a BigDecimal value.
  */
  public void setE01BPYORD(BigDecimal newvalue)
  {
    fieldE01BPYORD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPYORD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPYORD()
  {
    return fieldE01BPYORD.getBigDecimal();
  }

  /**
  * Set field E01BPYTYP using a String value.
  */
  public void setE01BPYTYP(String newvalue)
  {
    fieldE01BPYTYP.setString(newvalue);
  }

  /**
  * Get value of field E01BPYTYP as a String.
  */
  public String getE01BPYTYP()
  {
    return fieldE01BPYTYP.getString();
  }

  /**
  * Set field E01BPYTYPD using a String value.
  */
  public void setE01BPYTYPD(String newvalue)
  {
    fieldE01BPYTYPD.setString(newvalue);
  }

  /**
  * Get value of field E01BPYTYPD as a String.
  */
  public String getE01BPYTYPD()
  {
    return fieldE01BPYTYPD.getString();
  }

  /**
  * Set field E01BPYNM1 using a String value.
  */
  public void setE01BPYNM1(String newvalue)
  {
    fieldE01BPYNM1.setString(newvalue);
  }

  /**
  * Get value of field E01BPYNM1 as a String.
  */
  public String getE01BPYNM1()
  {
    return fieldE01BPYNM1.getString();
  }

  /**
  * Set field E01BPYNM2 using a String value.
  */
  public void setE01BPYNM2(String newvalue)
  {
    fieldE01BPYNM2.setString(newvalue);
  }

  /**
  * Get value of field E01BPYNM2 as a String.
  */
  public String getE01BPYNM2()
  {
    return fieldE01BPYNM2.getString();
  }

  /**
  * Set field E01BPYRSN using a String value.
  */
  public void setE01BPYRSN(String newvalue)
  {
    fieldE01BPYRSN.setString(newvalue);
  }

  /**
  * Get value of field E01BPYRSN as a String.
  */
  public String getE01BPYRSN()
  {
    return fieldE01BPYRSN.getString();
  }

  /**
  * Set field E01BPYRSND using a String value.
  */
  public void setE01BPYRSND(String newvalue)
  {
    fieldE01BPYRSND.setString(newvalue);
  }

  /**
  * Get value of field E01BPYRSND as a String.
  */
  public String getE01BPYRSND()
  {
    return fieldE01BPYRSND.getString();
  }

  /**
  * Set field E01BPYAMT using a String value.
  */
  public void setE01BPYAMT(String newvalue)
  {
    fieldE01BPYAMT.setString(newvalue);
  }

  /**
  * Get value of field E01BPYAMT as a String.
  */
  public String getE01BPYAMT()
  {
    return fieldE01BPYAMT.getString();
  }

  /**
  * Set numeric field E01BPYAMT using a BigDecimal value.
  */
  public void setE01BPYAMT(BigDecimal newvalue)
  {
    fieldE01BPYAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPYAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPYAMT()
  {
    return fieldE01BPYAMT.getBigDecimal();
  }

  /**
  * Set field E01BPYPDM using a String value.
  */
  public void setE01BPYPDM(String newvalue)
  {
    fieldE01BPYPDM.setString(newvalue);
  }

  /**
  * Get value of field E01BPYPDM as a String.
  */
  public String getE01BPYPDM()
  {
    return fieldE01BPYPDM.getString();
  }

  /**
  * Set numeric field E01BPYPDM using a BigDecimal value.
  */
  public void setE01BPYPDM(BigDecimal newvalue)
  {
    fieldE01BPYPDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPYPDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPYPDM()
  {
    return fieldE01BPYPDM.getBigDecimal();
  }

  /**
  * Set field E01BPYPDD using a String value.
  */
  public void setE01BPYPDD(String newvalue)
  {
    fieldE01BPYPDD.setString(newvalue);
  }

  /**
  * Get value of field E01BPYPDD as a String.
  */
  public String getE01BPYPDD()
  {
    return fieldE01BPYPDD.getString();
  }

  /**
  * Set numeric field E01BPYPDD using a BigDecimal value.
  */
  public void setE01BPYPDD(BigDecimal newvalue)
  {
    fieldE01BPYPDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPYPDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPYPDD()
  {
    return fieldE01BPYPDD.getBigDecimal();
  }

  /**
  * Set field E01BPYPDY using a String value.
  */
  public void setE01BPYPDY(String newvalue)
  {
    fieldE01BPYPDY.setString(newvalue);
  }

  /**
  * Get value of field E01BPYPDY as a String.
  */
  public String getE01BPYPDY()
  {
    return fieldE01BPYPDY.getString();
  }

  /**
  * Set numeric field E01BPYPDY using a BigDecimal value.
  */
  public void setE01BPYPDY(BigDecimal newvalue)
  {
    fieldE01BPYPDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPYPDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPYPDY()
  {
    return fieldE01BPYPDY.getBigDecimal();
  }

  /**
  * Set field E01BPYREF using a String value.
  */
  public void setE01BPYREF(String newvalue)
  {
    fieldE01BPYREF.setString(newvalue);
  }

  /**
  * Get value of field E01BPYREF as a String.
  */
  public String getE01BPYREF()
  {
    return fieldE01BPYREF.getString();
  }

  /**
  * Set numeric field E01BPYREF using a BigDecimal value.
  */
  public void setE01BPYREF(BigDecimal newvalue)
  {
    fieldE01BPYREF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPYREF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPYREF()
  {
    return fieldE01BPYREF.getBigDecimal();
  }

  /**
  * Set field E01BPYPYM using a String value.
  */
  public void setE01BPYPYM(String newvalue)
  {
    fieldE01BPYPYM.setString(newvalue);
  }

  /**
  * Get value of field E01BPYPYM as a String.
  */
  public String getE01BPYPYM()
  {
    return fieldE01BPYPYM.getString();
  }

  /**
  * Set numeric field E01BPYPYM using a BigDecimal value.
  */
  public void setE01BPYPYM(BigDecimal newvalue)
  {
    fieldE01BPYPYM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BPYPYM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BPYPYM()
  {
    return fieldE01BPYPYM.getBigDecimal();
  }

  /**
  * Set field E01BPYUSR using a String value.
  */
  public void setE01BPYUSR(String newvalue)
  {
    fieldE01BPYUSR.setString(newvalue);
  }

  /**
  * Get value of field E01BPYUSR as a String.
  */
  public String getE01BPYUSR()
  {
    return fieldE01BPYUSR.getString();
  }

  /**
  * Set field E01BPYAUS using a String value.
  */
  public void setE01BPYAUS(String newvalue)
  {
    fieldE01BPYAUS.setString(newvalue);
  }

  /**
  * Get value of field E01BPYAUS as a String.
  */
  public String getE01BPYAUS()
  {
    return fieldE01BPYAUS.getString();
  }

  /**
  * Set field E01BPYSTS using a String value.
  */
  public void setE01BPYSTS(String newvalue)
  {
    fieldE01BPYSTS.setString(newvalue);
  }

  /**
  * Get value of field E01BPYSTS as a String.
  */
  public String getE01BPYSTS()
  {
    return fieldE01BPYSTS.getString();
  }

  /**
  * Set field E01BPYSTSD using a String value.
  */
  public void setE01BPYSTSD(String newvalue)
  {
    fieldE01BPYSTSD.setString(newvalue);
  }

  /**
  * Get value of field E01BPYSTSD as a String.
  */
  public String getE01BPYSTSD()
  {
    return fieldE01BPYSTSD.getString();
  }

  /**
  * Set field E01ACT using a String value.
  */
  public void setE01ACT(String newvalue)
  {
    fieldE01ACT.setString(newvalue);
  }

  /**
  * Get value of field E01ACT as a String.
  */
  public String getE01ACT()
  {
    return fieldE01ACT.getString();
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