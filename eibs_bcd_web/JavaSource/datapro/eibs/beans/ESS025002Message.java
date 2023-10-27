package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESS025002 physical file definition.
* 
* File level identifier is 1140529190059.
* Record format level identifier is 52403811E1065.
*/

public class ESS025002Message extends MessageRecord
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
                                     "E02DATERM",
                                     "E02DATERD",
                                     "E02DATERY",
                                     "E02VALTIM",
                                     "E02CUSNUM",
                                     "E02CUSNA1",
                                     "E02NUMACC",
                                     "E02NUMREF",
                                     "E02USERID",
                                     "E02USRNME",
                                     "E02MNPUSA",
                                     "E02USANME",
                                     "E02APLCDE",
                                     "E02PRODUC",
                                     "E02MNLMOD",
                                     "E02MNLIPA",
                                     "E02MNLFIL",
                                     "E02MNLPRG",
                                     "E02DSCMOD",
                                     "E02DSTYPE",
                                     "E02NUMREC"
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
                                   "E02DATERM",
                                   "E02DATERD",
                                   "E02DATERY",
                                   "E02VALTIM",
                                   "E02CUSNUM",
                                   "E02CUSNA1",
                                   "E02NUMACC",
                                   "E02NUMREF",
                                   "E02USERID",
                                   "E02USRNME",
                                   "E02MNPUSA",
                                   "E02USANME",
                                   "E02APLCDE",
                                   "E02PRODUC",
                                   "E02MNLMOD",
                                   "E02MNLIPA",
                                   "E02MNLFIL",
                                   "E02MNLPRG",
                                   "E02DSCMOD",
                                   "E02DSTYPE",
                                   "E02NUMREC"
                                 };
  final static String fid = "1140529190059";
  final static String rid = "52403811E1065";
  final static String fmtname = "ESS025002";
  final int FIELDCOUNT = 30;
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
  private DecimalField fieldE02DATERM = null;
  private DecimalField fieldE02DATERD = null;
  private DecimalField fieldE02DATERY = null;
  private CharacterField fieldE02VALTIM = null;
  private DecimalField fieldE02CUSNUM = null;
  private CharacterField fieldE02CUSNA1 = null;
  private DecimalField fieldE02NUMACC = null;
  private DecimalField fieldE02NUMREF = null;
  private CharacterField fieldE02USERID = null;
  private CharacterField fieldE02USRNME = null;
  private CharacterField fieldE02MNPUSA = null;
  private CharacterField fieldE02USANME = null;
  private CharacterField fieldE02APLCDE = null;
  private CharacterField fieldE02PRODUC = null;
  private CharacterField fieldE02MNLMOD = null;
  private CharacterField fieldE02MNLIPA = null;
  private CharacterField fieldE02MNLFIL = null;
  private CharacterField fieldE02MNLPRG = null;
  private CharacterField fieldE02DSCMOD = null;
  private CharacterField fieldE02DSTYPE = null;
  private DecimalField fieldE02NUMREC = null;

  /**
  * Constructor for ESS025002Message.
  */
  public ESS025002Message()
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
    recordsize = 434;
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
    fields[9] = fieldE02DATERM =
    new DecimalField(message, HEADERSIZE + 42, 3, 0, "E02DATERM");
    fields[10] = fieldE02DATERD =
    new DecimalField(message, HEADERSIZE + 45, 3, 0, "E02DATERD");
    fields[11] = fieldE02DATERY =
    new DecimalField(message, HEADERSIZE + 48, 5, 0, "E02DATERY");
    fields[12] = fieldE02VALTIM =
    new CharacterField(message, HEADERSIZE + 53, 26, "E02VALTIM");
    fields[13] = fieldE02CUSNUM =
    new DecimalField(message, HEADERSIZE + 79, 10, 0, "E02CUSNUM");
    fields[14] = fieldE02CUSNA1 =
    new CharacterField(message, HEADERSIZE + 89, 60, "E02CUSNA1");
    fields[15] = fieldE02NUMACC =
    new DecimalField(message, HEADERSIZE + 149, 13, 0, "E02NUMACC");
    fields[16] = fieldE02NUMREF =
    new DecimalField(message, HEADERSIZE + 162, 13, 0, "E02NUMREF");
    fields[17] = fieldE02USERID =
    new CharacterField(message, HEADERSIZE + 175, 10, "E02USERID");
    fields[18] = fieldE02USRNME =
    new CharacterField(message, HEADERSIZE + 185, 45, "E02USRNME");
    fields[19] = fieldE02MNPUSA =
    new CharacterField(message, HEADERSIZE + 230, 10, "E02MNPUSA");
    fields[20] = fieldE02USANME =
    new CharacterField(message, HEADERSIZE + 240, 45, "E02USANME");
    fields[21] = fieldE02APLCDE =
    new CharacterField(message, HEADERSIZE + 285, 2, "E02APLCDE");
    fields[22] = fieldE02PRODUC =
    new CharacterField(message, HEADERSIZE + 287, 4, "E02PRODUC");
    fields[23] = fieldE02MNLMOD =
    new CharacterField(message, HEADERSIZE + 291, 10, "E02MNLMOD");
    fields[24] = fieldE02MNLIPA =
    new CharacterField(message, HEADERSIZE + 301, 25, "E02MNLIPA");
    fields[25] = fieldE02MNLFIL =
    new CharacterField(message, HEADERSIZE + 326, 10, "E02MNLFIL");
    fields[26] = fieldE02MNLPRG =
    new CharacterField(message, HEADERSIZE + 336, 10, "E02MNLPRG");
    fields[27] = fieldE02DSCMOD =
    new CharacterField(message, HEADERSIZE + 346, 35, "E02DSCMOD");
    fields[28] = fieldE02DSTYPE =
    new CharacterField(message, HEADERSIZE + 381, 45, "E02DSTYPE");
    fields[29] = fieldE02NUMREC =
    new DecimalField(message, HEADERSIZE + 426, 8, 0, "E02NUMREC");

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
  * Set field E02DATERM using a String value.
  */
  public void setE02DATERM(String newvalue)
  {
    fieldE02DATERM.setString(newvalue);
  }

  /**
  * Get value of field E02DATERM as a String.
  */
  public String getE02DATERM()
  {
    return fieldE02DATERM.getString();
  }

  /**
  * Set numeric field E02DATERM using a BigDecimal value.
  */
  public void setE02DATERM(BigDecimal newvalue)
  {
    fieldE02DATERM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DATERM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DATERM()
  {
    return fieldE02DATERM.getBigDecimal();
  }

  /**
  * Set field E02DATERD using a String value.
  */
  public void setE02DATERD(String newvalue)
  {
    fieldE02DATERD.setString(newvalue);
  }

  /**
  * Get value of field E02DATERD as a String.
  */
  public String getE02DATERD()
  {
    return fieldE02DATERD.getString();
  }

  /**
  * Set numeric field E02DATERD using a BigDecimal value.
  */
  public void setE02DATERD(BigDecimal newvalue)
  {
    fieldE02DATERD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DATERD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DATERD()
  {
    return fieldE02DATERD.getBigDecimal();
  }

  /**
  * Set field E02DATERY using a String value.
  */
  public void setE02DATERY(String newvalue)
  {
    fieldE02DATERY.setString(newvalue);
  }

  /**
  * Get value of field E02DATERY as a String.
  */
  public String getE02DATERY()
  {
    return fieldE02DATERY.getString();
  }

  /**
  * Set numeric field E02DATERY using a BigDecimal value.
  */
  public void setE02DATERY(BigDecimal newvalue)
  {
    fieldE02DATERY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DATERY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DATERY()
  {
    return fieldE02DATERY.getBigDecimal();
  }

  /**
  * Set field E02VALTIM using a String value.
  */
  public void setE02VALTIM(String newvalue)
  {
    fieldE02VALTIM.setString(newvalue);
  }

  /**
  * Get value of field E02VALTIM as a String.
  */
  public String getE02VALTIM()
  {
    return fieldE02VALTIM.getString();
  }

  /**
  * Set field E02CUSNUM using a String value.
  */
  public void setE02CUSNUM(String newvalue)
  {
    fieldE02CUSNUM.setString(newvalue);
  }

  /**
  * Get value of field E02CUSNUM as a String.
  */
  public String getE02CUSNUM()
  {
    return fieldE02CUSNUM.getString();
  }

  /**
  * Set numeric field E02CUSNUM using a BigDecimal value.
  */
  public void setE02CUSNUM(BigDecimal newvalue)
  {
    fieldE02CUSNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CUSNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CUSNUM()
  {
    return fieldE02CUSNUM.getBigDecimal();
  }

  /**
  * Set field E02CUSNA1 using a String value.
  */
  public void setE02CUSNA1(String newvalue)
  {
    fieldE02CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E02CUSNA1 as a String.
  */
  public String getE02CUSNA1()
  {
    return fieldE02CUSNA1.getString();
  }

  /**
  * Set field E02NUMACC using a String value.
  */
  public void setE02NUMACC(String newvalue)
  {
    fieldE02NUMACC.setString(newvalue);
  }

  /**
  * Get value of field E02NUMACC as a String.
  */
  public String getE02NUMACC()
  {
    return fieldE02NUMACC.getString();
  }

  /**
  * Set numeric field E02NUMACC using a BigDecimal value.
  */
  public void setE02NUMACC(BigDecimal newvalue)
  {
    fieldE02NUMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02NUMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02NUMACC()
  {
    return fieldE02NUMACC.getBigDecimal();
  }

  /**
  * Set field E02NUMREF using a String value.
  */
  public void setE02NUMREF(String newvalue)
  {
    fieldE02NUMREF.setString(newvalue);
  }

  /**
  * Get value of field E02NUMREF as a String.
  */
  public String getE02NUMREF()
  {
    return fieldE02NUMREF.getString();
  }

  /**
  * Set numeric field E02NUMREF using a BigDecimal value.
  */
  public void setE02NUMREF(BigDecimal newvalue)
  {
    fieldE02NUMREF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02NUMREF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02NUMREF()
  {
    return fieldE02NUMREF.getBigDecimal();
  }

  /**
  * Set field E02USERID using a String value.
  */
  public void setE02USERID(String newvalue)
  {
    fieldE02USERID.setString(newvalue);
  }

  /**
  * Get value of field E02USERID as a String.
  */
  public String getE02USERID()
  {
    return fieldE02USERID.getString();
  }

  /**
  * Set field E02USRNME using a String value.
  */
  public void setE02USRNME(String newvalue)
  {
    fieldE02USRNME.setString(newvalue);
  }

  /**
  * Get value of field E02USRNME as a String.
  */
  public String getE02USRNME()
  {
    return fieldE02USRNME.getString();
  }

  /**
  * Set field E02MNPUSA using a String value.
  */
  public void setE02MNPUSA(String newvalue)
  {
    fieldE02MNPUSA.setString(newvalue);
  }

  /**
  * Get value of field E02MNPUSA as a String.
  */
  public String getE02MNPUSA()
  {
    return fieldE02MNPUSA.getString();
  }

  /**
  * Set field E02USANME using a String value.
  */
  public void setE02USANME(String newvalue)
  {
    fieldE02USANME.setString(newvalue);
  }

  /**
  * Get value of field E02USANME as a String.
  */
  public String getE02USANME()
  {
    return fieldE02USANME.getString();
  }

  /**
  * Set field E02APLCDE using a String value.
  */
  public void setE02APLCDE(String newvalue)
  {
    fieldE02APLCDE.setString(newvalue);
  }

  /**
  * Get value of field E02APLCDE as a String.
  */
  public String getE02APLCDE()
  {
    return fieldE02APLCDE.getString();
  }

  /**
  * Set field E02PRODUC using a String value.
  */
  public void setE02PRODUC(String newvalue)
  {
    fieldE02PRODUC.setString(newvalue);
  }

  /**
  * Get value of field E02PRODUC as a String.
  */
  public String getE02PRODUC()
  {
    return fieldE02PRODUC.getString();
  }

  /**
  * Set field E02MNLMOD using a String value.
  */
  public void setE02MNLMOD(String newvalue)
  {
    fieldE02MNLMOD.setString(newvalue);
  }

  /**
  * Get value of field E02MNLMOD as a String.
  */
  public String getE02MNLMOD()
  {
    return fieldE02MNLMOD.getString();
  }

  /**
  * Set field E02MNLIPA using a String value.
  */
  public void setE02MNLIPA(String newvalue)
  {
    fieldE02MNLIPA.setString(newvalue);
  }

  /**
  * Get value of field E02MNLIPA as a String.
  */
  public String getE02MNLIPA()
  {
    return fieldE02MNLIPA.getString();
  }

  /**
  * Set field E02MNLFIL using a String value.
  */
  public void setE02MNLFIL(String newvalue)
  {
    fieldE02MNLFIL.setString(newvalue);
  }

  /**
  * Get value of field E02MNLFIL as a String.
  */
  public String getE02MNLFIL()
  {
    return fieldE02MNLFIL.getString();
  }

  /**
  * Set field E02MNLPRG using a String value.
  */
  public void setE02MNLPRG(String newvalue)
  {
    fieldE02MNLPRG.setString(newvalue);
  }

  /**
  * Get value of field E02MNLPRG as a String.
  */
  public String getE02MNLPRG()
  {
    return fieldE02MNLPRG.getString();
  }

  /**
  * Set field E02DSCMOD using a String value.
  */
  public void setE02DSCMOD(String newvalue)
  {
    fieldE02DSCMOD.setString(newvalue);
  }

  /**
  * Get value of field E02DSCMOD as a String.
  */
  public String getE02DSCMOD()
  {
    return fieldE02DSCMOD.getString();
  }

  /**
  * Set field E02DSTYPE using a String value.
  */
  public void setE02DSTYPE(String newvalue)
  {
    fieldE02DSTYPE.setString(newvalue);
  }

  /**
  * Get value of field E02DSTYPE as a String.
  */
  public String getE02DSTYPE()
  {
    return fieldE02DSTYPE.getString();
  }

  /**
  * Set field E02NUMREC using a String value.
  */
  public void setE02NUMREC(String newvalue)
  {
    fieldE02NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E02NUMREC as a String.
  */
  public String getE02NUMREC()
  {
    return fieldE02NUMREC.getString();
  }

  /**
  * Set numeric field E02NUMREC using a BigDecimal value.
  */
  public void setE02NUMREC(BigDecimal newvalue)
  {
    fieldE02NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02NUMREC()
  {
    return fieldE02NUMREC.getBigDecimal();
  }

}