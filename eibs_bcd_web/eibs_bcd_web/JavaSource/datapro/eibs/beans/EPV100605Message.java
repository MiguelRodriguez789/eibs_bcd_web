package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV100605 physical file definition.
* 
* File level identifier is 1130611113305.
* Record format level identifier is 449EB27408C38.
*/

public class EPV100605Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H05USERID",
                                     "H05PROGRM",
                                     "H05TIMSYS",
                                     "H05SCRCOD",
                                     "H05OPECOD",
                                     "H05FLGMAS",
                                     "H05FLGWK1",
                                     "H05FLGWK2",
                                     "H05FLGWK3",
                                     "E05PVMCUN",
                                     "E05PVDNUM",
                                     "E05PVDACC",
                                     "E05PVMRBR",
                                     "E05PVMICU",
                                     "E05PVMRED",
                                     "E05PVMOPM",
                                     "E05PVMOPD",
                                     "E05PVMOPY"
                                   };
  final static String tnames[] = {
                                   "H05USERID",
                                   "H05PROGRM",
                                   "H05TIMSYS",
                                   "H05SCRCOD",
                                   "H05OPECOD",
                                   "H05FLGMAS",
                                   "H05FLGWK1",
                                   "H05FLGWK2",
                                   "H05FLGWK3",
                                   "E05PVMCUN",
                                   "E05PVDNUM",
                                   "E05PVDACC",
                                   "E05PVMRBR",
                                   "E05PVMICU",
                                   "E05PVMRED",
                                   "E05PVMOPM",
                                   "E05PVMOPD",
                                   "E05PVMOPY"
                                 };
  final static String fid = "1130611113305";
  final static String rid = "449EB27408C38";
  final static String fmtname = "EPV100605";
  final int FIELDCOUNT = 18;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH05USERID = null;
  private CharacterField fieldH05PROGRM = null;
  private CharacterField fieldH05TIMSYS = null;
  private CharacterField fieldH05SCRCOD = null;
  private CharacterField fieldH05OPECOD = null;
  private CharacterField fieldH05FLGMAS = null;
  private CharacterField fieldH05FLGWK1 = null;
  private CharacterField fieldH05FLGWK2 = null;
  private CharacterField fieldH05FLGWK3 = null;
  private DecimalField fieldE05PVMCUN = null;
  private DecimalField fieldE05PVDNUM = null;
  private DecimalField fieldE05PVDACC = null;
  private DecimalField fieldE05PVMRBR = null;
  private DecimalField fieldE05PVMICU = null;
  private DecimalField fieldE05PVMRED = null;
  private DecimalField fieldE05PVMOPM = null;
  private DecimalField fieldE05PVMOPD = null;
  private DecimalField fieldE05PVMOPY = null;

  /**
  * Constructor for EPV100605Message.
  */
  public EPV100605Message()
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
    recordsize = 140;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH05USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H05USERID");
    fields[1] = fieldH05PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H05PROGRM");
    fields[2] = fieldH05TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H05TIMSYS");
    fields[3] = fieldH05SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H05SCRCOD");
    fields[4] = fieldH05OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H05OPECOD");
    fields[5] = fieldH05FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H05FLGMAS");
    fields[6] = fieldH05FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H05FLGWK1");
    fields[7] = fieldH05FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H05FLGWK2");
    fields[8] = fieldH05FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H05FLGWK3");
    fields[9] = fieldE05PVMCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E05PVMCUN");
    fields[10] = fieldE05PVDNUM =
    new DecimalField(message, HEADERSIZE + 52, 13, 0, "E05PVDNUM");
    fields[11] = fieldE05PVDACC =
    new DecimalField(message, HEADERSIZE + 65, 13, 0, "E05PVDACC");
    fields[12] = fieldE05PVMRBR =
    new DecimalField(message, HEADERSIZE + 78, 17, 2, "E05PVMRBR");
    fields[13] = fieldE05PVMICU =
    new DecimalField(message, HEADERSIZE + 95, 17, 2, "E05PVMICU");
    fields[14] = fieldE05PVMRED =
    new DecimalField(message, HEADERSIZE + 112, 17, 2, "E05PVMRED");
    fields[15] = fieldE05PVMOPM =
    new DecimalField(message, HEADERSIZE + 129, 3, 0, "E05PVMOPM");
    fields[16] = fieldE05PVMOPD =
    new DecimalField(message, HEADERSIZE + 132, 3, 0, "E05PVMOPD");
    fields[17] = fieldE05PVMOPY =
    new DecimalField(message, HEADERSIZE + 135, 5, 0, "E05PVMOPY");

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
  * Set field H05USERID using a String value.
  */
  public void setH05USERID(String newvalue)
  {
    fieldH05USERID.setString(newvalue);
  }

  /**
  * Get value of field H05USERID as a String.
  */
  public String getH05USERID()
  {
    return fieldH05USERID.getString();
  }

  /**
  * Set field H05PROGRM using a String value.
  */
  public void setH05PROGRM(String newvalue)
  {
    fieldH05PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H05PROGRM as a String.
  */
  public String getH05PROGRM()
  {
    return fieldH05PROGRM.getString();
  }

  /**
  * Set field H05TIMSYS using a String value.
  */
  public void setH05TIMSYS(String newvalue)
  {
    fieldH05TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H05TIMSYS as a String.
  */
  public String getH05TIMSYS()
  {
    return fieldH05TIMSYS.getString();
  }

  /**
  * Set field H05SCRCOD using a String value.
  */
  public void setH05SCRCOD(String newvalue)
  {
    fieldH05SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H05SCRCOD as a String.
  */
  public String getH05SCRCOD()
  {
    return fieldH05SCRCOD.getString();
  }

  /**
  * Set field H05OPECOD using a String value.
  */
  public void setH05OPECOD(String newvalue)
  {
    fieldH05OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H05OPECOD as a String.
  */
  public String getH05OPECOD()
  {
    return fieldH05OPECOD.getString();
  }

  /**
  * Set field H05FLGMAS using a String value.
  */
  public void setH05FLGMAS(String newvalue)
  {
    fieldH05FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H05FLGMAS as a String.
  */
  public String getH05FLGMAS()
  {
    return fieldH05FLGMAS.getString();
  }

  /**
  * Set field H05FLGWK1 using a String value.
  */
  public void setH05FLGWK1(String newvalue)
  {
    fieldH05FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H05FLGWK1 as a String.
  */
  public String getH05FLGWK1()
  {
    return fieldH05FLGWK1.getString();
  }

  /**
  * Set field H05FLGWK2 using a String value.
  */
  public void setH05FLGWK2(String newvalue)
  {
    fieldH05FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H05FLGWK2 as a String.
  */
  public String getH05FLGWK2()
  {
    return fieldH05FLGWK2.getString();
  }

  /**
  * Set field H05FLGWK3 using a String value.
  */
  public void setH05FLGWK3(String newvalue)
  {
    fieldH05FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H05FLGWK3 as a String.
  */
  public String getH05FLGWK3()
  {
    return fieldH05FLGWK3.getString();
  }

  /**
  * Set field E05PVMCUN using a String value.
  */
  public void setE05PVMCUN(String newvalue)
  {
    fieldE05PVMCUN.setString(newvalue);
  }

  /**
  * Get value of field E05PVMCUN as a String.
  */
  public String getE05PVMCUN()
  {
    return fieldE05PVMCUN.getString();
  }

  /**
  * Set numeric field E05PVMCUN using a BigDecimal value.
  */
  public void setE05PVMCUN(BigDecimal newvalue)
  {
    fieldE05PVMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E05PVMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE05PVMCUN()
  {
    return fieldE05PVMCUN.getBigDecimal();
  }

  /**
  * Set field E05PVDNUM using a String value.
  */
  public void setE05PVDNUM(String newvalue)
  {
    fieldE05PVDNUM.setString(newvalue);
  }

  /**
  * Get value of field E05PVDNUM as a String.
  */
  public String getE05PVDNUM()
  {
    return fieldE05PVDNUM.getString();
  }

  /**
  * Set numeric field E05PVDNUM using a BigDecimal value.
  */
  public void setE05PVDNUM(BigDecimal newvalue)
  {
    fieldE05PVDNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E05PVDNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE05PVDNUM()
  {
    return fieldE05PVDNUM.getBigDecimal();
  }

  /**
  * Set field E05PVDACC using a String value.
  */
  public void setE05PVDACC(String newvalue)
  {
    fieldE05PVDACC.setString(newvalue);
  }

  /**
  * Get value of field E05PVDACC as a String.
  */
  public String getE05PVDACC()
  {
    return fieldE05PVDACC.getString();
  }

  /**
  * Set numeric field E05PVDACC using a BigDecimal value.
  */
  public void setE05PVDACC(BigDecimal newvalue)
  {
    fieldE05PVDACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E05PVDACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE05PVDACC()
  {
    return fieldE05PVDACC.getBigDecimal();
  }

  /**
  * Set field E05PVMRBR using a String value.
  */
  public void setE05PVMRBR(String newvalue)
  {
    fieldE05PVMRBR.setString(newvalue);
  }

  /**
  * Get value of field E05PVMRBR as a String.
  */
  public String getE05PVMRBR()
  {
    return fieldE05PVMRBR.getString();
  }

  /**
  * Set numeric field E05PVMRBR using a BigDecimal value.
  */
  public void setE05PVMRBR(BigDecimal newvalue)
  {
    fieldE05PVMRBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E05PVMRBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE05PVMRBR()
  {
    return fieldE05PVMRBR.getBigDecimal();
  }

  /**
  * Set field E05PVMICU using a String value.
  */
  public void setE05PVMICU(String newvalue)
  {
    fieldE05PVMICU.setString(newvalue);
  }

  /**
  * Get value of field E05PVMICU as a String.
  */
  public String getE05PVMICU()
  {
    return fieldE05PVMICU.getString();
  }

  /**
  * Set numeric field E05PVMICU using a BigDecimal value.
  */
  public void setE05PVMICU(BigDecimal newvalue)
  {
    fieldE05PVMICU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E05PVMICU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE05PVMICU()
  {
    return fieldE05PVMICU.getBigDecimal();
  }

  /**
  * Set field E05PVMRED using a String value.
  */
  public void setE05PVMRED(String newvalue)
  {
    fieldE05PVMRED.setString(newvalue);
  }

  /**
  * Get value of field E05PVMRED as a String.
  */
  public String getE05PVMRED()
  {
    return fieldE05PVMRED.getString();
  }

  /**
  * Set numeric field E05PVMRED using a BigDecimal value.
  */
  public void setE05PVMRED(BigDecimal newvalue)
  {
    fieldE05PVMRED.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E05PVMRED as a BigDecimal.
  */
  public BigDecimal getBigDecimalE05PVMRED()
  {
    return fieldE05PVMRED.getBigDecimal();
  }

  /**
  * Set field E05PVMOPM using a String value.
  */
  public void setE05PVMOPM(String newvalue)
  {
    fieldE05PVMOPM.setString(newvalue);
  }

  /**
  * Get value of field E05PVMOPM as a String.
  */
  public String getE05PVMOPM()
  {
    return fieldE05PVMOPM.getString();
  }

  /**
  * Set numeric field E05PVMOPM using a BigDecimal value.
  */
  public void setE05PVMOPM(BigDecimal newvalue)
  {
    fieldE05PVMOPM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E05PVMOPM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE05PVMOPM()
  {
    return fieldE05PVMOPM.getBigDecimal();
  }

  /**
  * Set field E05PVMOPD using a String value.
  */
  public void setE05PVMOPD(String newvalue)
  {
    fieldE05PVMOPD.setString(newvalue);
  }

  /**
  * Get value of field E05PVMOPD as a String.
  */
  public String getE05PVMOPD()
  {
    return fieldE05PVMOPD.getString();
  }

  /**
  * Set numeric field E05PVMOPD using a BigDecimal value.
  */
  public void setE05PVMOPD(BigDecimal newvalue)
  {
    fieldE05PVMOPD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E05PVMOPD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE05PVMOPD()
  {
    return fieldE05PVMOPD.getBigDecimal();
  }

  /**
  * Set field E05PVMOPY using a String value.
  */
  public void setE05PVMOPY(String newvalue)
  {
    fieldE05PVMOPY.setString(newvalue);
  }

  /**
  * Get value of field E05PVMOPY as a String.
  */
  public String getE05PVMOPY()
  {
    return fieldE05PVMOPY.getString();
  }

  /**
  * Set numeric field E05PVMOPY using a BigDecimal value.
  */
  public void setE05PVMOPY(BigDecimal newvalue)
  {
    fieldE05PVMOPY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E05PVMOPY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE05PVMOPY()
  {
    return fieldE05PVMOPY.getBigDecimal();
  }

}