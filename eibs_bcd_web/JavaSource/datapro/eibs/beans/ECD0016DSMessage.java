package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECD0016DS physical file definition.
* 
* File level identifier is 1130611112843.
* Record format level identifier is 573AEAA30ACED.
*/

public class ECD0016DSMessage extends MessageRecord
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
                                     "E01CDRTAR",
                                     "E01CDRNAM",
                                     "E01CDRCUN",
                                     "E01CDRSTS",
                                     "E01CDRDSC"
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
                                   "E01CDRTAR",
                                   "E01CDRNAM",
                                   "E01CDRCUN",
                                   "E01CDRSTS",
                                   "E01CDRDSC"
                                 };
  final static String fid = "1130611112843";
  final static String rid = "573AEAA30ACED";
  final static String fmtname = "ECD0016DS";
  final int FIELDCOUNT = 14;
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
  private CharacterField fieldE01CDRTAR = null;
  private CharacterField fieldE01CDRNAM = null;
  private DecimalField fieldE01CDRCUN = null;
  private CharacterField fieldE01CDRSTS = null;
  private CharacterField fieldE01CDRDSC = null;

  /**
  * Constructor for ECD0016DSMessage.
  */
  public ECD0016DSMessage()
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
    recordsize = 151;
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
    fields[9] = fieldE01CDRTAR =
    new CharacterField(message, HEADERSIZE + 42, 20, "E01CDRTAR");
    fields[10] = fieldE01CDRNAM =
    new CharacterField(message, HEADERSIZE + 62, 30, "E01CDRNAM");
    fields[11] = fieldE01CDRCUN =
    new DecimalField(message, HEADERSIZE + 92, 10, 0, "E01CDRCUN");
    fields[12] = fieldE01CDRSTS =
    new CharacterField(message, HEADERSIZE + 102, 4, "E01CDRSTS");
    fields[13] = fieldE01CDRDSC =
    new CharacterField(message, HEADERSIZE + 106, 45, "E01CDRDSC");

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
  * Set field E01CDRTAR using a String value.
  */
  public void setE01CDRTAR(String newvalue)
  {
    fieldE01CDRTAR.setString(newvalue);
  }

  /**
  * Get value of field E01CDRTAR as a String.
  */
  public String getE01CDRTAR()
  {
    return fieldE01CDRTAR.getString();
  }

  /**
  * Set field E01CDRNAM using a String value.
  */
  public void setE01CDRNAM(String newvalue)
  {
    fieldE01CDRNAM.setString(newvalue);
  }

  /**
  * Get value of field E01CDRNAM as a String.
  */
  public String getE01CDRNAM()
  {
    return fieldE01CDRNAM.getString();
  }

  /**
  * Set field E01CDRCUN using a String value.
  */
  public void setE01CDRCUN(String newvalue)
  {
    fieldE01CDRCUN.setString(newvalue);
  }

  /**
  * Get value of field E01CDRCUN as a String.
  */
  public String getE01CDRCUN()
  {
    return fieldE01CDRCUN.getString();
  }

  /**
  * Set numeric field E01CDRCUN using a BigDecimal value.
  */
  public void setE01CDRCUN(BigDecimal newvalue)
  {
    fieldE01CDRCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDRCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDRCUN()
  {
    return fieldE01CDRCUN.getBigDecimal();
  }

  /**
  * Set field E01CDRSTS using a String value.
  */
  public void setE01CDRSTS(String newvalue)
  {
    fieldE01CDRSTS.setString(newvalue);
  }

  /**
  * Get value of field E01CDRSTS as a String.
  */
  public String getE01CDRSTS()
  {
    return fieldE01CDRSTS.getString();
  }

  /**
  * Set field E01CDRDSC using a String value.
  */
  public void setE01CDRDSC(String newvalue)
  {
    fieldE01CDRDSC.setString(newvalue);
  }

  /**
  * Get value of field E01CDRDSC as a String.
  */
  public String getE01CDRDSC()
  {
    return fieldE01CDRDSC.getString();
  }

}