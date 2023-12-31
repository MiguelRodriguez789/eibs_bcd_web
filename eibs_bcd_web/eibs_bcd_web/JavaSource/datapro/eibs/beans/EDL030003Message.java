package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL030003 physical file definition.
* 
* File level identifier is 1151016052432.
* Record format level identifier is 385FB7AA8FBE2.
*/

public class EDL030003Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H03USERID",
                                     "H03PROGRM",
                                     "H03TIMSYS",
                                     "H03SCRCOD",
                                     "H03OPECOD",
                                     "H03FLGMAS",
                                     "H03FLGWK1",
                                     "H03FLGWK2",
                                     "H03FLGWK3",
                                     "E03NUMACC",
                                     "E03INIDTM",
                                     "E03INIDTD",
                                     "E03INIDTY",
                                     "E03ENDDTM",
                                     "E03ENDDTD",
                                     "E03ENDDTY",
                                     "E03TRACDE",
                                     "E03PRIAMN",
                                     "E03INTRTE",
                                     "E03NUMDYS",
                                     "E03INTAMN",
                                     "E03INDOPE"
                                   };
  final static String tnames[] = {
                                   "H03USERID",
                                   "H03PROGRM",
                                   "H03TIMSYS",
                                   "H03SCRCOD",
                                   "H03OPECOD",
                                   "H03FLGMAS",
                                   "H03FLGWK1",
                                   "H03FLGWK2",
                                   "H03FLGWK3",
                                   "E03NUMACC",
                                   "E03INIDTM",
                                   "E03INIDTD",
                                   "E03INIDTY",
                                   "E03ENDDTM",
                                   "E03ENDDTD",
                                   "E03ENDDTY",
                                   "E03TRACDE",
                                   "E03PRIAMN",
                                   "E03INTRTE",
                                   "E03NUMDYS",
                                   "E03INTAMN",
                                   "E03INDOPE"
                                 };
  final static String fid = "1151016052432";
  final static String rid = "385FB7AA8FBE2";
  final static String fmtname = "EDL030003";
  final int FIELDCOUNT = 22;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH03USERID = null;
  private CharacterField fieldH03PROGRM = null;
  private CharacterField fieldH03TIMSYS = null;
  private CharacterField fieldH03SCRCOD = null;
  private CharacterField fieldH03OPECOD = null;
  private CharacterField fieldH03FLGMAS = null;
  private CharacterField fieldH03FLGWK1 = null;
  private CharacterField fieldH03FLGWK2 = null;
  private CharacterField fieldH03FLGWK3 = null;
  private DecimalField fieldE03NUMACC = null;
  private DecimalField fieldE03INIDTM = null;
  private DecimalField fieldE03INIDTD = null;
  private DecimalField fieldE03INIDTY = null;
  private DecimalField fieldE03ENDDTM = null;
  private DecimalField fieldE03ENDDTD = null;
  private DecimalField fieldE03ENDDTY = null;
  private CharacterField fieldE03TRACDE = null;
  private DecimalField fieldE03PRIAMN = null;
  private DecimalField fieldE03INTRTE = null;
  private DecimalField fieldE03NUMDYS = null;
  private DecimalField fieldE03INTAMN = null;
  private CharacterField fieldE03INDOPE = null;

  /**
  * Constructor for EDL030003Message.
  */
  public EDL030003Message()
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
    recordsize = 132;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH03USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H03USERID");
    fields[1] = fieldH03PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H03PROGRM");
    fields[2] = fieldH03TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H03TIMSYS");
    fields[3] = fieldH03SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H03SCRCOD");
    fields[4] = fieldH03OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H03OPECOD");
    fields[5] = fieldH03FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H03FLGMAS");
    fields[6] = fieldH03FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H03FLGWK1");
    fields[7] = fieldH03FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H03FLGWK2");
    fields[8] = fieldH03FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H03FLGWK3");
    fields[9] = fieldE03NUMACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E03NUMACC");
    fields[10] = fieldE03INIDTM =
    new DecimalField(message, HEADERSIZE + 55, 3, 0, "E03INIDTM");
    fields[11] = fieldE03INIDTD =
    new DecimalField(message, HEADERSIZE + 58, 3, 0, "E03INIDTD");
    fields[12] = fieldE03INIDTY =
    new DecimalField(message, HEADERSIZE + 61, 5, 0, "E03INIDTY");
    fields[13] = fieldE03ENDDTM =
    new DecimalField(message, HEADERSIZE + 66, 3, 0, "E03ENDDTM");
    fields[14] = fieldE03ENDDTD =
    new DecimalField(message, HEADERSIZE + 69, 3, 0, "E03ENDDTD");
    fields[15] = fieldE03ENDDTY =
    new DecimalField(message, HEADERSIZE + 72, 5, 0, "E03ENDDTY");
    fields[16] = fieldE03TRACDE =
    new CharacterField(message, HEADERSIZE + 77, 4, "E03TRACDE");
    fields[17] = fieldE03PRIAMN =
    new DecimalField(message, HEADERSIZE + 81, 17, 2, "E03PRIAMN");
    fields[18] = fieldE03INTRTE =
    new DecimalField(message, HEADERSIZE + 98, 11, 6, "E03INTRTE");
    fields[19] = fieldE03NUMDYS =
    new DecimalField(message, HEADERSIZE + 109, 5, 0, "E03NUMDYS");
    fields[20] = fieldE03INTAMN =
    new DecimalField(message, HEADERSIZE + 114, 17, 2, "E03INTAMN");
    fields[21] = fieldE03INDOPE =
    new CharacterField(message, HEADERSIZE + 131, 1, "E03INDOPE");

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
  * Set field H03USERID using a String value.
  */
  public void setH03USERID(String newvalue)
  {
    fieldH03USERID.setString(newvalue);
  }

  /**
  * Get value of field H03USERID as a String.
  */
  public String getH03USERID()
  {
    return fieldH03USERID.getString();
  }

  /**
  * Set field H03PROGRM using a String value.
  */
  public void setH03PROGRM(String newvalue)
  {
    fieldH03PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H03PROGRM as a String.
  */
  public String getH03PROGRM()
  {
    return fieldH03PROGRM.getString();
  }

  /**
  * Set field H03TIMSYS using a String value.
  */
  public void setH03TIMSYS(String newvalue)
  {
    fieldH03TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H03TIMSYS as a String.
  */
  public String getH03TIMSYS()
  {
    return fieldH03TIMSYS.getString();
  }

  /**
  * Set field H03SCRCOD using a String value.
  */
  public void setH03SCRCOD(String newvalue)
  {
    fieldH03SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H03SCRCOD as a String.
  */
  public String getH03SCRCOD()
  {
    return fieldH03SCRCOD.getString();
  }

  /**
  * Set field H03OPECOD using a String value.
  */
  public void setH03OPECOD(String newvalue)
  {
    fieldH03OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H03OPECOD as a String.
  */
  public String getH03OPECOD()
  {
    return fieldH03OPECOD.getString();
  }

  /**
  * Set field H03FLGMAS using a String value.
  */
  public void setH03FLGMAS(String newvalue)
  {
    fieldH03FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H03FLGMAS as a String.
  */
  public String getH03FLGMAS()
  {
    return fieldH03FLGMAS.getString();
  }

  /**
  * Set field H03FLGWK1 using a String value.
  */
  public void setH03FLGWK1(String newvalue)
  {
    fieldH03FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK1 as a String.
  */
  public String getH03FLGWK1()
  {
    return fieldH03FLGWK1.getString();
  }

  /**
  * Set field H03FLGWK2 using a String value.
  */
  public void setH03FLGWK2(String newvalue)
  {
    fieldH03FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK2 as a String.
  */
  public String getH03FLGWK2()
  {
    return fieldH03FLGWK2.getString();
  }

  /**
  * Set field H03FLGWK3 using a String value.
  */
  public void setH03FLGWK3(String newvalue)
  {
    fieldH03FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK3 as a String.
  */
  public String getH03FLGWK3()
  {
    return fieldH03FLGWK3.getString();
  }

  /**
  * Set field E03NUMACC using a String value.
  */
  public void setE03NUMACC(String newvalue)
  {
    fieldE03NUMACC.setString(newvalue);
  }

  /**
  * Get value of field E03NUMACC as a String.
  */
  public String getE03NUMACC()
  {
    return fieldE03NUMACC.getString();
  }

  /**
  * Set numeric field E03NUMACC using a BigDecimal value.
  */
  public void setE03NUMACC(BigDecimal newvalue)
  {
    fieldE03NUMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03NUMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03NUMACC()
  {
    return fieldE03NUMACC.getBigDecimal();
  }

  /**
  * Set field E03INIDTM using a String value.
  */
  public void setE03INIDTM(String newvalue)
  {
    fieldE03INIDTM.setString(newvalue);
  }

  /**
  * Get value of field E03INIDTM as a String.
  */
  public String getE03INIDTM()
  {
    return fieldE03INIDTM.getString();
  }

  /**
  * Set numeric field E03INIDTM using a BigDecimal value.
  */
  public void setE03INIDTM(BigDecimal newvalue)
  {
    fieldE03INIDTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03INIDTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03INIDTM()
  {
    return fieldE03INIDTM.getBigDecimal();
  }

  /**
  * Set field E03INIDTD using a String value.
  */
  public void setE03INIDTD(String newvalue)
  {
    fieldE03INIDTD.setString(newvalue);
  }

  /**
  * Get value of field E03INIDTD as a String.
  */
  public String getE03INIDTD()
  {
    return fieldE03INIDTD.getString();
  }

  /**
  * Set numeric field E03INIDTD using a BigDecimal value.
  */
  public void setE03INIDTD(BigDecimal newvalue)
  {
    fieldE03INIDTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03INIDTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03INIDTD()
  {
    return fieldE03INIDTD.getBigDecimal();
  }

  /**
  * Set field E03INIDTY using a String value.
  */
  public void setE03INIDTY(String newvalue)
  {
    fieldE03INIDTY.setString(newvalue);
  }

  /**
  * Get value of field E03INIDTY as a String.
  */
  public String getE03INIDTY()
  {
    return fieldE03INIDTY.getString();
  }

  /**
  * Set numeric field E03INIDTY using a BigDecimal value.
  */
  public void setE03INIDTY(BigDecimal newvalue)
  {
    fieldE03INIDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03INIDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03INIDTY()
  {
    return fieldE03INIDTY.getBigDecimal();
  }

  /**
  * Set field E03ENDDTM using a String value.
  */
  public void setE03ENDDTM(String newvalue)
  {
    fieldE03ENDDTM.setString(newvalue);
  }

  /**
  * Get value of field E03ENDDTM as a String.
  */
  public String getE03ENDDTM()
  {
    return fieldE03ENDDTM.getString();
  }

  /**
  * Set numeric field E03ENDDTM using a BigDecimal value.
  */
  public void setE03ENDDTM(BigDecimal newvalue)
  {
    fieldE03ENDDTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ENDDTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ENDDTM()
  {
    return fieldE03ENDDTM.getBigDecimal();
  }

  /**
  * Set field E03ENDDTD using a String value.
  */
  public void setE03ENDDTD(String newvalue)
  {
    fieldE03ENDDTD.setString(newvalue);
  }

  /**
  * Get value of field E03ENDDTD as a String.
  */
  public String getE03ENDDTD()
  {
    return fieldE03ENDDTD.getString();
  }

  /**
  * Set numeric field E03ENDDTD using a BigDecimal value.
  */
  public void setE03ENDDTD(BigDecimal newvalue)
  {
    fieldE03ENDDTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ENDDTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ENDDTD()
  {
    return fieldE03ENDDTD.getBigDecimal();
  }

  /**
  * Set field E03ENDDTY using a String value.
  */
  public void setE03ENDDTY(String newvalue)
  {
    fieldE03ENDDTY.setString(newvalue);
  }

  /**
  * Get value of field E03ENDDTY as a String.
  */
  public String getE03ENDDTY()
  {
    return fieldE03ENDDTY.getString();
  }

  /**
  * Set numeric field E03ENDDTY using a BigDecimal value.
  */
  public void setE03ENDDTY(BigDecimal newvalue)
  {
    fieldE03ENDDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ENDDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ENDDTY()
  {
    return fieldE03ENDDTY.getBigDecimal();
  }

  /**
  * Set field E03TRACDE using a String value.
  */
  public void setE03TRACDE(String newvalue)
  {
    fieldE03TRACDE.setString(newvalue);
  }

  /**
  * Get value of field E03TRACDE as a String.
  */
  public String getE03TRACDE()
  {
    return fieldE03TRACDE.getString();
  }

  /**
  * Set field E03PRIAMN using a String value.
  */
  public void setE03PRIAMN(String newvalue)
  {
    fieldE03PRIAMN.setString(newvalue);
  }

  /**
  * Get value of field E03PRIAMN as a String.
  */
  public String getE03PRIAMN()
  {
    return fieldE03PRIAMN.getString();
  }

  /**
  * Set numeric field E03PRIAMN using a BigDecimal value.
  */
  public void setE03PRIAMN(BigDecimal newvalue)
  {
    fieldE03PRIAMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PRIAMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PRIAMN()
  {
    return fieldE03PRIAMN.getBigDecimal();
  }

  /**
  * Set field E03INTRTE using a String value.
  */
  public void setE03INTRTE(String newvalue)
  {
    fieldE03INTRTE.setString(newvalue);
  }

  /**
  * Get value of field E03INTRTE as a String.
  */
  public String getE03INTRTE()
  {
    return fieldE03INTRTE.getString();
  }

  /**
  * Set numeric field E03INTRTE using a BigDecimal value.
  */
  public void setE03INTRTE(BigDecimal newvalue)
  {
    fieldE03INTRTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03INTRTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03INTRTE()
  {
    return fieldE03INTRTE.getBigDecimal();
  }

  /**
  * Set field E03NUMDYS using a String value.
  */
  public void setE03NUMDYS(String newvalue)
  {
    fieldE03NUMDYS.setString(newvalue);
  }

  /**
  * Get value of field E03NUMDYS as a String.
  */
  public String getE03NUMDYS()
  {
    return fieldE03NUMDYS.getString();
  }

  /**
  * Set numeric field E03NUMDYS using a BigDecimal value.
  */
  public void setE03NUMDYS(BigDecimal newvalue)
  {
    fieldE03NUMDYS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03NUMDYS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03NUMDYS()
  {
    return fieldE03NUMDYS.getBigDecimal();
  }

  /**
  * Set field E03INTAMN using a String value.
  */
  public void setE03INTAMN(String newvalue)
  {
    fieldE03INTAMN.setString(newvalue);
  }

  /**
  * Get value of field E03INTAMN as a String.
  */
  public String getE03INTAMN()
  {
    return fieldE03INTAMN.getString();
  }

  /**
  * Set numeric field E03INTAMN using a BigDecimal value.
  */
  public void setE03INTAMN(BigDecimal newvalue)
  {
    fieldE03INTAMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03INTAMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03INTAMN()
  {
    return fieldE03INTAMN.getBigDecimal();
  }

  /**
  * Set field E03INDOPE using a String value.
  */
  public void setE03INDOPE(String newvalue)
  {
    fieldE03INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E03INDOPE as a String.
  */
  public String getE03INDOPE()
  {
    return fieldE03INDOPE.getString();
  }

}
