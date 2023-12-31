package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EGL075502 physical file definition.
* 
* File level identifier is 1130611113204.
* Record format level identifier is 38C3181C2304B.
*/

public class EGL075502Message extends MessageRecord
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
                                     "E02SELBNK",
                                     "E02SELCCY",
                                     "E02SELGLN",
                                     "E02GLBBNK",
                                     "E02GLBCCY",
                                     "E02GLBGLN",
                                     "E02GLMDSC",
                                     "E02GLMCLS",
                                     "E02GLBBAL",
                                     "E02HISMON",
                                     "E02GLBNIV",
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
                                   "E02SELBNK",
                                   "E02SELCCY",
                                   "E02SELGLN",
                                   "E02GLBBNK",
                                   "E02GLBCCY",
                                   "E02GLBGLN",
                                   "E02GLMDSC",
                                   "E02GLMCLS",
                                   "E02GLBBAL",
                                   "E02HISMON",
                                   "E02GLBNIV",
                                   "E02NUMREC",
                                   "E02INDOPE"
                                 };
  final static String fid = "1130611113204";
  final static String rid = "38C3181C2304B";
  final static String fmtname = "EGL075502";
  final int FIELDCOUNT = 22;
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
  private CharacterField fieldE02SELBNK = null;
  private CharacterField fieldE02SELCCY = null;
  private DecimalField fieldE02SELGLN = null;
  private CharacterField fieldE02GLBBNK = null;
  private CharacterField fieldE02GLBCCY = null;
  private DecimalField fieldE02GLBGLN = null;
  private CharacterField fieldE02GLMDSC = null;
  private DecimalField fieldE02GLMCLS = null;
  private DecimalField fieldE02GLBBAL = null;
  private CharacterField fieldE02HISMON = null;
  private CharacterField fieldE02GLBNIV = null;
  private DecimalField fieldE02NUMREC = null;
  private CharacterField fieldE02INDOPE = null;

  /**
  * Constructor for EGL075502Message.
  */
  public EGL075502Message()
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
    recordsize = 177;
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
    fields[9] = fieldE02SELBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E02SELBNK");
    fields[10] = fieldE02SELCCY =
    new CharacterField(message, HEADERSIZE + 44, 3, "E02SELCCY");
    fields[11] = fieldE02SELGLN =
    new DecimalField(message, HEADERSIZE + 47, 17, 0, "E02SELGLN");
    fields[12] = fieldE02GLBBNK =
    new CharacterField(message, HEADERSIZE + 64, 2, "E02GLBBNK");
    fields[13] = fieldE02GLBCCY =
    new CharacterField(message, HEADERSIZE + 66, 3, "E02GLBCCY");
    fields[14] = fieldE02GLBGLN =
    new DecimalField(message, HEADERSIZE + 69, 17, 0, "E02GLBGLN");
    fields[15] = fieldE02GLMDSC =
    new CharacterField(message, HEADERSIZE + 86, 60, "E02GLMDSC");
    fields[16] = fieldE02GLMCLS =
    new DecimalField(message, HEADERSIZE + 146, 3, 0, "E02GLMCLS");
    fields[17] = fieldE02GLBBAL =
    new DecimalField(message, HEADERSIZE + 149, 17, 2, "E02GLBBAL");
    fields[18] = fieldE02HISMON =
    new CharacterField(message, HEADERSIZE + 166, 1, "E02HISMON");
    fields[19] = fieldE02GLBNIV =
    new CharacterField(message, HEADERSIZE + 167, 1, "E02GLBNIV");
    fields[20] = fieldE02NUMREC =
    new DecimalField(message, HEADERSIZE + 168, 8, 0, "E02NUMREC");
    fields[21] = fieldE02INDOPE =
    new CharacterField(message, HEADERSIZE + 176, 1, "E02INDOPE");

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
  * Set field E02SELBNK using a String value.
  */
  public void setE02SELBNK(String newvalue)
  {
    fieldE02SELBNK.setString(newvalue);
  }

  /**
  * Get value of field E02SELBNK as a String.
  */
  public String getE02SELBNK()
  {
    return fieldE02SELBNK.getString();
  }

  /**
  * Set field E02SELCCY using a String value.
  */
  public void setE02SELCCY(String newvalue)
  {
    fieldE02SELCCY.setString(newvalue);
  }

  /**
  * Get value of field E02SELCCY as a String.
  */
  public String getE02SELCCY()
  {
    return fieldE02SELCCY.getString();
  }

  /**
  * Set field E02SELGLN using a String value.
  */
  public void setE02SELGLN(String newvalue)
  {
    fieldE02SELGLN.setString(newvalue);
  }

  /**
  * Get value of field E02SELGLN as a String.
  */
  public String getE02SELGLN()
  {
    return fieldE02SELGLN.getString();
  }

  /**
  * Set numeric field E02SELGLN using a BigDecimal value.
  */
  public void setE02SELGLN(BigDecimal newvalue)
  {
    fieldE02SELGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02SELGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02SELGLN()
  {
    return fieldE02SELGLN.getBigDecimal();
  }

  /**
  * Set field E02GLBBNK using a String value.
  */
  public void setE02GLBBNK(String newvalue)
  {
    fieldE02GLBBNK.setString(newvalue);
  }

  /**
  * Get value of field E02GLBBNK as a String.
  */
  public String getE02GLBBNK()
  {
    return fieldE02GLBBNK.getString();
  }

  /**
  * Set field E02GLBCCY using a String value.
  */
  public void setE02GLBCCY(String newvalue)
  {
    fieldE02GLBCCY.setString(newvalue);
  }

  /**
  * Get value of field E02GLBCCY as a String.
  */
  public String getE02GLBCCY()
  {
    return fieldE02GLBCCY.getString();
  }

  /**
  * Set field E02GLBGLN using a String value.
  */
  public void setE02GLBGLN(String newvalue)
  {
    fieldE02GLBGLN.setString(newvalue);
  }

  /**
  * Get value of field E02GLBGLN as a String.
  */
  public String getE02GLBGLN()
  {
    return fieldE02GLBGLN.getString();
  }

  /**
  * Set numeric field E02GLBGLN using a BigDecimal value.
  */
  public void setE02GLBGLN(BigDecimal newvalue)
  {
    fieldE02GLBGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLBGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLBGLN()
  {
    return fieldE02GLBGLN.getBigDecimal();
  }

  /**
  * Set field E02GLMDSC using a String value.
  */
  public void setE02GLMDSC(String newvalue)
  {
    fieldE02GLMDSC.setString(newvalue);
  }

  /**
  * Get value of field E02GLMDSC as a String.
  */
  public String getE02GLMDSC()
  {
    return fieldE02GLMDSC.getString();
  }

  /**
  * Set field E02GLMCLS using a String value.
  */
  public void setE02GLMCLS(String newvalue)
  {
    fieldE02GLMCLS.setString(newvalue);
  }

  /**
  * Get value of field E02GLMCLS as a String.
  */
  public String getE02GLMCLS()
  {
    return fieldE02GLMCLS.getString();
  }

  /**
  * Set numeric field E02GLMCLS using a BigDecimal value.
  */
  public void setE02GLMCLS(BigDecimal newvalue)
  {
    fieldE02GLMCLS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLMCLS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLMCLS()
  {
    return fieldE02GLMCLS.getBigDecimal();
  }

  /**
  * Set field E02GLBBAL using a String value.
  */
  public void setE02GLBBAL(String newvalue)
  {
    fieldE02GLBBAL.setString(newvalue);
  }

  /**
  * Get value of field E02GLBBAL as a String.
  */
  public String getE02GLBBAL()
  {
    return fieldE02GLBBAL.getString();
  }

  /**
  * Set numeric field E02GLBBAL using a BigDecimal value.
  */
  public void setE02GLBBAL(BigDecimal newvalue)
  {
    fieldE02GLBBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLBBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLBBAL()
  {
    return fieldE02GLBBAL.getBigDecimal();
  }

  /**
  * Set field E02HISMON using a String value.
  */
  public void setE02HISMON(String newvalue)
  {
    fieldE02HISMON.setString(newvalue);
  }

  /**
  * Get value of field E02HISMON as a String.
  */
  public String getE02HISMON()
  {
    return fieldE02HISMON.getString();
  }

  /**
  * Set field E02GLBNIV using a String value.
  */
  public void setE02GLBNIV(String newvalue)
  {
    fieldE02GLBNIV.setString(newvalue);
  }

  /**
  * Get value of field E02GLBNIV as a String.
  */
  public String getE02GLBNIV()
  {
    return fieldE02GLBNIV.getString();
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
