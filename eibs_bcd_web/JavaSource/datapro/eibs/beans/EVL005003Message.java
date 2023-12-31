package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EVL005003 physical file definition.
* 
* File level identifier is 1130611113446.
* Record format level identifier is 4965A2C1E1F09.
*/

public class EVL005003Message extends MessageRecord
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
                                     "E03BALBNK",
                                     "E03BALBRN",
                                     "E03BALTIP",
                                     "E03BALTIN",
                                     "E03BALSUB",
                                     "E03BALSUN",
                                     "E03BALLOT",
                                     "E03BALSER",
                                     "E03BALINI",
                                     "E03BALFIN",
                                     "E03BALLST",
                                     "E03BALBAL"
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
                                   "E03BALBNK",
                                   "E03BALBRN",
                                   "E03BALTIP",
                                   "E03BALTIN",
                                   "E03BALSUB",
                                   "E03BALSUN",
                                   "E03BALLOT",
                                   "E03BALSER",
                                   "E03BALINI",
                                   "E03BALFIN",
                                   "E03BALLST",
                                   "E03BALBAL"
                                 };
  final static String fid = "1130611113446";
  final static String rid = "4965A2C1E1F09";
  final static String fmtname = "EVL005003";
  final int FIELDCOUNT = 21;
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
  private CharacterField fieldE03BALBNK = null;
  private DecimalField fieldE03BALBRN = null;
  private CharacterField fieldE03BALTIP = null;
  private CharacterField fieldE03BALTIN = null;
  private CharacterField fieldE03BALSUB = null;
  private CharacterField fieldE03BALSUN = null;
  private DecimalField fieldE03BALLOT = null;
  private DecimalField fieldE03BALSER = null;
  private DecimalField fieldE03BALINI = null;
  private DecimalField fieldE03BALFIN = null;
  private DecimalField fieldE03BALLST = null;
  private DecimalField fieldE03BALBAL = null;

  /**
  * Constructor for EVL005003Message.
  */
  public EVL005003Message()
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
    recordsize = 225;
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
    fields[9] = fieldE03BALBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E03BALBNK");
    fields[10] = fieldE03BALBRN =
    new DecimalField(message, HEADERSIZE + 44, 5, 0, "E03BALBRN");
    fields[11] = fieldE03BALTIP =
    new CharacterField(message, HEADERSIZE + 49, 4, "E03BALTIP");
    fields[12] = fieldE03BALTIN =
    new CharacterField(message, HEADERSIZE + 53, 45, "E03BALTIN");
    fields[13] = fieldE03BALSUB =
    new CharacterField(message, HEADERSIZE + 98, 4, "E03BALSUB");
    fields[14] = fieldE03BALSUN =
    new CharacterField(message, HEADERSIZE + 102, 45, "E03BALSUN");
    fields[15] = fieldE03BALLOT =
    new DecimalField(message, HEADERSIZE + 147, 13, 0, "E03BALLOT");
    fields[16] = fieldE03BALSER =
    new DecimalField(message, HEADERSIZE + 160, 13, 0, "E03BALSER");
    fields[17] = fieldE03BALINI =
    new DecimalField(message, HEADERSIZE + 173, 13, 0, "E03BALINI");
    fields[18] = fieldE03BALFIN =
    new DecimalField(message, HEADERSIZE + 186, 13, 0, "E03BALFIN");
    fields[19] = fieldE03BALLST =
    new DecimalField(message, HEADERSIZE + 199, 13, 0, "E03BALLST");
    fields[20] = fieldE03BALBAL =
    new DecimalField(message, HEADERSIZE + 212, 13, 0, "E03BALBAL");

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
  * Set field E03BALBNK using a String value.
  */
  public void setE03BALBNK(String newvalue)
  {
    fieldE03BALBNK.setString(newvalue);
  }

  /**
  * Get value of field E03BALBNK as a String.
  */
  public String getE03BALBNK()
  {
    return fieldE03BALBNK.getString();
  }

  /**
  * Set field E03BALBRN using a String value.
  */
  public void setE03BALBRN(String newvalue)
  {
    fieldE03BALBRN.setString(newvalue);
  }

  /**
  * Get value of field E03BALBRN as a String.
  */
  public String getE03BALBRN()
  {
    return fieldE03BALBRN.getString();
  }

  /**
  * Set numeric field E03BALBRN using a BigDecimal value.
  */
  public void setE03BALBRN(BigDecimal newvalue)
  {
    fieldE03BALBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03BALBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03BALBRN()
  {
    return fieldE03BALBRN.getBigDecimal();
  }

  /**
  * Set field E03BALTIP using a String value.
  */
  public void setE03BALTIP(String newvalue)
  {
    fieldE03BALTIP.setString(newvalue);
  }

  /**
  * Get value of field E03BALTIP as a String.
  */
  public String getE03BALTIP()
  {
    return fieldE03BALTIP.getString();
  }

  /**
  * Set field E03BALTIN using a String value.
  */
  public void setE03BALTIN(String newvalue)
  {
    fieldE03BALTIN.setString(newvalue);
  }

  /**
  * Get value of field E03BALTIN as a String.
  */
  public String getE03BALTIN()
  {
    return fieldE03BALTIN.getString();
  }

  /**
  * Set field E03BALSUB using a String value.
  */
  public void setE03BALSUB(String newvalue)
  {
    fieldE03BALSUB.setString(newvalue);
  }

  /**
  * Get value of field E03BALSUB as a String.
  */
  public String getE03BALSUB()
  {
    return fieldE03BALSUB.getString();
  }

  /**
  * Set field E03BALSUN using a String value.
  */
  public void setE03BALSUN(String newvalue)
  {
    fieldE03BALSUN.setString(newvalue);
  }

  /**
  * Get value of field E03BALSUN as a String.
  */
  public String getE03BALSUN()
  {
    return fieldE03BALSUN.getString();
  }

  /**
  * Set field E03BALLOT using a String value.
  */
  public void setE03BALLOT(String newvalue)
  {
    fieldE03BALLOT.setString(newvalue);
  }

  /**
  * Get value of field E03BALLOT as a String.
  */
  public String getE03BALLOT()
  {
    return fieldE03BALLOT.getString();
  }

  /**
  * Set numeric field E03BALLOT using a BigDecimal value.
  */
  public void setE03BALLOT(BigDecimal newvalue)
  {
    fieldE03BALLOT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03BALLOT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03BALLOT()
  {
    return fieldE03BALLOT.getBigDecimal();
  }

  /**
  * Set field E03BALSER using a String value.
  */
  public void setE03BALSER(String newvalue)
  {
    fieldE03BALSER.setString(newvalue);
  }

  /**
  * Get value of field E03BALSER as a String.
  */
  public String getE03BALSER()
  {
    return fieldE03BALSER.getString();
  }

  /**
  * Set numeric field E03BALSER using a BigDecimal value.
  */
  public void setE03BALSER(BigDecimal newvalue)
  {
    fieldE03BALSER.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03BALSER as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03BALSER()
  {
    return fieldE03BALSER.getBigDecimal();
  }

  /**
  * Set field E03BALINI using a String value.
  */
  public void setE03BALINI(String newvalue)
  {
    fieldE03BALINI.setString(newvalue);
  }

  /**
  * Get value of field E03BALINI as a String.
  */
  public String getE03BALINI()
  {
    return fieldE03BALINI.getString();
  }

  /**
  * Set numeric field E03BALINI using a BigDecimal value.
  */
  public void setE03BALINI(BigDecimal newvalue)
  {
    fieldE03BALINI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03BALINI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03BALINI()
  {
    return fieldE03BALINI.getBigDecimal();
  }

  /**
  * Set field E03BALFIN using a String value.
  */
  public void setE03BALFIN(String newvalue)
  {
    fieldE03BALFIN.setString(newvalue);
  }

  /**
  * Get value of field E03BALFIN as a String.
  */
  public String getE03BALFIN()
  {
    return fieldE03BALFIN.getString();
  }

  /**
  * Set numeric field E03BALFIN using a BigDecimal value.
  */
  public void setE03BALFIN(BigDecimal newvalue)
  {
    fieldE03BALFIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03BALFIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03BALFIN()
  {
    return fieldE03BALFIN.getBigDecimal();
  }

  /**
  * Set field E03BALLST using a String value.
  */
  public void setE03BALLST(String newvalue)
  {
    fieldE03BALLST.setString(newvalue);
  }

  /**
  * Get value of field E03BALLST as a String.
  */
  public String getE03BALLST()
  {
    return fieldE03BALLST.getString();
  }

  /**
  * Set numeric field E03BALLST using a BigDecimal value.
  */
  public void setE03BALLST(BigDecimal newvalue)
  {
    fieldE03BALLST.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03BALLST as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03BALLST()
  {
    return fieldE03BALLST.getBigDecimal();
  }

  /**
  * Set field E03BALBAL using a String value.
  */
  public void setE03BALBAL(String newvalue)
  {
    fieldE03BALBAL.setString(newvalue);
  }

  /**
  * Get value of field E03BALBAL as a String.
  */
  public String getE03BALBAL()
  {
    return fieldE03BALBAL.getString();
  }

  /**
  * Set numeric field E03BALBAL using a BigDecimal value.
  */
  public void setE03BALBAL(BigDecimal newvalue)
  {
    fieldE03BALBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03BALBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03BALBAL()
  {
    return fieldE03BALBAL.getBigDecimal();
  }

}
