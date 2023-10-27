package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECD0018DS physical file definition.
* 
* File level identifier is 1090209150453.
* Record format level identifier is 373FCE11C80AB.
*/

public class ECD0018DSMessage extends MessageRecord
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
                                     "E01CDPTPL",
                                     "E01CDPNPL",
                                     "E01CDPYYD",
                                     "E01CDPMMD",
                                     "E01CDPYYF",
                                     "E01CDPMMF",
                                     "E01CDPSUR",
                                     "E01CDPNUM",
                                     "E01CDPNAM",
                                     "E01CDPTOT",
                                     "E01CDPREG"
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
                                   "E01CDPTPL",
                                   "E01CDPNPL",
                                   "E01CDPYYD",
                                   "E01CDPMMD",
                                   "E01CDPYYF",
                                   "E01CDPMMF",
                                   "E01CDPSUR",
                                   "E01CDPNUM",
                                   "E01CDPNAM",
                                   "E01CDPTOT",
                                   "E01CDPREG"
                                 };
  final static String fid = "1090209150453";
  final static String rid = "373FCE11C80AB";
  final static String fmtname = "ECD0018DS";
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
  private CharacterField fieldE01CDPTPL = null;
  private CharacterField fieldE01CDPNPL = null;
  private DecimalField fieldE01CDPYYD = null;
  private DecimalField fieldE01CDPMMD = null;
  private DecimalField fieldE01CDPYYF = null;
  private DecimalField fieldE01CDPMMF = null;
  private DecimalField fieldE01CDPSUR = null;
  private CharacterField fieldE01CDPNUM = null;
  private CharacterField fieldE01CDPNAM = null;
  private DecimalField fieldE01CDPTOT = null;
  private DecimalField fieldE01CDPREG = null;

  /**
  * Constructor for ECD0018DSMessage.
  */
  public ECD0018DSMessage()
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
    recordsize = 169;
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
    fields[9] = fieldE01CDPTPL =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01CDPTPL");
    fields[10] = fieldE01CDPNPL =
    new CharacterField(message, HEADERSIZE + 44, 35, "E01CDPNPL");
    fields[11] = fieldE01CDPYYD =
    new DecimalField(message, HEADERSIZE + 79, 3, 0, "E01CDPYYD");
    fields[12] = fieldE01CDPMMD =
    new DecimalField(message, HEADERSIZE + 82, 3, 0, "E01CDPMMD");
    fields[13] = fieldE01CDPYYF =
    new DecimalField(message, HEADERSIZE + 85, 3, 0, "E01CDPYYF");
    fields[14] = fieldE01CDPMMF =
    new DecimalField(message, HEADERSIZE + 88, 3, 0, "E01CDPMMF");
    fields[15] = fieldE01CDPSUR =
    new DecimalField(message, HEADERSIZE + 91, 4, 0, "E01CDPSUR");
    fields[16] = fieldE01CDPNUM =
    new CharacterField(message, HEADERSIZE + 95, 20, "E01CDPNUM");
    fields[17] = fieldE01CDPNAM =
    new CharacterField(message, HEADERSIZE + 115, 40, "E01CDPNAM");
    fields[18] = fieldE01CDPTOT =
    new DecimalField(message, HEADERSIZE + 155, 7, 0, "E01CDPTOT");
    fields[19] = fieldE01CDPREG =
    new DecimalField(message, HEADERSIZE + 162, 7, 0, "E01CDPREG");

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
  * Set field E01CDPTPL using a String value.
  */
  public void setE01CDPTPL(String newvalue)
  {
    fieldE01CDPTPL.setString(newvalue);
  }

  /**
  * Get value of field E01CDPTPL as a String.
  */
  public String getE01CDPTPL()
  {
    return fieldE01CDPTPL.getString();
  }

  /**
  * Set field E01CDPNPL using a String value.
  */
  public void setE01CDPNPL(String newvalue)
  {
    fieldE01CDPNPL.setString(newvalue);
  }

  /**
  * Get value of field E01CDPNPL as a String.
  */
  public String getE01CDPNPL()
  {
    return fieldE01CDPNPL.getString();
  }

  /**
  * Set field E01CDPYYD using a String value.
  */
  public void setE01CDPYYD(String newvalue)
  {
    fieldE01CDPYYD.setString(newvalue);
  }

  /**
  * Get value of field E01CDPYYD as a String.
  */
  public String getE01CDPYYD()
  {
    return fieldE01CDPYYD.getString();
  }

  /**
  * Set numeric field E01CDPYYD using a BigDecimal value.
  */
  public void setE01CDPYYD(BigDecimal newvalue)
  {
    fieldE01CDPYYD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDPYYD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDPYYD()
  {
    return fieldE01CDPYYD.getBigDecimal();
  }

  /**
  * Set field E01CDPMMD using a String value.
  */
  public void setE01CDPMMD(String newvalue)
  {
    fieldE01CDPMMD.setString(newvalue);
  }

  /**
  * Get value of field E01CDPMMD as a String.
  */
  public String getE01CDPMMD()
  {
    return fieldE01CDPMMD.getString();
  }

  /**
  * Set numeric field E01CDPMMD using a BigDecimal value.
  */
  public void setE01CDPMMD(BigDecimal newvalue)
  {
    fieldE01CDPMMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDPMMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDPMMD()
  {
    return fieldE01CDPMMD.getBigDecimal();
  }

  /**
  * Set field E01CDPYYF using a String value.
  */
  public void setE01CDPYYF(String newvalue)
  {
    fieldE01CDPYYF.setString(newvalue);
  }

  /**
  * Get value of field E01CDPYYF as a String.
  */
  public String getE01CDPYYF()
  {
    return fieldE01CDPYYF.getString();
  }

  /**
  * Set numeric field E01CDPYYF using a BigDecimal value.
  */
  public void setE01CDPYYF(BigDecimal newvalue)
  {
    fieldE01CDPYYF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDPYYF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDPYYF()
  {
    return fieldE01CDPYYF.getBigDecimal();
  }

  /**
  * Set field E01CDPMMF using a String value.
  */
  public void setE01CDPMMF(String newvalue)
  {
    fieldE01CDPMMF.setString(newvalue);
  }

  /**
  * Get value of field E01CDPMMF as a String.
  */
  public String getE01CDPMMF()
  {
    return fieldE01CDPMMF.getString();
  }

  /**
  * Set numeric field E01CDPMMF using a BigDecimal value.
  */
  public void setE01CDPMMF(BigDecimal newvalue)
  {
    fieldE01CDPMMF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDPMMF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDPMMF()
  {
    return fieldE01CDPMMF.getBigDecimal();
  }

  /**
  * Set field E01CDPSUR using a String value.
  */
  public void setE01CDPSUR(String newvalue)
  {
    fieldE01CDPSUR.setString(newvalue);
  }

  /**
  * Get value of field E01CDPSUR as a String.
  */
  public String getE01CDPSUR()
  {
    return fieldE01CDPSUR.getString();
  }

  /**
  * Set numeric field E01CDPSUR using a BigDecimal value.
  */
  public void setE01CDPSUR(BigDecimal newvalue)
  {
    fieldE01CDPSUR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDPSUR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDPSUR()
  {
    return fieldE01CDPSUR.getBigDecimal();
  }

  /**
  * Set field E01CDPNUM using a String value.
  */
  public void setE01CDPNUM(String newvalue)
  {
    fieldE01CDPNUM.setString(newvalue);
  }

  /**
  * Get value of field E01CDPNUM as a String.
  */
  public String getE01CDPNUM()
  {
    return fieldE01CDPNUM.getString();
  }

  /**
  * Set field E01CDPNAM using a String value.
  */
  public void setE01CDPNAM(String newvalue)
  {
    fieldE01CDPNAM.setString(newvalue);
  }

  /**
  * Get value of field E01CDPNAM as a String.
  */
  public String getE01CDPNAM()
  {
    return fieldE01CDPNAM.getString();
  }

  /**
  * Set field E01CDPTOT using a String value.
  */
  public void setE01CDPTOT(String newvalue)
  {
    fieldE01CDPTOT.setString(newvalue);
  }

  /**
  * Get value of field E01CDPTOT as a String.
  */
  public String getE01CDPTOT()
  {
    return fieldE01CDPTOT.getString();
  }

  /**
  * Set numeric field E01CDPTOT using a BigDecimal value.
  */
  public void setE01CDPTOT(BigDecimal newvalue)
  {
    fieldE01CDPTOT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDPTOT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDPTOT()
  {
    return fieldE01CDPTOT.getBigDecimal();
  }

  /**
  * Set field E01CDPREG using a String value.
  */
  public void setE01CDPREG(String newvalue)
  {
    fieldE01CDPREG.setString(newvalue);
  }

  /**
  * Get value of field E01CDPREG as a String.
  */
  public String getE01CDPREG()
  {
    return fieldE01CDPREG.getString();
  }

  /**
  * Set numeric field E01CDPREG using a BigDecimal value.
  */
  public void setE01CDPREG(BigDecimal newvalue)
  {
    fieldE01CDPREG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDPREG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDPREG()
  {
    return fieldE01CDPREG.getBigDecimal();
  }

}
