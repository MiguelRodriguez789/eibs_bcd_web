package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD093003 physical file definition.
* 
* File level identifier is 1170113162015.
* Record format level identifier is 427344E055142.
*/

public class EDD093003Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H03USERID",
                                     "H03PROGRM",
                                     "H03TIMSYS",
                                     "H03SCRCOD",
                                     "H03OPECOD",
                                     "H03FLGMAS",
                                     "H03FLGWK1",
                                     "H03FLGWK2",
                                     "H03FLGWK3",
                                     "E03CNTFEM",
                                     "E03CNTFED",
                                     "E03CNTFEY",
                                     "E03CODBNK",
                                     "E03CODSUC",
                                     "E03CODCCY",
                                     "E03ACTION"
                                   };
  final static String tnames[] = {
                                   "H03USERID",
                                   "H03PROGRM",
                                   "H03TIMSYS",
                                   "H03SCRCOD",
                                   "H03OPECOD",
                                   "H03FLGMAS",
                                   "H03FLGWK1",
                                   "H03FLGWK2",
                                   "H03FLGWK3",
                                   "E03CNTFEM",
                                   "E03CNTFED",
                                   "E03CNTFEY",
                                   "E03CODBNK",
                                   "E03CODSUC",
                                   "E03CODCCY",
                                   "E03ACTION"
                                 };
  final static String fid = "1170113162015";
  final static String rid = "427344E055142";
  final static String fmtname = "EDD093003";
  final int FIELDCOUNT = 16;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH03USERID = null;
  private CharacterField fieldH03PROGRM = null;
  private CharacterField fieldH03TIMSYS = null;
  private CharacterField fieldH03SCRCOD = null;
  private CharacterField fieldH03OPECOD = null;
  private CharacterField fieldH03FLGMAS = null;
  private CharacterField fieldH03FLGWK1 = null;
  private CharacterField fieldH03FLGWK2 = null;
  private CharacterField fieldH03FLGWK3 = null;
  private DecimalField fieldE03CNTFEM = null;
  private DecimalField fieldE03CNTFED = null;
  private DecimalField fieldE03CNTFEY = null;
  private CharacterField fieldE03CODBNK = null;
  private DecimalField fieldE03CODSUC = null;
  private CharacterField fieldE03CODCCY = null;
  private CharacterField fieldE03ACTION = null;

  /**
  * Constructor for EDD093003Message.
  */
  public EDD093003Message()
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
    recordsize = 64;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH03USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H03USERID");
    fields[1] = fieldH03PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H03PROGRM");
    fields[2] = fieldH03TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H03TIMSYS");
    fields[3] = fieldH03SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H03SCRCOD");
    fields[4] = fieldH03OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H03OPECOD");
    fields[5] = fieldH03FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H03FLGMAS");
    fields[6] = fieldH03FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H03FLGWK1");
    fields[7] = fieldH03FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H03FLGWK2");
    fields[8] = fieldH03FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H03FLGWK3");
    fields[9] = fieldE03CNTFEM =
    new DecimalField(message, HEADERSIZE + 42, 3, 0, "E03CNTFEM");
    fields[10] = fieldE03CNTFED =
    new DecimalField(message, HEADERSIZE + 45, 3, 0, "E03CNTFED");
    fields[11] = fieldE03CNTFEY =
    new DecimalField(message, HEADERSIZE + 48, 5, 0, "E03CNTFEY");
    fields[12] = fieldE03CODBNK =
    new CharacterField(message, HEADERSIZE + 53, 2, "E03CODBNK");
    fields[13] = fieldE03CODSUC =
    new DecimalField(message, HEADERSIZE + 55, 5, 0, "E03CODSUC");
    fields[14] = fieldE03CODCCY =
    new CharacterField(message, HEADERSIZE + 60, 3, "E03CODCCY");
    fields[15] = fieldE03ACTION =
    new CharacterField(message, HEADERSIZE + 63, 1, "E03ACTION");

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
  * Set field H03USERID using a String value.
  */
  public void setH03USERID(String newvalue)
  {
    fieldH03USERID.setString(newvalue);
  }

  /**
  * Get value of field H03USERID as a String.
  */
  public String getH03USERID()
  {
    return fieldH03USERID.getString();
  }

  /**
  * Set field H03PROGRM using a String value.
  */
  public void setH03PROGRM(String newvalue)
  {
    fieldH03PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H03PROGRM as a String.
  */
  public String getH03PROGRM()
  {
    return fieldH03PROGRM.getString();
  }

  /**
  * Set field H03TIMSYS using a String value.
  */
  public void setH03TIMSYS(String newvalue)
  {
    fieldH03TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H03TIMSYS as a String.
  */
  public String getH03TIMSYS()
  {
    return fieldH03TIMSYS.getString();
  }

  /**
  * Set field H03SCRCOD using a String value.
  */
  public void setH03SCRCOD(String newvalue)
  {
    fieldH03SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H03SCRCOD as a String.
  */
  public String getH03SCRCOD()
  {
    return fieldH03SCRCOD.getString();
  }

  /**
  * Set field H03OPECOD using a String value.
  */
  public void setH03OPECOD(String newvalue)
  {
    fieldH03OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H03OPECOD as a String.
  */
  public String getH03OPECOD()
  {
    return fieldH03OPECOD.getString();
  }

  /**
  * Set field H03FLGMAS using a String value.
  */
  public void setH03FLGMAS(String newvalue)
  {
    fieldH03FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H03FLGMAS as a String.
  */
  public String getH03FLGMAS()
  {
    return fieldH03FLGMAS.getString();
  }

  /**
  * Set field H03FLGWK1 using a String value.
  */
  public void setH03FLGWK1(String newvalue)
  {
    fieldH03FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK1 as a String.
  */
  public String getH03FLGWK1()
  {
    return fieldH03FLGWK1.getString();
  }

  /**
  * Set field H03FLGWK2 using a String value.
  */
  public void setH03FLGWK2(String newvalue)
  {
    fieldH03FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK2 as a String.
  */
  public String getH03FLGWK2()
  {
    return fieldH03FLGWK2.getString();
  }

  /**
  * Set field H03FLGWK3 using a String value.
  */
  public void setH03FLGWK3(String newvalue)
  {
    fieldH03FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK3 as a String.
  */
  public String getH03FLGWK3()
  {
    return fieldH03FLGWK3.getString();
  }

  /**
  * Set field E03CNTFEM using a String value.
  */
  public void setE03CNTFEM(String newvalue)
  {
    fieldE03CNTFEM.setString(newvalue);
  }

  /**
  * Get value of field E03CNTFEM as a String.
  */
  public String getE03CNTFEM()
  {
    return fieldE03CNTFEM.getString();
  }

  /**
  * Set numeric field E03CNTFEM using a BigDecimal value.
  */
  public void setE03CNTFEM(BigDecimal newvalue)
  {
    fieldE03CNTFEM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03CNTFEM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03CNTFEM()
  {
    return fieldE03CNTFEM.getBigDecimal();
  }

  /**
  * Set field E03CNTFED using a String value.
  */
  public void setE03CNTFED(String newvalue)
  {
    fieldE03CNTFED.setString(newvalue);
  }

  /**
  * Get value of field E03CNTFED as a String.
  */
  public String getE03CNTFED()
  {
    return fieldE03CNTFED.getString();
  }

  /**
  * Set numeric field E03CNTFED using a BigDecimal value.
  */
  public void setE03CNTFED(BigDecimal newvalue)
  {
    fieldE03CNTFED.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03CNTFED as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03CNTFED()
  {
    return fieldE03CNTFED.getBigDecimal();
  }

  /**
  * Set field E03CNTFEY using a String value.
  */
  public void setE03CNTFEY(String newvalue)
  {
    fieldE03CNTFEY.setString(newvalue);
  }

  /**
  * Get value of field E03CNTFEY as a String.
  */
  public String getE03CNTFEY()
  {
    return fieldE03CNTFEY.getString();
  }

  /**
  * Set numeric field E03CNTFEY using a BigDecimal value.
  */
  public void setE03CNTFEY(BigDecimal newvalue)
  {
    fieldE03CNTFEY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03CNTFEY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03CNTFEY()
  {
    return fieldE03CNTFEY.getBigDecimal();
  }

  /**
  * Set field E03CODBNK using a String value.
  */
  public void setE03CODBNK(String newvalue)
  {
    fieldE03CODBNK.setString(newvalue);
  }

  /**
  * Get value of field E03CODBNK as a String.
  */
  public String getE03CODBNK()
  {
    return fieldE03CODBNK.getString();
  }

  /**
  * Set field E03CODSUC using a String value.
  */
  public void setE03CODSUC(String newvalue)
  {
    fieldE03CODSUC.setString(newvalue);
  }

  /**
  * Get value of field E03CODSUC as a String.
  */
  public String getE03CODSUC()
  {
    return fieldE03CODSUC.getString();
  }

  /**
  * Set numeric field E03CODSUC using a BigDecimal value.
  */
  public void setE03CODSUC(BigDecimal newvalue)
  {
    fieldE03CODSUC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03CODSUC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03CODSUC()
  {
    return fieldE03CODSUC.getBigDecimal();
  }

  /**
  * Set field E03CODCCY using a String value.
  */
  public void setE03CODCCY(String newvalue)
  {
    fieldE03CODCCY.setString(newvalue);
  }

  /**
  * Get value of field E03CODCCY as a String.
  */
  public String getE03CODCCY()
  {
    return fieldE03CODCCY.getString();
  }

  /**
  * Set field E03ACTION using a String value.
  */
  public void setE03ACTION(String newvalue)
  {
    fieldE03ACTION.setString(newvalue);
  }

  /**
  * Get value of field E03ACTION as a String.
  */
  public String getE03ACTION()
  {
    return fieldE03ACTION.getString();
  }

}
