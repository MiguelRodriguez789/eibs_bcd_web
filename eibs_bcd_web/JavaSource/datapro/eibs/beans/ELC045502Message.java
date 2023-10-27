package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ELC045502 physical file definition.
* 
* File level identifier is 1130611113214.
* Record format level identifier is 48D623254C383.
*/

public class ELC045502Message extends MessageRecord
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
                                     "E02LCMACC",
                                     "E02LCDTYP",
                                     "E02LCDBNK",
                                     "E02LCDDNO",
                                     "E02LCDLNO",
                                     "E02LCDLIN",
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
                                   "E02LCMACC",
                                   "E02LCDTYP",
                                   "E02LCDBNK",
                                   "E02LCDDNO",
                                   "E02LCDLNO",
                                   "E02LCDLIN",
                                   "E02INDOPE"
                                 };
  final static String fid = "1130611113214";
  final static String rid = "48D623254C383";
  final static String fmtname = "ELC045502";
  final int FIELDCOUNT = 16;
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
  private DecimalField fieldE02LCMACC = null;
  private CharacterField fieldE02LCDTYP = null;
  private CharacterField fieldE02LCDBNK = null;
  private DecimalField fieldE02LCDDNO = null;
  private DecimalField fieldE02LCDLNO = null;
  private CharacterField fieldE02LCDLIN = null;
  private CharacterField fieldE02INDOPE = null;

  /**
  * Constructor for ELC045502Message.
  */
  public ELC045502Message()
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
    recordsize = 147;
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
    fields[9] = fieldE02LCMACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E02LCMACC");
    fields[10] = fieldE02LCDTYP =
    new CharacterField(message, HEADERSIZE + 55, 1, "E02LCDTYP");
    fields[11] = fieldE02LCDBNK =
    new CharacterField(message, HEADERSIZE + 56, 2, "E02LCDBNK");
    fields[12] = fieldE02LCDDNO =
    new DecimalField(message, HEADERSIZE + 58, 4, 0, "E02LCDDNO");
    fields[13] = fieldE02LCDLNO =
    new DecimalField(message, HEADERSIZE + 62, 4, 0, "E02LCDLNO");
    fields[14] = fieldE02LCDLIN =
    new CharacterField(message, HEADERSIZE + 66, 80, "E02LCDLIN");
    fields[15] = fieldE02INDOPE =
    new CharacterField(message, HEADERSIZE + 146, 1, "E02INDOPE");

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
  * Set field E02LCMACC using a String value.
  */
  public void setE02LCMACC(String newvalue)
  {
    fieldE02LCMACC.setString(newvalue);
  }

  /**
  * Get value of field E02LCMACC as a String.
  */
  public String getE02LCMACC()
  {
    return fieldE02LCMACC.getString();
  }

  /**
  * Set numeric field E02LCMACC using a BigDecimal value.
  */
  public void setE02LCMACC(BigDecimal newvalue)
  {
    fieldE02LCMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LCMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LCMACC()
  {
    return fieldE02LCMACC.getBigDecimal();
  }

  /**
  * Set field E02LCDTYP using a String value.
  */
  public void setE02LCDTYP(String newvalue)
  {
    fieldE02LCDTYP.setString(newvalue);
  }

  /**
  * Get value of field E02LCDTYP as a String.
  */
  public String getE02LCDTYP()
  {
    return fieldE02LCDTYP.getString();
  }

  /**
  * Set field E02LCDBNK using a String value.
  */
  public void setE02LCDBNK(String newvalue)
  {
    fieldE02LCDBNK.setString(newvalue);
  }

  /**
  * Get value of field E02LCDBNK as a String.
  */
  public String getE02LCDBNK()
  {
    return fieldE02LCDBNK.getString();
  }

  /**
  * Set field E02LCDDNO using a String value.
  */
  public void setE02LCDDNO(String newvalue)
  {
    fieldE02LCDDNO.setString(newvalue);
  }

  /**
  * Get value of field E02LCDDNO as a String.
  */
  public String getE02LCDDNO()
  {
    return fieldE02LCDDNO.getString();
  }

  /**
  * Set numeric field E02LCDDNO using a BigDecimal value.
  */
  public void setE02LCDDNO(BigDecimal newvalue)
  {
    fieldE02LCDDNO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LCDDNO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LCDDNO()
  {
    return fieldE02LCDDNO.getBigDecimal();
  }

  /**
  * Set field E02LCDLNO using a String value.
  */
  public void setE02LCDLNO(String newvalue)
  {
    fieldE02LCDLNO.setString(newvalue);
  }

  /**
  * Get value of field E02LCDLNO as a String.
  */
  public String getE02LCDLNO()
  {
    return fieldE02LCDLNO.getString();
  }

  /**
  * Set numeric field E02LCDLNO using a BigDecimal value.
  */
  public void setE02LCDLNO(BigDecimal newvalue)
  {
    fieldE02LCDLNO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LCDLNO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LCDLNO()
  {
    return fieldE02LCDLNO.getBigDecimal();
  }

  /**
  * Set field E02LCDLIN using a String value.
  */
  public void setE02LCDLIN(String newvalue)
  {
    fieldE02LCDLIN.setString(newvalue);
  }

  /**
  * Get value of field E02LCDLIN as a String.
  */
  public String getE02LCDLIN()
  {
    return fieldE02LCDLIN.getString();
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
