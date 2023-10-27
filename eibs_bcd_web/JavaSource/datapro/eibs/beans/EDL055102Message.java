package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL055102 physical file definition.
* 
* File level identifier is 1180521221400.
* Record format level identifier is 2B45111E97790.
*/

public class EDL055102Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H02USERID",
                                     "H02PROGRM",
                                     "H02TIMSYS",
                                     "H02SCRCOD",
                                     "H02OPECOD",
                                     "H02FLGMAS",
                                     "H02FLGWK1",
                                     "H02FLGWK2",
                                     "H02FLGWK3",
                                     "E02DLMCDE",
                                     "E02MONTOA",
                                     "E02DLMACC",
                                     "E02DLMALI",
                                     "E02DLMBRN",
                                     "E02DLMMOD",
                                     "E02DLMMOR",
                                     "E02DLMCUN",
                                     "E02DLMTYP",
                                     "E02DLMPRO",
                                     "E02DLMMEP",
                                     "E02DLMPPR",
                                     "E02DLMPAC",
                                     "E02DLMPTO",
                                     "E02DLMPPP",
                                     "E02DLMLMM",
                                     "E02DLMLMD",
                                     "E02DLMLMY",
                                     "E02DLMLMU",
                                     "E02DLMLMT",
                                     "E02TOTMEP",
                                     "E02TOTPPR",
                                     "E02TOTPAC",
                                     "E02TOTPTO"
                                   };
  final static String tnames[] = {
                                   "H02USERID",
                                   "H02PROGRM",
                                   "H02TIMSYS",
                                   "H02SCRCOD",
                                   "H02OPECOD",
                                   "H02FLGMAS",
                                   "H02FLGWK1",
                                   "H02FLGWK2",
                                   "H02FLGWK3",
                                   "E02DLMCDE",
                                   "E02MONTOA",
                                   "E02DLMACC",
                                   "E02DLMALI",
                                   "E02DLMBRN",
                                   "E02DLMMOD",
                                   "E02DLMMOR",
                                   "E02DLMCUN",
                                   "E02DLMTYP",
                                   "E02DLMPRO",
                                   "E02DLMMEP",
                                   "E02DLMPPR",
                                   "E02DLMPAC",
                                   "E02DLMPTO",
                                   "E02DLMPPP",
                                   "E02DLMLMM",
                                   "E02DLMLMD",
                                   "E02DLMLMY",
                                   "E02DLMLMU",
                                   "E02DLMLMT",
                                   "E02TOTMEP",
                                   "E02TOTPPR",
                                   "E02TOTPAC",
                                   "E02TOTPTO"
                                 };
  final static String fid = "1180521221400";
  final static String rid = "2B45111E97790";
  final static String fmtname = "EDL055102";
  final int FIELDCOUNT = 33;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH02USERID = null;
  private CharacterField fieldH02PROGRM = null;
  private CharacterField fieldH02TIMSYS = null;
  private CharacterField fieldH02SCRCOD = null;
  private CharacterField fieldH02OPECOD = null;
  private CharacterField fieldH02FLGMAS = null;
  private CharacterField fieldH02FLGWK1 = null;
  private CharacterField fieldH02FLGWK2 = null;
  private CharacterField fieldH02FLGWK3 = null;
  private CharacterField fieldE02DLMCDE = null;
  private DecimalField fieldE02MONTOA = null;
  private DecimalField fieldE02DLMACC = null;
  private CharacterField fieldE02DLMALI = null;
  private DecimalField fieldE02DLMBRN = null;
  private CharacterField fieldE02DLMMOD = null;
  private DecimalField fieldE02DLMMOR = null;
  private DecimalField fieldE02DLMCUN = null;
  private CharacterField fieldE02DLMTYP = null;
  private CharacterField fieldE02DLMPRO = null;
  private DecimalField fieldE02DLMMEP = null;
  private DecimalField fieldE02DLMPPR = null;
  private DecimalField fieldE02DLMPAC = null;
  private DecimalField fieldE02DLMPTO = null;
  private DecimalField fieldE02DLMPPP = null;
  private DecimalField fieldE02DLMLMM = null;
  private DecimalField fieldE02DLMLMD = null;
  private DecimalField fieldE02DLMLMY = null;
  private CharacterField fieldE02DLMLMU = null;
  private CharacterField fieldE02DLMLMT = null;
  private DecimalField fieldE02TOTMEP = null;
  private DecimalField fieldE02TOTPPR = null;
  private DecimalField fieldE02TOTPAC = null;
  private DecimalField fieldE02TOTPTO = null;

  /**
  * Constructor for EDL055102Message.
  */
  public EDL055102Message()
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
    recordsize = 299;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH02USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H02USERID");
    fields[1] = fieldH02PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H02PROGRM");
    fields[2] = fieldH02TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H02TIMSYS");
    fields[3] = fieldH02SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H02SCRCOD");
    fields[4] = fieldH02OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H02OPECOD");
    fields[5] = fieldH02FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H02FLGMAS");
    fields[6] = fieldH02FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H02FLGWK1");
    fields[7] = fieldH02FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H02FLGWK2");
    fields[8] = fieldH02FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H02FLGWK3");
    fields[9] = fieldE02DLMCDE =
    new CharacterField(message, HEADERSIZE + 42, 4, "E02DLMCDE");
    fields[10] = fieldE02MONTOA =
    new DecimalField(message, HEADERSIZE + 46, 17, 2, "E02MONTOA");
    fields[11] = fieldE02DLMACC =
    new DecimalField(message, HEADERSIZE + 63, 13, 0, "E02DLMACC");
    fields[12] = fieldE02DLMALI =
    new CharacterField(message, HEADERSIZE + 76, 2, "E02DLMALI");
    fields[13] = fieldE02DLMBRN =
    new DecimalField(message, HEADERSIZE + 78, 5, 0, "E02DLMBRN");
    fields[14] = fieldE02DLMMOD =
    new CharacterField(message, HEADERSIZE + 83, 1, "E02DLMMOD");
    fields[15] = fieldE02DLMMOR =
    new DecimalField(message, HEADERSIZE + 84, 6, 0, "E02DLMMOR");
    fields[16] = fieldE02DLMCUN =
    new DecimalField(message, HEADERSIZE + 90, 10, 0, "E02DLMCUN");
    fields[17] = fieldE02DLMTYP =
    new CharacterField(message, HEADERSIZE + 100, 4, "E02DLMTYP");
    fields[18] = fieldE02DLMPRO =
    new CharacterField(message, HEADERSIZE + 104, 4, "E02DLMPRO");
    fields[19] = fieldE02DLMMEP =
    new DecimalField(message, HEADERSIZE + 108, 17, 2, "E02DLMMEP");
    fields[20] = fieldE02DLMPPR =
    new DecimalField(message, HEADERSIZE + 125, 17, 2, "E02DLMPPR");
    fields[21] = fieldE02DLMPAC =
    new DecimalField(message, HEADERSIZE + 142, 17, 2, "E02DLMPAC");
    fields[22] = fieldE02DLMPTO =
    new DecimalField(message, HEADERSIZE + 159, 17, 2, "E02DLMPTO");
    fields[23] = fieldE02DLMPPP =
    new DecimalField(message, HEADERSIZE + 176, 8, 3, "E02DLMPPP");
    fields[24] = fieldE02DLMLMM =
    new DecimalField(message, HEADERSIZE + 184, 3, 0, "E02DLMLMM");
    fields[25] = fieldE02DLMLMD =
    new DecimalField(message, HEADERSIZE + 187, 3, 0, "E02DLMLMD");
    fields[26] = fieldE02DLMLMY =
    new DecimalField(message, HEADERSIZE + 190, 5, 0, "E02DLMLMY");
    fields[27] = fieldE02DLMLMU =
    new CharacterField(message, HEADERSIZE + 195, 10, "E02DLMLMU");
    fields[28] = fieldE02DLMLMT =
    new CharacterField(message, HEADERSIZE + 205, 26, "E02DLMLMT");
    fields[29] = fieldE02TOTMEP =
    new DecimalField(message, HEADERSIZE + 231, 17, 2, "E02TOTMEP");
    fields[30] = fieldE02TOTPPR =
    new DecimalField(message, HEADERSIZE + 248, 17, 2, "E02TOTPPR");
    fields[31] = fieldE02TOTPAC =
    new DecimalField(message, HEADERSIZE + 265, 17, 2, "E02TOTPAC");
    fields[32] = fieldE02TOTPTO =
    new DecimalField(message, HEADERSIZE + 282, 17, 2, "E02TOTPTO");

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
  * Set field H02USERID using a String value.
  */
  public void setH02USERID(String newvalue)
  {
    fieldH02USERID.setString(newvalue);
  }

  /**
  * Get value of field H02USERID as a String.
  */
  public String getH02USERID()
  {
    return fieldH02USERID.getString();
  }

  /**
  * Set field H02PROGRM using a String value.
  */
  public void setH02PROGRM(String newvalue)
  {
    fieldH02PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H02PROGRM as a String.
  */
  public String getH02PROGRM()
  {
    return fieldH02PROGRM.getString();
  }

  /**
  * Set field H02TIMSYS using a String value.
  */
  public void setH02TIMSYS(String newvalue)
  {
    fieldH02TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H02TIMSYS as a String.
  */
  public String getH02TIMSYS()
  {
    return fieldH02TIMSYS.getString();
  }

  /**
  * Set field H02SCRCOD using a String value.
  */
  public void setH02SCRCOD(String newvalue)
  {
    fieldH02SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H02SCRCOD as a String.
  */
  public String getH02SCRCOD()
  {
    return fieldH02SCRCOD.getString();
  }

  /**
  * Set field H02OPECOD using a String value.
  */
  public void setH02OPECOD(String newvalue)
  {
    fieldH02OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H02OPECOD as a String.
  */
  public String getH02OPECOD()
  {
    return fieldH02OPECOD.getString();
  }

  /**
  * Set field H02FLGMAS using a String value.
  */
  public void setH02FLGMAS(String newvalue)
  {
    fieldH02FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H02FLGMAS as a String.
  */
  public String getH02FLGMAS()
  {
    return fieldH02FLGMAS.getString();
  }

  /**
  * Set field H02FLGWK1 using a String value.
  */
  public void setH02FLGWK1(String newvalue)
  {
    fieldH02FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK1 as a String.
  */
  public String getH02FLGWK1()
  {
    return fieldH02FLGWK1.getString();
  }

  /**
  * Set field H02FLGWK2 using a String value.
  */
  public void setH02FLGWK2(String newvalue)
  {
    fieldH02FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK2 as a String.
  */
  public String getH02FLGWK2()
  {
    return fieldH02FLGWK2.getString();
  }

  /**
  * Set field H02FLGWK3 using a String value.
  */
  public void setH02FLGWK3(String newvalue)
  {
    fieldH02FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK3 as a String.
  */
  public String getH02FLGWK3()
  {
    return fieldH02FLGWK3.getString();
  }

  /**
  * Set field E02DLMCDE using a String value.
  */
  public void setE02DLMCDE(String newvalue)
  {
    fieldE02DLMCDE.setString(newvalue);
  }

  /**
  * Get value of field E02DLMCDE as a String.
  */
  public String getE02DLMCDE()
  {
    return fieldE02DLMCDE.getString();
  }

  /**
  * Set field E02MONTOA using a String value.
  */
  public void setE02MONTOA(String newvalue)
  {
    fieldE02MONTOA.setString(newvalue);
  }

  /**
  * Get value of field E02MONTOA as a String.
  */
  public String getE02MONTOA()
  {
    return fieldE02MONTOA.getString();
  }

  /**
  * Set numeric field E02MONTOA using a BigDecimal value.
  */
  public void setE02MONTOA(BigDecimal newvalue)
  {
    fieldE02MONTOA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02MONTOA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02MONTOA()
  {
    return fieldE02MONTOA.getBigDecimal();
  }

  /**
  * Set field E02DLMACC using a String value.
  */
  public void setE02DLMACC(String newvalue)
  {
    fieldE02DLMACC.setString(newvalue);
  }

  /**
  * Get value of field E02DLMACC as a String.
  */
  public String getE02DLMACC()
  {
    return fieldE02DLMACC.getString();
  }

  /**
  * Set numeric field E02DLMACC using a BigDecimal value.
  */
  public void setE02DLMACC(BigDecimal newvalue)
  {
    fieldE02DLMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DLMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DLMACC()
  {
    return fieldE02DLMACC.getBigDecimal();
  }

  /**
  * Set field E02DLMALI using a String value.
  */
  public void setE02DLMALI(String newvalue)
  {
    fieldE02DLMALI.setString(newvalue);
  }

  /**
  * Get value of field E02DLMALI as a String.
  */
  public String getE02DLMALI()
  {
    return fieldE02DLMALI.getString();
  }

  /**
  * Set field E02DLMBRN using a String value.
  */
  public void setE02DLMBRN(String newvalue)
  {
    fieldE02DLMBRN.setString(newvalue);
  }

  /**
  * Get value of field E02DLMBRN as a String.
  */
  public String getE02DLMBRN()
  {
    return fieldE02DLMBRN.getString();
  }

  /**
  * Set numeric field E02DLMBRN using a BigDecimal value.
  */
  public void setE02DLMBRN(BigDecimal newvalue)
  {
    fieldE02DLMBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DLMBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DLMBRN()
  {
    return fieldE02DLMBRN.getBigDecimal();
  }

  /**
  * Set field E02DLMMOD using a String value.
  */
  public void setE02DLMMOD(String newvalue)
  {
    fieldE02DLMMOD.setString(newvalue);
  }

  /**
  * Get value of field E02DLMMOD as a String.
  */
  public String getE02DLMMOD()
  {
    return fieldE02DLMMOD.getString();
  }

  /**
  * Set field E02DLMMOR using a String value.
  */
  public void setE02DLMMOR(String newvalue)
  {
    fieldE02DLMMOR.setString(newvalue);
  }

  /**
  * Get value of field E02DLMMOR as a String.
  */
  public String getE02DLMMOR()
  {
    return fieldE02DLMMOR.getString();
  }

  /**
  * Set numeric field E02DLMMOR using a BigDecimal value.
  */
  public void setE02DLMMOR(BigDecimal newvalue)
  {
    fieldE02DLMMOR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DLMMOR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DLMMOR()
  {
    return fieldE02DLMMOR.getBigDecimal();
  }

  /**
  * Set field E02DLMCUN using a String value.
  */
  public void setE02DLMCUN(String newvalue)
  {
    fieldE02DLMCUN.setString(newvalue);
  }

  /**
  * Get value of field E02DLMCUN as a String.
  */
  public String getE02DLMCUN()
  {
    return fieldE02DLMCUN.getString();
  }

  /**
  * Set numeric field E02DLMCUN using a BigDecimal value.
  */
  public void setE02DLMCUN(BigDecimal newvalue)
  {
    fieldE02DLMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DLMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DLMCUN()
  {
    return fieldE02DLMCUN.getBigDecimal();
  }

  /**
  * Set field E02DLMTYP using a String value.
  */
  public void setE02DLMTYP(String newvalue)
  {
    fieldE02DLMTYP.setString(newvalue);
  }

  /**
  * Get value of field E02DLMTYP as a String.
  */
  public String getE02DLMTYP()
  {
    return fieldE02DLMTYP.getString();
  }

  /**
  * Set field E02DLMPRO using a String value.
  */
  public void setE02DLMPRO(String newvalue)
  {
    fieldE02DLMPRO.setString(newvalue);
  }

  /**
  * Get value of field E02DLMPRO as a String.
  */
  public String getE02DLMPRO()
  {
    return fieldE02DLMPRO.getString();
  }

  /**
  * Set field E02DLMMEP using a String value.
  */
  public void setE02DLMMEP(String newvalue)
  {
    fieldE02DLMMEP.setString(newvalue);
  }

  /**
  * Get value of field E02DLMMEP as a String.
  */
  public String getE02DLMMEP()
  {
    return fieldE02DLMMEP.getString();
  }

  /**
  * Set numeric field E02DLMMEP using a BigDecimal value.
  */
  public void setE02DLMMEP(BigDecimal newvalue)
  {
    fieldE02DLMMEP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DLMMEP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DLMMEP()
  {
    return fieldE02DLMMEP.getBigDecimal();
  }

  /**
  * Set field E02DLMPPR using a String value.
  */
  public void setE02DLMPPR(String newvalue)
  {
    fieldE02DLMPPR.setString(newvalue);
  }

  /**
  * Get value of field E02DLMPPR as a String.
  */
  public String getE02DLMPPR()
  {
    return fieldE02DLMPPR.getString();
  }

  /**
  * Set numeric field E02DLMPPR using a BigDecimal value.
  */
  public void setE02DLMPPR(BigDecimal newvalue)
  {
    fieldE02DLMPPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DLMPPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DLMPPR()
  {
    return fieldE02DLMPPR.getBigDecimal();
  }

  /**
  * Set field E02DLMPAC using a String value.
  */
  public void setE02DLMPAC(String newvalue)
  {
    fieldE02DLMPAC.setString(newvalue);
  }

  /**
  * Get value of field E02DLMPAC as a String.
  */
  public String getE02DLMPAC()
  {
    return fieldE02DLMPAC.getString();
  }

  /**
  * Set numeric field E02DLMPAC using a BigDecimal value.
  */
  public void setE02DLMPAC(BigDecimal newvalue)
  {
    fieldE02DLMPAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DLMPAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DLMPAC()
  {
    return fieldE02DLMPAC.getBigDecimal();
  }

  /**
  * Set field E02DLMPTO using a String value.
  */
  public void setE02DLMPTO(String newvalue)
  {
    fieldE02DLMPTO.setString(newvalue);
  }

  /**
  * Get value of field E02DLMPTO as a String.
  */
  public String getE02DLMPTO()
  {
    return fieldE02DLMPTO.getString();
  }

  /**
  * Set numeric field E02DLMPTO using a BigDecimal value.
  */
  public void setE02DLMPTO(BigDecimal newvalue)
  {
    fieldE02DLMPTO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DLMPTO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DLMPTO()
  {
    return fieldE02DLMPTO.getBigDecimal();
  }

  /**
  * Set field E02DLMPPP using a String value.
  */
  public void setE02DLMPPP(String newvalue)
  {
    fieldE02DLMPPP.setString(newvalue);
  }

  /**
  * Get value of field E02DLMPPP as a String.
  */
  public String getE02DLMPPP()
  {
    return fieldE02DLMPPP.getString();
  }

  /**
  * Set numeric field E02DLMPPP using a BigDecimal value.
  */
  public void setE02DLMPPP(BigDecimal newvalue)
  {
    fieldE02DLMPPP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DLMPPP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DLMPPP()
  {
    return fieldE02DLMPPP.getBigDecimal();
  }

  /**
  * Set field E02DLMLMM using a String value.
  */
  public void setE02DLMLMM(String newvalue)
  {
    fieldE02DLMLMM.setString(newvalue);
  }

  /**
  * Get value of field E02DLMLMM as a String.
  */
  public String getE02DLMLMM()
  {
    return fieldE02DLMLMM.getString();
  }

  /**
  * Set numeric field E02DLMLMM using a BigDecimal value.
  */
  public void setE02DLMLMM(BigDecimal newvalue)
  {
    fieldE02DLMLMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DLMLMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DLMLMM()
  {
    return fieldE02DLMLMM.getBigDecimal();
  }

  /**
  * Set field E02DLMLMD using a String value.
  */
  public void setE02DLMLMD(String newvalue)
  {
    fieldE02DLMLMD.setString(newvalue);
  }

  /**
  * Get value of field E02DLMLMD as a String.
  */
  public String getE02DLMLMD()
  {
    return fieldE02DLMLMD.getString();
  }

  /**
  * Set numeric field E02DLMLMD using a BigDecimal value.
  */
  public void setE02DLMLMD(BigDecimal newvalue)
  {
    fieldE02DLMLMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DLMLMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DLMLMD()
  {
    return fieldE02DLMLMD.getBigDecimal();
  }

  /**
  * Set field E02DLMLMY using a String value.
  */
  public void setE02DLMLMY(String newvalue)
  {
    fieldE02DLMLMY.setString(newvalue);
  }

  /**
  * Get value of field E02DLMLMY as a String.
  */
  public String getE02DLMLMY()
  {
    return fieldE02DLMLMY.getString();
  }

  /**
  * Set numeric field E02DLMLMY using a BigDecimal value.
  */
  public void setE02DLMLMY(BigDecimal newvalue)
  {
    fieldE02DLMLMY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DLMLMY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DLMLMY()
  {
    return fieldE02DLMLMY.getBigDecimal();
  }

  /**
  * Set field E02DLMLMU using a String value.
  */
  public void setE02DLMLMU(String newvalue)
  {
    fieldE02DLMLMU.setString(newvalue);
  }

  /**
  * Get value of field E02DLMLMU as a String.
  */
  public String getE02DLMLMU()
  {
    return fieldE02DLMLMU.getString();
  }

  /**
  * Set field E02DLMLMT using a String value.
  */
  public void setE02DLMLMT(String newvalue)
  {
    fieldE02DLMLMT.setString(newvalue);
  }

  /**
  * Get value of field E02DLMLMT as a String.
  */
  public String getE02DLMLMT()
  {
    return fieldE02DLMLMT.getString();
  }

  /**
  * Set field E02TOTMEP using a String value.
  */
  public void setE02TOTMEP(String newvalue)
  {
    fieldE02TOTMEP.setString(newvalue);
  }

  /**
  * Get value of field E02TOTMEP as a String.
  */
  public String getE02TOTMEP()
  {
    return fieldE02TOTMEP.getString();
  }

  /**
  * Set numeric field E02TOTMEP using a BigDecimal value.
  */
  public void setE02TOTMEP(BigDecimal newvalue)
  {
    fieldE02TOTMEP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTMEP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTMEP()
  {
    return fieldE02TOTMEP.getBigDecimal();
  }

  /**
  * Set field E02TOTPPR using a String value.
  */
  public void setE02TOTPPR(String newvalue)
  {
    fieldE02TOTPPR.setString(newvalue);
  }

  /**
  * Get value of field E02TOTPPR as a String.
  */
  public String getE02TOTPPR()
  {
    return fieldE02TOTPPR.getString();
  }

  /**
  * Set numeric field E02TOTPPR using a BigDecimal value.
  */
  public void setE02TOTPPR(BigDecimal newvalue)
  {
    fieldE02TOTPPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTPPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTPPR()
  {
    return fieldE02TOTPPR.getBigDecimal();
  }

  /**
  * Set field E02TOTPAC using a String value.
  */
  public void setE02TOTPAC(String newvalue)
  {
    fieldE02TOTPAC.setString(newvalue);
  }

  /**
  * Get value of field E02TOTPAC as a String.
  */
  public String getE02TOTPAC()
  {
    return fieldE02TOTPAC.getString();
  }

  /**
  * Set numeric field E02TOTPAC using a BigDecimal value.
  */
  public void setE02TOTPAC(BigDecimal newvalue)
  {
    fieldE02TOTPAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTPAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTPAC()
  {
    return fieldE02TOTPAC.getBigDecimal();
  }

  /**
  * Set field E02TOTPTO using a String value.
  */
  public void setE02TOTPTO(String newvalue)
  {
    fieldE02TOTPTO.setString(newvalue);
  }

  /**
  * Get value of field E02TOTPTO as a String.
  */
  public String getE02TOTPTO()
  {
    return fieldE02TOTPTO.getString();
  }

  /**
  * Set numeric field E02TOTPTO using a BigDecimal value.
  */
  public void setE02TOTPTO(BigDecimal newvalue)
  {
    fieldE02TOTPTO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02TOTPTO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02TOTPTO()
  {
    return fieldE02TOTPTO.getBigDecimal();
  }

}