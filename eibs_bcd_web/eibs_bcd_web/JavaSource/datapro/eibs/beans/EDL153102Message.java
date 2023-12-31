package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL153102 physical file definition.
* 
* File level identifier is 1130611112925.
* Record format level identifier is 482CF239356D9.
*/

public class EDL153102Message extends MessageRecord
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
                                     "E02USUBNK",
                                     "E02USUPRD",
                                     "E02USUCCY",
                                     "E02USUVDY",
                                     "E02USUVDM",
                                     "E02USUVDD",
                                     "E02FILCOD",
                                     "E02ACTION",
                                     "E02MSGTXT"
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
                                   "E02USUBNK",
                                   "E02USUPRD",
                                   "E02USUCCY",
                                   "E02USUVDY",
                                   "E02USUVDM",
                                   "E02USUVDD",
                                   "E02FILCOD",
                                   "E02ACTION",
                                   "E02MSGTXT"
                                 };
  final static String fid = "1130611112925";
  final static String rid = "482CF239356D9";
  final static String fmtname = "EDL153102";
  final int FIELDCOUNT = 18;
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
  private CharacterField fieldE02USUBNK = null;
  private CharacterField fieldE02USUPRD = null;
  private CharacterField fieldE02USUCCY = null;
  private DecimalField fieldE02USUVDY = null;
  private DecimalField fieldE02USUVDM = null;
  private DecimalField fieldE02USUVDD = null;
  private CharacterField fieldE02FILCOD = null;
  private CharacterField fieldE02ACTION = null;
  private CharacterField fieldE02MSGTXT = null;

  /**
  * Constructor for EDL153102Message.
  */
  public EDL153102Message()
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
    recordsize = 576;
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
    fields[9] = fieldE02USUBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E02USUBNK");
    fields[10] = fieldE02USUPRD =
    new CharacterField(message, HEADERSIZE + 44, 4, "E02USUPRD");
    fields[11] = fieldE02USUCCY =
    new CharacterField(message, HEADERSIZE + 48, 3, "E02USUCCY");
    fields[12] = fieldE02USUVDY =
    new DecimalField(message, HEADERSIZE + 51, 5, 0, "E02USUVDY");
    fields[13] = fieldE02USUVDM =
    new DecimalField(message, HEADERSIZE + 56, 3, 0, "E02USUVDM");
    fields[14] = fieldE02USUVDD =
    new DecimalField(message, HEADERSIZE + 59, 3, 0, "E02USUVDD");
    fields[15] = fieldE02FILCOD =
    new CharacterField(message, HEADERSIZE + 62, 1, "E02FILCOD");
    fields[16] = fieldE02ACTION =
    new CharacterField(message, HEADERSIZE + 63, 1, "E02ACTION");
    fields[17] = fieldE02MSGTXT =
    new CharacterField(message, HEADERSIZE + 64, 512, "E02MSGTXT");

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
  * Set field E02USUBNK using a String value.
  */
  public void setE02USUBNK(String newvalue)
  {
    fieldE02USUBNK.setString(newvalue);
  }

  /**
  * Get value of field E02USUBNK as a String.
  */
  public String getE02USUBNK()
  {
    return fieldE02USUBNK.getString();
  }

  /**
  * Set field E02USUPRD using a String value.
  */
  public void setE02USUPRD(String newvalue)
  {
    fieldE02USUPRD.setString(newvalue);
  }

  /**
  * Get value of field E02USUPRD as a String.
  */
  public String getE02USUPRD()
  {
    return fieldE02USUPRD.getString();
  }

  /**
  * Set field E02USUCCY using a String value.
  */
  public void setE02USUCCY(String newvalue)
  {
    fieldE02USUCCY.setString(newvalue);
  }

  /**
  * Get value of field E02USUCCY as a String.
  */
  public String getE02USUCCY()
  {
    return fieldE02USUCCY.getString();
  }

  /**
  * Set field E02USUVDY using a String value.
  */
  public void setE02USUVDY(String newvalue)
  {
    fieldE02USUVDY.setString(newvalue);
  }

  /**
  * Get value of field E02USUVDY as a String.
  */
  public String getE02USUVDY()
  {
    return fieldE02USUVDY.getString();
  }

  /**
  * Set numeric field E02USUVDY using a BigDecimal value.
  */
  public void setE02USUVDY(BigDecimal newvalue)
  {
    fieldE02USUVDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02USUVDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02USUVDY()
  {
    return fieldE02USUVDY.getBigDecimal();
  }

  /**
  * Set field E02USUVDM using a String value.
  */
  public void setE02USUVDM(String newvalue)
  {
    fieldE02USUVDM.setString(newvalue);
  }

  /**
  * Get value of field E02USUVDM as a String.
  */
  public String getE02USUVDM()
  {
    return fieldE02USUVDM.getString();
  }

  /**
  * Set numeric field E02USUVDM using a BigDecimal value.
  */
  public void setE02USUVDM(BigDecimal newvalue)
  {
    fieldE02USUVDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02USUVDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02USUVDM()
  {
    return fieldE02USUVDM.getBigDecimal();
  }

  /**
  * Set field E02USUVDD using a String value.
  */
  public void setE02USUVDD(String newvalue)
  {
    fieldE02USUVDD.setString(newvalue);
  }

  /**
  * Get value of field E02USUVDD as a String.
  */
  public String getE02USUVDD()
  {
    return fieldE02USUVDD.getString();
  }

  /**
  * Set numeric field E02USUVDD using a BigDecimal value.
  */
  public void setE02USUVDD(BigDecimal newvalue)
  {
    fieldE02USUVDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02USUVDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02USUVDD()
  {
    return fieldE02USUVDD.getBigDecimal();
  }

  /**
  * Set field E02FILCOD using a String value.
  */
  public void setE02FILCOD(String newvalue)
  {
    fieldE02FILCOD.setString(newvalue);
  }

  /**
  * Get value of field E02FILCOD as a String.
  */
  public String getE02FILCOD()
  {
    return fieldE02FILCOD.getString();
  }

  /**
  * Set field E02ACTION using a String value.
  */
  public void setE02ACTION(String newvalue)
  {
    fieldE02ACTION.setString(newvalue);
  }

  /**
  * Get value of field E02ACTION as a String.
  */
  public String getE02ACTION()
  {
    return fieldE02ACTION.getString();
  }

  /**
  * Set field E02MSGTXT using a String value.
  */
  public void setE02MSGTXT(String newvalue)
  {
    fieldE02MSGTXT.setString(newvalue);
  }

  /**
  * Get value of field E02MSGTXT as a String.
  */
  public String getE02MSGTXT()
  {
    return fieldE02MSGTXT.getString();
  }

}
