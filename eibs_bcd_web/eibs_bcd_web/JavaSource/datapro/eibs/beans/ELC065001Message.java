package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ELC065001 physical file definition.
* 
* File level identifier is 1130611113218.
* Record format level identifier is 3BE96B1017C63.
*/

public class ELC065001Message extends MessageRecord
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
                                     "E01LCABNK",
                                     "E01LCAATY",
                                     "E01LCATAR",
                                     "E01LCACUN",
                                     "E01LCATCY",
                                     "E01LCAACY",
                                     "E01LCADSC",
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
                                   "E01LCABNK",
                                   "E01LCAATY",
                                   "E01LCATAR",
                                   "E01LCACUN",
                                   "E01LCATCY",
                                   "E01LCAACY",
                                   "E01LCADSC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1130611113218";
  final static String rid = "3BE96B1017C63";
  final static String fmtname = "ELC065001";
  final int FIELDCOUNT = 17;
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
  private CharacterField fieldE01LCABNK = null;
  private CharacterField fieldE01LCAATY = null;
  private CharacterField fieldE01LCATAR = null;
  private DecimalField fieldE01LCACUN = null;
  private CharacterField fieldE01LCATCY = null;
  private CharacterField fieldE01LCAACY = null;
  private CharacterField fieldE01LCADSC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ELC065001Message.
  */
  public ELC065001Message()
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
    recordsize = 127;
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
    fields[9] = fieldE01LCABNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01LCABNK");
    fields[10] = fieldE01LCAATY =
    new CharacterField(message, HEADERSIZE + 44, 4, "E01LCAATY");
    fields[11] = fieldE01LCATAR =
    new CharacterField(message, HEADERSIZE + 48, 2, "E01LCATAR");
    fields[12] = fieldE01LCACUN =
    new DecimalField(message, HEADERSIZE + 50, 10, 0, "E01LCACUN");
    fields[13] = fieldE01LCATCY =
    new CharacterField(message, HEADERSIZE + 60, 3, "E01LCATCY");
    fields[14] = fieldE01LCAACY =
    new CharacterField(message, HEADERSIZE + 63, 3, "E01LCAACY");
    fields[15] = fieldE01LCADSC =
    new CharacterField(message, HEADERSIZE + 66, 60, "E01LCADSC");
    fields[16] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 126, 1, "E01INDOPE");

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
  * Set field E01LCABNK using a String value.
  */
  public void setE01LCABNK(String newvalue)
  {
    fieldE01LCABNK.setString(newvalue);
  }

  /**
  * Get value of field E01LCABNK as a String.
  */
  public String getE01LCABNK()
  {
    return fieldE01LCABNK.getString();
  }

  /**
  * Set field E01LCAATY using a String value.
  */
  public void setE01LCAATY(String newvalue)
  {
    fieldE01LCAATY.setString(newvalue);
  }

  /**
  * Get value of field E01LCAATY as a String.
  */
  public String getE01LCAATY()
  {
    return fieldE01LCAATY.getString();
  }

  /**
  * Set field E01LCATAR using a String value.
  */
  public void setE01LCATAR(String newvalue)
  {
    fieldE01LCATAR.setString(newvalue);
  }

  /**
  * Get value of field E01LCATAR as a String.
  */
  public String getE01LCATAR()
  {
    return fieldE01LCATAR.getString();
  }

  /**
  * Set field E01LCACUN using a String value.
  */
  public void setE01LCACUN(String newvalue)
  {
    fieldE01LCACUN.setString(newvalue);
  }

  /**
  * Get value of field E01LCACUN as a String.
  */
  public String getE01LCACUN()
  {
    return fieldE01LCACUN.getString();
  }

  /**
  * Set numeric field E01LCACUN using a BigDecimal value.
  */
  public void setE01LCACUN(BigDecimal newvalue)
  {
    fieldE01LCACUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCACUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCACUN()
  {
    return fieldE01LCACUN.getBigDecimal();
  }

  /**
  * Set field E01LCATCY using a String value.
  */
  public void setE01LCATCY(String newvalue)
  {
    fieldE01LCATCY.setString(newvalue);
  }

  /**
  * Get value of field E01LCATCY as a String.
  */
  public String getE01LCATCY()
  {
    return fieldE01LCATCY.getString();
  }

  /**
  * Set field E01LCAACY using a String value.
  */
  public void setE01LCAACY(String newvalue)
  {
    fieldE01LCAACY.setString(newvalue);
  }

  /**
  * Get value of field E01LCAACY as a String.
  */
  public String getE01LCAACY()
  {
    return fieldE01LCAACY.getString();
  }

  /**
  * Set field E01LCADSC using a String value.
  */
  public void setE01LCADSC(String newvalue)
  {
    fieldE01LCADSC.setString(newvalue);
  }

  /**
  * Get value of field E01LCADSC as a String.
  */
  public String getE01LCADSC()
  {
    return fieldE01LCADSC.getString();
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
