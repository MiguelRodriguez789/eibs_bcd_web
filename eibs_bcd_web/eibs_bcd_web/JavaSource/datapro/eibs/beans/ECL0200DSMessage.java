package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECL0200DS physical file definition.
* 
* File level identifier is 1130611112848.
* Record format level identifier is 404596D61F21A.
*/

public class ECL0200DSMessage extends MessageRecord
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
                                     "E01NROCTA",
                                     "E01NOMCLI",
                                     "E01TIIDCL",
                                     "E01NRIDCL",
                                     "E01MONEDA",
                                     "E01SERIE",
                                     "E01CHEINI",
                                     "E01CHEFIN",
                                     "E01CANCHE",
                                     "E01CANHAB"
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
                                   "E01NROCTA",
                                   "E01NOMCLI",
                                   "E01TIIDCL",
                                   "E01NRIDCL",
                                   "E01MONEDA",
                                   "E01SERIE",
                                   "E01CHEINI",
                                   "E01CHEFIN",
                                   "E01CANCHE",
                                   "E01CANHAB"
                                 };
  final static String fid = "1130611112848";
  final static String rid = "404596D61F21A";
  final static String fmtname = "ECL0200DS";
  final int FIELDCOUNT = 19;
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
  private CharacterField fieldE01NROCTA = null;
  private CharacterField fieldE01NOMCLI = null;
  private CharacterField fieldE01TIIDCL = null;
  private CharacterField fieldE01NRIDCL = null;
  private CharacterField fieldE01MONEDA = null;
  private DecimalField fieldE01SERIE = null;
  private DecimalField fieldE01CHEINI = null;
  private DecimalField fieldE01CHEFIN = null;
  private DecimalField fieldE01CANCHE = null;
  private DecimalField fieldE01CANHAB = null;

  /**
  * Constructor for ECL0200DSMessage.
  */
  public ECL0200DSMessage()
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
    fields[9] = fieldE01NROCTA =
    new CharacterField(message, HEADERSIZE + 42, 20, "E01NROCTA");
    fields[10] = fieldE01NOMCLI =
    new CharacterField(message, HEADERSIZE + 62, 45, "E01NOMCLI");
    fields[11] = fieldE01TIIDCL =
    new CharacterField(message, HEADERSIZE + 107, 1, "E01TIIDCL");
    fields[12] = fieldE01NRIDCL =
    new CharacterField(message, HEADERSIZE + 108, 25, "E01NRIDCL");
    fields[13] = fieldE01MONEDA =
    new CharacterField(message, HEADERSIZE + 133, 3, "E01MONEDA");
    fields[14] = fieldE01SERIE =
    new DecimalField(message, HEADERSIZE + 136, 7, 0, "E01SERIE");
    fields[15] = fieldE01CHEINI =
    new DecimalField(message, HEADERSIZE + 143, 12, 0, "E01CHEINI");
    fields[16] = fieldE01CHEFIN =
    new DecimalField(message, HEADERSIZE + 155, 12, 0, "E01CHEFIN");
    fields[17] = fieldE01CANCHE =
    new DecimalField(message, HEADERSIZE + 167, 5, 0, "E01CANCHE");
    fields[18] = fieldE01CANHAB =
    new DecimalField(message, HEADERSIZE + 172, 5, 0, "E01CANHAB");

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
  * Set field E01NROCTA using a String value.
  */
  public void setE01NROCTA(String newvalue)
  {
    fieldE01NROCTA.setString(newvalue);
  }

  /**
  * Get value of field E01NROCTA as a String.
  */
  public String getE01NROCTA()
  {
    return fieldE01NROCTA.getString();
  }

  /**
  * Set field E01NOMCLI using a String value.
  */
  public void setE01NOMCLI(String newvalue)
  {
    fieldE01NOMCLI.setString(newvalue);
  }

  /**
  * Get value of field E01NOMCLI as a String.
  */
  public String getE01NOMCLI()
  {
    return fieldE01NOMCLI.getString();
  }

  /**
  * Set field E01TIIDCL using a String value.
  */
  public void setE01TIIDCL(String newvalue)
  {
    fieldE01TIIDCL.setString(newvalue);
  }

  /**
  * Get value of field E01TIIDCL as a String.
  */
  public String getE01TIIDCL()
  {
    return fieldE01TIIDCL.getString();
  }

  /**
  * Set field E01NRIDCL using a String value.
  */
  public void setE01NRIDCL(String newvalue)
  {
    fieldE01NRIDCL.setString(newvalue);
  }

  /**
  * Get value of field E01NRIDCL as a String.
  */
  public String getE01NRIDCL()
  {
    return fieldE01NRIDCL.getString();
  }

  /**
  * Set field E01MONEDA using a String value.
  */
  public void setE01MONEDA(String newvalue)
  {
    fieldE01MONEDA.setString(newvalue);
  }

  /**
  * Get value of field E01MONEDA as a String.
  */
  public String getE01MONEDA()
  {
    return fieldE01MONEDA.getString();
  }

  /**
  * Set field E01SERIE using a String value.
  */
  public void setE01SERIE(String newvalue)
  {
    fieldE01SERIE.setString(newvalue);
  }

  /**
  * Get value of field E01SERIE as a String.
  */
  public String getE01SERIE()
  {
    return fieldE01SERIE.getString();
  }

  /**
  * Set numeric field E01SERIE using a BigDecimal value.
  */
  public void setE01SERIE(BigDecimal newvalue)
  {
    fieldE01SERIE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SERIE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SERIE()
  {
    return fieldE01SERIE.getBigDecimal();
  }

  /**
  * Set field E01CHEINI using a String value.
  */
  public void setE01CHEINI(String newvalue)
  {
    fieldE01CHEINI.setString(newvalue);
  }

  /**
  * Get value of field E01CHEINI as a String.
  */
  public String getE01CHEINI()
  {
    return fieldE01CHEINI.getString();
  }

  /**
  * Set numeric field E01CHEINI using a BigDecimal value.
  */
  public void setE01CHEINI(BigDecimal newvalue)
  {
    fieldE01CHEINI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHEINI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHEINI()
  {
    return fieldE01CHEINI.getBigDecimal();
  }

  /**
  * Set field E01CHEFIN using a String value.
  */
  public void setE01CHEFIN(String newvalue)
  {
    fieldE01CHEFIN.setString(newvalue);
  }

  /**
  * Get value of field E01CHEFIN as a String.
  */
  public String getE01CHEFIN()
  {
    return fieldE01CHEFIN.getString();
  }

  /**
  * Set numeric field E01CHEFIN using a BigDecimal value.
  */
  public void setE01CHEFIN(BigDecimal newvalue)
  {
    fieldE01CHEFIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHEFIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHEFIN()
  {
    return fieldE01CHEFIN.getBigDecimal();
  }

  /**
  * Set field E01CANCHE using a String value.
  */
  public void setE01CANCHE(String newvalue)
  {
    fieldE01CANCHE.setString(newvalue);
  }

  /**
  * Get value of field E01CANCHE as a String.
  */
  public String getE01CANCHE()
  {
    return fieldE01CANCHE.getString();
  }

  /**
  * Set numeric field E01CANCHE using a BigDecimal value.
  */
  public void setE01CANCHE(BigDecimal newvalue)
  {
    fieldE01CANCHE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CANCHE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CANCHE()
  {
    return fieldE01CANCHE.getBigDecimal();
  }

  /**
  * Set field E01CANHAB using a String value.
  */
  public void setE01CANHAB(String newvalue)
  {
    fieldE01CANHAB.setString(newvalue);
  }

  /**
  * Get value of field E01CANHAB as a String.
  */
  public String getE01CANHAB()
  {
    return fieldE01CANHAB.getString();
  }

  /**
  * Set numeric field E01CANHAB using a BigDecimal value.
  */
  public void setE01CANHAB(BigDecimal newvalue)
  {
    fieldE01CANHAB.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CANHAB as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CANHAB()
  {
    return fieldE01CANHAB.getBigDecimal();
  }

}
