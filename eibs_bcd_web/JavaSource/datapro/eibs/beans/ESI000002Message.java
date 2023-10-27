package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESI000002 physical file definition.
* 
* File level identifier is 1130611113404.
* Record format level identifier is 3DF9A3C31F7AA.
*/

public class ESI000002Message extends MessageRecord
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
                                     "E02WTIPOI",
                                     "E02WRIF",
                                     "E02WCUENT",
                                     "E02WDESCR",
                                     "E02WVIGEN",
                                     "E02WREEST",
                                     "E02WVENCI",
                                     "E02WLITIG",
                                     "E02WTOEJE",
                                     "E02WTOGEN",
                                     "E02WTOCAS",
                                     "E02NUMREC",
                                     "E02INDOPE"
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
                                   "E02WTIPOI",
                                   "E02WRIF",
                                   "E02WCUENT",
                                   "E02WDESCR",
                                   "E02WVIGEN",
                                   "E02WREEST",
                                   "E02WVENCI",
                                   "E02WLITIG",
                                   "E02WTOEJE",
                                   "E02WTOGEN",
                                   "E02WTOCAS",
                                   "E02NUMREC",
                                   "E02INDOPE"
                                 };
  final static String fid = "1130611113404";
  final static String rid = "3DF9A3C31F7AA";
  final static String fmtname = "ESI000002";
  final int FIELDCOUNT = 22;
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
  private CharacterField fieldE02WTIPOI = null;
  private DecimalField fieldE02WRIF = null;
  private DecimalField fieldE02WCUENT = null;
  private CharacterField fieldE02WDESCR = null;
  private DecimalField fieldE02WVIGEN = null;
  private DecimalField fieldE02WREEST = null;
  private DecimalField fieldE02WVENCI = null;
  private DecimalField fieldE02WLITIG = null;
  private DecimalField fieldE02WTOEJE = null;
  private DecimalField fieldE02WTOGEN = null;
  private DecimalField fieldE02WTOCAS = null;
  private DecimalField fieldE02NUMREC = null;
  private CharacterField fieldE02INDOPE = null;

  /**
  * Constructor for ESI000002Message.
  */
  public ESI000002Message()
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
    recordsize = 277;
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
    fields[9] = fieldE02WTIPOI =
    new CharacterField(message, HEADERSIZE + 42, 1, "E02WTIPOI");
    fields[10] = fieldE02WRIF =
    new DecimalField(message, HEADERSIZE + 43, 20, 0, "E02WRIF");
    fields[11] = fieldE02WCUENT =
    new DecimalField(message, HEADERSIZE + 63, 6, 0, "E02WCUENT");
    fields[12] = fieldE02WDESCR =
    new CharacterField(message, HEADERSIZE + 69, 45, "E02WDESCR");
    fields[13] = fieldE02WVIGEN =
    new DecimalField(message, HEADERSIZE + 114, 22, 2, "E02WVIGEN");
    fields[14] = fieldE02WREEST =
    new DecimalField(message, HEADERSIZE + 136, 22, 2, "E02WREEST");
    fields[15] = fieldE02WVENCI =
    new DecimalField(message, HEADERSIZE + 158, 22, 2, "E02WVENCI");
    fields[16] = fieldE02WLITIG =
    new DecimalField(message, HEADERSIZE + 180, 22, 2, "E02WLITIG");
    fields[17] = fieldE02WTOEJE =
    new DecimalField(message, HEADERSIZE + 202, 22, 2, "E02WTOEJE");
    fields[18] = fieldE02WTOGEN =
    new DecimalField(message, HEADERSIZE + 224, 22, 2, "E02WTOGEN");
    fields[19] = fieldE02WTOCAS =
    new DecimalField(message, HEADERSIZE + 246, 22, 2, "E02WTOCAS");
    fields[20] = fieldE02NUMREC =
    new DecimalField(message, HEADERSIZE + 268, 8, 0, "E02NUMREC");
    fields[21] = fieldE02INDOPE =
    new CharacterField(message, HEADERSIZE + 276, 1, "E02INDOPE");

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
  * Set field E02WTIPOI using a String value.
  */
  public void setE02WTIPOI(String newvalue)
  {
    fieldE02WTIPOI.setString(newvalue);
  }

  /**
  * Get value of field E02WTIPOI as a String.
  */
  public String getE02WTIPOI()
  {
    return fieldE02WTIPOI.getString();
  }

  /**
  * Set field E02WRIF using a String value.
  */
  public void setE02WRIF(String newvalue)
  {
    fieldE02WRIF.setString(newvalue);
  }

  /**
  * Get value of field E02WRIF as a String.
  */
  public String getE02WRIF()
  {
    return fieldE02WRIF.getString();
  }

  /**
  * Set numeric field E02WRIF using a BigDecimal value.
  */
  public void setE02WRIF(BigDecimal newvalue)
  {
    fieldE02WRIF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02WRIF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02WRIF()
  {
    return fieldE02WRIF.getBigDecimal();
  }

  /**
  * Set field E02WCUENT using a String value.
  */
  public void setE02WCUENT(String newvalue)
  {
    fieldE02WCUENT.setString(newvalue);
  }

  /**
  * Get value of field E02WCUENT as a String.
  */
  public String getE02WCUENT()
  {
    return fieldE02WCUENT.getString();
  }

  /**
  * Set numeric field E02WCUENT using a BigDecimal value.
  */
  public void setE02WCUENT(BigDecimal newvalue)
  {
    fieldE02WCUENT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02WCUENT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02WCUENT()
  {
    return fieldE02WCUENT.getBigDecimal();
  }

  /**
  * Set field E02WDESCR using a String value.
  */
  public void setE02WDESCR(String newvalue)
  {
    fieldE02WDESCR.setString(newvalue);
  }

  /**
  * Get value of field E02WDESCR as a String.
  */
  public String getE02WDESCR()
  {
    return fieldE02WDESCR.getString();
  }

  /**
  * Set field E02WVIGEN using a String value.
  */
  public void setE02WVIGEN(String newvalue)
  {
    fieldE02WVIGEN.setString(newvalue);
  }

  /**
  * Get value of field E02WVIGEN as a String.
  */
  public String getE02WVIGEN()
  {
    return fieldE02WVIGEN.getString();
  }

  /**
  * Set numeric field E02WVIGEN using a BigDecimal value.
  */
  public void setE02WVIGEN(BigDecimal newvalue)
  {
    fieldE02WVIGEN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02WVIGEN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02WVIGEN()
  {
    return fieldE02WVIGEN.getBigDecimal();
  }

  /**
  * Set field E02WREEST using a String value.
  */
  public void setE02WREEST(String newvalue)
  {
    fieldE02WREEST.setString(newvalue);
  }

  /**
  * Get value of field E02WREEST as a String.
  */
  public String getE02WREEST()
  {
    return fieldE02WREEST.getString();
  }

  /**
  * Set numeric field E02WREEST using a BigDecimal value.
  */
  public void setE02WREEST(BigDecimal newvalue)
  {
    fieldE02WREEST.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02WREEST as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02WREEST()
  {
    return fieldE02WREEST.getBigDecimal();
  }

  /**
  * Set field E02WVENCI using a String value.
  */
  public void setE02WVENCI(String newvalue)
  {
    fieldE02WVENCI.setString(newvalue);
  }

  /**
  * Get value of field E02WVENCI as a String.
  */
  public String getE02WVENCI()
  {
    return fieldE02WVENCI.getString();
  }

  /**
  * Set numeric field E02WVENCI using a BigDecimal value.
  */
  public void setE02WVENCI(BigDecimal newvalue)
  {
    fieldE02WVENCI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02WVENCI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02WVENCI()
  {
    return fieldE02WVENCI.getBigDecimal();
  }

  /**
  * Set field E02WLITIG using a String value.
  */
  public void setE02WLITIG(String newvalue)
  {
    fieldE02WLITIG.setString(newvalue);
  }

  /**
  * Get value of field E02WLITIG as a String.
  */
  public String getE02WLITIG()
  {
    return fieldE02WLITIG.getString();
  }

  /**
  * Set numeric field E02WLITIG using a BigDecimal value.
  */
  public void setE02WLITIG(BigDecimal newvalue)
  {
    fieldE02WLITIG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02WLITIG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02WLITIG()
  {
    return fieldE02WLITIG.getBigDecimal();
  }

  /**
  * Set field E02WTOEJE using a String value.
  */
  public void setE02WTOEJE(String newvalue)
  {
    fieldE02WTOEJE.setString(newvalue);
  }

  /**
  * Get value of field E02WTOEJE as a String.
  */
  public String getE02WTOEJE()
  {
    return fieldE02WTOEJE.getString();
  }

  /**
  * Set numeric field E02WTOEJE using a BigDecimal value.
  */
  public void setE02WTOEJE(BigDecimal newvalue)
  {
    fieldE02WTOEJE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02WTOEJE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02WTOEJE()
  {
    return fieldE02WTOEJE.getBigDecimal();
  }

  /**
  * Set field E02WTOGEN using a String value.
  */
  public void setE02WTOGEN(String newvalue)
  {
    fieldE02WTOGEN.setString(newvalue);
  }

  /**
  * Get value of field E02WTOGEN as a String.
  */
  public String getE02WTOGEN()
  {
    return fieldE02WTOGEN.getString();
  }

  /**
  * Set numeric field E02WTOGEN using a BigDecimal value.
  */
  public void setE02WTOGEN(BigDecimal newvalue)
  {
    fieldE02WTOGEN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02WTOGEN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02WTOGEN()
  {
    return fieldE02WTOGEN.getBigDecimal();
  }

  /**
  * Set field E02WTOCAS using a String value.
  */
  public void setE02WTOCAS(String newvalue)
  {
    fieldE02WTOCAS.setString(newvalue);
  }

  /**
  * Get value of field E02WTOCAS as a String.
  */
  public String getE02WTOCAS()
  {
    return fieldE02WTOCAS.getString();
  }

  /**
  * Set numeric field E02WTOCAS using a BigDecimal value.
  */
  public void setE02WTOCAS(BigDecimal newvalue)
  {
    fieldE02WTOCAS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02WTOCAS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02WTOCAS()
  {
    return fieldE02WTOCAS.getBigDecimal();
  }

  /**
  * Set field E02NUMREC using a String value.
  */
  public void setE02NUMREC(String newvalue)
  {
    fieldE02NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E02NUMREC as a String.
  */
  public String getE02NUMREC()
  {
    return fieldE02NUMREC.getString();
  }

  /**
  * Set numeric field E02NUMREC using a BigDecimal value.
  */
  public void setE02NUMREC(BigDecimal newvalue)
  {
    fieldE02NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02NUMREC()
  {
    return fieldE02NUMREC.getBigDecimal();
  }

  /**
  * Set field E02INDOPE using a String value.
  */
  public void setE02INDOPE(String newvalue)
  {
    fieldE02INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E02INDOPE as a String.
  */
  public String getE02INDOPE()
  {
    return fieldE02INDOPE.getString();
  }

}
