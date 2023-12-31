package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDP072301 physical file definition.
* 
* File level identifier is 1130611113112.
* Record format level identifier is 34B5D3EE3C0BA.
*/

public class EDP072301Message extends MessageRecord
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
                                     "E01CNTLAN",
                                     "E02DPTNPR",
                                     "E02DPTSEQ",
                                     "E02DPTIDN",
                                     "E02DPTNOM",
                                     "E02DPTCNY",
                                     "E02DPTCNM",
                                     "E02DPTCND",
                                     "E02DPTRTE",
                                     "E02OPECDE"
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
                                   "E01CNTLAN",
                                   "E02DPTNPR",
                                   "E02DPTSEQ",
                                   "E02DPTIDN",
                                   "E02DPTNOM",
                                   "E02DPTCNY",
                                   "E02DPTCNM",
                                   "E02DPTCND",
                                   "E02DPTRTE",
                                   "E02OPECDE"
                                 };
  final static String fid = "1130611113112";
  final static String rid = "34B5D3EE3C0BA";
  final static String fmtname = "EDP072301";
  final int FIELDCOUNT = 19;
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
  private CharacterField fieldE01CNTLAN = null;
  private DecimalField fieldE02DPTNPR = null;
  private DecimalField fieldE02DPTSEQ = null;
  private CharacterField fieldE02DPTIDN = null;
  private CharacterField fieldE02DPTNOM = null;
  private DecimalField fieldE02DPTCNY = null;
  private DecimalField fieldE02DPTCNM = null;
  private DecimalField fieldE02DPTCND = null;
  private DecimalField fieldE02DPTRTE = null;
  private CharacterField fieldE02OPECDE = null;

  /**
  * Constructor for EDP072301Message.
  */
  public EDP072301Message()
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
    recordsize = 154;
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
    fields[9] = fieldE01CNTLAN =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01CNTLAN");
    fields[10] = fieldE02DPTNPR =
    new DecimalField(message, HEADERSIZE + 43, 13, 0, "E02DPTNPR");
    fields[11] = fieldE02DPTSEQ =
    new DecimalField(message, HEADERSIZE + 56, 8, 0, "E02DPTSEQ");
    fields[12] = fieldE02DPTIDN =
    new CharacterField(message, HEADERSIZE + 64, 25, "E02DPTIDN");
    fields[13] = fieldE02DPTNOM =
    new CharacterField(message, HEADERSIZE + 89, 45, "E02DPTNOM");
    fields[14] = fieldE02DPTCNY =
    new DecimalField(message, HEADERSIZE + 134, 5, 0, "E02DPTCNY");
    fields[15] = fieldE02DPTCNM =
    new DecimalField(message, HEADERSIZE + 139, 3, 0, "E02DPTCNM");
    fields[16] = fieldE02DPTCND =
    new DecimalField(message, HEADERSIZE + 142, 3, 0, "E02DPTCND");
    fields[17] = fieldE02DPTRTE =
    new DecimalField(message, HEADERSIZE + 145, 8, 3, "E02DPTRTE");
    fields[18] = fieldE02OPECDE =
    new CharacterField(message, HEADERSIZE + 153, 1, "E02OPECDE");

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
  * Set field E01CNTLAN using a String value.
  */
  public void setE01CNTLAN(String newvalue)
  {
    fieldE01CNTLAN.setString(newvalue);
  }

  /**
  * Get value of field E01CNTLAN as a String.
  */
  public String getE01CNTLAN()
  {
    return fieldE01CNTLAN.getString();
  }

  /**
  * Set field E02DPTNPR using a String value.
  */
  public void setE02DPTNPR(String newvalue)
  {
    fieldE02DPTNPR.setString(newvalue);
  }

  /**
  * Get value of field E02DPTNPR as a String.
  */
  public String getE02DPTNPR()
  {
    return fieldE02DPTNPR.getString();
  }

  /**
  * Set numeric field E02DPTNPR using a BigDecimal value.
  */
  public void setE02DPTNPR(BigDecimal newvalue)
  {
    fieldE02DPTNPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DPTNPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DPTNPR()
  {
    return fieldE02DPTNPR.getBigDecimal();
  }

  /**
  * Set field E02DPTSEQ using a String value.
  */
  public void setE02DPTSEQ(String newvalue)
  {
    fieldE02DPTSEQ.setString(newvalue);
  }

  /**
  * Get value of field E02DPTSEQ as a String.
  */
  public String getE02DPTSEQ()
  {
    return fieldE02DPTSEQ.getString();
  }

  /**
  * Set numeric field E02DPTSEQ using a BigDecimal value.
  */
  public void setE02DPTSEQ(BigDecimal newvalue)
  {
    fieldE02DPTSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DPTSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DPTSEQ()
  {
    return fieldE02DPTSEQ.getBigDecimal();
  }

  /**
  * Set field E02DPTIDN using a String value.
  */
  public void setE02DPTIDN(String newvalue)
  {
    fieldE02DPTIDN.setString(newvalue);
  }

  /**
  * Get value of field E02DPTIDN as a String.
  */
  public String getE02DPTIDN()
  {
    return fieldE02DPTIDN.getString();
  }

  /**
  * Set field E02DPTNOM using a String value.
  */
  public void setE02DPTNOM(String newvalue)
  {
    fieldE02DPTNOM.setString(newvalue);
  }

  /**
  * Get value of field E02DPTNOM as a String.
  */
  public String getE02DPTNOM()
  {
    return fieldE02DPTNOM.getString();
  }

  /**
  * Set field E02DPTCNY using a String value.
  */
  public void setE02DPTCNY(String newvalue)
  {
    fieldE02DPTCNY.setString(newvalue);
  }

  /**
  * Get value of field E02DPTCNY as a String.
  */
  public String getE02DPTCNY()
  {
    return fieldE02DPTCNY.getString();
  }

  /**
  * Set numeric field E02DPTCNY using a BigDecimal value.
  */
  public void setE02DPTCNY(BigDecimal newvalue)
  {
    fieldE02DPTCNY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DPTCNY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DPTCNY()
  {
    return fieldE02DPTCNY.getBigDecimal();
  }

  /**
  * Set field E02DPTCNM using a String value.
  */
  public void setE02DPTCNM(String newvalue)
  {
    fieldE02DPTCNM.setString(newvalue);
  }

  /**
  * Get value of field E02DPTCNM as a String.
  */
  public String getE02DPTCNM()
  {
    return fieldE02DPTCNM.getString();
  }

  /**
  * Set numeric field E02DPTCNM using a BigDecimal value.
  */
  public void setE02DPTCNM(BigDecimal newvalue)
  {
    fieldE02DPTCNM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DPTCNM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DPTCNM()
  {
    return fieldE02DPTCNM.getBigDecimal();
  }

  /**
  * Set field E02DPTCND using a String value.
  */
  public void setE02DPTCND(String newvalue)
  {
    fieldE02DPTCND.setString(newvalue);
  }

  /**
  * Get value of field E02DPTCND as a String.
  */
  public String getE02DPTCND()
  {
    return fieldE02DPTCND.getString();
  }

  /**
  * Set numeric field E02DPTCND using a BigDecimal value.
  */
  public void setE02DPTCND(BigDecimal newvalue)
  {
    fieldE02DPTCND.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DPTCND as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DPTCND()
  {
    return fieldE02DPTCND.getBigDecimal();
  }

  /**
  * Set field E02DPTRTE using a String value.
  */
  public void setE02DPTRTE(String newvalue)
  {
    fieldE02DPTRTE.setString(newvalue);
  }

  /**
  * Get value of field E02DPTRTE as a String.
  */
  public String getE02DPTRTE()
  {
    return fieldE02DPTRTE.getString();
  }

  /**
  * Set numeric field E02DPTRTE using a BigDecimal value.
  */
  public void setE02DPTRTE(BigDecimal newvalue)
  {
    fieldE02DPTRTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DPTRTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DPTRTE()
  {
    return fieldE02DPTRTE.getBigDecimal();
  }

  /**
  * Set field E02OPECDE using a String value.
  */
  public void setE02OPECDE(String newvalue)
  {
    fieldE02OPECDE.setString(newvalue);
  }

  /**
  * Get value of field E02OPECDE as a String.
  */
  public String getE02OPECDE()
  {
    return fieldE02OPECDE.getString();
  }

}
