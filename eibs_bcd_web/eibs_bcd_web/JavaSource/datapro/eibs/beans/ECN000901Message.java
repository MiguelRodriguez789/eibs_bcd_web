package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECN000901 physical file definition.
* 
* File level identifier is 1151112064739.
* Record format level identifier is 4C1122007F56C.
*/

public class ECN000901Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H91USERID",
                                     "H91PROGRM",
                                     "H91TIMSYS",
                                     "H91SCRCOD",
                                     "H91OPECOD",
                                     "H91FLGMAS",
                                     "H91FLGWK1",
                                     "H91FLGWK2",
                                     "H91FLGWK3",
                                     "E91RTEACC",
                                     "E91RTEBNK",
                                     "E91RTEATY",
                                     "E91RTEATD",
                                     "E91RTEBLN",
                                     "E91RTECUN",
                                     "E91RTECUD",
                                     "E91RTENUM",
                                     "E91RTEIND"
                                   };
  final static String tnames[] = {
                                   "H91USERID",
                                   "H91PROGRM",
                                   "H91TIMSYS",
                                   "H91SCRCOD",
                                   "H91OPECOD",
                                   "H91FLGMAS",
                                   "H91FLGWK1",
                                   "H91FLGWK2",
                                   "H91FLGWK3",
                                   "E91RTEACC",
                                   "E91RTEBNK",
                                   "E91RTEATY",
                                   "E91RTEATD",
                                   "E91RTEBLN",
                                   "E91RTECUN",
                                   "E91RTECUD",
                                   "E91RTENUM",
                                   "E91RTEIND"
                                 };
  final static String fid = "1151112064739";
  final static String rid = "4C1122007F56C";
  final static String fmtname = "ECN000901";
  final int FIELDCOUNT = 18;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH91USERID = null;
  private CharacterField fieldH91PROGRM = null;
  private CharacterField fieldH91TIMSYS = null;
  private CharacterField fieldH91SCRCOD = null;
  private CharacterField fieldH91OPECOD = null;
  private CharacterField fieldH91FLGMAS = null;
  private CharacterField fieldH91FLGWK1 = null;
  private CharacterField fieldH91FLGWK2 = null;
  private CharacterField fieldH91FLGWK3 = null;
  private DecimalField fieldE91RTEACC = null;
  private CharacterField fieldE91RTEBNK = null;
  private CharacterField fieldE91RTEATY = null;
  private CharacterField fieldE91RTEATD = null;
  private CharacterField fieldE91RTEBLN = null;
  private DecimalField fieldE91RTECUN = null;
  private CharacterField fieldE91RTECUD = null;
  private DecimalField fieldE91RTENUM = null;
  private CharacterField fieldE91RTEIND = null;

  /**
  * Constructor for ECN000901Message.
  */
  public ECN000901Message()
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
    recordsize = 187;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH91USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H91USERID");
    fields[1] = fieldH91PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H91PROGRM");
    fields[2] = fieldH91TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H91TIMSYS");
    fields[3] = fieldH91SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H91SCRCOD");
    fields[4] = fieldH91OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H91OPECOD");
    fields[5] = fieldH91FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H91FLGMAS");
    fields[6] = fieldH91FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H91FLGWK1");
    fields[7] = fieldH91FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H91FLGWK2");
    fields[8] = fieldH91FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H91FLGWK3");
    fields[9] = fieldE91RTEACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E91RTEACC");
    fields[10] = fieldE91RTEBNK =
    new CharacterField(message, HEADERSIZE + 55, 2, "E91RTEBNK");
    fields[11] = fieldE91RTEATY =
    new CharacterField(message, HEADERSIZE + 57, 4, "E91RTEATY");
    fields[12] = fieldE91RTEATD =
    new CharacterField(message, HEADERSIZE + 61, 45, "E91RTEATD");
    fields[13] = fieldE91RTEBLN =
    new CharacterField(message, HEADERSIZE + 106, 2, "E91RTEBLN");
    fields[14] = fieldE91RTECUN =
    new DecimalField(message, HEADERSIZE + 108, 10, 0, "E91RTECUN");
    fields[15] = fieldE91RTECUD =
    new CharacterField(message, HEADERSIZE + 118, 60, "E91RTECUD");
    fields[16] = fieldE91RTENUM =
    new DecimalField(message, HEADERSIZE + 178, 8, 0, "E91RTENUM");
    fields[17] = fieldE91RTEIND =
    new CharacterField(message, HEADERSIZE + 186, 1, "E91RTEIND");

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
  * Set field H91USERID using a String value.
  */
  public void setH91USERID(String newvalue)
  {
    fieldH91USERID.setString(newvalue);
  }

  /**
  * Get value of field H91USERID as a String.
  */
  public String getH91USERID()
  {
    return fieldH91USERID.getString();
  }

  /**
  * Set field H91PROGRM using a String value.
  */
  public void setH91PROGRM(String newvalue)
  {
    fieldH91PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H91PROGRM as a String.
  */
  public String getH91PROGRM()
  {
    return fieldH91PROGRM.getString();
  }

  /**
  * Set field H91TIMSYS using a String value.
  */
  public void setH91TIMSYS(String newvalue)
  {
    fieldH91TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H91TIMSYS as a String.
  */
  public String getH91TIMSYS()
  {
    return fieldH91TIMSYS.getString();
  }

  /**
  * Set field H91SCRCOD using a String value.
  */
  public void setH91SCRCOD(String newvalue)
  {
    fieldH91SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H91SCRCOD as a String.
  */
  public String getH91SCRCOD()
  {
    return fieldH91SCRCOD.getString();
  }

  /**
  * Set field H91OPECOD using a String value.
  */
  public void setH91OPECOD(String newvalue)
  {
    fieldH91OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H91OPECOD as a String.
  */
  public String getH91OPECOD()
  {
    return fieldH91OPECOD.getString();
  }

  /**
  * Set field H91FLGMAS using a String value.
  */
  public void setH91FLGMAS(String newvalue)
  {
    fieldH91FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H91FLGMAS as a String.
  */
  public String getH91FLGMAS()
  {
    return fieldH91FLGMAS.getString();
  }

  /**
  * Set field H91FLGWK1 using a String value.
  */
  public void setH91FLGWK1(String newvalue)
  {
    fieldH91FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H91FLGWK1 as a String.
  */
  public String getH91FLGWK1()
  {
    return fieldH91FLGWK1.getString();
  }

  /**
  * Set field H91FLGWK2 using a String value.
  */
  public void setH91FLGWK2(String newvalue)
  {
    fieldH91FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H91FLGWK2 as a String.
  */
  public String getH91FLGWK2()
  {
    return fieldH91FLGWK2.getString();
  }

  /**
  * Set field H91FLGWK3 using a String value.
  */
  public void setH91FLGWK3(String newvalue)
  {
    fieldH91FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H91FLGWK3 as a String.
  */
  public String getH91FLGWK3()
  {
    return fieldH91FLGWK3.getString();
  }

  /**
  * Set field E91RTEACC using a String value.
  */
  public void setE91RTEACC(String newvalue)
  {
    fieldE91RTEACC.setString(newvalue);
  }

  /**
  * Get value of field E91RTEACC as a String.
  */
  public String getE91RTEACC()
  {
    return fieldE91RTEACC.getString();
  }

  /**
  * Set numeric field E91RTEACC using a BigDecimal value.
  */
  public void setE91RTEACC(BigDecimal newvalue)
  {
    fieldE91RTEACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E91RTEACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE91RTEACC()
  {
    return fieldE91RTEACC.getBigDecimal();
  }

  /**
  * Set field E91RTEBNK using a String value.
  */
  public void setE91RTEBNK(String newvalue)
  {
    fieldE91RTEBNK.setString(newvalue);
  }

  /**
  * Get value of field E91RTEBNK as a String.
  */
  public String getE91RTEBNK()
  {
    return fieldE91RTEBNK.getString();
  }

  /**
  * Set field E91RTEATY using a String value.
  */
  public void setE91RTEATY(String newvalue)
  {
    fieldE91RTEATY.setString(newvalue);
  }

  /**
  * Get value of field E91RTEATY as a String.
  */
  public String getE91RTEATY()
  {
    return fieldE91RTEATY.getString();
  }

  /**
  * Set field E91RTEATD using a String value.
  */
  public void setE91RTEATD(String newvalue)
  {
    fieldE91RTEATD.setString(newvalue);
  }

  /**
  * Get value of field E91RTEATD as a String.
  */
  public String getE91RTEATD()
  {
    return fieldE91RTEATD.getString();
  }

  /**
  * Set field E91RTEBLN using a String value.
  */
  public void setE91RTEBLN(String newvalue)
  {
    fieldE91RTEBLN.setString(newvalue);
  }

  /**
  * Get value of field E91RTEBLN as a String.
  */
  public String getE91RTEBLN()
  {
    return fieldE91RTEBLN.getString();
  }

  /**
  * Set field E91RTECUN using a String value.
  */
  public void setE91RTECUN(String newvalue)
  {
    fieldE91RTECUN.setString(newvalue);
  }

  /**
  * Get value of field E91RTECUN as a String.
  */
  public String getE91RTECUN()
  {
    return fieldE91RTECUN.getString();
  }

  /**
  * Set numeric field E91RTECUN using a BigDecimal value.
  */
  public void setE91RTECUN(BigDecimal newvalue)
  {
    fieldE91RTECUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E91RTECUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE91RTECUN()
  {
    return fieldE91RTECUN.getBigDecimal();
  }

  /**
  * Set field E91RTECUD using a String value.
  */
  public void setE91RTECUD(String newvalue)
  {
    fieldE91RTECUD.setString(newvalue);
  }

  /**
  * Get value of field E91RTECUD as a String.
  */
  public String getE91RTECUD()
  {
    return fieldE91RTECUD.getString();
  }

  /**
  * Set field E91RTENUM using a String value.
  */
  public void setE91RTENUM(String newvalue)
  {
    fieldE91RTENUM.setString(newvalue);
  }

  /**
  * Get value of field E91RTENUM as a String.
  */
  public String getE91RTENUM()
  {
    return fieldE91RTENUM.getString();
  }

  /**
  * Set numeric field E91RTENUM using a BigDecimal value.
  */
  public void setE91RTENUM(BigDecimal newvalue)
  {
    fieldE91RTENUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E91RTENUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE91RTENUM()
  {
    return fieldE91RTENUM.getBigDecimal();
  }

  /**
  * Set field E91RTEIND using a String value.
  */
  public void setE91RTEIND(String newvalue)
  {
    fieldE91RTEIND.setString(newvalue);
  }

  /**
  * Get value of field E91RTEIND as a String.
  */
  public String getE91RTEIND()
  {
    return fieldE91RTEIND.getString();
  }

}
