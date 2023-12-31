package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL053501 physical file definition.
* 
* File level identifier is 1140718112109.
* Record format level identifier is 4491EAF8B2864.
*/

public class EDL053501Message extends MessageRecord
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
                                     "E01MRTBNK",
                                     "E01MRTCCY",
                                     "E01MRTPRD",
                                     "E01MRTDSC",
                                     "E01MRTLMM",
                                     "E01MRTLMD",
                                     "E01MRTLMY"
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
                                   "E01MRTBNK",
                                   "E01MRTCCY",
                                   "E01MRTPRD",
                                   "E01MRTDSC",
                                   "E01MRTLMM",
                                   "E01MRTLMD",
                                   "E01MRTLMY"
                                 };
  final static String fid = "1140718112109";
  final static String rid = "4491EAF8B2864";
  final static String fmtname = "EDL053501";
  final int FIELDCOUNT = 16;
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
  private CharacterField fieldE01MRTBNK = null;
  private CharacterField fieldE01MRTCCY = null;
  private CharacterField fieldE01MRTPRD = null;
  private CharacterField fieldE01MRTDSC = null;
  private DecimalField fieldE01MRTLMM = null;
  private DecimalField fieldE01MRTLMD = null;
  private DecimalField fieldE01MRTLMY = null;

  /**
  * Constructor for EDL053501Message.
  */
  public EDL053501Message()
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
    recordsize = 107;
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
    fields[9] = fieldE01MRTBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01MRTBNK");
    fields[10] = fieldE01MRTCCY =
    new CharacterField(message, HEADERSIZE + 44, 3, "E01MRTCCY");
    fields[11] = fieldE01MRTPRD =
    new CharacterField(message, HEADERSIZE + 47, 4, "E01MRTPRD");
    fields[12] = fieldE01MRTDSC =
    new CharacterField(message, HEADERSIZE + 51, 45, "E01MRTDSC");
    fields[13] = fieldE01MRTLMM =
    new DecimalField(message, HEADERSIZE + 96, 3, 0, "E01MRTLMM");
    fields[14] = fieldE01MRTLMD =
    new DecimalField(message, HEADERSIZE + 99, 3, 0, "E01MRTLMD");
    fields[15] = fieldE01MRTLMY =
    new DecimalField(message, HEADERSIZE + 102, 5, 0, "E01MRTLMY");

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
  * Set field E01MRTBNK using a String value.
  */
  public void setE01MRTBNK(String newvalue)
  {
    fieldE01MRTBNK.setString(newvalue);
  }

  /**
  * Get value of field E01MRTBNK as a String.
  */
  public String getE01MRTBNK()
  {
    return fieldE01MRTBNK.getString();
  }

  /**
  * Set field E01MRTCCY using a String value.
  */
  public void setE01MRTCCY(String newvalue)
  {
    fieldE01MRTCCY.setString(newvalue);
  }

  /**
  * Get value of field E01MRTCCY as a String.
  */
  public String getE01MRTCCY()
  {
    return fieldE01MRTCCY.getString();
  }

  /**
  * Set field E01MRTPRD using a String value.
  */
  public void setE01MRTPRD(String newvalue)
  {
    fieldE01MRTPRD.setString(newvalue);
  }

  /**
  * Get value of field E01MRTPRD as a String.
  */
  public String getE01MRTPRD()
  {
    return fieldE01MRTPRD.getString();
  }

  /**
  * Set field E01MRTDSC using a String value.
  */
  public void setE01MRTDSC(String newvalue)
  {
    fieldE01MRTDSC.setString(newvalue);
  }

  /**
  * Get value of field E01MRTDSC as a String.
  */
  public String getE01MRTDSC()
  {
    return fieldE01MRTDSC.getString();
  }

  /**
  * Set field E01MRTLMM using a String value.
  */
  public void setE01MRTLMM(String newvalue)
  {
    fieldE01MRTLMM.setString(newvalue);
  }

  /**
  * Get value of field E01MRTLMM as a String.
  */
  public String getE01MRTLMM()
  {
    return fieldE01MRTLMM.getString();
  }

  /**
  * Set numeric field E01MRTLMM using a BigDecimal value.
  */
  public void setE01MRTLMM(BigDecimal newvalue)
  {
    fieldE01MRTLMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MRTLMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MRTLMM()
  {
    return fieldE01MRTLMM.getBigDecimal();
  }

  /**
  * Set field E01MRTLMD using a String value.
  */
  public void setE01MRTLMD(String newvalue)
  {
    fieldE01MRTLMD.setString(newvalue);
  }

  /**
  * Get value of field E01MRTLMD as a String.
  */
  public String getE01MRTLMD()
  {
    return fieldE01MRTLMD.getString();
  }

  /**
  * Set numeric field E01MRTLMD using a BigDecimal value.
  */
  public void setE01MRTLMD(BigDecimal newvalue)
  {
    fieldE01MRTLMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MRTLMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MRTLMD()
  {
    return fieldE01MRTLMD.getBigDecimal();
  }

  /**
  * Set field E01MRTLMY using a String value.
  */
  public void setE01MRTLMY(String newvalue)
  {
    fieldE01MRTLMY.setString(newvalue);
  }

  /**
  * Get value of field E01MRTLMY as a String.
  */
  public String getE01MRTLMY()
  {
    return fieldE01MRTLMY.getString();
  }

  /**
  * Set numeric field E01MRTLMY using a BigDecimal value.
  */
  public void setE01MRTLMY(BigDecimal newvalue)
  {
    fieldE01MRTLMY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MRTLMY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MRTLMY()
  {
    return fieldE01MRTLMY.getBigDecimal();
  }

}
