package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EIE820101 physical file definition.
* 
* File level identifier is 1130611113212.
* Record format level identifier is 44299E7B698EC.
*/

public class EIE820101Message extends MessageRecord
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
                                     "E01ISIIIC",
                                     "E01ISIDSC",
                                     "E01ISLCP1",
                                     "E01ISLCP2",
                                     "E01ISLCP3",
                                     "E01ISNIRT",
                                     "E01ISOCP1",
                                     "E01ISOCP2",
                                     "E01ISOCP3",
                                     "E01ISOIRT"
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
                                   "E01ISIIIC",
                                   "E01ISIDSC",
                                   "E01ISLCP1",
                                   "E01ISLCP2",
                                   "E01ISLCP3",
                                   "E01ISNIRT",
                                   "E01ISOCP1",
                                   "E01ISOCP2",
                                   "E01ISOCP3",
                                   "E01ISOIRT"
                                 };
  final static String fid = "1130611113212";
  final static String rid = "44299E7B698EC";
  final static String fmtname = "EIE820101";
  final int FIELDCOUNT = 19;
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
  private DecimalField fieldE01ISIIIC = null;
  private CharacterField fieldE01ISIDSC = null;
  private DecimalField fieldE01ISLCP1 = null;
  private DecimalField fieldE01ISLCP2 = null;
  private DecimalField fieldE01ISLCP3 = null;
  private DecimalField fieldE01ISNIRT = null;
  private DecimalField fieldE01ISOCP1 = null;
  private DecimalField fieldE01ISOCP2 = null;
  private DecimalField fieldE01ISOCP3 = null;
  private DecimalField fieldE01ISOIRT = null;

  /**
  * Constructor for EIE820101Message.
  */
  public EIE820101Message()
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
    recordsize = 159;
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
    fields[9] = fieldE01ISIIIC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01ISIIIC");
    fields[10] = fieldE01ISIDSC =
    new CharacterField(message, HEADERSIZE + 55, 60, "E01ISIDSC");
    fields[11] = fieldE01ISLCP1 =
    new DecimalField(message, HEADERSIZE + 115, 3, 0, "E01ISLCP1");
    fields[12] = fieldE01ISLCP2 =
    new DecimalField(message, HEADERSIZE + 118, 3, 0, "E01ISLCP2");
    fields[13] = fieldE01ISLCP3 =
    new DecimalField(message, HEADERSIZE + 121, 5, 0, "E01ISLCP3");
    fields[14] = fieldE01ISNIRT =
    new DecimalField(message, HEADERSIZE + 126, 11, 6, "E01ISNIRT");
    fields[15] = fieldE01ISOCP1 =
    new DecimalField(message, HEADERSIZE + 137, 3, 0, "E01ISOCP1");
    fields[16] = fieldE01ISOCP2 =
    new DecimalField(message, HEADERSIZE + 140, 3, 0, "E01ISOCP2");
    fields[17] = fieldE01ISOCP3 =
    new DecimalField(message, HEADERSIZE + 143, 5, 0, "E01ISOCP3");
    fields[18] = fieldE01ISOIRT =
    new DecimalField(message, HEADERSIZE + 148, 11, 6, "E01ISOIRT");

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
  * Set field E01ISIIIC using a String value.
  */
  public void setE01ISIIIC(String newvalue)
  {
    fieldE01ISIIIC.setString(newvalue);
  }

  /**
  * Get value of field E01ISIIIC as a String.
  */
  public String getE01ISIIIC()
  {
    return fieldE01ISIIIC.getString();
  }

  /**
  * Set numeric field E01ISIIIC using a BigDecimal value.
  */
  public void setE01ISIIIC(BigDecimal newvalue)
  {
    fieldE01ISIIIC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ISIIIC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ISIIIC()
  {
    return fieldE01ISIIIC.getBigDecimal();
  }

  /**
  * Set field E01ISIDSC using a String value.
  */
  public void setE01ISIDSC(String newvalue)
  {
    fieldE01ISIDSC.setString(newvalue);
  }

  /**
  * Get value of field E01ISIDSC as a String.
  */
  public String getE01ISIDSC()
  {
    return fieldE01ISIDSC.getString();
  }

  /**
  * Set field E01ISLCP1 using a String value.
  */
  public void setE01ISLCP1(String newvalue)
  {
    fieldE01ISLCP1.setString(newvalue);
  }

  /**
  * Get value of field E01ISLCP1 as a String.
  */
  public String getE01ISLCP1()
  {
    return fieldE01ISLCP1.getString();
  }

  /**
  * Set numeric field E01ISLCP1 using a BigDecimal value.
  */
  public void setE01ISLCP1(BigDecimal newvalue)
  {
    fieldE01ISLCP1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ISLCP1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ISLCP1()
  {
    return fieldE01ISLCP1.getBigDecimal();
  }

  /**
  * Set field E01ISLCP2 using a String value.
  */
  public void setE01ISLCP2(String newvalue)
  {
    fieldE01ISLCP2.setString(newvalue);
  }

  /**
  * Get value of field E01ISLCP2 as a String.
  */
  public String getE01ISLCP2()
  {
    return fieldE01ISLCP2.getString();
  }

  /**
  * Set numeric field E01ISLCP2 using a BigDecimal value.
  */
  public void setE01ISLCP2(BigDecimal newvalue)
  {
    fieldE01ISLCP2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ISLCP2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ISLCP2()
  {
    return fieldE01ISLCP2.getBigDecimal();
  }

  /**
  * Set field E01ISLCP3 using a String value.
  */
  public void setE01ISLCP3(String newvalue)
  {
    fieldE01ISLCP3.setString(newvalue);
  }

  /**
  * Get value of field E01ISLCP3 as a String.
  */
  public String getE01ISLCP3()
  {
    return fieldE01ISLCP3.getString();
  }

  /**
  * Set numeric field E01ISLCP3 using a BigDecimal value.
  */
  public void setE01ISLCP3(BigDecimal newvalue)
  {
    fieldE01ISLCP3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ISLCP3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ISLCP3()
  {
    return fieldE01ISLCP3.getBigDecimal();
  }

  /**
  * Set field E01ISNIRT using a String value.
  */
  public void setE01ISNIRT(String newvalue)
  {
    fieldE01ISNIRT.setString(newvalue);
  }

  /**
  * Get value of field E01ISNIRT as a String.
  */
  public String getE01ISNIRT()
  {
    return fieldE01ISNIRT.getString();
  }

  /**
  * Set numeric field E01ISNIRT using a BigDecimal value.
  */
  public void setE01ISNIRT(BigDecimal newvalue)
  {
    fieldE01ISNIRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ISNIRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ISNIRT()
  {
    return fieldE01ISNIRT.getBigDecimal();
  }

  /**
  * Set field E01ISOCP1 using a String value.
  */
  public void setE01ISOCP1(String newvalue)
  {
    fieldE01ISOCP1.setString(newvalue);
  }

  /**
  * Get value of field E01ISOCP1 as a String.
  */
  public String getE01ISOCP1()
  {
    return fieldE01ISOCP1.getString();
  }

  /**
  * Set numeric field E01ISOCP1 using a BigDecimal value.
  */
  public void setE01ISOCP1(BigDecimal newvalue)
  {
    fieldE01ISOCP1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ISOCP1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ISOCP1()
  {
    return fieldE01ISOCP1.getBigDecimal();
  }

  /**
  * Set field E01ISOCP2 using a String value.
  */
  public void setE01ISOCP2(String newvalue)
  {
    fieldE01ISOCP2.setString(newvalue);
  }

  /**
  * Get value of field E01ISOCP2 as a String.
  */
  public String getE01ISOCP2()
  {
    return fieldE01ISOCP2.getString();
  }

  /**
  * Set numeric field E01ISOCP2 using a BigDecimal value.
  */
  public void setE01ISOCP2(BigDecimal newvalue)
  {
    fieldE01ISOCP2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ISOCP2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ISOCP2()
  {
    return fieldE01ISOCP2.getBigDecimal();
  }

  /**
  * Set field E01ISOCP3 using a String value.
  */
  public void setE01ISOCP3(String newvalue)
  {
    fieldE01ISOCP3.setString(newvalue);
  }

  /**
  * Get value of field E01ISOCP3 as a String.
  */
  public String getE01ISOCP3()
  {
    return fieldE01ISOCP3.getString();
  }

  /**
  * Set numeric field E01ISOCP3 using a BigDecimal value.
  */
  public void setE01ISOCP3(BigDecimal newvalue)
  {
    fieldE01ISOCP3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ISOCP3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ISOCP3()
  {
    return fieldE01ISOCP3.getBigDecimal();
  }

  /**
  * Set field E01ISOIRT using a String value.
  */
  public void setE01ISOIRT(String newvalue)
  {
    fieldE01ISOIRT.setString(newvalue);
  }

  /**
  * Get value of field E01ISOIRT as a String.
  */
  public String getE01ISOIRT()
  {
    return fieldE01ISOIRT.getString();
  }

  /**
  * Set numeric field E01ISOIRT using a BigDecimal value.
  */
  public void setE01ISOIRT(BigDecimal newvalue)
  {
    fieldE01ISOIRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ISOIRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ISOIRT()
  {
    return fieldE01ISOIRT.getBigDecimal();
  }

}
