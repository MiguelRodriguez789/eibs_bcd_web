package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECSM00302 physical file definition.
* 
* File level identifier is 1181010090905.
* Record format level identifier is 3407E6C366474.
*/

public class ECSM00302Message extends MessageRecord
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
                                     "E02CSMBNK",
                                     "E02CSMCCY",
                                     "E02CSMGLN",
                                     "E02CSMNOM",
                                     "E02CSMAHO",
                                     "E02CSMPRB",
                                     "E02CSMPRO",
                                     "E02CSMCMM",
                                     "E02CSMCDD",
                                     "E02CSMCYY",
                                     "E02CSMCMU",
                                     "E02CSMLMM",
                                     "E02CSMLDD",
                                     "E02CSMLYY",
                                     "E02CSMLMU",
                                     "E02NUMREC",
                                     "E02INDOPE"
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
                                   "E02CSMBNK",
                                   "E02CSMCCY",
                                   "E02CSMGLN",
                                   "E02CSMNOM",
                                   "E02CSMAHO",
                                   "E02CSMPRB",
                                   "E02CSMPRO",
                                   "E02CSMCMM",
                                   "E02CSMCDD",
                                   "E02CSMCYY",
                                   "E02CSMCMU",
                                   "E02CSMLMM",
                                   "E02CSMLDD",
                                   "E02CSMLYY",
                                   "E02CSMLMU",
                                   "E02NUMREC",
                                   "E02INDOPE"
                                 };
  final static String fid = "1181010090905";
  final static String rid = "3407E6C366474";
  final static String fmtname = "ECSM00302";
  final int FIELDCOUNT = 26;
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
  private CharacterField fieldE02CSMBNK = null;
  private CharacterField fieldE02CSMCCY = null;
  private DecimalField fieldE02CSMGLN = null;
  private CharacterField fieldE02CSMNOM = null;
  private CharacterField fieldE02CSMAHO = null;
  private CharacterField fieldE02CSMPRB = null;
  private CharacterField fieldE02CSMPRO = null;
  private DecimalField fieldE02CSMCMM = null;
  private DecimalField fieldE02CSMCDD = null;
  private DecimalField fieldE02CSMCYY = null;
  private CharacterField fieldE02CSMCMU = null;
  private DecimalField fieldE02CSMLMM = null;
  private DecimalField fieldE02CSMLDD = null;
  private DecimalField fieldE02CSMLYY = null;
  private CharacterField fieldE02CSMLMU = null;
  private DecimalField fieldE02NUMREC = null;
  private CharacterField fieldE02INDOPE = null;

  /**
  * Constructor for ECSM00302Message.
  */
  public ECSM00302Message()
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
    recordsize = 131;
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
    fields[9] = fieldE02CSMBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E02CSMBNK");
    fields[10] = fieldE02CSMCCY =
    new CharacterField(message, HEADERSIZE + 44, 3, "E02CSMCCY");
    fields[11] = fieldE02CSMGLN =
    new DecimalField(message, HEADERSIZE + 47, 17, 0, "E02CSMGLN");
    fields[12] = fieldE02CSMNOM =
    new CharacterField(message, HEADERSIZE + 64, 4, "E02CSMNOM");
    fields[13] = fieldE02CSMAHO =
    new CharacterField(message, HEADERSIZE + 68, 4, "E02CSMAHO");
    fields[14] = fieldE02CSMPRB =
    new CharacterField(message, HEADERSIZE + 72, 4, "E02CSMPRB");
    fields[15] = fieldE02CSMPRO =
    new CharacterField(message, HEADERSIZE + 76, 4, "E02CSMPRO");
    fields[16] = fieldE02CSMCMM =
    new DecimalField(message, HEADERSIZE + 80, 3, 0, "E02CSMCMM");
    fields[17] = fieldE02CSMCDD =
    new DecimalField(message, HEADERSIZE + 83, 3, 0, "E02CSMCDD");
    fields[18] = fieldE02CSMCYY =
    new DecimalField(message, HEADERSIZE + 86, 5, 0, "E02CSMCYY");
    fields[19] = fieldE02CSMCMU =
    new CharacterField(message, HEADERSIZE + 91, 10, "E02CSMCMU");
    fields[20] = fieldE02CSMLMM =
    new DecimalField(message, HEADERSIZE + 101, 3, 0, "E02CSMLMM");
    fields[21] = fieldE02CSMLDD =
    new DecimalField(message, HEADERSIZE + 104, 3, 0, "E02CSMLDD");
    fields[22] = fieldE02CSMLYY =
    new DecimalField(message, HEADERSIZE + 107, 5, 0, "E02CSMLYY");
    fields[23] = fieldE02CSMLMU =
    new CharacterField(message, HEADERSIZE + 112, 10, "E02CSMLMU");
    fields[24] = fieldE02NUMREC =
    new DecimalField(message, HEADERSIZE + 122, 8, 0, "E02NUMREC");
    fields[25] = fieldE02INDOPE =
    new CharacterField(message, HEADERSIZE + 130, 1, "E02INDOPE");

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
  * Set field E02CSMBNK using a String value.
  */
  public void setE02CSMBNK(String newvalue)
  {
    fieldE02CSMBNK.setString(newvalue);
  }

  /**
  * Get value of field E02CSMBNK as a String.
  */
  public String getE02CSMBNK()
  {
    return fieldE02CSMBNK.getString();
  }

  /**
  * Set field E02CSMCCY using a String value.
  */
  public void setE02CSMCCY(String newvalue)
  {
    fieldE02CSMCCY.setString(newvalue);
  }

  /**
  * Get value of field E02CSMCCY as a String.
  */
  public String getE02CSMCCY()
  {
    return fieldE02CSMCCY.getString();
  }

  /**
  * Set field E02CSMGLN using a String value.
  */
  public void setE02CSMGLN(String newvalue)
  {
    fieldE02CSMGLN.setString(newvalue);
  }

  /**
  * Get value of field E02CSMGLN as a String.
  */
  public String getE02CSMGLN()
  {
    return fieldE02CSMGLN.getString();
  }

  /**
  * Set numeric field E02CSMGLN using a BigDecimal value.
  */
  public void setE02CSMGLN(BigDecimal newvalue)
  {
    fieldE02CSMGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CSMGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CSMGLN()
  {
    return fieldE02CSMGLN.getBigDecimal();
  }

  /**
  * Set field E02CSMNOM using a String value.
  */
  public void setE02CSMNOM(String newvalue)
  {
    fieldE02CSMNOM.setString(newvalue);
  }

  /**
  * Get value of field E02CSMNOM as a String.
  */
  public String getE02CSMNOM()
  {
    return fieldE02CSMNOM.getString();
  }

  /**
  * Set field E02CSMAHO using a String value.
  */
  public void setE02CSMAHO(String newvalue)
  {
    fieldE02CSMAHO.setString(newvalue);
  }

  /**
  * Get value of field E02CSMAHO as a String.
  */
  public String getE02CSMAHO()
  {
    return fieldE02CSMAHO.getString();
  }

  /**
  * Set field E02CSMPRB using a String value.
  */
  public void setE02CSMPRB(String newvalue)
  {
    fieldE02CSMPRB.setString(newvalue);
  }

  /**
  * Get value of field E02CSMPRB as a String.
  */
  public String getE02CSMPRB()
  {
    return fieldE02CSMPRB.getString();
  }

  /**
  * Set field E02CSMPRO using a String value.
  */
  public void setE02CSMPRO(String newvalue)
  {
    fieldE02CSMPRO.setString(newvalue);
  }

  /**
  * Get value of field E02CSMPRO as a String.
  */
  public String getE02CSMPRO()
  {
    return fieldE02CSMPRO.getString();
  }

  /**
  * Set field E02CSMCMM using a String value.
  */
  public void setE02CSMCMM(String newvalue)
  {
    fieldE02CSMCMM.setString(newvalue);
  }

  /**
  * Get value of field E02CSMCMM as a String.
  */
  public String getE02CSMCMM()
  {
    return fieldE02CSMCMM.getString();
  }

  /**
  * Set numeric field E02CSMCMM using a BigDecimal value.
  */
  public void setE02CSMCMM(BigDecimal newvalue)
  {
    fieldE02CSMCMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CSMCMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CSMCMM()
  {
    return fieldE02CSMCMM.getBigDecimal();
  }

  /**
  * Set field E02CSMCDD using a String value.
  */
  public void setE02CSMCDD(String newvalue)
  {
    fieldE02CSMCDD.setString(newvalue);
  }

  /**
  * Get value of field E02CSMCDD as a String.
  */
  public String getE02CSMCDD()
  {
    return fieldE02CSMCDD.getString();
  }

  /**
  * Set numeric field E02CSMCDD using a BigDecimal value.
  */
  public void setE02CSMCDD(BigDecimal newvalue)
  {
    fieldE02CSMCDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CSMCDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CSMCDD()
  {
    return fieldE02CSMCDD.getBigDecimal();
  }

  /**
  * Set field E02CSMCYY using a String value.
  */
  public void setE02CSMCYY(String newvalue)
  {
    fieldE02CSMCYY.setString(newvalue);
  }

  /**
  * Get value of field E02CSMCYY as a String.
  */
  public String getE02CSMCYY()
  {
    return fieldE02CSMCYY.getString();
  }

  /**
  * Set numeric field E02CSMCYY using a BigDecimal value.
  */
  public void setE02CSMCYY(BigDecimal newvalue)
  {
    fieldE02CSMCYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CSMCYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CSMCYY()
  {
    return fieldE02CSMCYY.getBigDecimal();
  }

  /**
  * Set field E02CSMCMU using a String value.
  */
  public void setE02CSMCMU(String newvalue)
  {
    fieldE02CSMCMU.setString(newvalue);
  }

  /**
  * Get value of field E02CSMCMU as a String.
  */
  public String getE02CSMCMU()
  {
    return fieldE02CSMCMU.getString();
  }

  /**
  * Set field E02CSMLMM using a String value.
  */
  public void setE02CSMLMM(String newvalue)
  {
    fieldE02CSMLMM.setString(newvalue);
  }

  /**
  * Get value of field E02CSMLMM as a String.
  */
  public String getE02CSMLMM()
  {
    return fieldE02CSMLMM.getString();
  }

  /**
  * Set numeric field E02CSMLMM using a BigDecimal value.
  */
  public void setE02CSMLMM(BigDecimal newvalue)
  {
    fieldE02CSMLMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CSMLMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CSMLMM()
  {
    return fieldE02CSMLMM.getBigDecimal();
  }

  /**
  * Set field E02CSMLDD using a String value.
  */
  public void setE02CSMLDD(String newvalue)
  {
    fieldE02CSMLDD.setString(newvalue);
  }

  /**
  * Get value of field E02CSMLDD as a String.
  */
  public String getE02CSMLDD()
  {
    return fieldE02CSMLDD.getString();
  }

  /**
  * Set numeric field E02CSMLDD using a BigDecimal value.
  */
  public void setE02CSMLDD(BigDecimal newvalue)
  {
    fieldE02CSMLDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CSMLDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CSMLDD()
  {
    return fieldE02CSMLDD.getBigDecimal();
  }

  /**
  * Set field E02CSMLYY using a String value.
  */
  public void setE02CSMLYY(String newvalue)
  {
    fieldE02CSMLYY.setString(newvalue);
  }

  /**
  * Get value of field E02CSMLYY as a String.
  */
  public String getE02CSMLYY()
  {
    return fieldE02CSMLYY.getString();
  }

  /**
  * Set numeric field E02CSMLYY using a BigDecimal value.
  */
  public void setE02CSMLYY(BigDecimal newvalue)
  {
    fieldE02CSMLYY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CSMLYY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CSMLYY()
  {
    return fieldE02CSMLYY.getBigDecimal();
  }

  /**
  * Set field E02CSMLMU using a String value.
  */
  public void setE02CSMLMU(String newvalue)
  {
    fieldE02CSMLMU.setString(newvalue);
  }

  /**
  * Get value of field E02CSMLMU as a String.
  */
  public String getE02CSMLMU()
  {
    return fieldE02CSMLMU.getString();
  }

  /**
  * Set field E02NUMREC using a String value.
  */
  public void setE02NUMREC(String newvalue)
  {
    fieldE02NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E02NUMREC as a String.
  */
  public String getE02NUMREC()
  {
    return fieldE02NUMREC.getString();
  }

  /**
  * Set numeric field E02NUMREC using a BigDecimal value.
  */
  public void setE02NUMREC(BigDecimal newvalue)
  {
    fieldE02NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02NUMREC()
  {
    return fieldE02NUMREC.getBigDecimal();
  }

  /**
  * Set field E02INDOPE using a String value.
  */
  public void setE02INDOPE(String newvalue)
  {
    fieldE02INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E02INDOPE as a String.
  */
  public String getE02INDOPE()
  {
    return fieldE02INDOPE.getString();
  }

}
