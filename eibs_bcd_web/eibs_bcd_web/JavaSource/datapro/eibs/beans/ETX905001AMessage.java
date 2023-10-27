package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ETX905001A physical file definition.
* 
* File level identifier is 1130611113440.
* Record format level identifier is 51ED83FBD9461.
*/

public class ETX905001AMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "H01USERID",
                                     "H01PROGRM",
                                     "H01TIMSYS",
                                     "H01SCR",
                                     "H01OPECOD",
                                     "H01FLGMAS",
                                     "H01FLGWK1",
                                     "H01FLGWK2",
                                     "H01FLGWK3",
                                     "E01TXACOD",
                                     "E01TXABNK",
                                     "E01TXABRN",
                                     "E01TXACTA",
                                     "E01TXAIVA",
                                     "E01TXAPIV",
                                     "E01ACT",
                                     "E01NUMREC",
                                     "E01INDOPE"
                                   };
  final static String tnames[] = {
                                   "H01USERID",
                                   "H01PROGRM",
                                   "H01TIMSYS",
                                   "H01SCR",
                                   "H01OPECOD",
                                   "H01FLGMAS",
                                   "H01FLGWK1",
                                   "H01FLGWK2",
                                   "H01FLGWK3",
                                   "E01TXACOD",
                                   "E01TXABNK",
                                   "E01TXABRN",
                                   "E01TXACTA",
                                   "E01TXAIVA",
                                   "E01TXAPIV",
                                   "E01ACT",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1130611113440";
  final static String rid = "51ED83FBD9461";
  final static String fmtname = "ETX905001A";
  final int FIELDCOUNT = 18;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH01USERID = null;
  private CharacterField fieldH01PROGRM = null;
  private CharacterField fieldH01TIMSYS = null;
  private CharacterField fieldH01SCR = null;
  private CharacterField fieldH01OPECOD = null;
  private CharacterField fieldH01FLGMAS = null;
  private CharacterField fieldH01FLGWK1 = null;
  private CharacterField fieldH01FLGWK2 = null;
  private CharacterField fieldH01FLGWK3 = null;
  private DecimalField fieldE01TXACOD = null;
  private CharacterField fieldE01TXABNK = null;
  private DecimalField fieldE01TXABRN = null;
  private DecimalField fieldE01TXACTA = null;
  private CharacterField fieldE01TXAIVA = null;
  private DecimalField fieldE01TXAPIV = null;
  private CharacterField fieldE01ACT = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ETX905001AMessage.
  */
  public ETX905001AMessage()
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
    recordsize = 90;
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
    fields[3] = fieldH01SCR =
    new CharacterField(message, HEADERSIZE + 32, 2, "H01SCR");
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
    fields[9] = fieldE01TXACOD =
    new DecimalField(message, HEADERSIZE + 42, 5, 0, "E01TXACOD");
    fields[10] = fieldE01TXABNK =
    new CharacterField(message, HEADERSIZE + 47, 2, "E01TXABNK");
    fields[11] = fieldE01TXABRN =
    new DecimalField(message, HEADERSIZE + 49, 5, 0, "E01TXABRN");
    fields[12] = fieldE01TXACTA =
    new DecimalField(message, HEADERSIZE + 54, 17, 0, "E01TXACTA");
    fields[13] = fieldE01TXAIVA =
    new CharacterField(message, HEADERSIZE + 71, 1, "E01TXAIVA");
    fields[14] = fieldE01TXAPIV =
    new DecimalField(message, HEADERSIZE + 72, 8, 3, "E01TXAPIV");
    fields[15] = fieldE01ACT =
    new CharacterField(message, HEADERSIZE + 80, 1, "E01ACT");
    fields[16] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 81, 8, 0, "E01NUMREC");
    fields[17] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 89, 1, "E01INDOPE");

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
  * Set field H01SCR using a String value.
  */
  public void setH01SCR(String newvalue)
  {
    fieldH01SCR.setString(newvalue);
  }

  /**
  * Get value of field H01SCR as a String.
  */
  public String getH01SCR()
  {
    return fieldH01SCR.getString();
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
  * Set field E01TXACOD using a String value.
  */
  public void setE01TXACOD(String newvalue)
  {
    fieldE01TXACOD.setString(newvalue);
  }

  /**
  * Get value of field E01TXACOD as a String.
  */
  public String getE01TXACOD()
  {
    return fieldE01TXACOD.getString();
  }

  /**
  * Set numeric field E01TXACOD using a BigDecimal value.
  */
  public void setE01TXACOD(BigDecimal newvalue)
  {
    fieldE01TXACOD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TXACOD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TXACOD()
  {
    return fieldE01TXACOD.getBigDecimal();
  }

  /**
  * Set field E01TXABNK using a String value.
  */
  public void setE01TXABNK(String newvalue)
  {
    fieldE01TXABNK.setString(newvalue);
  }

  /**
  * Get value of field E01TXABNK as a String.
  */
  public String getE01TXABNK()
  {
    return fieldE01TXABNK.getString();
  }

  /**
  * Set field E01TXABRN using a String value.
  */
  public void setE01TXABRN(String newvalue)
  {
    fieldE01TXABRN.setString(newvalue);
  }

  /**
  * Get value of field E01TXABRN as a String.
  */
  public String getE01TXABRN()
  {
    return fieldE01TXABRN.getString();
  }

  /**
  * Set numeric field E01TXABRN using a BigDecimal value.
  */
  public void setE01TXABRN(BigDecimal newvalue)
  {
    fieldE01TXABRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TXABRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TXABRN()
  {
    return fieldE01TXABRN.getBigDecimal();
  }

  /**
  * Set field E01TXACTA using a String value.
  */
  public void setE01TXACTA(String newvalue)
  {
    fieldE01TXACTA.setString(newvalue);
  }

  /**
  * Get value of field E01TXACTA as a String.
  */
  public String getE01TXACTA()
  {
    return fieldE01TXACTA.getString();
  }

  /**
  * Set numeric field E01TXACTA using a BigDecimal value.
  */
  public void setE01TXACTA(BigDecimal newvalue)
  {
    fieldE01TXACTA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TXACTA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TXACTA()
  {
    return fieldE01TXACTA.getBigDecimal();
  }

  /**
  * Set field E01TXAIVA using a String value.
  */
  public void setE01TXAIVA(String newvalue)
  {
    fieldE01TXAIVA.setString(newvalue);
  }

  /**
  * Get value of field E01TXAIVA as a String.
  */
  public String getE01TXAIVA()
  {
    return fieldE01TXAIVA.getString();
  }

  /**
  * Set field E01TXAPIV using a String value.
  */
  public void setE01TXAPIV(String newvalue)
  {
    fieldE01TXAPIV.setString(newvalue);
  }

  /**
  * Get value of field E01TXAPIV as a String.
  */
  public String getE01TXAPIV()
  {
    return fieldE01TXAPIV.getString();
  }

  /**
  * Set numeric field E01TXAPIV using a BigDecimal value.
  */
  public void setE01TXAPIV(BigDecimal newvalue)
  {
    fieldE01TXAPIV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TXAPIV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TXAPIV()
  {
    return fieldE01TXAPIV.getBigDecimal();
  }

  /**
  * Set field E01ACT using a String value.
  */
  public void setE01ACT(String newvalue)
  {
    fieldE01ACT.setString(newvalue);
  }

  /**
  * Get value of field E01ACT as a String.
  */
  public String getE01ACT()
  {
    return fieldE01ACT.getString();
  }

  /**
  * Set field E01NUMREC using a String value.
  */
  public void setE01NUMREC(String newvalue)
  {
    fieldE01NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E01NUMREC as a String.
  */
  public String getE01NUMREC()
  {
    return fieldE01NUMREC.getString();
  }

  /**
  * Set numeric field E01NUMREC using a BigDecimal value.
  */
  public void setE01NUMREC(BigDecimal newvalue)
  {
    fieldE01NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NUMREC()
  {
    return fieldE01NUMREC.getBigDecimal();
  }

  /**
  * Set field E01INDOPE using a String value.
  */
  public void setE01INDOPE(String newvalue)
  {
    fieldE01INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E01INDOPE as a String.
  */
  public String getE01INDOPE()
  {
    return fieldE01INDOPE.getString();
  }

}
