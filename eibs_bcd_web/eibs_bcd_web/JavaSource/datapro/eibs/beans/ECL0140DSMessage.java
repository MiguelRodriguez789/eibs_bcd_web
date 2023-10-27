package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECL0140DS physical file definition.
* 
* File level identifier is 1130611112848.
* Record format level identifier is 4BC578DE0AFC9.
*/

public class ECL0140DSMessage extends MessageRecord
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
                                     "E01CODCLI",
                                     "E01TARNRO",
                                     "E01NOMCLI",
                                     "E01IDETIP",
                                     "E01IDECLI",
                                     "E01CTSSAC",
                                     "E01CTSLCR",
                                     "E01CTSSCO",
                                     "E01CTSCME",
                                     "E01CTSMUP",
                                     "E01CTSIVE",
                                     "E01CTSFPP",
                                     "E01CTSFUP",
                                     "E01CTSSDC",
                                     "E01CTSCVD",
                                     "E01CTSCID",
                                     "E01CTSSTA",
                                     "E01ESTDIS",
                                     "E01DESEDI",
                                     "E01CDOINT",
                                     "E01SDOCDI",
                                     "E01CDOVIA",
                                     "E01SDOCDV"
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
                                   "E01CODCLI",
                                   "E01TARNRO",
                                   "E01NOMCLI",
                                   "E01IDETIP",
                                   "E01IDECLI",
                                   "E01CTSSAC",
                                   "E01CTSLCR",
                                   "E01CTSSCO",
                                   "E01CTSCME",
                                   "E01CTSMUP",
                                   "E01CTSIVE",
                                   "E01CTSFPP",
                                   "E01CTSFUP",
                                   "E01CTSSDC",
                                   "E01CTSCVD",
                                   "E01CTSCID",
                                   "E01CTSSTA",
                                   "E01ESTDIS",
                                   "E01DESEDI",
                                   "E01CDOINT",
                                   "E01SDOCDI",
                                   "E01CDOVIA",
                                   "E01SDOCDV"
                                 };
  final static String fid = "1130611112848";
  final static String rid = "4BC578DE0AFC9";
  final static String fmtname = "ECL0140DS";
  final int FIELDCOUNT = 32;
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
  private CharacterField fieldE01CODCLI = null;
  private CharacterField fieldE01TARNRO = null;
  private CharacterField fieldE01NOMCLI = null;
  private CharacterField fieldE01IDETIP = null;
  private CharacterField fieldE01IDECLI = null;
  private DecimalField fieldE01CTSSAC = null;
  private DecimalField fieldE01CTSLCR = null;
  private DecimalField fieldE01CTSSCO = null;
  private DecimalField fieldE01CTSCME = null;
  private DecimalField fieldE01CTSMUP = null;
  private DecimalField fieldE01CTSIVE = null;
  private DecimalField fieldE01CTSFPP = null;
  private DecimalField fieldE01CTSFUP = null;
  private DecimalField fieldE01CTSSDC = null;
  private DecimalField fieldE01CTSCVD = null;
  private DecimalField fieldE01CTSCID = null;
  private CharacterField fieldE01CTSSTA = null;
  private CharacterField fieldE01ESTDIS = null;
  private CharacterField fieldE01DESEDI = null;
  private DecimalField fieldE01CDOINT = null;
  private DecimalField fieldE01SDOCDI = null;
  private DecimalField fieldE01CDOVIA = null;
  private DecimalField fieldE01SDOCDV = null;

  /**
  * Constructor for ECL0140DSMessage.
  */
  public ECL0140DSMessage()
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
    recordsize = 430;
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
    fields[9] = fieldE01CODCLI =
    new CharacterField(message, HEADERSIZE + 42, 10, "E01CODCLI");
    fields[10] = fieldE01TARNRO =
    new CharacterField(message, HEADERSIZE + 52, 20, "E01TARNRO");
    fields[11] = fieldE01NOMCLI =
    new CharacterField(message, HEADERSIZE + 72, 45, "E01NOMCLI");
    fields[12] = fieldE01IDETIP =
    new CharacterField(message, HEADERSIZE + 117, 1, "E01IDETIP");
    fields[13] = fieldE01IDECLI =
    new CharacterField(message, HEADERSIZE + 118, 25, "E01IDECLI");
    fields[14] = fieldE01CTSSAC =
    new DecimalField(message, HEADERSIZE + 143, 17, 2, "E01CTSSAC");
    fields[15] = fieldE01CTSLCR =
    new DecimalField(message, HEADERSIZE + 160, 17, 2, "E01CTSLCR");
    fields[16] = fieldE01CTSSCO =
    new DecimalField(message, HEADERSIZE + 177, 17, 2, "E01CTSSCO");
    fields[17] = fieldE01CTSCME =
    new DecimalField(message, HEADERSIZE + 194, 17, 2, "E01CTSCME");
    fields[18] = fieldE01CTSMUP =
    new DecimalField(message, HEADERSIZE + 211, 17, 2, "E01CTSMUP");
    fields[19] = fieldE01CTSIVE =
    new DecimalField(message, HEADERSIZE + 228, 17, 2, "E01CTSIVE");
    fields[20] = fieldE01CTSFPP =
    new DecimalField(message, HEADERSIZE + 245, 9, 0, "E01CTSFPP");
    fields[21] = fieldE01CTSFUP =
    new DecimalField(message, HEADERSIZE + 254, 9, 0, "E01CTSFUP");
    fields[22] = fieldE01CTSSDC =
    new DecimalField(message, HEADERSIZE + 263, 17, 2, "E01CTSSDC");
    fields[23] = fieldE01CTSCVD =
    new DecimalField(message, HEADERSIZE + 280, 17, 2, "E01CTSCVD");
    fields[24] = fieldE01CTSCID =
    new DecimalField(message, HEADERSIZE + 297, 17, 2, "E01CTSCID");
    fields[25] = fieldE01CTSSTA =
    new CharacterField(message, HEADERSIZE + 314, 1, "E01CTSSTA");
    fields[26] = fieldE01ESTDIS =
    new CharacterField(message, HEADERSIZE + 315, 2, "E01ESTDIS");
    fields[27] = fieldE01DESEDI =
    new CharacterField(message, HEADERSIZE + 317, 45, "E01DESEDI");
    fields[28] = fieldE01CDOINT =
    new DecimalField(message, HEADERSIZE + 362, 17, 2, "E01CDOINT");
    fields[29] = fieldE01SDOCDI =
    new DecimalField(message, HEADERSIZE + 379, 17, 2, "E01SDOCDI");
    fields[30] = fieldE01CDOVIA =
    new DecimalField(message, HEADERSIZE + 396, 17, 2, "E01CDOVIA");
    fields[31] = fieldE01SDOCDV =
    new DecimalField(message, HEADERSIZE + 413, 17, 2, "E01SDOCDV");

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
  * Set field E01CODCLI using a String value.
  */
  public void setE01CODCLI(String newvalue)
  {
    fieldE01CODCLI.setString(newvalue);
  }

  /**
  * Get value of field E01CODCLI as a String.
  */
  public String getE01CODCLI()
  {
    return fieldE01CODCLI.getString();
  }

  /**
  * Set field E01TARNRO using a String value.
  */
  public void setE01TARNRO(String newvalue)
  {
    fieldE01TARNRO.setString(newvalue);
  }

  /**
  * Get value of field E01TARNRO as a String.
  */
  public String getE01TARNRO()
  {
    return fieldE01TARNRO.getString();
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
  * Set field E01IDETIP using a String value.
  */
  public void setE01IDETIP(String newvalue)
  {
    fieldE01IDETIP.setString(newvalue);
  }

  /**
  * Get value of field E01IDETIP as a String.
  */
  public String getE01IDETIP()
  {
    return fieldE01IDETIP.getString();
  }

  /**
  * Set field E01IDECLI using a String value.
  */
  public void setE01IDECLI(String newvalue)
  {
    fieldE01IDECLI.setString(newvalue);
  }

  /**
  * Get value of field E01IDECLI as a String.
  */
  public String getE01IDECLI()
  {
    return fieldE01IDECLI.getString();
  }

  /**
  * Set field E01CTSSAC using a String value.
  */
  public void setE01CTSSAC(String newvalue)
  {
    fieldE01CTSSAC.setString(newvalue);
  }

  /**
  * Get value of field E01CTSSAC as a String.
  */
  public String getE01CTSSAC()
  {
    return fieldE01CTSSAC.getString();
  }

  /**
  * Set numeric field E01CTSSAC using a BigDecimal value.
  */
  public void setE01CTSSAC(BigDecimal newvalue)
  {
    fieldE01CTSSAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CTSSAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CTSSAC()
  {
    return fieldE01CTSSAC.getBigDecimal();
  }

  /**
  * Set field E01CTSLCR using a String value.
  */
  public void setE01CTSLCR(String newvalue)
  {
    fieldE01CTSLCR.setString(newvalue);
  }

  /**
  * Get value of field E01CTSLCR as a String.
  */
  public String getE01CTSLCR()
  {
    return fieldE01CTSLCR.getString();
  }

  /**
  * Set numeric field E01CTSLCR using a BigDecimal value.
  */
  public void setE01CTSLCR(BigDecimal newvalue)
  {
    fieldE01CTSLCR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CTSLCR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CTSLCR()
  {
    return fieldE01CTSLCR.getBigDecimal();
  }

  /**
  * Set field E01CTSSCO using a String value.
  */
  public void setE01CTSSCO(String newvalue)
  {
    fieldE01CTSSCO.setString(newvalue);
  }

  /**
  * Get value of field E01CTSSCO as a String.
  */
  public String getE01CTSSCO()
  {
    return fieldE01CTSSCO.getString();
  }

  /**
  * Set numeric field E01CTSSCO using a BigDecimal value.
  */
  public void setE01CTSSCO(BigDecimal newvalue)
  {
    fieldE01CTSSCO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CTSSCO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CTSSCO()
  {
    return fieldE01CTSSCO.getBigDecimal();
  }

  /**
  * Set field E01CTSCME using a String value.
  */
  public void setE01CTSCME(String newvalue)
  {
    fieldE01CTSCME.setString(newvalue);
  }

  /**
  * Get value of field E01CTSCME as a String.
  */
  public String getE01CTSCME()
  {
    return fieldE01CTSCME.getString();
  }

  /**
  * Set numeric field E01CTSCME using a BigDecimal value.
  */
  public void setE01CTSCME(BigDecimal newvalue)
  {
    fieldE01CTSCME.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CTSCME as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CTSCME()
  {
    return fieldE01CTSCME.getBigDecimal();
  }

  /**
  * Set field E01CTSMUP using a String value.
  */
  public void setE01CTSMUP(String newvalue)
  {
    fieldE01CTSMUP.setString(newvalue);
  }

  /**
  * Get value of field E01CTSMUP as a String.
  */
  public String getE01CTSMUP()
  {
    return fieldE01CTSMUP.getString();
  }

  /**
  * Set numeric field E01CTSMUP using a BigDecimal value.
  */
  public void setE01CTSMUP(BigDecimal newvalue)
  {
    fieldE01CTSMUP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CTSMUP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CTSMUP()
  {
    return fieldE01CTSMUP.getBigDecimal();
  }

  /**
  * Set field E01CTSIVE using a String value.
  */
  public void setE01CTSIVE(String newvalue)
  {
    fieldE01CTSIVE.setString(newvalue);
  }

  /**
  * Get value of field E01CTSIVE as a String.
  */
  public String getE01CTSIVE()
  {
    return fieldE01CTSIVE.getString();
  }

  /**
  * Set numeric field E01CTSIVE using a BigDecimal value.
  */
  public void setE01CTSIVE(BigDecimal newvalue)
  {
    fieldE01CTSIVE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CTSIVE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CTSIVE()
  {
    return fieldE01CTSIVE.getBigDecimal();
  }

  /**
  * Set field E01CTSFPP using a String value.
  */
  public void setE01CTSFPP(String newvalue)
  {
    fieldE01CTSFPP.setString(newvalue);
  }

  /**
  * Get value of field E01CTSFPP as a String.
  */
  public String getE01CTSFPP()
  {
    return fieldE01CTSFPP.getString();
  }

  /**
  * Set numeric field E01CTSFPP using a BigDecimal value.
  */
  public void setE01CTSFPP(BigDecimal newvalue)
  {
    fieldE01CTSFPP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CTSFPP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CTSFPP()
  {
    return fieldE01CTSFPP.getBigDecimal();
  }

  /**
  * Set field E01CTSFUP using a String value.
  */
  public void setE01CTSFUP(String newvalue)
  {
    fieldE01CTSFUP.setString(newvalue);
  }

  /**
  * Get value of field E01CTSFUP as a String.
  */
  public String getE01CTSFUP()
  {
    return fieldE01CTSFUP.getString();
  }

  /**
  * Set numeric field E01CTSFUP using a BigDecimal value.
  */
  public void setE01CTSFUP(BigDecimal newvalue)
  {
    fieldE01CTSFUP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CTSFUP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CTSFUP()
  {
    return fieldE01CTSFUP.getBigDecimal();
  }

  /**
  * Set field E01CTSSDC using a String value.
  */
  public void setE01CTSSDC(String newvalue)
  {
    fieldE01CTSSDC.setString(newvalue);
  }

  /**
  * Get value of field E01CTSSDC as a String.
  */
  public String getE01CTSSDC()
  {
    return fieldE01CTSSDC.getString();
  }

  /**
  * Set numeric field E01CTSSDC using a BigDecimal value.
  */
  public void setE01CTSSDC(BigDecimal newvalue)
  {
    fieldE01CTSSDC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CTSSDC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CTSSDC()
  {
    return fieldE01CTSSDC.getBigDecimal();
  }

  /**
  * Set field E01CTSCVD using a String value.
  */
  public void setE01CTSCVD(String newvalue)
  {
    fieldE01CTSCVD.setString(newvalue);
  }

  /**
  * Get value of field E01CTSCVD as a String.
  */
  public String getE01CTSCVD()
  {
    return fieldE01CTSCVD.getString();
  }

  /**
  * Set numeric field E01CTSCVD using a BigDecimal value.
  */
  public void setE01CTSCVD(BigDecimal newvalue)
  {
    fieldE01CTSCVD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CTSCVD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CTSCVD()
  {
    return fieldE01CTSCVD.getBigDecimal();
  }

  /**
  * Set field E01CTSCID using a String value.
  */
  public void setE01CTSCID(String newvalue)
  {
    fieldE01CTSCID.setString(newvalue);
  }

  /**
  * Get value of field E01CTSCID as a String.
  */
  public String getE01CTSCID()
  {
    return fieldE01CTSCID.getString();
  }

  /**
  * Set numeric field E01CTSCID using a BigDecimal value.
  */
  public void setE01CTSCID(BigDecimal newvalue)
  {
    fieldE01CTSCID.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CTSCID as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CTSCID()
  {
    return fieldE01CTSCID.getBigDecimal();
  }

  /**
  * Set field E01CTSSTA using a String value.
  */
  public void setE01CTSSTA(String newvalue)
  {
    fieldE01CTSSTA.setString(newvalue);
  }

  /**
  * Get value of field E01CTSSTA as a String.
  */
  public String getE01CTSSTA()
  {
    return fieldE01CTSSTA.getString();
  }

  /**
  * Set field E01ESTDIS using a String value.
  */
  public void setE01ESTDIS(String newvalue)
  {
    fieldE01ESTDIS.setString(newvalue);
  }

  /**
  * Get value of field E01ESTDIS as a String.
  */
  public String getE01ESTDIS()
  {
    return fieldE01ESTDIS.getString();
  }

  /**
  * Set field E01DESEDI using a String value.
  */
  public void setE01DESEDI(String newvalue)
  {
    fieldE01DESEDI.setString(newvalue);
  }

  /**
  * Get value of field E01DESEDI as a String.
  */
  public String getE01DESEDI()
  {
    return fieldE01DESEDI.getString();
  }

  /**
  * Set field E01CDOINT using a String value.
  */
  public void setE01CDOINT(String newvalue)
  {
    fieldE01CDOINT.setString(newvalue);
  }

  /**
  * Get value of field E01CDOINT as a String.
  */
  public String getE01CDOINT()
  {
    return fieldE01CDOINT.getString();
  }

  /**
  * Set numeric field E01CDOINT using a BigDecimal value.
  */
  public void setE01CDOINT(BigDecimal newvalue)
  {
    fieldE01CDOINT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDOINT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDOINT()
  {
    return fieldE01CDOINT.getBigDecimal();
  }

  /**
  * Set field E01SDOCDI using a String value.
  */
  public void setE01SDOCDI(String newvalue)
  {
    fieldE01SDOCDI.setString(newvalue);
  }

  /**
  * Get value of field E01SDOCDI as a String.
  */
  public String getE01SDOCDI()
  {
    return fieldE01SDOCDI.getString();
  }

  /**
  * Set numeric field E01SDOCDI using a BigDecimal value.
  */
  public void setE01SDOCDI(BigDecimal newvalue)
  {
    fieldE01SDOCDI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SDOCDI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SDOCDI()
  {
    return fieldE01SDOCDI.getBigDecimal();
  }

  /**
  * Set field E01CDOVIA using a String value.
  */
  public void setE01CDOVIA(String newvalue)
  {
    fieldE01CDOVIA.setString(newvalue);
  }

  /**
  * Get value of field E01CDOVIA as a String.
  */
  public String getE01CDOVIA()
  {
    return fieldE01CDOVIA.getString();
  }

  /**
  * Set numeric field E01CDOVIA using a BigDecimal value.
  */
  public void setE01CDOVIA(BigDecimal newvalue)
  {
    fieldE01CDOVIA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDOVIA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDOVIA()
  {
    return fieldE01CDOVIA.getBigDecimal();
  }

  /**
  * Set field E01SDOCDV using a String value.
  */
  public void setE01SDOCDV(String newvalue)
  {
    fieldE01SDOCDV.setString(newvalue);
  }

  /**
  * Get value of field E01SDOCDV as a String.
  */
  public String getE01SDOCDV()
  {
    return fieldE01SDOCDV.getString();
  }

  /**
  * Set numeric field E01SDOCDV using a BigDecimal value.
  */
  public void setE01SDOCDV(BigDecimal newvalue)
  {
    fieldE01SDOCDV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SDOCDV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SDOCDV()
  {
    return fieldE01SDOCDV.getBigDecimal();
  }

}
