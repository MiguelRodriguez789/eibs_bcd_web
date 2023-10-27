package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL054802 physical file definition.
* 
* File level identifier is 1180504120953.
* Record format level identifier is 479D66E4DFBC8.
*/

public class EDL054802Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H02USERID",
                                     "H02PROGRM",
                                     "H02TIMSYS",
                                     "H02SCRCOD",
                                     "H02OPECOD",
                                     "H02FLGMAS",
                                     "H02FLGWK1",
                                     "H02FLGWK2",
                                     "H02FLGWK3",
                                     "E02CTPCNV",
                                     "E02DSCCNV",
                                     "E02CTPTYP",
                                     "E02CTPDSC",
                                     "E02CTLSEQ",
                                     "E02CTLNUM",
                                     "E02CTLCNV",
                                     "E02CTLREF",
                                     "E02CTLCUN",
                                     "E02CTLIDN",
                                     "E02CTLTID",
                                     "E02CTLPID",
                                     "E02CTLNA1",
                                     "E02CTLAPV",
                                     "E02CTLUNI",
                                     "E02CTLRSV",
                                     "E02CTLURV",
                                     "E02CTLUSU",
                                     "E02CTLOPM",
                                     "E02CTLOPD",
                                     "E02CTLOPY",
                                     "E02CTLCAU",
                                     "E02CTLUCM",
                                     "E02CTLUCD",
                                     "E02CTLUCY",
                                     "E02CTLOBS",
                                     "E02CTLFL1",
                                     "E02CTLFL2",
                                     "E02CTLFL3",
                                     "E02CTLAM1",
                                     "E02CTLAM2",
                                     "E02CTLOPE"
                                   };
  final static String tnames[] = {
                                   "H02USERID",
                                   "H02PROGRM",
                                   "H02TIMSYS",
                                   "H02SCRCOD",
                                   "H02OPECOD",
                                   "H02FLGMAS",
                                   "H02FLGWK1",
                                   "H02FLGWK2",
                                   "H02FLGWK3",
                                   "E02CTPCNV",
                                   "E02DSCCNV",
                                   "E02CTPTYP",
                                   "E02CTPDSC",
                                   "E02CTLSEQ",
                                   "E02CTLNUM",
                                   "E02CTLCNV",
                                   "E02CTLREF",
                                   "E02CTLCUN",
                                   "E02CTLIDN",
                                   "E02CTLTID",
                                   "E02CTLPID",
                                   "E02CTLNA1",
                                   "E02CTLAPV",
                                   "E02CTLUNI",
                                   "E02CTLRSV",
                                   "E02CTLURV",
                                   "E02CTLUSU",
                                   "E02CTLOPM",
                                   "E02CTLOPD",
                                   "E02CTLOPY",
                                   "E02CTLCAU",
                                   "E02CTLUCM",
                                   "E02CTLUCD",
                                   "E02CTLUCY",
                                   "E02CTLOBS",
                                   "E02CTLFL1",
                                   "E02CTLFL2",
                                   "E02CTLFL3",
                                   "E02CTLAM1",
                                   "E02CTLAM2",
                                   "E02CTLOPE"
                                 };
  final static String fid = "1180504120953";
  final static String rid = "479D66E4DFBC8";
  final static String fmtname = "EDL054802";
  final int FIELDCOUNT = 41;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH02USERID = null;
  private CharacterField fieldH02PROGRM = null;
  private CharacterField fieldH02TIMSYS = null;
  private CharacterField fieldH02SCRCOD = null;
  private CharacterField fieldH02OPECOD = null;
  private CharacterField fieldH02FLGMAS = null;
  private CharacterField fieldH02FLGWK1 = null;
  private CharacterField fieldH02FLGWK2 = null;
  private CharacterField fieldH02FLGWK3 = null;
  private CharacterField fieldE02CTPCNV = null;
  private CharacterField fieldE02DSCCNV = null;
  private CharacterField fieldE02CTPTYP = null;
  private CharacterField fieldE02CTPDSC = null;
  private DecimalField fieldE02CTLSEQ = null;
  private DecimalField fieldE02CTLNUM = null;
  private CharacterField fieldE02CTLCNV = null;
  private DecimalField fieldE02CTLREF = null;
  private DecimalField fieldE02CTLCUN = null;
  private CharacterField fieldE02CTLIDN = null;
  private CharacterField fieldE02CTLTID = null;
  private CharacterField fieldE02CTLPID = null;
  private CharacterField fieldE02CTLNA1 = null;
  private DecimalField fieldE02CTLAPV = null;
  private DecimalField fieldE02CTLUNI = null;
  private DecimalField fieldE02CTLRSV = null;
  private DecimalField fieldE02CTLURV = null;
  private CharacterField fieldE02CTLUSU = null;
  private DecimalField fieldE02CTLOPM = null;
  private DecimalField fieldE02CTLOPD = null;
  private DecimalField fieldE02CTLOPY = null;
  private CharacterField fieldE02CTLCAU = null;
  private DecimalField fieldE02CTLUCM = null;
  private DecimalField fieldE02CTLUCD = null;
  private DecimalField fieldE02CTLUCY = null;
  private CharacterField fieldE02CTLOBS = null;
  private CharacterField fieldE02CTLFL1 = null;
  private CharacterField fieldE02CTLFL2 = null;
  private CharacterField fieldE02CTLFL3 = null;
  private DecimalField fieldE02CTLAM1 = null;
  private DecimalField fieldE02CTLAM2 = null;
  private CharacterField fieldE02CTLOPE = null;

  /**
  * Constructor for EDL054802Message.
  */
  public EDL054802Message()
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
    recordsize = 439;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH02USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H02USERID");
    fields[1] = fieldH02PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H02PROGRM");
    fields[2] = fieldH02TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H02TIMSYS");
    fields[3] = fieldH02SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H02SCRCOD");
    fields[4] = fieldH02OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H02OPECOD");
    fields[5] = fieldH02FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H02FLGMAS");
    fields[6] = fieldH02FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H02FLGWK1");
    fields[7] = fieldH02FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H02FLGWK2");
    fields[8] = fieldH02FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H02FLGWK3");
    fields[9] = fieldE02CTPCNV =
    new CharacterField(message, HEADERSIZE + 42, 4, "E02CTPCNV");
    fields[10] = fieldE02DSCCNV =
    new CharacterField(message, HEADERSIZE + 46, 45, "E02DSCCNV");
    fields[11] = fieldE02CTPTYP =
    new CharacterField(message, HEADERSIZE + 91, 2, "E02CTPTYP");
    fields[12] = fieldE02CTPDSC =
    new CharacterField(message, HEADERSIZE + 93, 45, "E02CTPDSC");
    fields[13] = fieldE02CTLSEQ =
    new DecimalField(message, HEADERSIZE + 138, 13, 0, "E02CTLSEQ");
    fields[14] = fieldE02CTLNUM =
    new DecimalField(message, HEADERSIZE + 151, 13, 0, "E02CTLNUM");
    fields[15] = fieldE02CTLCNV =
    new CharacterField(message, HEADERSIZE + 164, 4, "E02CTLCNV");
    fields[16] = fieldE02CTLREF =
    new DecimalField(message, HEADERSIZE + 168, 13, 0, "E02CTLREF");
    fields[17] = fieldE02CTLCUN =
    new DecimalField(message, HEADERSIZE + 181, 10, 0, "E02CTLCUN");
    fields[18] = fieldE02CTLIDN =
    new CharacterField(message, HEADERSIZE + 191, 25, "E02CTLIDN");
    fields[19] = fieldE02CTLTID =
    new CharacterField(message, HEADERSIZE + 216, 4, "E02CTLTID");
    fields[20] = fieldE02CTLPID =
    new CharacterField(message, HEADERSIZE + 220, 4, "E02CTLPID");
    fields[21] = fieldE02CTLNA1 =
    new CharacterField(message, HEADERSIZE + 224, 45, "E02CTLNA1");
    fields[22] = fieldE02CTLAPV =
    new DecimalField(message, HEADERSIZE + 269, 17, 2, "E02CTLAPV");
    fields[23] = fieldE02CTLUNI =
    new DecimalField(message, HEADERSIZE + 286, 6, 0, "E02CTLUNI");
    fields[24] = fieldE02CTLRSV =
    new DecimalField(message, HEADERSIZE + 292, 17, 2, "E02CTLRSV");
    fields[25] = fieldE02CTLURV =
    new DecimalField(message, HEADERSIZE + 309, 6, 0, "E02CTLURV");
    fields[26] = fieldE02CTLUSU =
    new CharacterField(message, HEADERSIZE + 315, 10, "E02CTLUSU");
    fields[27] = fieldE02CTLOPM =
    new DecimalField(message, HEADERSIZE + 325, 3, 0, "E02CTLOPM");
    fields[28] = fieldE02CTLOPD =
    new DecimalField(message, HEADERSIZE + 328, 3, 0, "E02CTLOPD");
    fields[29] = fieldE02CTLOPY =
    new DecimalField(message, HEADERSIZE + 331, 5, 0, "E02CTLOPY");
    fields[30] = fieldE02CTLCAU =
    new CharacterField(message, HEADERSIZE + 336, 4, "E02CTLCAU");
    fields[31] = fieldE02CTLUCM =
    new DecimalField(message, HEADERSIZE + 340, 3, 0, "E02CTLUCM");
    fields[32] = fieldE02CTLUCD =
    new DecimalField(message, HEADERSIZE + 343, 3, 0, "E02CTLUCD");
    fields[33] = fieldE02CTLUCY =
    new DecimalField(message, HEADERSIZE + 346, 5, 0, "E02CTLUCY");
    fields[34] = fieldE02CTLOBS =
    new CharacterField(message, HEADERSIZE + 351, 50, "E02CTLOBS");
    fields[35] = fieldE02CTLFL1 =
    new CharacterField(message, HEADERSIZE + 401, 1, "E02CTLFL1");
    fields[36] = fieldE02CTLFL2 =
    new CharacterField(message, HEADERSIZE + 402, 1, "E02CTLFL2");
    fields[37] = fieldE02CTLFL3 =
    new CharacterField(message, HEADERSIZE + 403, 1, "E02CTLFL3");
    fields[38] = fieldE02CTLAM1 =
    new DecimalField(message, HEADERSIZE + 404, 17, 2, "E02CTLAM1");
    fields[39] = fieldE02CTLAM2 =
    new DecimalField(message, HEADERSIZE + 421, 17, 2, "E02CTLAM2");
    fields[40] = fieldE02CTLOPE =
    new CharacterField(message, HEADERSIZE + 438, 1, "E02CTLOPE");

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
  * Set field H02USERID using a String value.
  */
  public void setH02USERID(String newvalue)
  {
    fieldH02USERID.setString(newvalue);
  }

  /**
  * Get value of field H02USERID as a String.
  */
  public String getH02USERID()
  {
    return fieldH02USERID.getString();
  }

  /**
  * Set field H02PROGRM using a String value.
  */
  public void setH02PROGRM(String newvalue)
  {
    fieldH02PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H02PROGRM as a String.
  */
  public String getH02PROGRM()
  {
    return fieldH02PROGRM.getString();
  }

  /**
  * Set field H02TIMSYS using a String value.
  */
  public void setH02TIMSYS(String newvalue)
  {
    fieldH02TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H02TIMSYS as a String.
  */
  public String getH02TIMSYS()
  {
    return fieldH02TIMSYS.getString();
  }

  /**
  * Set field H02SCRCOD using a String value.
  */
  public void setH02SCRCOD(String newvalue)
  {
    fieldH02SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H02SCRCOD as a String.
  */
  public String getH02SCRCOD()
  {
    return fieldH02SCRCOD.getString();
  }

  /**
  * Set field H02OPECOD using a String value.
  */
  public void setH02OPECOD(String newvalue)
  {
    fieldH02OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H02OPECOD as a String.
  */
  public String getH02OPECOD()
  {
    return fieldH02OPECOD.getString();
  }

  /**
  * Set field H02FLGMAS using a String value.
  */
  public void setH02FLGMAS(String newvalue)
  {
    fieldH02FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H02FLGMAS as a String.
  */
  public String getH02FLGMAS()
  {
    return fieldH02FLGMAS.getString();
  }

  /**
  * Set field H02FLGWK1 using a String value.
  */
  public void setH02FLGWK1(String newvalue)
  {
    fieldH02FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK1 as a String.
  */
  public String getH02FLGWK1()
  {
    return fieldH02FLGWK1.getString();
  }

  /**
  * Set field H02FLGWK2 using a String value.
  */
  public void setH02FLGWK2(String newvalue)
  {
    fieldH02FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK2 as a String.
  */
  public String getH02FLGWK2()
  {
    return fieldH02FLGWK2.getString();
  }

  /**
  * Set field H02FLGWK3 using a String value.
  */
  public void setH02FLGWK3(String newvalue)
  {
    fieldH02FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK3 as a String.
  */
  public String getH02FLGWK3()
  {
    return fieldH02FLGWK3.getString();
  }

  /**
  * Set field E02CTPCNV using a String value.
  */
  public void setE02CTPCNV(String newvalue)
  {
    fieldE02CTPCNV.setString(newvalue);
  }

  /**
  * Get value of field E02CTPCNV as a String.
  */
  public String getE02CTPCNV()
  {
    return fieldE02CTPCNV.getString();
  }

  /**
  * Set field E02DSCCNV using a String value.
  */
  public void setE02DSCCNV(String newvalue)
  {
    fieldE02DSCCNV.setString(newvalue);
  }

  /**
  * Get value of field E02DSCCNV as a String.
  */
  public String getE02DSCCNV()
  {
    return fieldE02DSCCNV.getString();
  }

  /**
  * Set field E02CTPTYP using a String value.
  */
  public void setE02CTPTYP(String newvalue)
  {
    fieldE02CTPTYP.setString(newvalue);
  }

  /**
  * Get value of field E02CTPTYP as a String.
  */
  public String getE02CTPTYP()
  {
    return fieldE02CTPTYP.getString();
  }

  /**
  * Set field E02CTPDSC using a String value.
  */
  public void setE02CTPDSC(String newvalue)
  {
    fieldE02CTPDSC.setString(newvalue);
  }

  /**
  * Get value of field E02CTPDSC as a String.
  */
  public String getE02CTPDSC()
  {
    return fieldE02CTPDSC.getString();
  }

  /**
  * Set field E02CTLSEQ using a String value.
  */
  public void setE02CTLSEQ(String newvalue)
  {
    fieldE02CTLSEQ.setString(newvalue);
  }

  /**
  * Get value of field E02CTLSEQ as a String.
  */
  public String getE02CTLSEQ()
  {
    return fieldE02CTLSEQ.getString();
  }

  /**
  * Set numeric field E02CTLSEQ using a BigDecimal value.
  */
  public void setE02CTLSEQ(BigDecimal newvalue)
  {
    fieldE02CTLSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CTLSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CTLSEQ()
  {
    return fieldE02CTLSEQ.getBigDecimal();
  }

  /**
  * Set field E02CTLNUM using a String value.
  */
  public void setE02CTLNUM(String newvalue)
  {
    fieldE02CTLNUM.setString(newvalue);
  }

  /**
  * Get value of field E02CTLNUM as a String.
  */
  public String getE02CTLNUM()
  {
    return fieldE02CTLNUM.getString();
  }

  /**
  * Set numeric field E02CTLNUM using a BigDecimal value.
  */
  public void setE02CTLNUM(BigDecimal newvalue)
  {
    fieldE02CTLNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CTLNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CTLNUM()
  {
    return fieldE02CTLNUM.getBigDecimal();
  }

  /**
  * Set field E02CTLCNV using a String value.
  */
  public void setE02CTLCNV(String newvalue)
  {
    fieldE02CTLCNV.setString(newvalue);
  }

  /**
  * Get value of field E02CTLCNV as a String.
  */
  public String getE02CTLCNV()
  {
    return fieldE02CTLCNV.getString();
  }

  /**
  * Set field E02CTLREF using a String value.
  */
  public void setE02CTLREF(String newvalue)
  {
    fieldE02CTLREF.setString(newvalue);
  }

  /**
  * Get value of field E02CTLREF as a String.
  */
  public String getE02CTLREF()
  {
    return fieldE02CTLREF.getString();
  }

  /**
  * Set numeric field E02CTLREF using a BigDecimal value.
  */
  public void setE02CTLREF(BigDecimal newvalue)
  {
    fieldE02CTLREF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CTLREF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CTLREF()
  {
    return fieldE02CTLREF.getBigDecimal();
  }

  /**
  * Set field E02CTLCUN using a String value.
  */
  public void setE02CTLCUN(String newvalue)
  {
    fieldE02CTLCUN.setString(newvalue);
  }

  /**
  * Get value of field E02CTLCUN as a String.
  */
  public String getE02CTLCUN()
  {
    return fieldE02CTLCUN.getString();
  }

  /**
  * Set numeric field E02CTLCUN using a BigDecimal value.
  */
  public void setE02CTLCUN(BigDecimal newvalue)
  {
    fieldE02CTLCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CTLCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CTLCUN()
  {
    return fieldE02CTLCUN.getBigDecimal();
  }

  /**
  * Set field E02CTLIDN using a String value.
  */
  public void setE02CTLIDN(String newvalue)
  {
    fieldE02CTLIDN.setString(newvalue);
  }

  /**
  * Get value of field E02CTLIDN as a String.
  */
  public String getE02CTLIDN()
  {
    return fieldE02CTLIDN.getString();
  }

  /**
  * Set field E02CTLTID using a String value.
  */
  public void setE02CTLTID(String newvalue)
  {
    fieldE02CTLTID.setString(newvalue);
  }

  /**
  * Get value of field E02CTLTID as a String.
  */
  public String getE02CTLTID()
  {
    return fieldE02CTLTID.getString();
  }

  /**
  * Set field E02CTLPID using a String value.
  */
  public void setE02CTLPID(String newvalue)
  {
    fieldE02CTLPID.setString(newvalue);
  }

  /**
  * Get value of field E02CTLPID as a String.
  */
  public String getE02CTLPID()
  {
    return fieldE02CTLPID.getString();
  }

  /**
  * Set field E02CTLNA1 using a String value.
  */
  public void setE02CTLNA1(String newvalue)
  {
    fieldE02CTLNA1.setString(newvalue);
  }

  /**
  * Get value of field E02CTLNA1 as a String.
  */
  public String getE02CTLNA1()
  {
    return fieldE02CTLNA1.getString();
  }

  /**
  * Set field E02CTLAPV using a String value.
  */
  public void setE02CTLAPV(String newvalue)
  {
    fieldE02CTLAPV.setString(newvalue);
  }

  /**
  * Get value of field E02CTLAPV as a String.
  */
  public String getE02CTLAPV()
  {
    return fieldE02CTLAPV.getString();
  }

  /**
  * Set numeric field E02CTLAPV using a BigDecimal value.
  */
  public void setE02CTLAPV(BigDecimal newvalue)
  {
    fieldE02CTLAPV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CTLAPV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CTLAPV()
  {
    return fieldE02CTLAPV.getBigDecimal();
  }

  /**
  * Set field E02CTLUNI using a String value.
  */
  public void setE02CTLUNI(String newvalue)
  {
    fieldE02CTLUNI.setString(newvalue);
  }

  /**
  * Get value of field E02CTLUNI as a String.
  */
  public String getE02CTLUNI()
  {
    return fieldE02CTLUNI.getString();
  }

  /**
  * Set numeric field E02CTLUNI using a BigDecimal value.
  */
  public void setE02CTLUNI(BigDecimal newvalue)
  {
    fieldE02CTLUNI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CTLUNI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CTLUNI()
  {
    return fieldE02CTLUNI.getBigDecimal();
  }

  /**
  * Set field E02CTLRSV using a String value.
  */
  public void setE02CTLRSV(String newvalue)
  {
    fieldE02CTLRSV.setString(newvalue);
  }

  /**
  * Get value of field E02CTLRSV as a String.
  */
  public String getE02CTLRSV()
  {
    return fieldE02CTLRSV.getString();
  }

  /**
  * Set numeric field E02CTLRSV using a BigDecimal value.
  */
  public void setE02CTLRSV(BigDecimal newvalue)
  {
    fieldE02CTLRSV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CTLRSV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CTLRSV()
  {
    return fieldE02CTLRSV.getBigDecimal();
  }

  /**
  * Set field E02CTLURV using a String value.
  */
  public void setE02CTLURV(String newvalue)
  {
    fieldE02CTLURV.setString(newvalue);
  }

  /**
  * Get value of field E02CTLURV as a String.
  */
  public String getE02CTLURV()
  {
    return fieldE02CTLURV.getString();
  }

  /**
  * Set numeric field E02CTLURV using a BigDecimal value.
  */
  public void setE02CTLURV(BigDecimal newvalue)
  {
    fieldE02CTLURV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CTLURV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CTLURV()
  {
    return fieldE02CTLURV.getBigDecimal();
  }

  /**
  * Set field E02CTLUSU using a String value.
  */
  public void setE02CTLUSU(String newvalue)
  {
    fieldE02CTLUSU.setString(newvalue);
  }

  /**
  * Get value of field E02CTLUSU as a String.
  */
  public String getE02CTLUSU()
  {
    return fieldE02CTLUSU.getString();
  }

  /**
  * Set field E02CTLOPM using a String value.
  */
  public void setE02CTLOPM(String newvalue)
  {
    fieldE02CTLOPM.setString(newvalue);
  }

  /**
  * Get value of field E02CTLOPM as a String.
  */
  public String getE02CTLOPM()
  {
    return fieldE02CTLOPM.getString();
  }

  /**
  * Set numeric field E02CTLOPM using a BigDecimal value.
  */
  public void setE02CTLOPM(BigDecimal newvalue)
  {
    fieldE02CTLOPM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CTLOPM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CTLOPM()
  {
    return fieldE02CTLOPM.getBigDecimal();
  }

  /**
  * Set field E02CTLOPD using a String value.
  */
  public void setE02CTLOPD(String newvalue)
  {
    fieldE02CTLOPD.setString(newvalue);
  }

  /**
  * Get value of field E02CTLOPD as a String.
  */
  public String getE02CTLOPD()
  {
    return fieldE02CTLOPD.getString();
  }

  /**
  * Set numeric field E02CTLOPD using a BigDecimal value.
  */
  public void setE02CTLOPD(BigDecimal newvalue)
  {
    fieldE02CTLOPD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CTLOPD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CTLOPD()
  {
    return fieldE02CTLOPD.getBigDecimal();
  }

  /**
  * Set field E02CTLOPY using a String value.
  */
  public void setE02CTLOPY(String newvalue)
  {
    fieldE02CTLOPY.setString(newvalue);
  }

  /**
  * Get value of field E02CTLOPY as a String.
  */
  public String getE02CTLOPY()
  {
    return fieldE02CTLOPY.getString();
  }

  /**
  * Set numeric field E02CTLOPY using a BigDecimal value.
  */
  public void setE02CTLOPY(BigDecimal newvalue)
  {
    fieldE02CTLOPY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CTLOPY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CTLOPY()
  {
    return fieldE02CTLOPY.getBigDecimal();
  }

  /**
  * Set field E02CTLCAU using a String value.
  */
  public void setE02CTLCAU(String newvalue)
  {
    fieldE02CTLCAU.setString(newvalue);
  }

  /**
  * Get value of field E02CTLCAU as a String.
  */
  public String getE02CTLCAU()
  {
    return fieldE02CTLCAU.getString();
  }

  /**
  * Set field E02CTLUCM using a String value.
  */
  public void setE02CTLUCM(String newvalue)
  {
    fieldE02CTLUCM.setString(newvalue);
  }

  /**
  * Get value of field E02CTLUCM as a String.
  */
  public String getE02CTLUCM()
  {
    return fieldE02CTLUCM.getString();
  }

  /**
  * Set numeric field E02CTLUCM using a BigDecimal value.
  */
  public void setE02CTLUCM(BigDecimal newvalue)
  {
    fieldE02CTLUCM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CTLUCM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CTLUCM()
  {
    return fieldE02CTLUCM.getBigDecimal();
  }

  /**
  * Set field E02CTLUCD using a String value.
  */
  public void setE02CTLUCD(String newvalue)
  {
    fieldE02CTLUCD.setString(newvalue);
  }

  /**
  * Get value of field E02CTLUCD as a String.
  */
  public String getE02CTLUCD()
  {
    return fieldE02CTLUCD.getString();
  }

  /**
  * Set numeric field E02CTLUCD using a BigDecimal value.
  */
  public void setE02CTLUCD(BigDecimal newvalue)
  {
    fieldE02CTLUCD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CTLUCD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CTLUCD()
  {
    return fieldE02CTLUCD.getBigDecimal();
  }

  /**
  * Set field E02CTLUCY using a String value.
  */
  public void setE02CTLUCY(String newvalue)
  {
    fieldE02CTLUCY.setString(newvalue);
  }

  /**
  * Get value of field E02CTLUCY as a String.
  */
  public String getE02CTLUCY()
  {
    return fieldE02CTLUCY.getString();
  }

  /**
  * Set numeric field E02CTLUCY using a BigDecimal value.
  */
  public void setE02CTLUCY(BigDecimal newvalue)
  {
    fieldE02CTLUCY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CTLUCY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CTLUCY()
  {
    return fieldE02CTLUCY.getBigDecimal();
  }

  /**
  * Set field E02CTLOBS using a String value.
  */
  public void setE02CTLOBS(String newvalue)
  {
    fieldE02CTLOBS.setString(newvalue);
  }

  /**
  * Get value of field E02CTLOBS as a String.
  */
  public String getE02CTLOBS()
  {
    return fieldE02CTLOBS.getString();
  }

  /**
  * Set field E02CTLFL1 using a String value.
  */
  public void setE02CTLFL1(String newvalue)
  {
    fieldE02CTLFL1.setString(newvalue);
  }

  /**
  * Get value of field E02CTLFL1 as a String.
  */
  public String getE02CTLFL1()
  {
    return fieldE02CTLFL1.getString();
  }

  /**
  * Set field E02CTLFL2 using a String value.
  */
  public void setE02CTLFL2(String newvalue)
  {
    fieldE02CTLFL2.setString(newvalue);
  }

  /**
  * Get value of field E02CTLFL2 as a String.
  */
  public String getE02CTLFL2()
  {
    return fieldE02CTLFL2.getString();
  }

  /**
  * Set field E02CTLFL3 using a String value.
  */
  public void setE02CTLFL3(String newvalue)
  {
    fieldE02CTLFL3.setString(newvalue);
  }

  /**
  * Get value of field E02CTLFL3 as a String.
  */
  public String getE02CTLFL3()
  {
    return fieldE02CTLFL3.getString();
  }

  /**
  * Set field E02CTLAM1 using a String value.
  */
  public void setE02CTLAM1(String newvalue)
  {
    fieldE02CTLAM1.setString(newvalue);
  }

  /**
  * Get value of field E02CTLAM1 as a String.
  */
  public String getE02CTLAM1()
  {
    return fieldE02CTLAM1.getString();
  }

  /**
  * Set numeric field E02CTLAM1 using a BigDecimal value.
  */
  public void setE02CTLAM1(BigDecimal newvalue)
  {
    fieldE02CTLAM1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CTLAM1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CTLAM1()
  {
    return fieldE02CTLAM1.getBigDecimal();
  }

  /**
  * Set field E02CTLAM2 using a String value.
  */
  public void setE02CTLAM2(String newvalue)
  {
    fieldE02CTLAM2.setString(newvalue);
  }

  /**
  * Get value of field E02CTLAM2 as a String.
  */
  public String getE02CTLAM2()
  {
    return fieldE02CTLAM2.getString();
  }

  /**
  * Set numeric field E02CTLAM2 using a BigDecimal value.
  */
  public void setE02CTLAM2(BigDecimal newvalue)
  {
    fieldE02CTLAM2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CTLAM2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CTLAM2()
  {
    return fieldE02CTLAM2.getBigDecimal();
  }

  /**
  * Set field E02CTLOPE using a String value.
  */
  public void setE02CTLOPE(String newvalue)
  {
    fieldE02CTLOPE.setString(newvalue);
  }

  /**
  * Get value of field E02CTLOPE as a String.
  */
  public String getE02CTLOPE()
  {
    return fieldE02CTLOPE.getString();
  }

}
