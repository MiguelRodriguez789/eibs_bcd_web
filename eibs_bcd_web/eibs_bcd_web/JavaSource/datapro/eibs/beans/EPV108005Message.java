package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV108005 physical file definition.
* 
* File level identifier is 1130611113307.
* Record format level identifier is 44B4FAA77D54E.
*/

public class EPV108005Message extends MessageRecord
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
                                     "E05COLACC",
                                     "E05COBERT",
                                     "E05DESCRI",
                                     "E05COLAMT",
                                     "E05TASVIG",
                                     "E05SEGURO",
                                     "E05PROACC",
                                     "E05DSCCRE"
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
                                   "E05COLACC",
                                   "E05COBERT",
                                   "E05DESCRI",
                                   "E05COLAMT",
                                   "E05TASVIG",
                                   "E05SEGURO",
                                   "E05PROACC",
                                   "E05DSCCRE"
                                 };
  final static String fid = "1130611113307";
  final static String rid = "44B4FAA77D54E";
  final static String fmtname = "EPV108005";
  final int FIELDCOUNT = 17;
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
  private DecimalField fieldE05COLACC = null;
  private CharacterField fieldE05COBERT = null;
  private CharacterField fieldE05DESCRI = null;
  private DecimalField fieldE05COLAMT = null;
  private CharacterField fieldE05TASVIG = null;
  private CharacterField fieldE05SEGURO = null;
  private DecimalField fieldE05PROACC = null;
  private CharacterField fieldE05DSCCRE = null;

  /**
  * Constructor for EPV108005Message.
  */
  public EPV108005Message()
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
    recordsize = 222;
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
    fields[9] = fieldE05COLACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E05COLACC");
    fields[10] = fieldE05COBERT =
    new CharacterField(message, HEADERSIZE + 55, 15, "E05COBERT");
    fields[11] = fieldE05DESCRI =
    new CharacterField(message, HEADERSIZE + 70, 60, "E05DESCRI");
    fields[12] = fieldE05COLAMT =
    new DecimalField(message, HEADERSIZE + 130, 17, 2, "E05COLAMT");
    fields[13] = fieldE05TASVIG =
    new CharacterField(message, HEADERSIZE + 147, 1, "E05TASVIG");
    fields[14] = fieldE05SEGURO =
    new CharacterField(message, HEADERSIZE + 148, 1, "E05SEGURO");
    fields[15] = fieldE05PROACC =
    new DecimalField(message, HEADERSIZE + 149, 13, 0, "E05PROACC");
    fields[16] = fieldE05DSCCRE =
    new CharacterField(message, HEADERSIZE + 162, 60, "E05DSCCRE");

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
  * Set field E05COLACC using a String value.
  */
  public void setE05COLACC(String newvalue)
  {
    fieldE05COLACC.setString(newvalue);
  }

  /**
  * Get value of field E05COLACC as a String.
  */
  public String getE05COLACC()
  {
    return fieldE05COLACC.getString();
  }

  /**
  * Set numeric field E05COLACC using a BigDecimal value.
  */
  public void setE05COLACC(BigDecimal newvalue)
  {
    fieldE05COLACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E05COLACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE05COLACC()
  {
    return fieldE05COLACC.getBigDecimal();
  }

  /**
  * Set field E05COBERT using a String value.
  */
  public void setE05COBERT(String newvalue)
  {
    fieldE05COBERT.setString(newvalue);
  }

  /**
  * Get value of field E05COBERT as a String.
  */
  public String getE05COBERT()
  {
    return fieldE05COBERT.getString();
  }

  /**
  * Set field E05DESCRI using a String value.
  */
  public void setE05DESCRI(String newvalue)
  {
    fieldE05DESCRI.setString(newvalue);
  }

  /**
  * Get value of field E05DESCRI as a String.
  */
  public String getE05DESCRI()
  {
    return fieldE05DESCRI.getString();
  }

  /**
  * Set field E05COLAMT using a String value.
  */
  public void setE05COLAMT(String newvalue)
  {
    fieldE05COLAMT.setString(newvalue);
  }

  /**
  * Get value of field E05COLAMT as a String.
  */
  public String getE05COLAMT()
  {
    return fieldE05COLAMT.getString();
  }

  /**
  * Set numeric field E05COLAMT using a BigDecimal value.
  */
  public void setE05COLAMT(BigDecimal newvalue)
  {
    fieldE05COLAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E05COLAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE05COLAMT()
  {
    return fieldE05COLAMT.getBigDecimal();
  }

  /**
  * Set field E05TASVIG using a String value.
  */
  public void setE05TASVIG(String newvalue)
  {
    fieldE05TASVIG.setString(newvalue);
  }

  /**
  * Get value of field E05TASVIG as a String.
  */
  public String getE05TASVIG()
  {
    return fieldE05TASVIG.getString();
  }

  /**
  * Set field E05SEGURO using a String value.
  */
  public void setE05SEGURO(String newvalue)
  {
    fieldE05SEGURO.setString(newvalue);
  }

  /**
  * Get value of field E05SEGURO as a String.
  */
  public String getE05SEGURO()
  {
    return fieldE05SEGURO.getString();
  }

  /**
  * Set field E05PROACC using a String value.
  */
  public void setE05PROACC(String newvalue)
  {
    fieldE05PROACC.setString(newvalue);
  }

  /**
  * Get value of field E05PROACC as a String.
  */
  public String getE05PROACC()
  {
    return fieldE05PROACC.getString();
  }

  /**
  * Set numeric field E05PROACC using a BigDecimal value.
  */
  public void setE05PROACC(BigDecimal newvalue)
  {
    fieldE05PROACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E05PROACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE05PROACC()
  {
    return fieldE05PROACC.getBigDecimal();
  }

  /**
  * Set field E05DSCCRE using a String value.
  */
  public void setE05DSCCRE(String newvalue)
  {
    fieldE05DSCCRE.setString(newvalue);
  }

  /**
  * Get value of field E05DSCCRE as a String.
  */
  public String getE05DSCCRE()
  {
    return fieldE05DSCCRE.getString();
  }

}
