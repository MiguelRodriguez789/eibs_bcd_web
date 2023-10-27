package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL055501 physical file definition.
* 
* File level identifier is 1180629170128.
* Record format level identifier is 4F78FEA14450E.
*/

public class EDL055501Message extends MessageRecord
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
                                     "E01SELTYP",
                                     "E01SELCUN",
                                     "E01SELOFN",
                                     "E01CUSCUN",
                                     "E01CUSNA1",
                                     "E01CUSNA2",
                                     "E01CUSNA3",
                                     "E01CUSNA4",
                                     "E01CUSIDN",
                                     "E01CUSLGT"
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
                                   "E01SELTYP",
                                   "E01SELCUN",
                                   "E01SELOFN",
                                   "E01CUSCUN",
                                   "E01CUSNA1",
                                   "E01CUSNA2",
                                   "E01CUSNA3",
                                   "E01CUSNA4",
                                   "E01CUSIDN",
                                   "E01CUSLGT"
                                 };
  final static String fid = "1180629170128";
  final static String rid = "4F78FEA14450E";
  final static String fmtname = "EDL055501";
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
  private CharacterField fieldE01SELTYP = null;
  private DecimalField fieldE01SELCUN = null;
  private DecimalField fieldE01SELOFN = null;
  private DecimalField fieldE01CUSCUN = null;
  private CharacterField fieldE01CUSNA1 = null;
  private CharacterField fieldE01CUSNA2 = null;
  private CharacterField fieldE01CUSNA3 = null;
  private CharacterField fieldE01CUSNA4 = null;
  private CharacterField fieldE01CUSIDN = null;
  private CharacterField fieldE01CUSLGT = null;

  /**
  * Constructor for EDL055501Message.
  */
  public EDL055501Message()
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
    recordsize = 297;
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
    fields[9] = fieldE01SELTYP =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01SELTYP");
    fields[10] = fieldE01SELCUN =
    new DecimalField(message, HEADERSIZE + 43, 10, 0, "E01SELCUN");
    fields[11] = fieldE01SELOFN =
    new DecimalField(message, HEADERSIZE + 53, 13, 0, "E01SELOFN");
    fields[12] = fieldE01CUSCUN =
    new DecimalField(message, HEADERSIZE + 66, 10, 0, "E01CUSCUN");
    fields[13] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 76, 60, "E01CUSNA1");
    fields[14] = fieldE01CUSNA2 =
    new CharacterField(message, HEADERSIZE + 136, 45, "E01CUSNA2");
    fields[15] = fieldE01CUSNA3 =
    new CharacterField(message, HEADERSIZE + 181, 45, "E01CUSNA3");
    fields[16] = fieldE01CUSNA4 =
    new CharacterField(message, HEADERSIZE + 226, 45, "E01CUSNA4");
    fields[17] = fieldE01CUSIDN =
    new CharacterField(message, HEADERSIZE + 271, 25, "E01CUSIDN");
    fields[18] = fieldE01CUSLGT =
    new CharacterField(message, HEADERSIZE + 296, 1, "E01CUSLGT");

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
  * Set field E01SELTYP using a String value.
  */
  public void setE01SELTYP(String newvalue)
  {
    fieldE01SELTYP.setString(newvalue);
  }

  /**
  * Get value of field E01SELTYP as a String.
  */
  public String getE01SELTYP()
  {
    return fieldE01SELTYP.getString();
  }

  /**
  * Set field E01SELCUN using a String value.
  */
  public void setE01SELCUN(String newvalue)
  {
    fieldE01SELCUN.setString(newvalue);
  }

  /**
  * Get value of field E01SELCUN as a String.
  */
  public String getE01SELCUN()
  {
    return fieldE01SELCUN.getString();
  }

  /**
  * Set numeric field E01SELCUN using a BigDecimal value.
  */
  public void setE01SELCUN(BigDecimal newvalue)
  {
    fieldE01SELCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SELCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SELCUN()
  {
    return fieldE01SELCUN.getBigDecimal();
  }

  /**
  * Set field E01SELOFN using a String value.
  */
  public void setE01SELOFN(String newvalue)
  {
    fieldE01SELOFN.setString(newvalue);
  }

  /**
  * Get value of field E01SELOFN as a String.
  */
  public String getE01SELOFN()
  {
    return fieldE01SELOFN.getString();
  }

  /**
  * Set numeric field E01SELOFN using a BigDecimal value.
  */
  public void setE01SELOFN(BigDecimal newvalue)
  {
    fieldE01SELOFN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SELOFN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SELOFN()
  {
    return fieldE01SELOFN.getBigDecimal();
  }

  /**
  * Set field E01CUSCUN using a String value.
  */
  public void setE01CUSCUN(String newvalue)
  {
    fieldE01CUSCUN.setString(newvalue);
  }

  /**
  * Get value of field E01CUSCUN as a String.
  */
  public String getE01CUSCUN()
  {
    return fieldE01CUSCUN.getString();
  }

  /**
  * Set numeric field E01CUSCUN using a BigDecimal value.
  */
  public void setE01CUSCUN(BigDecimal newvalue)
  {
    fieldE01CUSCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSCUN()
  {
    return fieldE01CUSCUN.getBigDecimal();
  }

  /**
  * Set field E01CUSNA1 using a String value.
  */
  public void setE01CUSNA1(String newvalue)
  {
    fieldE01CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E01CUSNA1 as a String.
  */
  public String getE01CUSNA1()
  {
    return fieldE01CUSNA1.getString();
  }

  /**
  * Set field E01CUSNA2 using a String value.
  */
  public void setE01CUSNA2(String newvalue)
  {
    fieldE01CUSNA2.setString(newvalue);
  }

  /**
  * Get value of field E01CUSNA2 as a String.
  */
  public String getE01CUSNA2()
  {
    return fieldE01CUSNA2.getString();
  }

  /**
  * Set field E01CUSNA3 using a String value.
  */
  public void setE01CUSNA3(String newvalue)
  {
    fieldE01CUSNA3.setString(newvalue);
  }

  /**
  * Get value of field E01CUSNA3 as a String.
  */
  public String getE01CUSNA3()
  {
    return fieldE01CUSNA3.getString();
  }

  /**
  * Set field E01CUSNA4 using a String value.
  */
  public void setE01CUSNA4(String newvalue)
  {
    fieldE01CUSNA4.setString(newvalue);
  }

  /**
  * Get value of field E01CUSNA4 as a String.
  */
  public String getE01CUSNA4()
  {
    return fieldE01CUSNA4.getString();
  }

  /**
  * Set field E01CUSIDN using a String value.
  */
  public void setE01CUSIDN(String newvalue)
  {
    fieldE01CUSIDN.setString(newvalue);
  }

  /**
  * Get value of field E01CUSIDN as a String.
  */
  public String getE01CUSIDN()
  {
    return fieldE01CUSIDN.getString();
  }

  /**
  * Set field E01CUSLGT using a String value.
  */
  public void setE01CUSLGT(String newvalue)
  {
    fieldE01CUSLGT.setString(newvalue);
  }

  /**
  * Get value of field E01CUSLGT as a String.
  */
  public String getE01CUSLGT()
  {
    return fieldE01CUSLGT.getString();
  }

}
