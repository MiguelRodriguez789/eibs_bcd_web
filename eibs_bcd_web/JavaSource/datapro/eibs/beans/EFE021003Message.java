package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EFE021003 physical file definition.
* 
* File level identifier is 1130611113139.
* Record format level identifier is 38923C1C8CA10.
*/

public class EFE021003Message extends MessageRecord
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
                                     "E03FSCSEQ",
                                     "E03FSCTYP",
                                     "E03FSCIBS",
                                     "E03FSCDAY",
                                     "E03FSCTI1",
                                     "E03FSCTI2",
                                     "E03FSCTI3",
                                     "E03FSCFRQ",
                                     "E03FSCRTR",
                                     "E03FSCIN1",
                                     "E03FSCIN2",
                                     "E03ACT",
                                     "E03NUMREC",
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
                                   "E03FSCSEQ",
                                   "E03FSCTYP",
                                   "E03FSCIBS",
                                   "E03FSCDAY",
                                   "E03FSCTI1",
                                   "E03FSCTI2",
                                   "E03FSCTI3",
                                   "E03FSCFRQ",
                                   "E03FSCRTR",
                                   "E03FSCIN1",
                                   "E03FSCIN2",
                                   "E03ACT",
                                   "E03NUMREC",
                                   "E03INDOPE"
                                 };
  final static String fid = "1130611113139";
  final static String rid = "38923C1C8CA10";
  final static String fmtname = "EFE021003";
  final int FIELDCOUNT = 23;
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
  private DecimalField fieldE03FSCSEQ = null;
  private CharacterField fieldE03FSCTYP = null;
  private CharacterField fieldE03FSCIBS = null;
  private CharacterField fieldE03FSCDAY = null;
  private DecimalField fieldE03FSCTI1 = null;
  private DecimalField fieldE03FSCTI2 = null;
  private DecimalField fieldE03FSCTI3 = null;
  private CharacterField fieldE03FSCFRQ = null;
  private DecimalField fieldE03FSCRTR = null;
  private DecimalField fieldE03FSCIN1 = null;
  private DecimalField fieldE03FSCIN2 = null;
  private CharacterField fieldE03ACT = null;
  private DecimalField fieldE03NUMREC = null;
  private CharacterField fieldE03INDOPE = null;

  /**
  * Constructor for EFE021003Message.
  */
  public EFE021003Message()
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
    recordsize = 106;
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
    fields[9] = fieldE03FSCSEQ =
    new DecimalField(message, HEADERSIZE + 42, 6, 0, "E03FSCSEQ");
    fields[10] = fieldE03FSCTYP =
    new CharacterField(message, HEADERSIZE + 48, 4, "E03FSCTYP");
    fields[11] = fieldE03FSCIBS =
    new CharacterField(message, HEADERSIZE + 52, 15, "E03FSCIBS");
    fields[12] = fieldE03FSCDAY =
    new CharacterField(message, HEADERSIZE + 67, 5, "E03FSCDAY");
    fields[13] = fieldE03FSCTI1 =
    new DecimalField(message, HEADERSIZE + 72, 3, 0, "E03FSCTI1");
    fields[14] = fieldE03FSCTI2 =
    new DecimalField(message, HEADERSIZE + 75, 3, 0, "E03FSCTI2");
    fields[15] = fieldE03FSCTI3 =
    new DecimalField(message, HEADERSIZE + 78, 3, 0, "E03FSCTI3");
    fields[16] = fieldE03FSCFRQ =
    new CharacterField(message, HEADERSIZE + 81, 6, "E03FSCFRQ");
    fields[17] = fieldE03FSCRTR =
    new DecimalField(message, HEADERSIZE + 87, 3, 0, "E03FSCRTR");
    fields[18] = fieldE03FSCIN1 =
    new DecimalField(message, HEADERSIZE + 90, 3, 0, "E03FSCIN1");
    fields[19] = fieldE03FSCIN2 =
    new DecimalField(message, HEADERSIZE + 93, 3, 0, "E03FSCIN2");
    fields[20] = fieldE03ACT =
    new CharacterField(message, HEADERSIZE + 96, 1, "E03ACT");
    fields[21] = fieldE03NUMREC =
    new DecimalField(message, HEADERSIZE + 97, 8, 0, "E03NUMREC");
    fields[22] = fieldE03INDOPE =
    new CharacterField(message, HEADERSIZE + 105, 1, "E03INDOPE");

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
  * Set field E03FSCSEQ using a String value.
  */
  public void setE03FSCSEQ(String newvalue)
  {
    fieldE03FSCSEQ.setString(newvalue);
  }

  /**
  * Get value of field E03FSCSEQ as a String.
  */
  public String getE03FSCSEQ()
  {
    return fieldE03FSCSEQ.getString();
  }

  /**
  * Set numeric field E03FSCSEQ using a BigDecimal value.
  */
  public void setE03FSCSEQ(BigDecimal newvalue)
  {
    fieldE03FSCSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03FSCSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03FSCSEQ()
  {
    return fieldE03FSCSEQ.getBigDecimal();
  }

  /**
  * Set field E03FSCTYP using a String value.
  */
  public void setE03FSCTYP(String newvalue)
  {
    fieldE03FSCTYP.setString(newvalue);
  }

  /**
  * Get value of field E03FSCTYP as a String.
  */
  public String getE03FSCTYP()
  {
    return fieldE03FSCTYP.getString();
  }

  /**
  * Set field E03FSCIBS using a String value.
  */
  public void setE03FSCIBS(String newvalue)
  {
    fieldE03FSCIBS.setString(newvalue);
  }

  /**
  * Get value of field E03FSCIBS as a String.
  */
  public String getE03FSCIBS()
  {
    return fieldE03FSCIBS.getString();
  }

  /**
  * Set field E03FSCDAY using a String value.
  */
  public void setE03FSCDAY(String newvalue)
  {
    fieldE03FSCDAY.setString(newvalue);
  }

  /**
  * Get value of field E03FSCDAY as a String.
  */
  public String getE03FSCDAY()
  {
    return fieldE03FSCDAY.getString();
  }

  /**
  * Set field E03FSCTI1 using a String value.
  */
  public void setE03FSCTI1(String newvalue)
  {
    fieldE03FSCTI1.setString(newvalue);
  }

  /**
  * Get value of field E03FSCTI1 as a String.
  */
  public String getE03FSCTI1()
  {
    return fieldE03FSCTI1.getString();
  }

  /**
  * Set numeric field E03FSCTI1 using a BigDecimal value.
  */
  public void setE03FSCTI1(BigDecimal newvalue)
  {
    fieldE03FSCTI1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03FSCTI1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03FSCTI1()
  {
    return fieldE03FSCTI1.getBigDecimal();
  }

  /**
  * Set field E03FSCTI2 using a String value.
  */
  public void setE03FSCTI2(String newvalue)
  {
    fieldE03FSCTI2.setString(newvalue);
  }

  /**
  * Get value of field E03FSCTI2 as a String.
  */
  public String getE03FSCTI2()
  {
    return fieldE03FSCTI2.getString();
  }

  /**
  * Set numeric field E03FSCTI2 using a BigDecimal value.
  */
  public void setE03FSCTI2(BigDecimal newvalue)
  {
    fieldE03FSCTI2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03FSCTI2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03FSCTI2()
  {
    return fieldE03FSCTI2.getBigDecimal();
  }

  /**
  * Set field E03FSCTI3 using a String value.
  */
  public void setE03FSCTI3(String newvalue)
  {
    fieldE03FSCTI3.setString(newvalue);
  }

  /**
  * Get value of field E03FSCTI3 as a String.
  */
  public String getE03FSCTI3()
  {
    return fieldE03FSCTI3.getString();
  }

  /**
  * Set numeric field E03FSCTI3 using a BigDecimal value.
  */
  public void setE03FSCTI3(BigDecimal newvalue)
  {
    fieldE03FSCTI3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03FSCTI3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03FSCTI3()
  {
    return fieldE03FSCTI3.getBigDecimal();
  }

  /**
  * Set field E03FSCFRQ using a String value.
  */
  public void setE03FSCFRQ(String newvalue)
  {
    fieldE03FSCFRQ.setString(newvalue);
  }

  /**
  * Get value of field E03FSCFRQ as a String.
  */
  public String getE03FSCFRQ()
  {
    return fieldE03FSCFRQ.getString();
  }

  /**
  * Set field E03FSCRTR using a String value.
  */
  public void setE03FSCRTR(String newvalue)
  {
    fieldE03FSCRTR.setString(newvalue);
  }

  /**
  * Get value of field E03FSCRTR as a String.
  */
  public String getE03FSCRTR()
  {
    return fieldE03FSCRTR.getString();
  }

  /**
  * Set numeric field E03FSCRTR using a BigDecimal value.
  */
  public void setE03FSCRTR(BigDecimal newvalue)
  {
    fieldE03FSCRTR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03FSCRTR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03FSCRTR()
  {
    return fieldE03FSCRTR.getBigDecimal();
  }

  /**
  * Set field E03FSCIN1 using a String value.
  */
  public void setE03FSCIN1(String newvalue)
  {
    fieldE03FSCIN1.setString(newvalue);
  }

  /**
  * Get value of field E03FSCIN1 as a String.
  */
  public String getE03FSCIN1()
  {
    return fieldE03FSCIN1.getString();
  }

  /**
  * Set numeric field E03FSCIN1 using a BigDecimal value.
  */
  public void setE03FSCIN1(BigDecimal newvalue)
  {
    fieldE03FSCIN1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03FSCIN1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03FSCIN1()
  {
    return fieldE03FSCIN1.getBigDecimal();
  }

  /**
  * Set field E03FSCIN2 using a String value.
  */
  public void setE03FSCIN2(String newvalue)
  {
    fieldE03FSCIN2.setString(newvalue);
  }

  /**
  * Get value of field E03FSCIN2 as a String.
  */
  public String getE03FSCIN2()
  {
    return fieldE03FSCIN2.getString();
  }

  /**
  * Set numeric field E03FSCIN2 using a BigDecimal value.
  */
  public void setE03FSCIN2(BigDecimal newvalue)
  {
    fieldE03FSCIN2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03FSCIN2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03FSCIN2()
  {
    return fieldE03FSCIN2.getBigDecimal();
  }

  /**
  * Set field E03ACT using a String value.
  */
  public void setE03ACT(String newvalue)
  {
    fieldE03ACT.setString(newvalue);
  }

  /**
  * Get value of field E03ACT as a String.
  */
  public String getE03ACT()
  {
    return fieldE03ACT.getString();
  }

  /**
  * Set field E03NUMREC using a String value.
  */
  public void setE03NUMREC(String newvalue)
  {
    fieldE03NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E03NUMREC as a String.
  */
  public String getE03NUMREC()
  {
    return fieldE03NUMREC.getString();
  }

  /**
  * Set numeric field E03NUMREC using a BigDecimal value.
  */
  public void setE03NUMREC(BigDecimal newvalue)
  {
    fieldE03NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03NUMREC()
  {
    return fieldE03NUMREC.getBigDecimal();
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