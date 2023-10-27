package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV015403 physical file definition.
* 
* File level identifier is 1210422184738.
* Record format level identifier is 495A3CC1827BF.
*/

public class EPV015403Message extends MessageRecord
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
                                     "E03DEAACC",
                                     "E03DEAPRO",
                                     "E03DSCPRO",
                                     "E03DEAOAM",
                                     "E03DEAMAM",
                                     "E03DEAMAD",
                                     "E03DEAMAY",
                                     "E03DEASTS"
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
                                   "E03DEAACC",
                                   "E03DEAPRO",
                                   "E03DSCPRO",
                                   "E03DEAOAM",
                                   "E03DEAMAM",
                                   "E03DEAMAD",
                                   "E03DEAMAY",
                                   "E03DEASTS"
                                 };
  final static String fid = "1210422184738";
  final static String rid = "495A3CC1827BF";
  final static String fmtname = "EPV015403";
  final int FIELDCOUNT = 17;
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
  private DecimalField fieldE03DEAACC = null;
  private CharacterField fieldE03DEAPRO = null;
  private CharacterField fieldE03DSCPRO = null;
  private DecimalField fieldE03DEAOAM = null;
  private DecimalField fieldE03DEAMAM = null;
  private DecimalField fieldE03DEAMAD = null;
  private DecimalField fieldE03DEAMAY = null;
  private CharacterField fieldE03DEASTS = null;

  /**
  * Constructor for EPV015403Message.
  */
  public EPV015403Message()
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
    recordsize = 133;
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
    fields[9] = fieldE03DEAACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E03DEAACC");
    fields[10] = fieldE03DEAPRO =
    new CharacterField(message, HEADERSIZE + 55, 4, "E03DEAPRO");
    fields[11] = fieldE03DSCPRO =
    new CharacterField(message, HEADERSIZE + 59, 45, "E03DSCPRO");
    fields[12] = fieldE03DEAOAM =
    new DecimalField(message, HEADERSIZE + 104, 17, 2, "E03DEAOAM");
    fields[13] = fieldE03DEAMAM =
    new DecimalField(message, HEADERSIZE + 121, 3, 0, "E03DEAMAM");
    fields[14] = fieldE03DEAMAD =
    new DecimalField(message, HEADERSIZE + 124, 3, 0, "E03DEAMAD");
    fields[15] = fieldE03DEAMAY =
    new DecimalField(message, HEADERSIZE + 127, 5, 0, "E03DEAMAY");
    fields[16] = fieldE03DEASTS =
    new CharacterField(message, HEADERSIZE + 132, 1, "E03DEASTS");

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
  * Set field E03DEAACC using a String value.
  */
  public void setE03DEAACC(String newvalue)
  {
    fieldE03DEAACC.setString(newvalue);
  }

  /**
  * Get value of field E03DEAACC as a String.
  */
  public String getE03DEAACC()
  {
    return fieldE03DEAACC.getString();
  }

  /**
  * Set numeric field E03DEAACC using a BigDecimal value.
  */
  public void setE03DEAACC(BigDecimal newvalue)
  {
    fieldE03DEAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DEAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DEAACC()
  {
    return fieldE03DEAACC.getBigDecimal();
  }

  /**
  * Set field E03DEAPRO using a String value.
  */
  public void setE03DEAPRO(String newvalue)
  {
    fieldE03DEAPRO.setString(newvalue);
  }

  /**
  * Get value of field E03DEAPRO as a String.
  */
  public String getE03DEAPRO()
  {
    return fieldE03DEAPRO.getString();
  }

  /**
  * Set field E03DSCPRO using a String value.
  */
  public void setE03DSCPRO(String newvalue)
  {
    fieldE03DSCPRO.setString(newvalue);
  }

  /**
  * Get value of field E03DSCPRO as a String.
  */
  public String getE03DSCPRO()
  {
    return fieldE03DSCPRO.getString();
  }

  /**
  * Set field E03DEAOAM using a String value.
  */
  public void setE03DEAOAM(String newvalue)
  {
    fieldE03DEAOAM.setString(newvalue);
  }

  /**
  * Get value of field E03DEAOAM as a String.
  */
  public String getE03DEAOAM()
  {
    return fieldE03DEAOAM.getString();
  }

  /**
  * Set numeric field E03DEAOAM using a BigDecimal value.
  */
  public void setE03DEAOAM(BigDecimal newvalue)
  {
    fieldE03DEAOAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DEAOAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DEAOAM()
  {
    return fieldE03DEAOAM.getBigDecimal();
  }

  /**
  * Set field E03DEAMAM using a String value.
  */
  public void setE03DEAMAM(String newvalue)
  {
    fieldE03DEAMAM.setString(newvalue);
  }

  /**
  * Get value of field E03DEAMAM as a String.
  */
  public String getE03DEAMAM()
  {
    return fieldE03DEAMAM.getString();
  }

  /**
  * Set numeric field E03DEAMAM using a BigDecimal value.
  */
  public void setE03DEAMAM(BigDecimal newvalue)
  {
    fieldE03DEAMAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DEAMAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DEAMAM()
  {
    return fieldE03DEAMAM.getBigDecimal();
  }

  /**
  * Set field E03DEAMAD using a String value.
  */
  public void setE03DEAMAD(String newvalue)
  {
    fieldE03DEAMAD.setString(newvalue);
  }

  /**
  * Get value of field E03DEAMAD as a String.
  */
  public String getE03DEAMAD()
  {
    return fieldE03DEAMAD.getString();
  }

  /**
  * Set numeric field E03DEAMAD using a BigDecimal value.
  */
  public void setE03DEAMAD(BigDecimal newvalue)
  {
    fieldE03DEAMAD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DEAMAD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DEAMAD()
  {
    return fieldE03DEAMAD.getBigDecimal();
  }

  /**
  * Set field E03DEAMAY using a String value.
  */
  public void setE03DEAMAY(String newvalue)
  {
    fieldE03DEAMAY.setString(newvalue);
  }

  /**
  * Get value of field E03DEAMAY as a String.
  */
  public String getE03DEAMAY()
  {
    return fieldE03DEAMAY.getString();
  }

  /**
  * Set numeric field E03DEAMAY using a BigDecimal value.
  */
  public void setE03DEAMAY(BigDecimal newvalue)
  {
    fieldE03DEAMAY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DEAMAY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DEAMAY()
  {
    return fieldE03DEAMAY.getBigDecimal();
  }

  /**
  * Set field E03DEASTS using a String value.
  */
  public void setE03DEASTS(String newvalue)
  {
    fieldE03DEASTS.setString(newvalue);
  }

  /**
  * Get value of field E03DEASTS as a String.
  */
  public String getE03DEASTS()
  {
    return fieldE03DEASTS.getString();
  }

}
