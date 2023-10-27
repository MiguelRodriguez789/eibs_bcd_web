package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EGL001201 physical file definition.
* 
* File level identifier is 1130611113201.
* Record format level identifier is 41385E5A41D4E.
*/

public class EGL001201Message extends MessageRecord
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
                                     "E01BTHNUM",
                                     "E01ORGBNK",
                                     "E01ORGBRN",
                                     "E01RUNDT1",
                                     "E01RUNDT2",
                                     "E01RUNDT3",
                                     "E01USROPE",
                                     "E01STATUS",
                                     "E01TOTDEB",
                                     "E01TOTCRE",
                                     "E01TOTTRN"
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
                                   "E01BTHNUM",
                                   "E01ORGBNK",
                                   "E01ORGBRN",
                                   "E01RUNDT1",
                                   "E01RUNDT2",
                                   "E01RUNDT3",
                                   "E01USROPE",
                                   "E01STATUS",
                                   "E01TOTDEB",
                                   "E01TOTCRE",
                                   "E01TOTTRN"
                                 };
  final static String fid = "1130611113201";
  final static String rid = "41385E5A41D4E";
  final static String fmtname = "EGL001201";
  final int FIELDCOUNT = 20;
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
  private DecimalField fieldE01BTHNUM = null;
  private CharacterField fieldE01ORGBNK = null;
  private DecimalField fieldE01ORGBRN = null;
  private DecimalField fieldE01RUNDT1 = null;
  private DecimalField fieldE01RUNDT2 = null;
  private DecimalField fieldE01RUNDT3 = null;
  private CharacterField fieldE01USROPE = null;
  private CharacterField fieldE01STATUS = null;
  private DecimalField fieldE01TOTDEB = null;
  private DecimalField fieldE01TOTCRE = null;
  private DecimalField fieldE01TOTTRN = null;

  /**
  * Constructor for EGL001201Message.
  */
  public EGL001201Message()
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
    recordsize = 163;
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
    fields[9] = fieldE01BTHNUM =
    new DecimalField(message, HEADERSIZE + 42, 6, 0, "E01BTHNUM");
    fields[10] = fieldE01ORGBNK =
    new CharacterField(message, HEADERSIZE + 48, 2, "E01ORGBNK");
    fields[11] = fieldE01ORGBRN =
    new DecimalField(message, HEADERSIZE + 50, 5, 0, "E01ORGBRN");
    fields[12] = fieldE01RUNDT1 =
    new DecimalField(message, HEADERSIZE + 55, 3, 0, "E01RUNDT1");
    fields[13] = fieldE01RUNDT2 =
    new DecimalField(message, HEADERSIZE + 58, 3, 0, "E01RUNDT2");
    fields[14] = fieldE01RUNDT3 =
    new DecimalField(message, HEADERSIZE + 61, 5, 0, "E01RUNDT3");
    fields[15] = fieldE01USROPE =
    new CharacterField(message, HEADERSIZE + 66, 10, "E01USROPE");
    fields[16] = fieldE01STATUS =
    new CharacterField(message, HEADERSIZE + 76, 45, "E01STATUS");
    fields[17] = fieldE01TOTDEB =
    new DecimalField(message, HEADERSIZE + 121, 17, 2, "E01TOTDEB");
    fields[18] = fieldE01TOTCRE =
    new DecimalField(message, HEADERSIZE + 138, 17, 2, "E01TOTCRE");
    fields[19] = fieldE01TOTTRN =
    new DecimalField(message, HEADERSIZE + 155, 8, 0, "E01TOTTRN");

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
  * Set field E01BTHNUM using a String value.
  */
  public void setE01BTHNUM(String newvalue)
  {
    fieldE01BTHNUM.setString(newvalue);
  }

  /**
  * Get value of field E01BTHNUM as a String.
  */
  public String getE01BTHNUM()
  {
    return fieldE01BTHNUM.getString();
  }

  /**
  * Set numeric field E01BTHNUM using a BigDecimal value.
  */
  public void setE01BTHNUM(BigDecimal newvalue)
  {
    fieldE01BTHNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BTHNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BTHNUM()
  {
    return fieldE01BTHNUM.getBigDecimal();
  }

  /**
  * Set field E01ORGBNK using a String value.
  */
  public void setE01ORGBNK(String newvalue)
  {
    fieldE01ORGBNK.setString(newvalue);
  }

  /**
  * Get value of field E01ORGBNK as a String.
  */
  public String getE01ORGBNK()
  {
    return fieldE01ORGBNK.getString();
  }

  /**
  * Set field E01ORGBRN using a String value.
  */
  public void setE01ORGBRN(String newvalue)
  {
    fieldE01ORGBRN.setString(newvalue);
  }

  /**
  * Get value of field E01ORGBRN as a String.
  */
  public String getE01ORGBRN()
  {
    return fieldE01ORGBRN.getString();
  }

  /**
  * Set numeric field E01ORGBRN using a BigDecimal value.
  */
  public void setE01ORGBRN(BigDecimal newvalue)
  {
    fieldE01ORGBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ORGBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ORGBRN()
  {
    return fieldE01ORGBRN.getBigDecimal();
  }

  /**
  * Set field E01RUNDT1 using a String value.
  */
  public void setE01RUNDT1(String newvalue)
  {
    fieldE01RUNDT1.setString(newvalue);
  }

  /**
  * Get value of field E01RUNDT1 as a String.
  */
  public String getE01RUNDT1()
  {
    return fieldE01RUNDT1.getString();
  }

  /**
  * Set numeric field E01RUNDT1 using a BigDecimal value.
  */
  public void setE01RUNDT1(BigDecimal newvalue)
  {
    fieldE01RUNDT1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RUNDT1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RUNDT1()
  {
    return fieldE01RUNDT1.getBigDecimal();
  }

  /**
  * Set field E01RUNDT2 using a String value.
  */
  public void setE01RUNDT2(String newvalue)
  {
    fieldE01RUNDT2.setString(newvalue);
  }

  /**
  * Get value of field E01RUNDT2 as a String.
  */
  public String getE01RUNDT2()
  {
    return fieldE01RUNDT2.getString();
  }

  /**
  * Set numeric field E01RUNDT2 using a BigDecimal value.
  */
  public void setE01RUNDT2(BigDecimal newvalue)
  {
    fieldE01RUNDT2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RUNDT2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RUNDT2()
  {
    return fieldE01RUNDT2.getBigDecimal();
  }

  /**
  * Set field E01RUNDT3 using a String value.
  */
  public void setE01RUNDT3(String newvalue)
  {
    fieldE01RUNDT3.setString(newvalue);
  }

  /**
  * Get value of field E01RUNDT3 as a String.
  */
  public String getE01RUNDT3()
  {
    return fieldE01RUNDT3.getString();
  }

  /**
  * Set numeric field E01RUNDT3 using a BigDecimal value.
  */
  public void setE01RUNDT3(BigDecimal newvalue)
  {
    fieldE01RUNDT3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RUNDT3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RUNDT3()
  {
    return fieldE01RUNDT3.getBigDecimal();
  }

  /**
  * Set field E01USROPE using a String value.
  */
  public void setE01USROPE(String newvalue)
  {
    fieldE01USROPE.setString(newvalue);
  }

  /**
  * Get value of field E01USROPE as a String.
  */
  public String getE01USROPE()
  {
    return fieldE01USROPE.getString();
  }

  /**
  * Set field E01STATUS using a String value.
  */
  public void setE01STATUS(String newvalue)
  {
    fieldE01STATUS.setString(newvalue);
  }

  /**
  * Get value of field E01STATUS as a String.
  */
  public String getE01STATUS()
  {
    return fieldE01STATUS.getString();
  }

  /**
  * Set field E01TOTDEB using a String value.
  */
  public void setE01TOTDEB(String newvalue)
  {
    fieldE01TOTDEB.setString(newvalue);
  }

  /**
  * Get value of field E01TOTDEB as a String.
  */
  public String getE01TOTDEB()
  {
    return fieldE01TOTDEB.getString();
  }

  /**
  * Set numeric field E01TOTDEB using a BigDecimal value.
  */
  public void setE01TOTDEB(BigDecimal newvalue)
  {
    fieldE01TOTDEB.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTDEB as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTDEB()
  {
    return fieldE01TOTDEB.getBigDecimal();
  }

  /**
  * Set field E01TOTCRE using a String value.
  */
  public void setE01TOTCRE(String newvalue)
  {
    fieldE01TOTCRE.setString(newvalue);
  }

  /**
  * Get value of field E01TOTCRE as a String.
  */
  public String getE01TOTCRE()
  {
    return fieldE01TOTCRE.getString();
  }

  /**
  * Set numeric field E01TOTCRE using a BigDecimal value.
  */
  public void setE01TOTCRE(BigDecimal newvalue)
  {
    fieldE01TOTCRE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTCRE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTCRE()
  {
    return fieldE01TOTCRE.getBigDecimal();
  }

  /**
  * Set field E01TOTTRN using a String value.
  */
  public void setE01TOTTRN(String newvalue)
  {
    fieldE01TOTTRN.setString(newvalue);
  }

  /**
  * Get value of field E01TOTTRN as a String.
  */
  public String getE01TOTTRN()
  {
    return fieldE01TOTTRN.getString();
  }

  /**
  * Set numeric field E01TOTTRN using a BigDecimal value.
  */
  public void setE01TOTTRN(BigDecimal newvalue)
  {
    fieldE01TOTTRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTTRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTTRN()
  {
    return fieldE01TOTTRN.getBigDecimal();
  }

}