package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL114801 physical file definition.
* 
* File level identifier is 1170221165555.
* Record format level identifier is 332819C96B3DA.
*/

public class EDL114801Message extends MessageRecord
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
                                     "E01DEAACC",
                                     "E01DEABNK",
                                     "E01DEABRN",
                                     "E01DEACUN",
                                     "E01CUSNA1",
                                     "E01STATUS",
                                     "E01FLGSEL",
                                     "E01DEAOAM",
                                     "E01DEAODM",
                                     "E01DEAODD",
                                     "E01DEAODY",
                                     "E01DEAMDM",
                                     "E01DEAMDD",
                                     "E01DEAMDY",
                                     "E01DEATRM",
                                     "E01DEATRC",
                                     "E01LNSRTE",
                                     "E01LNSBAS",
                                     "E01DEAMEP",
                                     "E01DEAMEI",
                                     "E01DEAMEM",
                                     "E01TOTDUE",
                                     "E01DLUFSM",
                                     "E01DLUFSD",
                                     "E01DLUFSY"
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
                                   "E01DEAACC",
                                   "E01DEABNK",
                                   "E01DEABRN",
                                   "E01DEACUN",
                                   "E01CUSNA1",
                                   "E01STATUS",
                                   "E01FLGSEL",
                                   "E01DEAOAM",
                                   "E01DEAODM",
                                   "E01DEAODD",
                                   "E01DEAODY",
                                   "E01DEAMDM",
                                   "E01DEAMDD",
                                   "E01DEAMDY",
                                   "E01DEATRM",
                                   "E01DEATRC",
                                   "E01LNSRTE",
                                   "E01LNSBAS",
                                   "E01DEAMEP",
                                   "E01DEAMEI",
                                   "E01DEAMEM",
                                   "E01TOTDUE",
                                   "E01DLUFSM",
                                   "E01DLUFSD",
                                   "E01DLUFSY"
                                 };
  final static String fid = "1170221165555";
  final static String rid = "332819C96B3DA";
  final static String fmtname = "EDL114801";
  final int FIELDCOUNT = 34;
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
  private DecimalField fieldE01DEAACC = null;
  private CharacterField fieldE01DEABNK = null;
  private DecimalField fieldE01DEABRN = null;
  private DecimalField fieldE01DEACUN = null;
  private CharacterField fieldE01CUSNA1 = null;
  private CharacterField fieldE01STATUS = null;
  private CharacterField fieldE01FLGSEL = null;
  private DecimalField fieldE01DEAOAM = null;
  private DecimalField fieldE01DEAODM = null;
  private DecimalField fieldE01DEAODD = null;
  private DecimalField fieldE01DEAODY = null;
  private DecimalField fieldE01DEAMDM = null;
  private DecimalField fieldE01DEAMDD = null;
  private DecimalField fieldE01DEAMDY = null;
  private DecimalField fieldE01DEATRM = null;
  private CharacterField fieldE01DEATRC = null;
  private DecimalField fieldE01LNSRTE = null;
  private DecimalField fieldE01LNSBAS = null;
  private DecimalField fieldE01DEAMEP = null;
  private DecimalField fieldE01DEAMEI = null;
  private DecimalField fieldE01DEAMEM = null;
  private DecimalField fieldE01TOTDUE = null;
  private DecimalField fieldE01DLUFSM = null;
  private DecimalField fieldE01DLUFSD = null;
  private DecimalField fieldE01DLUFSY = null;

  /**
  * Constructor for EDL114801Message.
  */
  public EDL114801Message()
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
    recordsize = 318;
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
    fields[9] = fieldE01DEAACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01DEAACC");
    fields[10] = fieldE01DEABNK =
    new CharacterField(message, HEADERSIZE + 55, 2, "E01DEABNK");
    fields[11] = fieldE01DEABRN =
    new DecimalField(message, HEADERSIZE + 57, 5, 0, "E01DEABRN");
    fields[12] = fieldE01DEACUN =
    new DecimalField(message, HEADERSIZE + 62, 10, 0, "E01DEACUN");
    fields[13] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 72, 60, "E01CUSNA1");
    fields[14] = fieldE01STATUS =
    new CharacterField(message, HEADERSIZE + 132, 45, "E01STATUS");
    fields[15] = fieldE01FLGSEL =
    new CharacterField(message, HEADERSIZE + 177, 1, "E01FLGSEL");
    fields[16] = fieldE01DEAOAM =
    new DecimalField(message, HEADERSIZE + 178, 17, 2, "E01DEAOAM");
    fields[17] = fieldE01DEAODM =
    new DecimalField(message, HEADERSIZE + 195, 3, 0, "E01DEAODM");
    fields[18] = fieldE01DEAODD =
    new DecimalField(message, HEADERSIZE + 198, 3, 0, "E01DEAODD");
    fields[19] = fieldE01DEAODY =
    new DecimalField(message, HEADERSIZE + 201, 5, 0, "E01DEAODY");
    fields[20] = fieldE01DEAMDM =
    new DecimalField(message, HEADERSIZE + 206, 3, 0, "E01DEAMDM");
    fields[21] = fieldE01DEAMDD =
    new DecimalField(message, HEADERSIZE + 209, 3, 0, "E01DEAMDD");
    fields[22] = fieldE01DEAMDY =
    new DecimalField(message, HEADERSIZE + 212, 5, 0, "E01DEAMDY");
    fields[23] = fieldE01DEATRM =
    new DecimalField(message, HEADERSIZE + 217, 6, 0, "E01DEATRM");
    fields[24] = fieldE01DEATRC =
    new CharacterField(message, HEADERSIZE + 223, 1, "E01DEATRC");
    fields[25] = fieldE01LNSRTE =
    new DecimalField(message, HEADERSIZE + 224, 11, 6, "E01LNSRTE");
    fields[26] = fieldE01LNSBAS =
    new DecimalField(message, HEADERSIZE + 235, 4, 0, "E01LNSBAS");
    fields[27] = fieldE01DEAMEP =
    new DecimalField(message, HEADERSIZE + 239, 17, 2, "E01DEAMEP");
    fields[28] = fieldE01DEAMEI =
    new DecimalField(message, HEADERSIZE + 256, 17, 2, "E01DEAMEI");
    fields[29] = fieldE01DEAMEM =
    new DecimalField(message, HEADERSIZE + 273, 17, 2, "E01DEAMEM");
    fields[30] = fieldE01TOTDUE =
    new DecimalField(message, HEADERSIZE + 290, 17, 2, "E01TOTDUE");
    fields[31] = fieldE01DLUFSM =
    new DecimalField(message, HEADERSIZE + 307, 3, 0, "E01DLUFSM");
    fields[32] = fieldE01DLUFSD =
    new DecimalField(message, HEADERSIZE + 310, 3, 0, "E01DLUFSD");
    fields[33] = fieldE01DLUFSY =
    new DecimalField(message, HEADERSIZE + 313, 5, 0, "E01DLUFSY");

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
  * Set field E01DEAACC using a String value.
  */
  public void setE01DEAACC(String newvalue)
  {
    fieldE01DEAACC.setString(newvalue);
  }

  /**
  * Get value of field E01DEAACC as a String.
  */
  public String getE01DEAACC()
  {
    return fieldE01DEAACC.getString();
  }

  /**
  * Set numeric field E01DEAACC using a BigDecimal value.
  */
  public void setE01DEAACC(BigDecimal newvalue)
  {
    fieldE01DEAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAACC()
  {
    return fieldE01DEAACC.getBigDecimal();
  }

  /**
  * Set field E01DEABNK using a String value.
  */
  public void setE01DEABNK(String newvalue)
  {
    fieldE01DEABNK.setString(newvalue);
  }

  /**
  * Get value of field E01DEABNK as a String.
  */
  public String getE01DEABNK()
  {
    return fieldE01DEABNK.getString();
  }

  /**
  * Set field E01DEABRN using a String value.
  */
  public void setE01DEABRN(String newvalue)
  {
    fieldE01DEABRN.setString(newvalue);
  }

  /**
  * Get value of field E01DEABRN as a String.
  */
  public String getE01DEABRN()
  {
    return fieldE01DEABRN.getString();
  }

  /**
  * Set numeric field E01DEABRN using a BigDecimal value.
  */
  public void setE01DEABRN(BigDecimal newvalue)
  {
    fieldE01DEABRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEABRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEABRN()
  {
    return fieldE01DEABRN.getBigDecimal();
  }

  /**
  * Set field E01DEACUN using a String value.
  */
  public void setE01DEACUN(String newvalue)
  {
    fieldE01DEACUN.setString(newvalue);
  }

  /**
  * Get value of field E01DEACUN as a String.
  */
  public String getE01DEACUN()
  {
    return fieldE01DEACUN.getString();
  }

  /**
  * Set numeric field E01DEACUN using a BigDecimal value.
  */
  public void setE01DEACUN(BigDecimal newvalue)
  {
    fieldE01DEACUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEACUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEACUN()
  {
    return fieldE01DEACUN.getBigDecimal();
  }

  /**
  * Set field E01CUSNA1 using a String value.
  */
  public void setE01CUSNA1(String newvalue)
  {
    fieldE01CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E01CUSNA1 as a String.
  */
  public String getE01CUSNA1()
  {
    return fieldE01CUSNA1.getString();
  }

  /**
  * Set field E01STATUS using a String value.
  */
  public void setE01STATUS(String newvalue)
  {
    fieldE01STATUS.setString(newvalue);
  }

  /**
  * Get value of field E01STATUS as a String.
  */
  public String getE01STATUS()
  {
    return fieldE01STATUS.getString();
  }

  /**
  * Set field E01FLGSEL using a String value.
  */
  public void setE01FLGSEL(String newvalue)
  {
    fieldE01FLGSEL.setString(newvalue);
  }

  /**
  * Get value of field E01FLGSEL as a String.
  */
  public String getE01FLGSEL()
  {
    return fieldE01FLGSEL.getString();
  }

  /**
  * Set field E01DEAOAM using a String value.
  */
  public void setE01DEAOAM(String newvalue)
  {
    fieldE01DEAOAM.setString(newvalue);
  }

  /**
  * Get value of field E01DEAOAM as a String.
  */
  public String getE01DEAOAM()
  {
    return fieldE01DEAOAM.getString();
  }

  /**
  * Set numeric field E01DEAOAM using a BigDecimal value.
  */
  public void setE01DEAOAM(BigDecimal newvalue)
  {
    fieldE01DEAOAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAOAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAOAM()
  {
    return fieldE01DEAOAM.getBigDecimal();
  }

  /**
  * Set field E01DEAODM using a String value.
  */
  public void setE01DEAODM(String newvalue)
  {
    fieldE01DEAODM.setString(newvalue);
  }

  /**
  * Get value of field E01DEAODM as a String.
  */
  public String getE01DEAODM()
  {
    return fieldE01DEAODM.getString();
  }

  /**
  * Set numeric field E01DEAODM using a BigDecimal value.
  */
  public void setE01DEAODM(BigDecimal newvalue)
  {
    fieldE01DEAODM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAODM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAODM()
  {
    return fieldE01DEAODM.getBigDecimal();
  }

  /**
  * Set field E01DEAODD using a String value.
  */
  public void setE01DEAODD(String newvalue)
  {
    fieldE01DEAODD.setString(newvalue);
  }

  /**
  * Get value of field E01DEAODD as a String.
  */
  public String getE01DEAODD()
  {
    return fieldE01DEAODD.getString();
  }

  /**
  * Set numeric field E01DEAODD using a BigDecimal value.
  */
  public void setE01DEAODD(BigDecimal newvalue)
  {
    fieldE01DEAODD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAODD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAODD()
  {
    return fieldE01DEAODD.getBigDecimal();
  }

  /**
  * Set field E01DEAODY using a String value.
  */
  public void setE01DEAODY(String newvalue)
  {
    fieldE01DEAODY.setString(newvalue);
  }

  /**
  * Get value of field E01DEAODY as a String.
  */
  public String getE01DEAODY()
  {
    return fieldE01DEAODY.getString();
  }

  /**
  * Set numeric field E01DEAODY using a BigDecimal value.
  */
  public void setE01DEAODY(BigDecimal newvalue)
  {
    fieldE01DEAODY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAODY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAODY()
  {
    return fieldE01DEAODY.getBigDecimal();
  }

  /**
  * Set field E01DEAMDM using a String value.
  */
  public void setE01DEAMDM(String newvalue)
  {
    fieldE01DEAMDM.setString(newvalue);
  }

  /**
  * Get value of field E01DEAMDM as a String.
  */
  public String getE01DEAMDM()
  {
    return fieldE01DEAMDM.getString();
  }

  /**
  * Set numeric field E01DEAMDM using a BigDecimal value.
  */
  public void setE01DEAMDM(BigDecimal newvalue)
  {
    fieldE01DEAMDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAMDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAMDM()
  {
    return fieldE01DEAMDM.getBigDecimal();
  }

  /**
  * Set field E01DEAMDD using a String value.
  */
  public void setE01DEAMDD(String newvalue)
  {
    fieldE01DEAMDD.setString(newvalue);
  }

  /**
  * Get value of field E01DEAMDD as a String.
  */
  public String getE01DEAMDD()
  {
    return fieldE01DEAMDD.getString();
  }

  /**
  * Set numeric field E01DEAMDD using a BigDecimal value.
  */
  public void setE01DEAMDD(BigDecimal newvalue)
  {
    fieldE01DEAMDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAMDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAMDD()
  {
    return fieldE01DEAMDD.getBigDecimal();
  }

  /**
  * Set field E01DEAMDY using a String value.
  */
  public void setE01DEAMDY(String newvalue)
  {
    fieldE01DEAMDY.setString(newvalue);
  }

  /**
  * Get value of field E01DEAMDY as a String.
  */
  public String getE01DEAMDY()
  {
    return fieldE01DEAMDY.getString();
  }

  /**
  * Set numeric field E01DEAMDY using a BigDecimal value.
  */
  public void setE01DEAMDY(BigDecimal newvalue)
  {
    fieldE01DEAMDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAMDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAMDY()
  {
    return fieldE01DEAMDY.getBigDecimal();
  }

  /**
  * Set field E01DEATRM using a String value.
  */
  public void setE01DEATRM(String newvalue)
  {
    fieldE01DEATRM.setString(newvalue);
  }

  /**
  * Get value of field E01DEATRM as a String.
  */
  public String getE01DEATRM()
  {
    return fieldE01DEATRM.getString();
  }

  /**
  * Set numeric field E01DEATRM using a BigDecimal value.
  */
  public void setE01DEATRM(BigDecimal newvalue)
  {
    fieldE01DEATRM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEATRM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEATRM()
  {
    return fieldE01DEATRM.getBigDecimal();
  }

  /**
  * Set field E01DEATRC using a String value.
  */
  public void setE01DEATRC(String newvalue)
  {
    fieldE01DEATRC.setString(newvalue);
  }

  /**
  * Get value of field E01DEATRC as a String.
  */
  public String getE01DEATRC()
  {
    return fieldE01DEATRC.getString();
  }

  /**
  * Set field E01LNSRTE using a String value.
  */
  public void setE01LNSRTE(String newvalue)
  {
    fieldE01LNSRTE.setString(newvalue);
  }

  /**
  * Get value of field E01LNSRTE as a String.
  */
  public String getE01LNSRTE()
  {
    return fieldE01LNSRTE.getString();
  }

  /**
  * Set numeric field E01LNSRTE using a BigDecimal value.
  */
  public void setE01LNSRTE(BigDecimal newvalue)
  {
    fieldE01LNSRTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LNSRTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LNSRTE()
  {
    return fieldE01LNSRTE.getBigDecimal();
  }

  /**
  * Set field E01LNSBAS using a String value.
  */
  public void setE01LNSBAS(String newvalue)
  {
    fieldE01LNSBAS.setString(newvalue);
  }

  /**
  * Get value of field E01LNSBAS as a String.
  */
  public String getE01LNSBAS()
  {
    return fieldE01LNSBAS.getString();
  }

  /**
  * Set numeric field E01LNSBAS using a BigDecimal value.
  */
  public void setE01LNSBAS(BigDecimal newvalue)
  {
    fieldE01LNSBAS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LNSBAS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LNSBAS()
  {
    return fieldE01LNSBAS.getBigDecimal();
  }

  /**
  * Set field E01DEAMEP using a String value.
  */
  public void setE01DEAMEP(String newvalue)
  {
    fieldE01DEAMEP.setString(newvalue);
  }

  /**
  * Get value of field E01DEAMEP as a String.
  */
  public String getE01DEAMEP()
  {
    return fieldE01DEAMEP.getString();
  }

  /**
  * Set numeric field E01DEAMEP using a BigDecimal value.
  */
  public void setE01DEAMEP(BigDecimal newvalue)
  {
    fieldE01DEAMEP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAMEP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAMEP()
  {
    return fieldE01DEAMEP.getBigDecimal();
  }

  /**
  * Set field E01DEAMEI using a String value.
  */
  public void setE01DEAMEI(String newvalue)
  {
    fieldE01DEAMEI.setString(newvalue);
  }

  /**
  * Get value of field E01DEAMEI as a String.
  */
  public String getE01DEAMEI()
  {
    return fieldE01DEAMEI.getString();
  }

  /**
  * Set numeric field E01DEAMEI using a BigDecimal value.
  */
  public void setE01DEAMEI(BigDecimal newvalue)
  {
    fieldE01DEAMEI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAMEI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAMEI()
  {
    return fieldE01DEAMEI.getBigDecimal();
  }

  /**
  * Set field E01DEAMEM using a String value.
  */
  public void setE01DEAMEM(String newvalue)
  {
    fieldE01DEAMEM.setString(newvalue);
  }

  /**
  * Get value of field E01DEAMEM as a String.
  */
  public String getE01DEAMEM()
  {
    return fieldE01DEAMEM.getString();
  }

  /**
  * Set numeric field E01DEAMEM using a BigDecimal value.
  */
  public void setE01DEAMEM(BigDecimal newvalue)
  {
    fieldE01DEAMEM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAMEM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAMEM()
  {
    return fieldE01DEAMEM.getBigDecimal();
  }

  /**
  * Set field E01TOTDUE using a String value.
  */
  public void setE01TOTDUE(String newvalue)
  {
    fieldE01TOTDUE.setString(newvalue);
  }

  /**
  * Get value of field E01TOTDUE as a String.
  */
  public String getE01TOTDUE()
  {
    return fieldE01TOTDUE.getString();
  }

  /**
  * Set numeric field E01TOTDUE using a BigDecimal value.
  */
  public void setE01TOTDUE(BigDecimal newvalue)
  {
    fieldE01TOTDUE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTDUE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTDUE()
  {
    return fieldE01TOTDUE.getBigDecimal();
  }

  /**
  * Set field E01DLUFSM using a String value.
  */
  public void setE01DLUFSM(String newvalue)
  {
    fieldE01DLUFSM.setString(newvalue);
  }

  /**
  * Get value of field E01DLUFSM as a String.
  */
  public String getE01DLUFSM()
  {
    return fieldE01DLUFSM.getString();
  }

  /**
  * Set numeric field E01DLUFSM using a BigDecimal value.
  */
  public void setE01DLUFSM(BigDecimal newvalue)
  {
    fieldE01DLUFSM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLUFSM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLUFSM()
  {
    return fieldE01DLUFSM.getBigDecimal();
  }

  /**
  * Set field E01DLUFSD using a String value.
  */
  public void setE01DLUFSD(String newvalue)
  {
    fieldE01DLUFSD.setString(newvalue);
  }

  /**
  * Get value of field E01DLUFSD as a String.
  */
  public String getE01DLUFSD()
  {
    return fieldE01DLUFSD.getString();
  }

  /**
  * Set numeric field E01DLUFSD using a BigDecimal value.
  */
  public void setE01DLUFSD(BigDecimal newvalue)
  {
    fieldE01DLUFSD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLUFSD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLUFSD()
  {
    return fieldE01DLUFSD.getBigDecimal();
  }

  /**
  * Set field E01DLUFSY using a String value.
  */
  public void setE01DLUFSY(String newvalue)
  {
    fieldE01DLUFSY.setString(newvalue);
  }

  /**
  * Get value of field E01DLUFSY as a String.
  */
  public String getE01DLUFSY()
  {
    return fieldE01DLUFSY.getString();
  }

  /**
  * Set numeric field E01DLUFSY using a BigDecimal value.
  */
  public void setE01DLUFSY(BigDecimal newvalue)
  {
    fieldE01DLUFSY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLUFSY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLUFSY()
  {
    return fieldE01DLUFSY.getBigDecimal();
  }

}
