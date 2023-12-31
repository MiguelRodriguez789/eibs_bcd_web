package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECH020501 physical file definition.
* 
* File level identifier is 1180519232556.
* Record format level identifier is 2BE73882F576E.
*/

public class ECH020501Message extends MessageRecord
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
                                     "E01CHLBNK",
                                     "E01CHLBRN",
                                     "E01CHLCCY",
                                     "E01CHLACC",
                                     "E01CHLCDE",
                                     "E01CHLTYP",
                                     "E01CHLTCB",
                                     "E01CHLBDS",
                                     "E01CHLPDS",
                                     "E01CHLCDS",
                                     "E01CHLMSK",
                                     "E01CHLTSK",
                                     "E01CHLASK",
                                     "E01CHLCIM",
                                     "E01CHLBIM",
                                     "E01CHLBSK",
                                     "E01CHLLMD",
                                     "E01CHLLMY",
                                     "E01CHLLMT",
                                     "E01CHLLRM",
                                     "E01CHLLRD",
                                     "E01CHLLRY",
                                     "E01CHLLOR",
                                     "E01CHUNOR",
                                     "E01CHLFL1",
                                     "E01CHLFL2",
                                     "E01NUMREC",
                                     "E01INDOPE"
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
                                   "E01CHLBNK",
                                   "E01CHLBRN",
                                   "E01CHLCCY",
                                   "E01CHLACC",
                                   "E01CHLCDE",
                                   "E01CHLTYP",
                                   "E01CHLTCB",
                                   "E01CHLBDS",
                                   "E01CHLPDS",
                                   "E01CHLCDS",
                                   "E01CHLMSK",
                                   "E01CHLTSK",
                                   "E01CHLASK",
                                   "E01CHLCIM",
                                   "E01CHLBIM",
                                   "E01CHLBSK",
                                   "E01CHLLMD",
                                   "E01CHLLMY",
                                   "E01CHLLMT",
                                   "E01CHLLRM",
                                   "E01CHLLRD",
                                   "E01CHLLRY",
                                   "E01CHLLOR",
                                   "E01CHUNOR",
                                   "E01CHLFL1",
                                   "E01CHLFL2",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1180519232556";
  final static String rid = "2BE73882F576E";
  final static String fmtname = "ECH020501";
  final int FIELDCOUNT = 37;
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
  private CharacterField fieldE01CHLBNK = null;
  private DecimalField fieldE01CHLBRN = null;
  private CharacterField fieldE01CHLCCY = null;
  private DecimalField fieldE01CHLACC = null;
  private CharacterField fieldE01CHLCDE = null;
  private CharacterField fieldE01CHLTYP = null;
  private CharacterField fieldE01CHLTCB = null;
  private CharacterField fieldE01CHLBDS = null;
  private CharacterField fieldE01CHLPDS = null;
  private CharacterField fieldE01CHLCDS = null;
  private DecimalField fieldE01CHLMSK = null;
  private DecimalField fieldE01CHLTSK = null;
  private DecimalField fieldE01CHLASK = null;
  private DecimalField fieldE01CHLCIM = null;
  private DecimalField fieldE01CHLBIM = null;
  private DecimalField fieldE01CHLBSK = null;
  private DecimalField fieldE01CHLLMD = null;
  private DecimalField fieldE01CHLLMY = null;
  private CharacterField fieldE01CHLLMT = null;
  private DecimalField fieldE01CHLLRM = null;
  private DecimalField fieldE01CHLLRD = null;
  private DecimalField fieldE01CHLLRY = null;
  private DecimalField fieldE01CHLLOR = null;
  private DecimalField fieldE01CHUNOR = null;
  private CharacterField fieldE01CHLFL1 = null;
  private CharacterField fieldE01CHLFL2 = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ECH020501Message.
  */
  public ECH020501Message()
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
    recordsize = 325;
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
    fields[9] = fieldE01CHLBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01CHLBNK");
    fields[10] = fieldE01CHLBRN =
    new DecimalField(message, HEADERSIZE + 44, 5, 0, "E01CHLBRN");
    fields[11] = fieldE01CHLCCY =
    new CharacterField(message, HEADERSIZE + 49, 3, "E01CHLCCY");
    fields[12] = fieldE01CHLACC =
    new DecimalField(message, HEADERSIZE + 52, 13, 0, "E01CHLACC");
    fields[13] = fieldE01CHLCDE =
    new CharacterField(message, HEADERSIZE + 65, 4, "E01CHLCDE");
    fields[14] = fieldE01CHLTYP =
    new CharacterField(message, HEADERSIZE + 69, 4, "E01CHLTYP");
    fields[15] = fieldE01CHLTCB =
    new CharacterField(message, HEADERSIZE + 73, 2, "E01CHLTCB");
    fields[16] = fieldE01CHLBDS =
    new CharacterField(message, HEADERSIZE + 75, 45, "E01CHLBDS");
    fields[17] = fieldE01CHLPDS =
    new CharacterField(message, HEADERSIZE + 120, 45, "E01CHLPDS");
    fields[18] = fieldE01CHLCDS =
    new CharacterField(message, HEADERSIZE + 165, 45, "E01CHLCDS");
    fields[19] = fieldE01CHLMSK =
    new DecimalField(message, HEADERSIZE + 210, 6, 0, "E01CHLMSK");
    fields[20] = fieldE01CHLTSK =
    new DecimalField(message, HEADERSIZE + 216, 6, 0, "E01CHLTSK");
    fields[21] = fieldE01CHLASK =
    new DecimalField(message, HEADERSIZE + 222, 6, 0, "E01CHLASK");
    fields[22] = fieldE01CHLCIM =
    new DecimalField(message, HEADERSIZE + 228, 6, 0, "E01CHLCIM");
    fields[23] = fieldE01CHLBIM =
    new DecimalField(message, HEADERSIZE + 234, 8, 0, "E01CHLBIM");
    fields[24] = fieldE01CHLBSK =
    new DecimalField(message, HEADERSIZE + 242, 8, 0, "E01CHLBSK");
    fields[25] = fieldE01CHLLMD =
    new DecimalField(message, HEADERSIZE + 250, 3, 0, "E01CHLLMD");
    fields[26] = fieldE01CHLLMY =
    new DecimalField(message, HEADERSIZE + 253, 5, 0, "E01CHLLMY");
    fields[27] = fieldE01CHLLMT =
    new CharacterField(message, HEADERSIZE + 258, 26, "E01CHLLMT");
    fields[28] = fieldE01CHLLRM =
    new DecimalField(message, HEADERSIZE + 284, 3, 0, "E01CHLLRM");
    fields[29] = fieldE01CHLLRD =
    new DecimalField(message, HEADERSIZE + 287, 3, 0, "E01CHLLRD");
    fields[30] = fieldE01CHLLRY =
    new DecimalField(message, HEADERSIZE + 290, 5, 0, "E01CHLLRY");
    fields[31] = fieldE01CHLLOR =
    new DecimalField(message, HEADERSIZE + 295, 6, 0, "E01CHLLOR");
    fields[32] = fieldE01CHUNOR =
    new DecimalField(message, HEADERSIZE + 301, 13, 0, "E01CHUNOR");
    fields[33] = fieldE01CHLFL1 =
    new CharacterField(message, HEADERSIZE + 314, 1, "E01CHLFL1");
    fields[34] = fieldE01CHLFL2 =
    new CharacterField(message, HEADERSIZE + 315, 1, "E01CHLFL2");
    fields[35] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 316, 8, 0, "E01NUMREC");
    fields[36] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 324, 1, "E01INDOPE");

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
  * Set field E01CHLBNK using a String value.
  */
  public void setE01CHLBNK(String newvalue)
  {
    fieldE01CHLBNK.setString(newvalue);
  }

  /**
  * Get value of field E01CHLBNK as a String.
  */
  public String getE01CHLBNK()
  {
    return fieldE01CHLBNK.getString();
  }

  /**
  * Set field E01CHLBRN using a String value.
  */
  public void setE01CHLBRN(String newvalue)
  {
    fieldE01CHLBRN.setString(newvalue);
  }

  /**
  * Get value of field E01CHLBRN as a String.
  */
  public String getE01CHLBRN()
  {
    return fieldE01CHLBRN.getString();
  }

  /**
  * Set numeric field E01CHLBRN using a BigDecimal value.
  */
  public void setE01CHLBRN(BigDecimal newvalue)
  {
    fieldE01CHLBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHLBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHLBRN()
  {
    return fieldE01CHLBRN.getBigDecimal();
  }

  /**
  * Set field E01CHLCCY using a String value.
  */
  public void setE01CHLCCY(String newvalue)
  {
    fieldE01CHLCCY.setString(newvalue);
  }

  /**
  * Get value of field E01CHLCCY as a String.
  */
  public String getE01CHLCCY()
  {
    return fieldE01CHLCCY.getString();
  }

  /**
  * Set field E01CHLACC using a String value.
  */
  public void setE01CHLACC(String newvalue)
  {
    fieldE01CHLACC.setString(newvalue);
  }

  /**
  * Get value of field E01CHLACC as a String.
  */
  public String getE01CHLACC()
  {
    return fieldE01CHLACC.getString();
  }

  /**
  * Set numeric field E01CHLACC using a BigDecimal value.
  */
  public void setE01CHLACC(BigDecimal newvalue)
  {
    fieldE01CHLACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHLACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHLACC()
  {
    return fieldE01CHLACC.getBigDecimal();
  }

  /**
  * Set field E01CHLCDE using a String value.
  */
  public void setE01CHLCDE(String newvalue)
  {
    fieldE01CHLCDE.setString(newvalue);
  }

  /**
  * Get value of field E01CHLCDE as a String.
  */
  public String getE01CHLCDE()
  {
    return fieldE01CHLCDE.getString();
  }

  /**
  * Set field E01CHLTYP using a String value.
  */
  public void setE01CHLTYP(String newvalue)
  {
    fieldE01CHLTYP.setString(newvalue);
  }

  /**
  * Get value of field E01CHLTYP as a String.
  */
  public String getE01CHLTYP()
  {
    return fieldE01CHLTYP.getString();
  }

  /**
  * Set field E01CHLTCB using a String value.
  */
  public void setE01CHLTCB(String newvalue)
  {
    fieldE01CHLTCB.setString(newvalue);
  }

  /**
  * Get value of field E01CHLTCB as a String.
  */
  public String getE01CHLTCB()
  {
    return fieldE01CHLTCB.getString();
  }

  /**
  * Set field E01CHLBDS using a String value.
  */
  public void setE01CHLBDS(String newvalue)
  {
    fieldE01CHLBDS.setString(newvalue);
  }

  /**
  * Get value of field E01CHLBDS as a String.
  */
  public String getE01CHLBDS()
  {
    return fieldE01CHLBDS.getString();
  }

  /**
  * Set field E01CHLPDS using a String value.
  */
  public void setE01CHLPDS(String newvalue)
  {
    fieldE01CHLPDS.setString(newvalue);
  }

  /**
  * Get value of field E01CHLPDS as a String.
  */
  public String getE01CHLPDS()
  {
    return fieldE01CHLPDS.getString();
  }

  /**
  * Set field E01CHLCDS using a String value.
  */
  public void setE01CHLCDS(String newvalue)
  {
    fieldE01CHLCDS.setString(newvalue);
  }

  /**
  * Get value of field E01CHLCDS as a String.
  */
  public String getE01CHLCDS()
  {
    return fieldE01CHLCDS.getString();
  }

  /**
  * Set field E01CHLMSK using a String value.
  */
  public void setE01CHLMSK(String newvalue)
  {
    fieldE01CHLMSK.setString(newvalue);
  }

  /**
  * Get value of field E01CHLMSK as a String.
  */
  public String getE01CHLMSK()
  {
    return fieldE01CHLMSK.getString();
  }

  /**
  * Set numeric field E01CHLMSK using a BigDecimal value.
  */
  public void setE01CHLMSK(BigDecimal newvalue)
  {
    fieldE01CHLMSK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHLMSK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHLMSK()
  {
    return fieldE01CHLMSK.getBigDecimal();
  }

  /**
  * Set field E01CHLTSK using a String value.
  */
  public void setE01CHLTSK(String newvalue)
  {
    fieldE01CHLTSK.setString(newvalue);
  }

  /**
  * Get value of field E01CHLTSK as a String.
  */
  public String getE01CHLTSK()
  {
    return fieldE01CHLTSK.getString();
  }

  /**
  * Set numeric field E01CHLTSK using a BigDecimal value.
  */
  public void setE01CHLTSK(BigDecimal newvalue)
  {
    fieldE01CHLTSK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHLTSK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHLTSK()
  {
    return fieldE01CHLTSK.getBigDecimal();
  }

  /**
  * Set field E01CHLASK using a String value.
  */
  public void setE01CHLASK(String newvalue)
  {
    fieldE01CHLASK.setString(newvalue);
  }

  /**
  * Get value of field E01CHLASK as a String.
  */
  public String getE01CHLASK()
  {
    return fieldE01CHLASK.getString();
  }

  /**
  * Set numeric field E01CHLASK using a BigDecimal value.
  */
  public void setE01CHLASK(BigDecimal newvalue)
  {
    fieldE01CHLASK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHLASK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHLASK()
  {
    return fieldE01CHLASK.getBigDecimal();
  }

  /**
  * Set field E01CHLCIM using a String value.
  */
  public void setE01CHLCIM(String newvalue)
  {
    fieldE01CHLCIM.setString(newvalue);
  }

  /**
  * Get value of field E01CHLCIM as a String.
  */
  public String getE01CHLCIM()
  {
    return fieldE01CHLCIM.getString();
  }

  /**
  * Set numeric field E01CHLCIM using a BigDecimal value.
  */
  public void setE01CHLCIM(BigDecimal newvalue)
  {
    fieldE01CHLCIM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHLCIM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHLCIM()
  {
    return fieldE01CHLCIM.getBigDecimal();
  }

  /**
  * Set field E01CHLBIM using a String value.
  */
  public void setE01CHLBIM(String newvalue)
  {
    fieldE01CHLBIM.setString(newvalue);
  }

  /**
  * Get value of field E01CHLBIM as a String.
  */
  public String getE01CHLBIM()
  {
    return fieldE01CHLBIM.getString();
  }

  /**
  * Set numeric field E01CHLBIM using a BigDecimal value.
  */
  public void setE01CHLBIM(BigDecimal newvalue)
  {
    fieldE01CHLBIM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHLBIM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHLBIM()
  {
    return fieldE01CHLBIM.getBigDecimal();
  }

  /**
  * Set field E01CHLBSK using a String value.
  */
  public void setE01CHLBSK(String newvalue)
  {
    fieldE01CHLBSK.setString(newvalue);
  }

  /**
  * Get value of field E01CHLBSK as a String.
  */
  public String getE01CHLBSK()
  {
    return fieldE01CHLBSK.getString();
  }

  /**
  * Set numeric field E01CHLBSK using a BigDecimal value.
  */
  public void setE01CHLBSK(BigDecimal newvalue)
  {
    fieldE01CHLBSK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHLBSK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHLBSK()
  {
    return fieldE01CHLBSK.getBigDecimal();
  }

  /**
  * Set field E01CHLLMD using a String value.
  */
  public void setE01CHLLMD(String newvalue)
  {
    fieldE01CHLLMD.setString(newvalue);
  }

  /**
  * Get value of field E01CHLLMD as a String.
  */
  public String getE01CHLLMD()
  {
    return fieldE01CHLLMD.getString();
  }

  /**
  * Set numeric field E01CHLLMD using a BigDecimal value.
  */
  public void setE01CHLLMD(BigDecimal newvalue)
  {
    fieldE01CHLLMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHLLMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHLLMD()
  {
    return fieldE01CHLLMD.getBigDecimal();
  }

  /**
  * Set field E01CHLLMY using a String value.
  */
  public void setE01CHLLMY(String newvalue)
  {
    fieldE01CHLLMY.setString(newvalue);
  }

  /**
  * Get value of field E01CHLLMY as a String.
  */
  public String getE01CHLLMY()
  {
    return fieldE01CHLLMY.getString();
  }

  /**
  * Set numeric field E01CHLLMY using a BigDecimal value.
  */
  public void setE01CHLLMY(BigDecimal newvalue)
  {
    fieldE01CHLLMY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHLLMY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHLLMY()
  {
    return fieldE01CHLLMY.getBigDecimal();
  }

  /**
  * Set field E01CHLLMT using a String value.
  */
  public void setE01CHLLMT(String newvalue)
  {
    fieldE01CHLLMT.setString(newvalue);
  }

  /**
  * Get value of field E01CHLLMT as a String.
  */
  public String getE01CHLLMT()
  {
    return fieldE01CHLLMT.getString();
  }

  /**
  * Set field E01CHLLRM using a String value.
  */
  public void setE01CHLLRM(String newvalue)
  {
    fieldE01CHLLRM.setString(newvalue);
  }

  /**
  * Get value of field E01CHLLRM as a String.
  */
  public String getE01CHLLRM()
  {
    return fieldE01CHLLRM.getString();
  }

  /**
  * Set numeric field E01CHLLRM using a BigDecimal value.
  */
  public void setE01CHLLRM(BigDecimal newvalue)
  {
    fieldE01CHLLRM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHLLRM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHLLRM()
  {
    return fieldE01CHLLRM.getBigDecimal();
  }

  /**
  * Set field E01CHLLRD using a String value.
  */
  public void setE01CHLLRD(String newvalue)
  {
    fieldE01CHLLRD.setString(newvalue);
  }

  /**
  * Get value of field E01CHLLRD as a String.
  */
  public String getE01CHLLRD()
  {
    return fieldE01CHLLRD.getString();
  }

  /**
  * Set numeric field E01CHLLRD using a BigDecimal value.
  */
  public void setE01CHLLRD(BigDecimal newvalue)
  {
    fieldE01CHLLRD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHLLRD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHLLRD()
  {
    return fieldE01CHLLRD.getBigDecimal();
  }

  /**
  * Set field E01CHLLRY using a String value.
  */
  public void setE01CHLLRY(String newvalue)
  {
    fieldE01CHLLRY.setString(newvalue);
  }

  /**
  * Get value of field E01CHLLRY as a String.
  */
  public String getE01CHLLRY()
  {
    return fieldE01CHLLRY.getString();
  }

  /**
  * Set numeric field E01CHLLRY using a BigDecimal value.
  */
  public void setE01CHLLRY(BigDecimal newvalue)
  {
    fieldE01CHLLRY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHLLRY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHLLRY()
  {
    return fieldE01CHLLRY.getBigDecimal();
  }

  /**
  * Set field E01CHLLOR using a String value.
  */
  public void setE01CHLLOR(String newvalue)
  {
    fieldE01CHLLOR.setString(newvalue);
  }

  /**
  * Get value of field E01CHLLOR as a String.
  */
  public String getE01CHLLOR()
  {
    return fieldE01CHLLOR.getString();
  }

  /**
  * Set numeric field E01CHLLOR using a BigDecimal value.
  */
  public void setE01CHLLOR(BigDecimal newvalue)
  {
    fieldE01CHLLOR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHLLOR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHLLOR()
  {
    return fieldE01CHLLOR.getBigDecimal();
  }

  /**
  * Set field E01CHUNOR using a String value.
  */
  public void setE01CHUNOR(String newvalue)
  {
    fieldE01CHUNOR.setString(newvalue);
  }

  /**
  * Get value of field E01CHUNOR as a String.
  */
  public String getE01CHUNOR()
  {
    return fieldE01CHUNOR.getString();
  }

  /**
  * Set numeric field E01CHUNOR using a BigDecimal value.
  */
  public void setE01CHUNOR(BigDecimal newvalue)
  {
    fieldE01CHUNOR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHUNOR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHUNOR()
  {
    return fieldE01CHUNOR.getBigDecimal();
  }

  /**
  * Set field E01CHLFL1 using a String value.
  */
  public void setE01CHLFL1(String newvalue)
  {
    fieldE01CHLFL1.setString(newvalue);
  }

  /**
  * Get value of field E01CHLFL1 as a String.
  */
  public String getE01CHLFL1()
  {
    return fieldE01CHLFL1.getString();
  }

  /**
  * Set field E01CHLFL2 using a String value.
  */
  public void setE01CHLFL2(String newvalue)
  {
    fieldE01CHLFL2.setString(newvalue);
  }

  /**
  * Get value of field E01CHLFL2 as a String.
  */
  public String getE01CHLFL2()
  {
    return fieldE01CHLFL2.getString();
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
