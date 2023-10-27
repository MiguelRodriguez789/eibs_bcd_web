package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD043015 physical file definition.
* 
* File level identifier is 1170113120224.
* Record format level identifier is 36E4ADBBF4A6C.
*/

public class EDD043015Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H15USERID",
                                     "H15PROGRM",
                                     "H15TIMSYS",
                                     "H15SCRCOD",
                                     "H15OPECOD",
                                     "H15FLGMAS",
                                     "H15FLGWK1",
                                     "H15FLGWK2",
                                     "H15FLGWK3",
                                     "E15SELACC",
                                     "E15CONPAC",
                                     "E15CUSNA1",
                                     "E15ACMBRN",
                                     "E15ACMGBL",
                                     "E15ACMNBL",
                                     "E15ACMOFC",
                                     "E15DSCOFC",
                                     "E15TOTAMT",
                                     "E15ACMPRO",
                                     "E15OPECOD"
                                   };
  final static String tnames[] = {
                                   "H15USERID",
                                   "H15PROGRM",
                                   "H15TIMSYS",
                                   "H15SCRCOD",
                                   "H15OPECOD",
                                   "H15FLGMAS",
                                   "H15FLGWK1",
                                   "H15FLGWK2",
                                   "H15FLGWK3",
                                   "E15SELACC",
                                   "E15CONPAC",
                                   "E15CUSNA1",
                                   "E15ACMBRN",
                                   "E15ACMGBL",
                                   "E15ACMNBL",
                                   "E15ACMOFC",
                                   "E15DSCOFC",
                                   "E15TOTAMT",
                                   "E15ACMPRO",
                                   "E15OPECOD"
                                 };
  final static String fid = "1170113120224";
  final static String rid = "36E4ADBBF4A6C";
  final static String fmtname = "EDD043015";
  final int FIELDCOUNT = 20;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH15USERID = null;
  private CharacterField fieldH15PROGRM = null;
  private CharacterField fieldH15TIMSYS = null;
  private CharacterField fieldH15SCRCOD = null;
  private CharacterField fieldH15OPECOD = null;
  private CharacterField fieldH15FLGMAS = null;
  private CharacterField fieldH15FLGWK1 = null;
  private CharacterField fieldH15FLGWK2 = null;
  private CharacterField fieldH15FLGWK3 = null;
  private DecimalField fieldE15SELACC = null;
  private DecimalField fieldE15CONPAC = null;
  private CharacterField fieldE15CUSNA1 = null;
  private DecimalField fieldE15ACMBRN = null;
  private DecimalField fieldE15ACMGBL = null;
  private DecimalField fieldE15ACMNBL = null;
  private CharacterField fieldE15ACMOFC = null;
  private CharacterField fieldE15DSCOFC = null;
  private DecimalField fieldE15TOTAMT = null;
  private CharacterField fieldE15ACMPRO = null;
  private CharacterField fieldE15OPECOD = null;

  /**
  * Constructor for EDD043015Message.
  */
  public EDD043015Message()
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
    recordsize = 253;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH15USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H15USERID");
    fields[1] = fieldH15PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H15PROGRM");
    fields[2] = fieldH15TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H15TIMSYS");
    fields[3] = fieldH15SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H15SCRCOD");
    fields[4] = fieldH15OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H15OPECOD");
    fields[5] = fieldH15FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H15FLGMAS");
    fields[6] = fieldH15FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H15FLGWK1");
    fields[7] = fieldH15FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H15FLGWK2");
    fields[8] = fieldH15FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H15FLGWK3");
    fields[9] = fieldE15SELACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E15SELACC");
    fields[10] = fieldE15CONPAC =
    new DecimalField(message, HEADERSIZE + 55, 13, 0, "E15CONPAC");
    fields[11] = fieldE15CUSNA1 =
    new CharacterField(message, HEADERSIZE + 68, 60, "E15CUSNA1");
    fields[12] = fieldE15ACMBRN =
    new DecimalField(message, HEADERSIZE + 128, 5, 0, "E15ACMBRN");
    fields[13] = fieldE15ACMGBL =
    new DecimalField(message, HEADERSIZE + 133, 17, 2, "E15ACMGBL");
    fields[14] = fieldE15ACMNBL =
    new DecimalField(message, HEADERSIZE + 150, 17, 2, "E15ACMNBL");
    fields[15] = fieldE15ACMOFC =
    new CharacterField(message, HEADERSIZE + 167, 4, "E15ACMOFC");
    fields[16] = fieldE15DSCOFC =
    new CharacterField(message, HEADERSIZE + 171, 60, "E15DSCOFC");
    fields[17] = fieldE15TOTAMT =
    new DecimalField(message, HEADERSIZE + 231, 17, 2, "E15TOTAMT");
    fields[18] = fieldE15ACMPRO =
    new CharacterField(message, HEADERSIZE + 248, 4, "E15ACMPRO");
    fields[19] = fieldE15OPECOD =
    new CharacterField(message, HEADERSIZE + 252, 1, "E15OPECOD");

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
  * Set field H15USERID using a String value.
  */
  public void setH15USERID(String newvalue)
  {
    fieldH15USERID.setString(newvalue);
  }

  /**
  * Get value of field H15USERID as a String.
  */
  public String getH15USERID()
  {
    return fieldH15USERID.getString();
  }

  /**
  * Set field H15PROGRM using a String value.
  */
  public void setH15PROGRM(String newvalue)
  {
    fieldH15PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H15PROGRM as a String.
  */
  public String getH15PROGRM()
  {
    return fieldH15PROGRM.getString();
  }

  /**
  * Set field H15TIMSYS using a String value.
  */
  public void setH15TIMSYS(String newvalue)
  {
    fieldH15TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H15TIMSYS as a String.
  */
  public String getH15TIMSYS()
  {
    return fieldH15TIMSYS.getString();
  }

  /**
  * Set field H15SCRCOD using a String value.
  */
  public void setH15SCRCOD(String newvalue)
  {
    fieldH15SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H15SCRCOD as a String.
  */
  public String getH15SCRCOD()
  {
    return fieldH15SCRCOD.getString();
  }

  /**
  * Set field H15OPECOD using a String value.
  */
  public void setH15OPECOD(String newvalue)
  {
    fieldH15OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H15OPECOD as a String.
  */
  public String getH15OPECOD()
  {
    return fieldH15OPECOD.getString();
  }

  /**
  * Set field H15FLGMAS using a String value.
  */
  public void setH15FLGMAS(String newvalue)
  {
    fieldH15FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H15FLGMAS as a String.
  */
  public String getH15FLGMAS()
  {
    return fieldH15FLGMAS.getString();
  }

  /**
  * Set field H15FLGWK1 using a String value.
  */
  public void setH15FLGWK1(String newvalue)
  {
    fieldH15FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H15FLGWK1 as a String.
  */
  public String getH15FLGWK1()
  {
    return fieldH15FLGWK1.getString();
  }

  /**
  * Set field H15FLGWK2 using a String value.
  */
  public void setH15FLGWK2(String newvalue)
  {
    fieldH15FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H15FLGWK2 as a String.
  */
  public String getH15FLGWK2()
  {
    return fieldH15FLGWK2.getString();
  }

  /**
  * Set field H15FLGWK3 using a String value.
  */
  public void setH15FLGWK3(String newvalue)
  {
    fieldH15FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H15FLGWK3 as a String.
  */
  public String getH15FLGWK3()
  {
    return fieldH15FLGWK3.getString();
  }

  /**
  * Set field E15SELACC using a String value.
  */
  public void setE15SELACC(String newvalue)
  {
    fieldE15SELACC.setString(newvalue);
  }

  /**
  * Get value of field E15SELACC as a String.
  */
  public String getE15SELACC()
  {
    return fieldE15SELACC.getString();
  }

  /**
  * Set numeric field E15SELACC using a BigDecimal value.
  */
  public void setE15SELACC(BigDecimal newvalue)
  {
    fieldE15SELACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15SELACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15SELACC()
  {
    return fieldE15SELACC.getBigDecimal();
  }

  /**
  * Set field E15CONPAC using a String value.
  */
  public void setE15CONPAC(String newvalue)
  {
    fieldE15CONPAC.setString(newvalue);
  }

  /**
  * Get value of field E15CONPAC as a String.
  */
  public String getE15CONPAC()
  {
    return fieldE15CONPAC.getString();
  }

  /**
  * Set numeric field E15CONPAC using a BigDecimal value.
  */
  public void setE15CONPAC(BigDecimal newvalue)
  {
    fieldE15CONPAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15CONPAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15CONPAC()
  {
    return fieldE15CONPAC.getBigDecimal();
  }

  /**
  * Set field E15CUSNA1 using a String value.
  */
  public void setE15CUSNA1(String newvalue)
  {
    fieldE15CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E15CUSNA1 as a String.
  */
  public String getE15CUSNA1()
  {
    return fieldE15CUSNA1.getString();
  }

  /**
  * Set field E15ACMBRN using a String value.
  */
  public void setE15ACMBRN(String newvalue)
  {
    fieldE15ACMBRN.setString(newvalue);
  }

  /**
  * Get value of field E15ACMBRN as a String.
  */
  public String getE15ACMBRN()
  {
    return fieldE15ACMBRN.getString();
  }

  /**
  * Set numeric field E15ACMBRN using a BigDecimal value.
  */
  public void setE15ACMBRN(BigDecimal newvalue)
  {
    fieldE15ACMBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15ACMBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15ACMBRN()
  {
    return fieldE15ACMBRN.getBigDecimal();
  }

  /**
  * Set field E15ACMGBL using a String value.
  */
  public void setE15ACMGBL(String newvalue)
  {
    fieldE15ACMGBL.setString(newvalue);
  }

  /**
  * Get value of field E15ACMGBL as a String.
  */
  public String getE15ACMGBL()
  {
    return fieldE15ACMGBL.getString();
  }

  /**
  * Set numeric field E15ACMGBL using a BigDecimal value.
  */
  public void setE15ACMGBL(BigDecimal newvalue)
  {
    fieldE15ACMGBL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15ACMGBL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15ACMGBL()
  {
    return fieldE15ACMGBL.getBigDecimal();
  }

  /**
  * Set field E15ACMNBL using a String value.
  */
  public void setE15ACMNBL(String newvalue)
  {
    fieldE15ACMNBL.setString(newvalue);
  }

  /**
  * Get value of field E15ACMNBL as a String.
  */
  public String getE15ACMNBL()
  {
    return fieldE15ACMNBL.getString();
  }

  /**
  * Set numeric field E15ACMNBL using a BigDecimal value.
  */
  public void setE15ACMNBL(BigDecimal newvalue)
  {
    fieldE15ACMNBL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15ACMNBL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15ACMNBL()
  {
    return fieldE15ACMNBL.getBigDecimal();
  }

  /**
  * Set field E15ACMOFC using a String value.
  */
  public void setE15ACMOFC(String newvalue)
  {
    fieldE15ACMOFC.setString(newvalue);
  }

  /**
  * Get value of field E15ACMOFC as a String.
  */
  public String getE15ACMOFC()
  {
    return fieldE15ACMOFC.getString();
  }

  /**
  * Set field E15DSCOFC using a String value.
  */
  public void setE15DSCOFC(String newvalue)
  {
    fieldE15DSCOFC.setString(newvalue);
  }

  /**
  * Get value of field E15DSCOFC as a String.
  */
  public String getE15DSCOFC()
  {
    return fieldE15DSCOFC.getString();
  }

  /**
  * Set field E15TOTAMT using a String value.
  */
  public void setE15TOTAMT(String newvalue)
  {
    fieldE15TOTAMT.setString(newvalue);
  }

  /**
  * Get value of field E15TOTAMT as a String.
  */
  public String getE15TOTAMT()
  {
    return fieldE15TOTAMT.getString();
  }

  /**
  * Set numeric field E15TOTAMT using a BigDecimal value.
  */
  public void setE15TOTAMT(BigDecimal newvalue)
  {
    fieldE15TOTAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E15TOTAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE15TOTAMT()
  {
    return fieldE15TOTAMT.getBigDecimal();
  }

  /**
  * Set field E15ACMPRO using a String value.
  */
  public void setE15ACMPRO(String newvalue)
  {
    fieldE15ACMPRO.setString(newvalue);
  }

  /**
  * Get value of field E15ACMPRO as a String.
  */
  public String getE15ACMPRO()
  {
    return fieldE15ACMPRO.getString();
  }

  /**
  * Set field E15OPECOD using a String value.
  */
  public void setE15OPECOD(String newvalue)
  {
    fieldE15OPECOD.setString(newvalue);
  }

  /**
  * Get value of field E15OPECOD as a String.
  */
  public String getE15OPECOD()
  {
    return fieldE15OPECOD.getString();
  }

}