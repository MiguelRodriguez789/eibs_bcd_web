package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDP084001 physical file definition.
* 
* File level identifier is 1130611113115.
* Record format level identifier is 313E6C35045F2.
*/

public class EDP084001Message extends MessageRecord
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
                                     "E01PTSLGT",
                                     "E01PTSMOD",
                                     "E01PTSSEQ",
                                     "E01PTSDSC",
                                     "E01PTSPTS",
                                     "E01PTSVMN",
                                     "E01PTSVMX",
                                     "E01PTSVAL",
                                     "E01PTSPTT",
                                     "E01RECPOS",
                                     "E01OPECDE"
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
                                   "E01PTSLGT",
                                   "E01PTSMOD",
                                   "E01PTSSEQ",
                                   "E01PTSDSC",
                                   "E01PTSPTS",
                                   "E01PTSVMN",
                                   "E01PTSVMX",
                                   "E01PTSVAL",
                                   "E01PTSPTT",
                                   "E01RECPOS",
                                   "E01OPECDE"
                                 };
  final static String fid = "1130611113115";
  final static String rid = "313E6C35045F2";
  final static String fmtname = "EDP084001";
  final int FIELDCOUNT = 21;
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
  private CharacterField fieldE01PTSLGT = null;
  private CharacterField fieldE01PTSMOD = null;
  private DecimalField fieldE01PTSSEQ = null;
  private CharacterField fieldE01PTSDSC = null;
  private DecimalField fieldE01PTSPTS = null;
  private DecimalField fieldE01PTSVMN = null;
  private DecimalField fieldE01PTSVMX = null;
  private CharacterField fieldE01PTSVAL = null;
  private DecimalField fieldE01PTSPTT = null;
  private DecimalField fieldE01RECPOS = null;
  private CharacterField fieldE01OPECDE = null;

  /**
  * Constructor for EDP084001Message.
  */
  public EDP084001Message()
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
    recordsize = 211;
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
    fields[10] = fieldE01PTSLGT =
    new CharacterField(message, HEADERSIZE + 43, 1, "E01PTSLGT");
    fields[11] = fieldE01PTSMOD =
    new CharacterField(message, HEADERSIZE + 44, 4, "E01PTSMOD");
    fields[12] = fieldE01PTSSEQ =
    new DecimalField(message, HEADERSIZE + 48, 8, 0, "E01PTSSEQ");
    fields[13] = fieldE01PTSDSC =
    new CharacterField(message, HEADERSIZE + 56, 60, "E01PTSDSC");
    fields[14] = fieldE01PTSPTS =
    new DecimalField(message, HEADERSIZE + 116, 8, 3, "E01PTSPTS");
    fields[15] = fieldE01PTSVMN =
    new DecimalField(message, HEADERSIZE + 124, 17, 2, "E01PTSVMN");
    fields[16] = fieldE01PTSVMX =
    new DecimalField(message, HEADERSIZE + 141, 17, 2, "E01PTSVMX");
    fields[17] = fieldE01PTSVAL =
    new CharacterField(message, HEADERSIZE + 158, 35, "E01PTSVAL");
    fields[18] = fieldE01PTSPTT =
    new DecimalField(message, HEADERSIZE + 193, 9, 2, "E01PTSPTT");
    fields[19] = fieldE01RECPOS =
    new DecimalField(message, HEADERSIZE + 202, 8, 0, "E01RECPOS");
    fields[20] = fieldE01OPECDE =
    new CharacterField(message, HEADERSIZE + 210, 1, "E01OPECDE");

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
  * Set field E01PTSLGT using a String value.
  */
  public void setE01PTSLGT(String newvalue)
  {
    fieldE01PTSLGT.setString(newvalue);
  }

  /**
  * Get value of field E01PTSLGT as a String.
  */
  public String getE01PTSLGT()
  {
    return fieldE01PTSLGT.getString();
  }

  /**
  * Set field E01PTSMOD using a String value.
  */
  public void setE01PTSMOD(String newvalue)
  {
    fieldE01PTSMOD.setString(newvalue);
  }

  /**
  * Get value of field E01PTSMOD as a String.
  */
  public String getE01PTSMOD()
  {
    return fieldE01PTSMOD.getString();
  }

  /**
  * Set field E01PTSSEQ using a String value.
  */
  public void setE01PTSSEQ(String newvalue)
  {
    fieldE01PTSSEQ.setString(newvalue);
  }

  /**
  * Get value of field E01PTSSEQ as a String.
  */
  public String getE01PTSSEQ()
  {
    return fieldE01PTSSEQ.getString();
  }

  /**
  * Set numeric field E01PTSSEQ using a BigDecimal value.
  */
  public void setE01PTSSEQ(BigDecimal newvalue)
  {
    fieldE01PTSSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PTSSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PTSSEQ()
  {
    return fieldE01PTSSEQ.getBigDecimal();
  }

  /**
  * Set field E01PTSDSC using a String value.
  */
  public void setE01PTSDSC(String newvalue)
  {
    fieldE01PTSDSC.setString(newvalue);
  }

  /**
  * Get value of field E01PTSDSC as a String.
  */
  public String getE01PTSDSC()
  {
    return fieldE01PTSDSC.getString();
  }

  /**
  * Set field E01PTSPTS using a String value.
  */
  public void setE01PTSPTS(String newvalue)
  {
    fieldE01PTSPTS.setString(newvalue);
  }

  /**
  * Get value of field E01PTSPTS as a String.
  */
  public String getE01PTSPTS()
  {
    return fieldE01PTSPTS.getString();
  }

  /**
  * Set numeric field E01PTSPTS using a BigDecimal value.
  */
  public void setE01PTSPTS(BigDecimal newvalue)
  {
    fieldE01PTSPTS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PTSPTS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PTSPTS()
  {
    return fieldE01PTSPTS.getBigDecimal();
  }

  /**
  * Set field E01PTSVMN using a String value.
  */
  public void setE01PTSVMN(String newvalue)
  {
    fieldE01PTSVMN.setString(newvalue);
  }

  /**
  * Get value of field E01PTSVMN as a String.
  */
  public String getE01PTSVMN()
  {
    return fieldE01PTSVMN.getString();
  }

  /**
  * Set numeric field E01PTSVMN using a BigDecimal value.
  */
  public void setE01PTSVMN(BigDecimal newvalue)
  {
    fieldE01PTSVMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PTSVMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PTSVMN()
  {
    return fieldE01PTSVMN.getBigDecimal();
  }

  /**
  * Set field E01PTSVMX using a String value.
  */
  public void setE01PTSVMX(String newvalue)
  {
    fieldE01PTSVMX.setString(newvalue);
  }

  /**
  * Get value of field E01PTSVMX as a String.
  */
  public String getE01PTSVMX()
  {
    return fieldE01PTSVMX.getString();
  }

  /**
  * Set numeric field E01PTSVMX using a BigDecimal value.
  */
  public void setE01PTSVMX(BigDecimal newvalue)
  {
    fieldE01PTSVMX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PTSVMX as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PTSVMX()
  {
    return fieldE01PTSVMX.getBigDecimal();
  }

  /**
  * Set field E01PTSVAL using a String value.
  */
  public void setE01PTSVAL(String newvalue)
  {
    fieldE01PTSVAL.setString(newvalue);
  }

  /**
  * Get value of field E01PTSVAL as a String.
  */
  public String getE01PTSVAL()
  {
    return fieldE01PTSVAL.getString();
  }

  /**
  * Set field E01PTSPTT using a String value.
  */
  public void setE01PTSPTT(String newvalue)
  {
    fieldE01PTSPTT.setString(newvalue);
  }

  /**
  * Get value of field E01PTSPTT as a String.
  */
  public String getE01PTSPTT()
  {
    return fieldE01PTSPTT.getString();
  }

  /**
  * Set numeric field E01PTSPTT using a BigDecimal value.
  */
  public void setE01PTSPTT(BigDecimal newvalue)
  {
    fieldE01PTSPTT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PTSPTT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PTSPTT()
  {
    return fieldE01PTSPTT.getBigDecimal();
  }

  /**
  * Set field E01RECPOS using a String value.
  */
  public void setE01RECPOS(String newvalue)
  {
    fieldE01RECPOS.setString(newvalue);
  }

  /**
  * Get value of field E01RECPOS as a String.
  */
  public String getE01RECPOS()
  {
    return fieldE01RECPOS.getString();
  }

  /**
  * Set numeric field E01RECPOS using a BigDecimal value.
  */
  public void setE01RECPOS(BigDecimal newvalue)
  {
    fieldE01RECPOS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RECPOS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RECPOS()
  {
    return fieldE01RECPOS.getBigDecimal();
  }

  /**
  * Set field E01OPECDE using a String value.
  */
  public void setE01OPECDE(String newvalue)
  {
    fieldE01OPECDE.setString(newvalue);
  }

  /**
  * Get value of field E01OPECDE as a String.
  */
  public String getE01OPECDE()
  {
    return fieldE01OPECDE.getString();
  }

}
