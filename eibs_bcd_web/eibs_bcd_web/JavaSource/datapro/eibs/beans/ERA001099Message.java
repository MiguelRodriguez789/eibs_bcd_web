package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ERA001099 physical file definition.
* 
* File level identifier is 1130906142701.
* Record format level identifier is 3D0907270E167.
*/

public class ERA001099Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H99USERID",
                                     "H99PROGRM",
                                     "H99TIMSYS",
                                     "H99SCRCOD",
                                     "H99OPECOD",
                                     "H99FLGMAS",
                                     "H99FLGWK1",
                                     "H99FLGWK2",
                                     "H99FLGWK3",
                                     "E01CNODCC",
                                     "E01CNORCD",
                                     "E01CNODSC",
                                     "E01CNOFRP",
                                     "E01CNOSCG",
                                     "E01CNOSCY",
                                     "E01CNOCST",
                                     "E01CNOBNK",
                                     "E01CNOBRN",
                                     "E01CNOATY",
                                     "E01CNODTY"
                                   };
  final static String tnames[] = {
                                   "H99USERID",
                                   "H99PROGRM",
                                   "H99TIMSYS",
                                   "H99SCRCOD",
                                   "H99OPECOD",
                                   "H99FLGMAS",
                                   "H99FLGWK1",
                                   "H99FLGWK2",
                                   "H99FLGWK3",
                                   "E01CNODCC",
                                   "E01CNORCD",
                                   "E01CNODSC",
                                   "E01CNOFRP",
                                   "E01CNOSCG",
                                   "E01CNOSCY",
                                   "E01CNOCST",
                                   "E01CNOBNK",
                                   "E01CNOBRN",
                                   "E01CNOATY",
                                   "E01CNODTY"
                                 };
  final static String fid = "1130906142701";
  final static String rid = "3D0907270E167";
  final static String fmtname = "ERA001099";
  final int FIELDCOUNT = 20;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH99USERID = null;
  private CharacterField fieldH99PROGRM = null;
  private CharacterField fieldH99TIMSYS = null;
  private CharacterField fieldH99SCRCOD = null;
  private CharacterField fieldH99OPECOD = null;
  private CharacterField fieldH99FLGMAS = null;
  private CharacterField fieldH99FLGWK1 = null;
  private CharacterField fieldH99FLGWK2 = null;
  private CharacterField fieldH99FLGWK3 = null;
  private CharacterField fieldE01CNODCC = null;
  private CharacterField fieldE01CNORCD = null;
  private CharacterField fieldE01CNODSC = null;
  private DecimalField fieldE01CNOFRP = null;
  private DecimalField fieldE01CNOSCG = null;
  private CharacterField fieldE01CNOSCY = null;
  private DecimalField fieldE01CNOCST = null;
  private CharacterField fieldE01CNOBNK = null;
  private DecimalField fieldE01CNOBRN = null;
  private CharacterField fieldE01CNOATY = null;
  private CharacterField fieldE01CNODTY = null;

  /**
  * Constructor for ERA001099Message.
  */
  public ERA001099Message()
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
    recordsize = 184;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH99USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H99USERID");
    fields[1] = fieldH99PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H99PROGRM");
    fields[2] = fieldH99TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H99TIMSYS");
    fields[3] = fieldH99SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H99SCRCOD");
    fields[4] = fieldH99OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H99OPECOD");
    fields[5] = fieldH99FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H99FLGMAS");
    fields[6] = fieldH99FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H99FLGWK1");
    fields[7] = fieldH99FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H99FLGWK2");
    fields[8] = fieldH99FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H99FLGWK3");
    fields[9] = fieldE01CNODCC =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01CNODCC");
    fields[10] = fieldE01CNORCD =
    new CharacterField(message, HEADERSIZE + 44, 4, "E01CNORCD");
    fields[11] = fieldE01CNODSC =
    new CharacterField(message, HEADERSIZE + 48, 45, "E01CNODSC");
    fields[12] = fieldE01CNOFRP =
    new DecimalField(message, HEADERSIZE + 93, 6, 0, "E01CNOFRP");
    fields[13] = fieldE01CNOSCG =
    new DecimalField(message, HEADERSIZE + 99, 17, 0, "E01CNOSCG");
    fields[14] = fieldE01CNOSCY =
    new CharacterField(message, HEADERSIZE + 116, 3, "E01CNOSCY");
    fields[15] = fieldE01CNOCST =
    new DecimalField(message, HEADERSIZE + 119, 9, 3, "E01CNOCST");
    fields[16] = fieldE01CNOBNK =
    new CharacterField(message, HEADERSIZE + 128, 2, "E01CNOBNK");
    fields[17] = fieldE01CNOBRN =
    new DecimalField(message, HEADERSIZE + 130, 5, 0, "E01CNOBRN");
    fields[18] = fieldE01CNOATY =
    new CharacterField(message, HEADERSIZE + 135, 4, "E01CNOATY");
    fields[19] = fieldE01CNODTY =
    new CharacterField(message, HEADERSIZE + 139, 45, "E01CNODTY");

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
  * Set field H99USERID using a String value.
  */
  public void setH99USERID(String newvalue)
  {
    fieldH99USERID.setString(newvalue);
  }

  /**
  * Get value of field H99USERID as a String.
  */
  public String getH99USERID()
  {
    return fieldH99USERID.getString();
  }

  /**
  * Set field H99PROGRM using a String value.
  */
  public void setH99PROGRM(String newvalue)
  {
    fieldH99PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H99PROGRM as a String.
  */
  public String getH99PROGRM()
  {
    return fieldH99PROGRM.getString();
  }

  /**
  * Set field H99TIMSYS using a String value.
  */
  public void setH99TIMSYS(String newvalue)
  {
    fieldH99TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H99TIMSYS as a String.
  */
  public String getH99TIMSYS()
  {
    return fieldH99TIMSYS.getString();
  }

  /**
  * Set field H99SCRCOD using a String value.
  */
  public void setH99SCRCOD(String newvalue)
  {
    fieldH99SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H99SCRCOD as a String.
  */
  public String getH99SCRCOD()
  {
    return fieldH99SCRCOD.getString();
  }

  /**
  * Set field H99OPECOD using a String value.
  */
  public void setH99OPECOD(String newvalue)
  {
    fieldH99OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H99OPECOD as a String.
  */
  public String getH99OPECOD()
  {
    return fieldH99OPECOD.getString();
  }

  /**
  * Set field H99FLGMAS using a String value.
  */
  public void setH99FLGMAS(String newvalue)
  {
    fieldH99FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H99FLGMAS as a String.
  */
  public String getH99FLGMAS()
  {
    return fieldH99FLGMAS.getString();
  }

  /**
  * Set field H99FLGWK1 using a String value.
  */
  public void setH99FLGWK1(String newvalue)
  {
    fieldH99FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H99FLGWK1 as a String.
  */
  public String getH99FLGWK1()
  {
    return fieldH99FLGWK1.getString();
  }

  /**
  * Set field H99FLGWK2 using a String value.
  */
  public void setH99FLGWK2(String newvalue)
  {
    fieldH99FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H99FLGWK2 as a String.
  */
  public String getH99FLGWK2()
  {
    return fieldH99FLGWK2.getString();
  }

  /**
  * Set field H99FLGWK3 using a String value.
  */
  public void setH99FLGWK3(String newvalue)
  {
    fieldH99FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H99FLGWK3 as a String.
  */
  public String getH99FLGWK3()
  {
    return fieldH99FLGWK3.getString();
  }

  /**
  * Set field E01CNODCC using a String value.
  */
  public void setE01CNODCC(String newvalue)
  {
    fieldE01CNODCC.setString(newvalue);
  }

  /**
  * Get value of field E01CNODCC as a String.
  */
  public String getE01CNODCC()
  {
    return fieldE01CNODCC.getString();
  }

  /**
  * Set field E01CNORCD using a String value.
  */
  public void setE01CNORCD(String newvalue)
  {
    fieldE01CNORCD.setString(newvalue);
  }

  /**
  * Get value of field E01CNORCD as a String.
  */
  public String getE01CNORCD()
  {
    return fieldE01CNORCD.getString();
  }

  /**
  * Set field E01CNODSC using a String value.
  */
  public void setE01CNODSC(String newvalue)
  {
    fieldE01CNODSC.setString(newvalue);
  }

  /**
  * Get value of field E01CNODSC as a String.
  */
  public String getE01CNODSC()
  {
    return fieldE01CNODSC.getString();
  }

  /**
  * Set field E01CNOFRP using a String value.
  */
  public void setE01CNOFRP(String newvalue)
  {
    fieldE01CNOFRP.setString(newvalue);
  }

  /**
  * Get value of field E01CNOFRP as a String.
  */
  public String getE01CNOFRP()
  {
    return fieldE01CNOFRP.getString();
  }

  /**
  * Set numeric field E01CNOFRP using a BigDecimal value.
  */
  public void setE01CNOFRP(BigDecimal newvalue)
  {
    fieldE01CNOFRP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CNOFRP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CNOFRP()
  {
    return fieldE01CNOFRP.getBigDecimal();
  }

  /**
  * Set field E01CNOSCG using a String value.
  */
  public void setE01CNOSCG(String newvalue)
  {
    fieldE01CNOSCG.setString(newvalue);
  }

  /**
  * Get value of field E01CNOSCG as a String.
  */
  public String getE01CNOSCG()
  {
    return fieldE01CNOSCG.getString();
  }

  /**
  * Set numeric field E01CNOSCG using a BigDecimal value.
  */
  public void setE01CNOSCG(BigDecimal newvalue)
  {
    fieldE01CNOSCG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CNOSCG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CNOSCG()
  {
    return fieldE01CNOSCG.getBigDecimal();
  }

  /**
  * Set field E01CNOSCY using a String value.
  */
  public void setE01CNOSCY(String newvalue)
  {
    fieldE01CNOSCY.setString(newvalue);
  }

  /**
  * Get value of field E01CNOSCY as a String.
  */
  public String getE01CNOSCY()
  {
    return fieldE01CNOSCY.getString();
  }

  /**
  * Set field E01CNOCST using a String value.
  */
  public void setE01CNOCST(String newvalue)
  {
    fieldE01CNOCST.setString(newvalue);
  }

  /**
  * Get value of field E01CNOCST as a String.
  */
  public String getE01CNOCST()
  {
    return fieldE01CNOCST.getString();
  }

  /**
  * Set numeric field E01CNOCST using a BigDecimal value.
  */
  public void setE01CNOCST(BigDecimal newvalue)
  {
    fieldE01CNOCST.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CNOCST as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CNOCST()
  {
    return fieldE01CNOCST.getBigDecimal();
  }

  /**
  * Set field E01CNOBNK using a String value.
  */
  public void setE01CNOBNK(String newvalue)
  {
    fieldE01CNOBNK.setString(newvalue);
  }

  /**
  * Get value of field E01CNOBNK as a String.
  */
  public String getE01CNOBNK()
  {
    return fieldE01CNOBNK.getString();
  }

  /**
  * Set field E01CNOBRN using a String value.
  */
  public void setE01CNOBRN(String newvalue)
  {
    fieldE01CNOBRN.setString(newvalue);
  }

  /**
  * Get value of field E01CNOBRN as a String.
  */
  public String getE01CNOBRN()
  {
    return fieldE01CNOBRN.getString();
  }

  /**
  * Set numeric field E01CNOBRN using a BigDecimal value.
  */
  public void setE01CNOBRN(BigDecimal newvalue)
  {
    fieldE01CNOBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CNOBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CNOBRN()
  {
    return fieldE01CNOBRN.getBigDecimal();
  }

  /**
  * Set field E01CNOATY using a String value.
  */
  public void setE01CNOATY(String newvalue)
  {
    fieldE01CNOATY.setString(newvalue);
  }

  /**
  * Get value of field E01CNOATY as a String.
  */
  public String getE01CNOATY()
  {
    return fieldE01CNOATY.getString();
  }

  /**
  * Set field E01CNODTY using a String value.
  */
  public void setE01CNODTY(String newvalue)
  {
    fieldE01CNODTY.setString(newvalue);
  }

  /**
  * Get value of field E01CNODTY as a String.
  */
  public String getE01CNODTY()
  {
    return fieldE01CNODTY.getString();
  }

}
