package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EST051001 physical file definition.
* 
* File level identifier is 1100706173659.
* Record format level identifier is 316928E6C2F08.
*/

public class EST051001Message extends MessageRecord
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
                                     "E01CRHNRE",
                                     "E01CRHTTA",
                                     "E01CRHTPL",
                                     "E01CRHCEM",
                                     "E01CRHSEC",
                                     "E01CRHFGY",
                                     "E01CRHFGM",
                                     "E01CRHFGD",
                                     "E01CRHCDE",
                                     "E01CRHSDE",
                                     "E01CRHFDE",
                                     "E01CRHFHA",
                                     "E01CRHCPL",
                                     "E01CRHCUA",
                                     "E01CRHFRY",
                                     "E01CRHFRM",
                                     "E01CRHFRD",
                                     "E01CRHCUE",
                                     "E01CRHFEY",
                                     "E01CRHFEM",
                                     "E01CRHFED",
                                     "E01CRHUEN",
                                     "E01CRHURE",
                                     "E01CRHEST",
                                     "E01CRHNRN",
                                     "E01CRHGL1",
                                     "E01CRHGL2",
                                     "E01CRHGL3",
                                     "E01CRHGL4",
                                     "E01CRHNR1",
                                     "E01CRHNR2",
                                     "E01CRHNR3",
                                     "E01CRHNR4",
                                     "E01CRHFDY",
                                     "E01CRHFDM",
                                     "E01CRHFDD",
                                     "E01CRHFHY",
                                     "E01CRHFHM",
                                     "E01CRHFHD",
                                     "E01CRHGSD"
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
                                   "E01CRHNRE",
                                   "E01CRHTTA",
                                   "E01CRHTPL",
                                   "E01CRHCEM",
                                   "E01CRHSEC",
                                   "E01CRHFGY",
                                   "E01CRHFGM",
                                   "E01CRHFGD",
                                   "E01CRHCDE",
                                   "E01CRHSDE",
                                   "E01CRHFDE",
                                   "E01CRHFHA",
                                   "E01CRHCPL",
                                   "E01CRHCUA",
                                   "E01CRHFRY",
                                   "E01CRHFRM",
                                   "E01CRHFRD",
                                   "E01CRHCUE",
                                   "E01CRHFEY",
                                   "E01CRHFEM",
                                   "E01CRHFED",
                                   "E01CRHUEN",
                                   "E01CRHURE",
                                   "E01CRHEST",
                                   "E01CRHNRN",
                                   "E01CRHGL1",
                                   "E01CRHGL2",
                                   "E01CRHGL3",
                                   "E01CRHGL4",
                                   "E01CRHNR1",
                                   "E01CRHNR2",
                                   "E01CRHNR3",
                                   "E01CRHNR4",
                                   "E01CRHFDY",
                                   "E01CRHFDM",
                                   "E01CRHFDD",
                                   "E01CRHFHY",
                                   "E01CRHFHM",
                                   "E01CRHFHD",
                                   "E01CRHGSD"
                                 };
  final static String fid = "1100706173659";
  final static String rid = "316928E6C2F08";
  final static String fmtname = "EST051001";
  final int FIELDCOUNT = 49;
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
  private DecimalField fieldE01CRHNRE = null;
  private CharacterField fieldE01CRHTTA = null;
  private CharacterField fieldE01CRHTPL = null;
  private CharacterField fieldE01CRHCEM = null;
  private DecimalField fieldE01CRHSEC = null;
  private DecimalField fieldE01CRHFGY = null;
  private DecimalField fieldE01CRHFGM = null;
  private DecimalField fieldE01CRHFGD = null;
  private DecimalField fieldE01CRHCDE = null;
  private DecimalField fieldE01CRHSDE = null;
  private DecimalField fieldE01CRHFDE = null;
  private DecimalField fieldE01CRHFHA = null;
  private DecimalField fieldE01CRHCPL = null;
  private DecimalField fieldE01CRHCUA = null;
  private DecimalField fieldE01CRHFRY = null;
  private DecimalField fieldE01CRHFRM = null;
  private DecimalField fieldE01CRHFRD = null;
  private DecimalField fieldE01CRHCUE = null;
  private DecimalField fieldE01CRHFEY = null;
  private DecimalField fieldE01CRHFEM = null;
  private DecimalField fieldE01CRHFED = null;
  private CharacterField fieldE01CRHUEN = null;
  private CharacterField fieldE01CRHURE = null;
  private CharacterField fieldE01CRHEST = null;
  private DecimalField fieldE01CRHNRN = null;
  private CharacterField fieldE01CRHGL1 = null;
  private CharacterField fieldE01CRHGL2 = null;
  private CharacterField fieldE01CRHGL3 = null;
  private CharacterField fieldE01CRHGL4 = null;
  private DecimalField fieldE01CRHNR1 = null;
  private DecimalField fieldE01CRHNR2 = null;
  private DecimalField fieldE01CRHNR3 = null;
  private DecimalField fieldE01CRHNR4 = null;
  private DecimalField fieldE01CRHFDY = null;
  private DecimalField fieldE01CRHFDM = null;
  private DecimalField fieldE01CRHFDD = null;
  private DecimalField fieldE01CRHFHY = null;
  private DecimalField fieldE01CRHFHM = null;
  private DecimalField fieldE01CRHFHD = null;
  private CharacterField fieldE01CRHGSD = null;

  /**
  * Constructor for EST051001Message.
  */
  public EST051001Message()
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
    recordsize = 339;
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
    fields[9] = fieldE01CRHNRE =
    new DecimalField(message, HEADERSIZE + 42, 9, 0, "E01CRHNRE");
    fields[10] = fieldE01CRHTTA =
    new CharacterField(message, HEADERSIZE + 51, 4, "E01CRHTTA");
    fields[11] = fieldE01CRHTPL =
    new CharacterField(message, HEADERSIZE + 55, 4, "E01CRHTPL");
    fields[12] = fieldE01CRHCEM =
    new CharacterField(message, HEADERSIZE + 59, 4, "E01CRHCEM");
    fields[13] = fieldE01CRHSEC =
    new DecimalField(message, HEADERSIZE + 63, 4, 0, "E01CRHSEC");
    fields[14] = fieldE01CRHFGY =
    new DecimalField(message, HEADERSIZE + 67, 5, 0, "E01CRHFGY");
    fields[15] = fieldE01CRHFGM =
    new DecimalField(message, HEADERSIZE + 72, 3, 0, "E01CRHFGM");
    fields[16] = fieldE01CRHFGD =
    new DecimalField(message, HEADERSIZE + 75, 3, 0, "E01CRHFGD");
    fields[17] = fieldE01CRHCDE =
    new DecimalField(message, HEADERSIZE + 78, 4, 0, "E01CRHCDE");
    fields[18] = fieldE01CRHSDE =
    new DecimalField(message, HEADERSIZE + 82, 4, 0, "E01CRHSDE");
    fields[19] = fieldE01CRHFDE =
    new DecimalField(message, HEADERSIZE + 86, 9, 0, "E01CRHFDE");
    fields[20] = fieldE01CRHFHA =
    new DecimalField(message, HEADERSIZE + 95, 9, 0, "E01CRHFHA");
    fields[21] = fieldE01CRHCPL =
    new DecimalField(message, HEADERSIZE + 104, 7, 0, "E01CRHCPL");
    fields[22] = fieldE01CRHCUA =
    new DecimalField(message, HEADERSIZE + 111, 4, 0, "E01CRHCUA");
    fields[23] = fieldE01CRHFRY =
    new DecimalField(message, HEADERSIZE + 115, 5, 0, "E01CRHFRY");
    fields[24] = fieldE01CRHFRM =
    new DecimalField(message, HEADERSIZE + 120, 3, 0, "E01CRHFRM");
    fields[25] = fieldE01CRHFRD =
    new DecimalField(message, HEADERSIZE + 123, 3, 0, "E01CRHFRD");
    fields[26] = fieldE01CRHCUE =
    new DecimalField(message, HEADERSIZE + 126, 4, 0, "E01CRHCUE");
    fields[27] = fieldE01CRHFEY =
    new DecimalField(message, HEADERSIZE + 130, 5, 0, "E01CRHFEY");
    fields[28] = fieldE01CRHFEM =
    new DecimalField(message, HEADERSIZE + 135, 3, 0, "E01CRHFEM");
    fields[29] = fieldE01CRHFED =
    new DecimalField(message, HEADERSIZE + 138, 3, 0, "E01CRHFED");
    fields[30] = fieldE01CRHUEN =
    new CharacterField(message, HEADERSIZE + 141, 10, "E01CRHUEN");
    fields[31] = fieldE01CRHURE =
    new CharacterField(message, HEADERSIZE + 151, 10, "E01CRHURE");
    fields[32] = fieldE01CRHEST =
    new CharacterField(message, HEADERSIZE + 161, 1, "E01CRHEST");
    fields[33] = fieldE01CRHNRN =
    new DecimalField(message, HEADERSIZE + 162, 9, 0, "E01CRHNRN");
    fields[34] = fieldE01CRHGL1 =
    new CharacterField(message, HEADERSIZE + 171, 20, "E01CRHGL1");
    fields[35] = fieldE01CRHGL2 =
    new CharacterField(message, HEADERSIZE + 191, 20, "E01CRHGL2");
    fields[36] = fieldE01CRHGL3 =
    new CharacterField(message, HEADERSIZE + 211, 20, "E01CRHGL3");
    fields[37] = fieldE01CRHGL4 =
    new CharacterField(message, HEADERSIZE + 231, 20, "E01CRHGL4");
    fields[38] = fieldE01CRHNR1 =
    new DecimalField(message, HEADERSIZE + 251, 9, 0, "E01CRHNR1");
    fields[39] = fieldE01CRHNR2 =
    new DecimalField(message, HEADERSIZE + 260, 9, 0, "E01CRHNR2");
    fields[40] = fieldE01CRHNR3 =
    new DecimalField(message, HEADERSIZE + 269, 9, 0, "E01CRHNR3");
    fields[41] = fieldE01CRHNR4 =
    new DecimalField(message, HEADERSIZE + 278, 9, 0, "E01CRHNR4");
    fields[42] = fieldE01CRHFDY =
    new DecimalField(message, HEADERSIZE + 287, 5, 0, "E01CRHFDY");
    fields[43] = fieldE01CRHFDM =
    new DecimalField(message, HEADERSIZE + 292, 3, 0, "E01CRHFDM");
    fields[44] = fieldE01CRHFDD =
    new DecimalField(message, HEADERSIZE + 295, 3, 0, "E01CRHFDD");
    fields[45] = fieldE01CRHFHY =
    new DecimalField(message, HEADERSIZE + 298, 5, 0, "E01CRHFHY");
    fields[46] = fieldE01CRHFHM =
    new DecimalField(message, HEADERSIZE + 303, 3, 0, "E01CRHFHM");
    fields[47] = fieldE01CRHFHD =
    new DecimalField(message, HEADERSIZE + 306, 3, 0, "E01CRHFHD");
    fields[48] = fieldE01CRHGSD =
    new CharacterField(message, HEADERSIZE + 309, 30, "E01CRHGSD");

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
  * Set field E01CRHNRE using a String value.
  */
  public void setE01CRHNRE(String newvalue)
  {
    fieldE01CRHNRE.setString(newvalue);
  }

  /**
  * Get value of field E01CRHNRE as a String.
  */
  public String getE01CRHNRE()
  {
    return fieldE01CRHNRE.getString();
  }

  /**
  * Set numeric field E01CRHNRE using a BigDecimal value.
  */
  public void setE01CRHNRE(BigDecimal newvalue)
  {
    fieldE01CRHNRE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHNRE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHNRE()
  {
    return fieldE01CRHNRE.getBigDecimal();
  }

  /**
  * Set field E01CRHTTA using a String value.
  */
  public void setE01CRHTTA(String newvalue)
  {
    fieldE01CRHTTA.setString(newvalue);
  }

  /**
  * Get value of field E01CRHTTA as a String.
  */
  public String getE01CRHTTA()
  {
    return fieldE01CRHTTA.getString();
  }

  /**
  * Set field E01CRHTPL using a String value.
  */
  public void setE01CRHTPL(String newvalue)
  {
    fieldE01CRHTPL.setString(newvalue);
  }

  /**
  * Get value of field E01CRHTPL as a String.
  */
  public String getE01CRHTPL()
  {
    return fieldE01CRHTPL.getString();
  }

  /**
  * Set field E01CRHCEM using a String value.
  */
  public void setE01CRHCEM(String newvalue)
  {
    fieldE01CRHCEM.setString(newvalue);
  }

  /**
  * Get value of field E01CRHCEM as a String.
  */
  public String getE01CRHCEM()
  {
    return fieldE01CRHCEM.getString();
  }

  /**
  * Set field E01CRHSEC using a String value.
  */
  public void setE01CRHSEC(String newvalue)
  {
    fieldE01CRHSEC.setString(newvalue);
  }

  /**
  * Get value of field E01CRHSEC as a String.
  */
  public String getE01CRHSEC()
  {
    return fieldE01CRHSEC.getString();
  }

  /**
  * Set numeric field E01CRHSEC using a BigDecimal value.
  */
  public void setE01CRHSEC(BigDecimal newvalue)
  {
    fieldE01CRHSEC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHSEC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHSEC()
  {
    return fieldE01CRHSEC.getBigDecimal();
  }

  /**
  * Set field E01CRHFGY using a String value.
  */
  public void setE01CRHFGY(String newvalue)
  {
    fieldE01CRHFGY.setString(newvalue);
  }

  /**
  * Get value of field E01CRHFGY as a String.
  */
  public String getE01CRHFGY()
  {
    return fieldE01CRHFGY.getString();
  }

  /**
  * Set numeric field E01CRHFGY using a BigDecimal value.
  */
  public void setE01CRHFGY(BigDecimal newvalue)
  {
    fieldE01CRHFGY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHFGY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHFGY()
  {
    return fieldE01CRHFGY.getBigDecimal();
  }

  /**
  * Set field E01CRHFGM using a String value.
  */
  public void setE01CRHFGM(String newvalue)
  {
    fieldE01CRHFGM.setString(newvalue);
  }

  /**
  * Get value of field E01CRHFGM as a String.
  */
  public String getE01CRHFGM()
  {
    return fieldE01CRHFGM.getString();
  }

  /**
  * Set numeric field E01CRHFGM using a BigDecimal value.
  */
  public void setE01CRHFGM(BigDecimal newvalue)
  {
    fieldE01CRHFGM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHFGM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHFGM()
  {
    return fieldE01CRHFGM.getBigDecimal();
  }

  /**
  * Set field E01CRHFGD using a String value.
  */
  public void setE01CRHFGD(String newvalue)
  {
    fieldE01CRHFGD.setString(newvalue);
  }

  /**
  * Get value of field E01CRHFGD as a String.
  */
  public String getE01CRHFGD()
  {
    return fieldE01CRHFGD.getString();
  }

  /**
  * Set numeric field E01CRHFGD using a BigDecimal value.
  */
  public void setE01CRHFGD(BigDecimal newvalue)
  {
    fieldE01CRHFGD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHFGD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHFGD()
  {
    return fieldE01CRHFGD.getBigDecimal();
  }

  /**
  * Set field E01CRHCDE using a String value.
  */
  public void setE01CRHCDE(String newvalue)
  {
    fieldE01CRHCDE.setString(newvalue);
  }

  /**
  * Get value of field E01CRHCDE as a String.
  */
  public String getE01CRHCDE()
  {
    return fieldE01CRHCDE.getString();
  }

  /**
  * Set numeric field E01CRHCDE using a BigDecimal value.
  */
  public void setE01CRHCDE(BigDecimal newvalue)
  {
    fieldE01CRHCDE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHCDE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHCDE()
  {
    return fieldE01CRHCDE.getBigDecimal();
  }

  /**
  * Set field E01CRHSDE using a String value.
  */
  public void setE01CRHSDE(String newvalue)
  {
    fieldE01CRHSDE.setString(newvalue);
  }

  /**
  * Get value of field E01CRHSDE as a String.
  */
  public String getE01CRHSDE()
  {
    return fieldE01CRHSDE.getString();
  }

  /**
  * Set numeric field E01CRHSDE using a BigDecimal value.
  */
  public void setE01CRHSDE(BigDecimal newvalue)
  {
    fieldE01CRHSDE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHSDE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHSDE()
  {
    return fieldE01CRHSDE.getBigDecimal();
  }

  /**
  * Set field E01CRHFDE using a String value.
  */
  public void setE01CRHFDE(String newvalue)
  {
    fieldE01CRHFDE.setString(newvalue);
  }

  /**
  * Get value of field E01CRHFDE as a String.
  */
  public String getE01CRHFDE()
  {
    return fieldE01CRHFDE.getString();
  }

  /**
  * Set numeric field E01CRHFDE using a BigDecimal value.
  */
  public void setE01CRHFDE(BigDecimal newvalue)
  {
    fieldE01CRHFDE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHFDE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHFDE()
  {
    return fieldE01CRHFDE.getBigDecimal();
  }

  /**
  * Set field E01CRHFHA using a String value.
  */
  public void setE01CRHFHA(String newvalue)
  {
    fieldE01CRHFHA.setString(newvalue);
  }

  /**
  * Get value of field E01CRHFHA as a String.
  */
  public String getE01CRHFHA()
  {
    return fieldE01CRHFHA.getString();
  }

  /**
  * Set numeric field E01CRHFHA using a BigDecimal value.
  */
  public void setE01CRHFHA(BigDecimal newvalue)
  {
    fieldE01CRHFHA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHFHA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHFHA()
  {
    return fieldE01CRHFHA.getBigDecimal();
  }

  /**
  * Set field E01CRHCPL using a String value.
  */
  public void setE01CRHCPL(String newvalue)
  {
    fieldE01CRHCPL.setString(newvalue);
  }

  /**
  * Get value of field E01CRHCPL as a String.
  */
  public String getE01CRHCPL()
  {
    return fieldE01CRHCPL.getString();
  }

  /**
  * Set numeric field E01CRHCPL using a BigDecimal value.
  */
  public void setE01CRHCPL(BigDecimal newvalue)
  {
    fieldE01CRHCPL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHCPL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHCPL()
  {
    return fieldE01CRHCPL.getBigDecimal();
  }

  /**
  * Set field E01CRHCUA using a String value.
  */
  public void setE01CRHCUA(String newvalue)
  {
    fieldE01CRHCUA.setString(newvalue);
  }

  /**
  * Get value of field E01CRHCUA as a String.
  */
  public String getE01CRHCUA()
  {
    return fieldE01CRHCUA.getString();
  }

  /**
  * Set numeric field E01CRHCUA using a BigDecimal value.
  */
  public void setE01CRHCUA(BigDecimal newvalue)
  {
    fieldE01CRHCUA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHCUA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHCUA()
  {
    return fieldE01CRHCUA.getBigDecimal();
  }

  /**
  * Set field E01CRHFRY using a String value.
  */
  public void setE01CRHFRY(String newvalue)
  {
    fieldE01CRHFRY.setString(newvalue);
  }

  /**
  * Get value of field E01CRHFRY as a String.
  */
  public String getE01CRHFRY()
  {
    return fieldE01CRHFRY.getString();
  }

  /**
  * Set numeric field E01CRHFRY using a BigDecimal value.
  */
  public void setE01CRHFRY(BigDecimal newvalue)
  {
    fieldE01CRHFRY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHFRY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHFRY()
  {
    return fieldE01CRHFRY.getBigDecimal();
  }

  /**
  * Set field E01CRHFRM using a String value.
  */
  public void setE01CRHFRM(String newvalue)
  {
    fieldE01CRHFRM.setString(newvalue);
  }

  /**
  * Get value of field E01CRHFRM as a String.
  */
  public String getE01CRHFRM()
  {
    return fieldE01CRHFRM.getString();
  }

  /**
  * Set numeric field E01CRHFRM using a BigDecimal value.
  */
  public void setE01CRHFRM(BigDecimal newvalue)
  {
    fieldE01CRHFRM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHFRM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHFRM()
  {
    return fieldE01CRHFRM.getBigDecimal();
  }

  /**
  * Set field E01CRHFRD using a String value.
  */
  public void setE01CRHFRD(String newvalue)
  {
    fieldE01CRHFRD.setString(newvalue);
  }

  /**
  * Get value of field E01CRHFRD as a String.
  */
  public String getE01CRHFRD()
  {
    return fieldE01CRHFRD.getString();
  }

  /**
  * Set numeric field E01CRHFRD using a BigDecimal value.
  */
  public void setE01CRHFRD(BigDecimal newvalue)
  {
    fieldE01CRHFRD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHFRD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHFRD()
  {
    return fieldE01CRHFRD.getBigDecimal();
  }

  /**
  * Set field E01CRHCUE using a String value.
  */
  public void setE01CRHCUE(String newvalue)
  {
    fieldE01CRHCUE.setString(newvalue);
  }

  /**
  * Get value of field E01CRHCUE as a String.
  */
  public String getE01CRHCUE()
  {
    return fieldE01CRHCUE.getString();
  }

  /**
  * Set numeric field E01CRHCUE using a BigDecimal value.
  */
  public void setE01CRHCUE(BigDecimal newvalue)
  {
    fieldE01CRHCUE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHCUE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHCUE()
  {
    return fieldE01CRHCUE.getBigDecimal();
  }

  /**
  * Set field E01CRHFEY using a String value.
  */
  public void setE01CRHFEY(String newvalue)
  {
    fieldE01CRHFEY.setString(newvalue);
  }

  /**
  * Get value of field E01CRHFEY as a String.
  */
  public String getE01CRHFEY()
  {
    return fieldE01CRHFEY.getString();
  }

  /**
  * Set numeric field E01CRHFEY using a BigDecimal value.
  */
  public void setE01CRHFEY(BigDecimal newvalue)
  {
    fieldE01CRHFEY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHFEY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHFEY()
  {
    return fieldE01CRHFEY.getBigDecimal();
  }

  /**
  * Set field E01CRHFEM using a String value.
  */
  public void setE01CRHFEM(String newvalue)
  {
    fieldE01CRHFEM.setString(newvalue);
  }

  /**
  * Get value of field E01CRHFEM as a String.
  */
  public String getE01CRHFEM()
  {
    return fieldE01CRHFEM.getString();
  }

  /**
  * Set numeric field E01CRHFEM using a BigDecimal value.
  */
  public void setE01CRHFEM(BigDecimal newvalue)
  {
    fieldE01CRHFEM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHFEM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHFEM()
  {
    return fieldE01CRHFEM.getBigDecimal();
  }

  /**
  * Set field E01CRHFED using a String value.
  */
  public void setE01CRHFED(String newvalue)
  {
    fieldE01CRHFED.setString(newvalue);
  }

  /**
  * Get value of field E01CRHFED as a String.
  */
  public String getE01CRHFED()
  {
    return fieldE01CRHFED.getString();
  }

  /**
  * Set numeric field E01CRHFED using a BigDecimal value.
  */
  public void setE01CRHFED(BigDecimal newvalue)
  {
    fieldE01CRHFED.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHFED as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHFED()
  {
    return fieldE01CRHFED.getBigDecimal();
  }

  /**
  * Set field E01CRHUEN using a String value.
  */
  public void setE01CRHUEN(String newvalue)
  {
    fieldE01CRHUEN.setString(newvalue);
  }

  /**
  * Get value of field E01CRHUEN as a String.
  */
  public String getE01CRHUEN()
  {
    return fieldE01CRHUEN.getString();
  }

  /**
  * Set field E01CRHURE using a String value.
  */
  public void setE01CRHURE(String newvalue)
  {
    fieldE01CRHURE.setString(newvalue);
  }

  /**
  * Get value of field E01CRHURE as a String.
  */
  public String getE01CRHURE()
  {
    return fieldE01CRHURE.getString();
  }

  /**
  * Set field E01CRHEST using a String value.
  */
  public void setE01CRHEST(String newvalue)
  {
    fieldE01CRHEST.setString(newvalue);
  }

  /**
  * Get value of field E01CRHEST as a String.
  */
  public String getE01CRHEST()
  {
    return fieldE01CRHEST.getString();
  }

  /**
  * Set field E01CRHNRN using a String value.
  */
  public void setE01CRHNRN(String newvalue)
  {
    fieldE01CRHNRN.setString(newvalue);
  }

  /**
  * Get value of field E01CRHNRN as a String.
  */
  public String getE01CRHNRN()
  {
    return fieldE01CRHNRN.getString();
  }

  /**
  * Set numeric field E01CRHNRN using a BigDecimal value.
  */
  public void setE01CRHNRN(BigDecimal newvalue)
  {
    fieldE01CRHNRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHNRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHNRN()
  {
    return fieldE01CRHNRN.getBigDecimal();
  }

  /**
  * Set field E01CRHGL1 using a String value.
  */
  public void setE01CRHGL1(String newvalue)
  {
    fieldE01CRHGL1.setString(newvalue);
  }

  /**
  * Get value of field E01CRHGL1 as a String.
  */
  public String getE01CRHGL1()
  {
    return fieldE01CRHGL1.getString();
  }

  /**
  * Set field E01CRHGL2 using a String value.
  */
  public void setE01CRHGL2(String newvalue)
  {
    fieldE01CRHGL2.setString(newvalue);
  }

  /**
  * Get value of field E01CRHGL2 as a String.
  */
  public String getE01CRHGL2()
  {
    return fieldE01CRHGL2.getString();
  }

  /**
  * Set field E01CRHGL3 using a String value.
  */
  public void setE01CRHGL3(String newvalue)
  {
    fieldE01CRHGL3.setString(newvalue);
  }

  /**
  * Get value of field E01CRHGL3 as a String.
  */
  public String getE01CRHGL3()
  {
    return fieldE01CRHGL3.getString();
  }

  /**
  * Set field E01CRHGL4 using a String value.
  */
  public void setE01CRHGL4(String newvalue)
  {
    fieldE01CRHGL4.setString(newvalue);
  }

  /**
  * Get value of field E01CRHGL4 as a String.
  */
  public String getE01CRHGL4()
  {
    return fieldE01CRHGL4.getString();
  }

  /**
  * Set field E01CRHNR1 using a String value.
  */
  public void setE01CRHNR1(String newvalue)
  {
    fieldE01CRHNR1.setString(newvalue);
  }

  /**
  * Get value of field E01CRHNR1 as a String.
  */
  public String getE01CRHNR1()
  {
    return fieldE01CRHNR1.getString();
  }

  /**
  * Set numeric field E01CRHNR1 using a BigDecimal value.
  */
  public void setE01CRHNR1(BigDecimal newvalue)
  {
    fieldE01CRHNR1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHNR1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHNR1()
  {
    return fieldE01CRHNR1.getBigDecimal();
  }

  /**
  * Set field E01CRHNR2 using a String value.
  */
  public void setE01CRHNR2(String newvalue)
  {
    fieldE01CRHNR2.setString(newvalue);
  }

  /**
  * Get value of field E01CRHNR2 as a String.
  */
  public String getE01CRHNR2()
  {
    return fieldE01CRHNR2.getString();
  }

  /**
  * Set numeric field E01CRHNR2 using a BigDecimal value.
  */
  public void setE01CRHNR2(BigDecimal newvalue)
  {
    fieldE01CRHNR2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHNR2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHNR2()
  {
    return fieldE01CRHNR2.getBigDecimal();
  }

  /**
  * Set field E01CRHNR3 using a String value.
  */
  public void setE01CRHNR3(String newvalue)
  {
    fieldE01CRHNR3.setString(newvalue);
  }

  /**
  * Get value of field E01CRHNR3 as a String.
  */
  public String getE01CRHNR3()
  {
    return fieldE01CRHNR3.getString();
  }

  /**
  * Set numeric field E01CRHNR3 using a BigDecimal value.
  */
  public void setE01CRHNR3(BigDecimal newvalue)
  {
    fieldE01CRHNR3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHNR3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHNR3()
  {
    return fieldE01CRHNR3.getBigDecimal();
  }

  /**
  * Set field E01CRHNR4 using a String value.
  */
  public void setE01CRHNR4(String newvalue)
  {
    fieldE01CRHNR4.setString(newvalue);
  }

  /**
  * Get value of field E01CRHNR4 as a String.
  */
  public String getE01CRHNR4()
  {
    return fieldE01CRHNR4.getString();
  }

  /**
  * Set numeric field E01CRHNR4 using a BigDecimal value.
  */
  public void setE01CRHNR4(BigDecimal newvalue)
  {
    fieldE01CRHNR4.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHNR4 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHNR4()
  {
    return fieldE01CRHNR4.getBigDecimal();
  }

  /**
  * Set field E01CRHFDY using a String value.
  */
  public void setE01CRHFDY(String newvalue)
  {
    fieldE01CRHFDY.setString(newvalue);
  }

  /**
  * Get value of field E01CRHFDY as a String.
  */
  public String getE01CRHFDY()
  {
    return fieldE01CRHFDY.getString();
  }

  /**
  * Set numeric field E01CRHFDY using a BigDecimal value.
  */
  public void setE01CRHFDY(BigDecimal newvalue)
  {
    fieldE01CRHFDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHFDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHFDY()
  {
    return fieldE01CRHFDY.getBigDecimal();
  }

  /**
  * Set field E01CRHFDM using a String value.
  */
  public void setE01CRHFDM(String newvalue)
  {
    fieldE01CRHFDM.setString(newvalue);
  }

  /**
  * Get value of field E01CRHFDM as a String.
  */
  public String getE01CRHFDM()
  {
    return fieldE01CRHFDM.getString();
  }

  /**
  * Set numeric field E01CRHFDM using a BigDecimal value.
  */
  public void setE01CRHFDM(BigDecimal newvalue)
  {
    fieldE01CRHFDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHFDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHFDM()
  {
    return fieldE01CRHFDM.getBigDecimal();
  }

  /**
  * Set field E01CRHFDD using a String value.
  */
  public void setE01CRHFDD(String newvalue)
  {
    fieldE01CRHFDD.setString(newvalue);
  }

  /**
  * Get value of field E01CRHFDD as a String.
  */
  public String getE01CRHFDD()
  {
    return fieldE01CRHFDD.getString();
  }

  /**
  * Set numeric field E01CRHFDD using a BigDecimal value.
  */
  public void setE01CRHFDD(BigDecimal newvalue)
  {
    fieldE01CRHFDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHFDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHFDD()
  {
    return fieldE01CRHFDD.getBigDecimal();
  }

  /**
  * Set field E01CRHFHY using a String value.
  */
  public void setE01CRHFHY(String newvalue)
  {
    fieldE01CRHFHY.setString(newvalue);
  }

  /**
  * Get value of field E01CRHFHY as a String.
  */
  public String getE01CRHFHY()
  {
    return fieldE01CRHFHY.getString();
  }

  /**
  * Set numeric field E01CRHFHY using a BigDecimal value.
  */
  public void setE01CRHFHY(BigDecimal newvalue)
  {
    fieldE01CRHFHY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHFHY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHFHY()
  {
    return fieldE01CRHFHY.getBigDecimal();
  }

  /**
  * Set field E01CRHFHM using a String value.
  */
  public void setE01CRHFHM(String newvalue)
  {
    fieldE01CRHFHM.setString(newvalue);
  }

  /**
  * Get value of field E01CRHFHM as a String.
  */
  public String getE01CRHFHM()
  {
    return fieldE01CRHFHM.getString();
  }

  /**
  * Set numeric field E01CRHFHM using a BigDecimal value.
  */
  public void setE01CRHFHM(BigDecimal newvalue)
  {
    fieldE01CRHFHM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHFHM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHFHM()
  {
    return fieldE01CRHFHM.getBigDecimal();
  }

  /**
  * Set field E01CRHFHD using a String value.
  */
  public void setE01CRHFHD(String newvalue)
  {
    fieldE01CRHFHD.setString(newvalue);
  }

  /**
  * Get value of field E01CRHFHD as a String.
  */
  public String getE01CRHFHD()
  {
    return fieldE01CRHFHD.getString();
  }

  /**
  * Set numeric field E01CRHFHD using a BigDecimal value.
  */
  public void setE01CRHFHD(BigDecimal newvalue)
  {
    fieldE01CRHFHD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CRHFHD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CRHFHD()
  {
    return fieldE01CRHFHD.getBigDecimal();
  }

  /**
  * Set field E01CRHGSD using a String value.
  */
  public void setE01CRHGSD(String newvalue)
  {
    fieldE01CRHGSD.setString(newvalue);
  }

  /**
  * Get value of field E01CRHGSD as a String.
  */
  public String getE01CRHGSD()
  {
    return fieldE01CRHGSD.getString();
  }

}
